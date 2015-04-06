<?php

namespace Max\Controller;

use Max\Exception\ApiDisabledException;
use Max\Form\JsonForm;
use Max\Repository\AbstractMaxRepository;
use Max\Stdlib\Hydrator\Json;
use Zend\Mvc\Controller\AbstractRestfulController;
use Zend\Paginator\Paginator;
use Zend\View\Model\JsonModel;

/**
 * Kontroler za splošni cikel list / view / create / update
 * močno se naslanja na metapodatke o entitetah.
 *
 */
class RestController
        extends AbstractRestfulController
{

    use Traits\EntityTrait,
        \Max\Expect\ExpectTrait,
        Traits\JsonErrorsTrait;

    /**
     * Ali getList vrne seznam objektov če je query prazen
     *
     * @var boolean
     */
    protected $listAllIfEmptyQuery = false;

    /**
     * Forma za validacijo entitet
     * 
     * @var JsonForm
     */
    protected $form = null;

    /**
     * ime Forme za parsanje parametrov v getList metodi
     * 
     * @var string
     */
    protected $filterFormName = null;

    /**
     * Ime entitete
     *
     * @var Json
     */
    protected $hydr;

    /**
     * Opcije hidratorja - kaj se hidrira po vrednosti in kaj se ne hidrira
     * @var type
     */
    protected $hydratorOptions = [];

    /**
     * Rest get metoda
     * @param string $id
     * @return JsonModel
     */
    public function get($id)
    {
        $view = $this->params('view', 'default');
        $this->isApiEnabled('read', $view);
        try {
            $sr = $this->getRepository();
            $object = $sr->find($id);
            if ($object) {
                $perm = $this->getFormPermission('read', $view);
                $this->expect($this->isGranted($perm, $object)
                        , $this->trnslt('Api dostop zavrnjen'), 100099);
                $data = $this->hydr->extract($object);
                return new JsonModel($data);
            } else {
                $this->addError($this->trnslt('Ni entitete z id-jem'), 100098, 'warning');
            }
            return $this->getErrors();
        } catch (\Exception $e) {
            $this->addErrorFromException($e);
            return $this->getErrors();
        }
    }

    /**
     * Rest get list
     * @return JsonModel
     */
    public function getList()
    {

        $listName = $this->params('view', 'default');
        $this->isApiEnabled('list', $listName);

        try {

            $perm = $this->getListPermission($listName);
            $this->expect($this->isGranted($perm), $this->trnsl('Api dostop zavrnjen'), 100012);


            $filter = $this->buildFilterForm($this->getConfig('list.' . $listName));
            if ($this->filterFormName) {
                $params = $this->params()->fromQuery();
                $filter->setData($params);
                if (!$filter->isValid()) {
                    $this->addFormMessages($filter);
                    return $this->getErrors();
                }
                $params = $filter->getData();
            }
            /* @var $sr  AbstractMaxRepository */
            $sr = $this->getRepository();
            $this->manageSort($sr, $listName);
            $paginator = new Paginator($sr->getPaginator($params, $listName));
            $this->setPaginatorParams($paginator);
            $jsonList = [];

            $filter = $this->getConfig("lists.$listName.jsonFilter");
            foreach ($paginator as $object) {

                $array = $this->hydr->extract($object);
                if ($filter) {
                    $jsonList[] = $sr->jsonFilter($array, $listName);
                } else {
                    $jsonList[] = $array;
                }
                //  }
            }

            return new JsonModel([
                'state' => array_merge($sr->getSortJson($listName), $this->getPaginatorArray($paginator)),
                'data' => $jsonList,
            ]);
        } catch (\Exception $e) {
            $this->addErrorFromException($e);
            return $this->getErrors();
        }
    }

    /**
     * Naredi formo, poveže obstoječo entiteto , s formo. Pri posti formo validira in
     * shrani spremembe
     *
     * @return JsonModel
     */
    public function update($id, $data)
    {
        $view = $this->params('view', 'default');
        // preverim, če je api spoloh omogočen         
        $this->isApiEnabled('update', $view);

        /* @var $sr  AbstractMaxRepository */
        $sr = $this->getRepository();


        $object = $sr->find($id);
        try {
            $perm = $this->getFormPermission('update', $view);
            $this->expect($this->isGranted($perm, $object), $this->trnsl('Dostop do api zavrnjen.'));

            $this->expect($object, $this->trnsl('Objekt ne obstaja'), 100100);

            $this->form->setMode('EDIT');

            $this->form->bind($object);
            $data['id'] = $id;
            $this->form->setData(['fieldset' => $data]);

            if ($this->form->isValid()) {

                /* @var $sr  AbstractMaxRepository */
                $sr = $this->getRepository();
                $sr->update($object);

                $this->getEm()->flush();
                $data = $this->hydr->extract($object);
                return new JsonModel($data);
            } else {
                $this->addFormMessages($this->form);
            }
        } catch (\Exception $e) {
            $this->addErrorFromException($e);
        }
        return $this->getErrors();
    }

    /**
     * Naredi formo za dodjanje entitete. Če se forma validira shrani spremembo
     *
     * @return JsonModel
     */
    public function create($data)
    {
        $view = $this->params('view', 'default');

        $this->isApiEnabled('create', $view);
        try {
            $object = new $this->entityClass;
            $perm = $this->getFormPermission('create', $view);
            $this->expect($this->isGranted($perm, $object), $this->trnsl("Api access denied"), 100008);

            $this->form->setMode('NEW');
            $this->form->bind($object);
            $this->form->setData($data);

            if ($this->form->isValid()) {
                /* @var $sr  AbstractMaxRepository */
                $sr = $this->getRepository();
                $sr->create($object);
                $this->em->flush();
                $data = $this->hydr->extract($object);
                return new JsonModel($data);
            } else {
                $this->addFormMessages($this->form);
            }
        } catch (\Exception $e) {
            $this->addErrorFromException($e);
        }
        return $this->getErrors();
    }

    /**
     * Briše obstoječo entiteto
     *
     * @param ID
     * @return JsonModel
     */
    public function delete($id)
    {

        $this->isApiEnabled('delete');
        /* @var $sr  AbstractMaxRepository */
        $sr = $this->getRepository();
        $object = $sr->find($id);

        $perm = $this->getEntityPermission('delete');
        $this->expect($this->isGranted($perm, $object), $this->trnsl('Dostop zavrnjen'), 100201);

        if (method_exists($sr, 'delete')) {
            try {
                $sr->delete($object);
                $this->em->flush();
                $this->addError($this->trnsl('Uspešno brisano.'), 'info');
                return $this->getErrors('200');
            } catch (\Exception $exc) {
                $this->addErrorFromException($exc);
                $this->addError($this->trnsl('Brisanje ni uspelo!'));
            }
        } else {
            try {
                $this->em->remove($object);
                $this->em->flush();
                $this->addError($this->trnsl('Uspešno brisano.'), 'info');
                return $this->getErrors('200');
            } catch (\Exception $exc) {
                $this->addErrorFromException($exc);
                $this->addError($this->trnsl('Brisanje ni uspelo!'));
            }
        }

        return $this->getErrors();
    }

    public function deleteList()
    {
        return $this->notSupported();
    }

    public function head($id = null)
    {
        return $this->notSupported();
    }

    public function options()
    {
        return $this->notSupported();
    }

    public function patch($id, $data)
    {
        return $this->notSupported();
    }

    public function patchList($data)
    {
        return $this->notSupported();
    }

    /**
     * 
     * Vrne napako s sporočilom, da akcija ni podprta
     * @param integer $code
     * @return array
     */
    protected function notSupported($code = 980404)
    {
        $this->addError($this->trnsl('Neveljavna REST akcija'), $code);
        return $this->getErrors();
    }

    /**
     * Vrne metapodatke iz paginatorja za enkodiranje v JSON
     *
     * @param Paginator $paginator
     */
    public function getPaginatorArray($paginator)
    {
        if ($paginator instanceof Paginator) {
            if ($paginator->getItemCountPerPage() < 1) {
                $lastPage = 1;
            } else {
                $lastPage = ceil($paginator->getTotalItemCount() / $paginator->getItemCountPerPage());
            }
            return [ 'currentPage' => $paginator->getCurrentPageNumber(),
                'totalRecords' => $paginator->getTotalItemCount(),
                'lastPage' => $lastPage,
                'pageSize' => $paginator->getItemCountPerPage(),
            ];
        } else {
            $c = count($paginator);
            return ['currentPage' => 1,
                'totalRecords' => $c,
                'lastPage' => 1,
                'pageSize' => max($c, 1)];
        }
    }

    /**
     * Nastavi stran in količino na stran iz query parametrov
     *
     * @param Paginator $paginator
     */
    public function setPaginatorParams($paginator)
    {
        if ($paginator->getDefaultItemCountPerPage() > 1) {
            $paginator->setCurrentPageNumber($this->params()->fromQuery('page', 1));
            $paginator->setItemCountPerPage($this->params()->fromQuery('per_page', $paginator->getItemCountPerPage()));
        }
    }

    /**
     * Posreduje podatke o zahtevanem sortu v repositorij
     * Poskrbi za persistenco sort podatkov v sessionu
     *
     * @param AbstractMaxRepository $repository
     * @param string $listName
     */
    public function manageSort($repository, $listName = 'default', $suffix = 'sort')
    {

        if ($this->params()->fromQuery('sort_by')) {
            $field = $this->params()->fromQuery('sort_by');
            $dir = $this->params()->fromQuery('order');
            if (!$dir) {
                $so = $repository->getSort();
                if (isset($so->options[$field]['dir']))
                    $dir = $so->options[$field]['dir'];
                else
                    $dir = 'ASC';
            }
            $repository->setSort($field, $dir, $listName);
        }
    }

    /**
     * Preveri ali je posamezna metoda za konkretni 
     * API omogočena ali ne.
     * 
     * @param string $method
     * @param string $view
     */
    public function isApiEnabled($method, $view = 'default')
    {

        $globalyDisabled = $this->getConfig('disabledMethods', []);

        switch ($method) {
            case 'read':
            case 'create':
            case 'update':
                $viewDisabled = $this->getConfig("forms.$view.disabledMethods", []);
                break;
            case 'list':
                $viewDisabled = $this->getConfig("lists.$view.disabledMethods", []);
                break;
            default:
                $viewDisabled = [];
        }

        $disabled = array_merge($globalyDisabled, $viewDisabled);
        if (in_array($method, $disabled)) {
            throw new ApiDisabledException("$method disabled", 100020);
        }
    }

    public function getListPermission($view)
    {
        $p1 = $this->getConfig("lists.$view.perm");
        if ($p1) {
            return $p1;
        }
        return $this->getEntityPermission('list');
    }

    public function getFormPermission($action, $view = 'default')
    {
        $p1 = $this->getConfig("forms.$view.perm.$");
        if ($p1) {
            return $p1;
        }
        return $this->getEntityPermission($action);
    }

    public function buildFilterForm($config)
    {
        $fm = $this->getForm();
        $this->form = new JsonForm();
        $this->form->setConfig($config);
    }

}
