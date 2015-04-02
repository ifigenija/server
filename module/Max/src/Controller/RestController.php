<?php

namespace Max\Controller;

use Zend\Mvc\Controller\AbstractRestfulController;
use Max\Exception\EntityNotFound;
use Max\Exception\MaxException;
use Max\Form\JsonForm;
use Max\Repository\AbstractMaxRepository;
use Max\Stdlib\Hydrator\Json;
use Zend\Mvc\MvcEvent;
use Zend\Paginator\Paginator;
use Zend\View\Model\JsonModel;
use ZfcRbac\Service\AuthorizationService;

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
        $this->isApiEnabled('get', $view);
        try {
            
            $sr = $this->getRepository();
            $object = $sr->find($id);
            if ($object) {
                $perm = $this->getApiPermission('read', $view);
                $this->expect($this->isGranted($perm, $object), $this->translate('Api dostop zavrnjen'), 100099);
                $data = $this->hydr->extract($object);
                return new JsonModel($data);
            } else {
                $this->addError('Ni entitete z id-jem', 100098, 'warning');
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
        /* @var $sr  AbstractMaxRepository */
        $sr = $this->getRepository();
        $trnsl = $this->getTranslator();

        try {

            $perm = $this->getApiPermission('list', $listName);
            $this->expect($this->isGranted($perm), $trnsl->translate('Api dostop zavrnjen'), 100012);


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
        $this->isApiEnabled('update');

        /* @var $sr  AbstractMaxRepository */
        $sr = $this->getRepository();
        $trnsl = $this->getTranslator();

        $this->form->setMode('EDIT');
        $object = $sr->find($id);
        try {
            $perm = $this->getEntityPermission('update');
            $this->expect($this->isGranted($perm, $object), $trnsl->translate('Dostop do api zavrnjen.'));

            if (!$object) {
                throw new MaxException($trnsl->translate('Objekt ne obstaja'), 100100);
            }

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
        $this->isApiEnabled('create');
        try {
            $object = new $this->entityClass;
            $perm = $this->getEntityPermission('create');
            $this->expect($this->isGranted($perm, $object), "Api access denied", 100008);

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
        
        
        /* @var $sr  AbstractMaxRepository */
        $sr = $this->getRepository();
        $object = $sr->find($id);

        if (!$object) {
            throw new EntityNotFound($trnsl->translate('Entiteta ne obstaja'), 100009);
        }

        $perm = $this->getEntityPermission('delete');
        if (!$this->isGranted($perm, $object)) {
            throw new MaxAccessDeniedException($perm, $object->id);
        }

        if (method_exists($sr, 'delete')) {
            try {
                $sr->delete($object);
                $this->em->flush();
                $this->addError($trnsl->translate('Uspešno brisano.'), 'info');
                return $this->getErrors('200');
            } catch (\Exception $exc) {
                $this->addErrorFromException($exc);
                $this->addError($trnsl->translate('Brisanje ni uspelo!'));
            }
        } else {
            try {
                $this->em->remove($object);
                $this->em->flush();
                $this->addError($trnsl->translate('Uspešno brisano.'), 'info');
                return $this->getErrors('200');
            } catch (\Exception $exc) {
                $this->addErrorFromException($exc);
                $this->addError($trnsl->translate('Brisanje ni uspelo!'));
            }
        }

        return $this->getErrors();
    }

    /**
     * 
     * Vrne napako s sporočilom, da akcija ni podprta
     * @param integer $code
     * @return array
     */
    protected function notSupported($code = 980404)
    {
        $translator = $this->getServiceManager()->get('translator');
        $this->addError($this->translate('Neveljavna REST akcija'), $code);
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
    public function isApiEnabled($method, $view = null) {
        
        $globalyDisabled = $this->getConfig('disabledMethods', []);
                
        if (in_array($method, ['get', 'create', 'delete', 'update'])) {
            $viewDisabled = $this->getConfig("forms.$view.disabledMethods", []);
        } else {
            $viewDisabled = $this->getConfig("lists.$view.disabledMethods", []);
        }

        $disabled = array_merge($globalyDisabled, $viewDisabled);
        
        $this->expect(!in_array($method, $disabled), "$method disabled");
        
    }
    
    
    public function buildFilterForm($config)
    {
        $fm = $this->getForm();
        $this->form = new JsonForm();
        $this->form->setConfig($config);
    }

}
