<?php

namespace Max\Controller;

use Max\Exception\ApiDisabledException;
use Max\Form\Filter\Simple;
use Max\Form\JsonForm;
use Max\Repository\AbstractMaxRepository;
use Max\Repository\CrudInterface;
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

    const DENIED = "Api dostop zavrnjen %s %s";
    /**
     * Rest get metoda
     * @param string $id
     * @return JsonModel
     */
    public function get($id)
    {
        $view = $this->params('view', 'default');
        $this->isApiEnabled('read', $view);
        $perm = $this->getFormPermission('read', $view);
        try {
            $sr     = $this->getRepository();
            $object = $sr->find($id);
            $this->expect($this->isGranted($perm, $object)
                    , $this->trnsl(self::DENIED)
                    , 100099, [$perm, $this->getUsername()]);

            $this->expect($object, $this->trnsl('Ni entitete z id-jem'), 100098);

            $hydr = $this->getHydrator($view);

            $data = $hydr->extract($object);
            return new JsonModel($data);
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
            $this->expect($this->isGranted($perm)
                    , $this->trnsl(self::DENIED)
                    , 100012, [$perm, $this->getUsername()]);

            $filter = $this->buildFilterForm($listName);

            $this->expect($filter, $this->trnsl('Filter ni nastavljen'), 100013);

            $params = $this->params()->fromQuery();
            $filter->setData($params);
            if (!$filter->isValid()) {
                $this->addFormMessages($filter);
                return $this->getErrors();
            }
            $data = $filter->getData();

            /* @var $sr  AbstractMaxRepository */
            $sr        = $this->getRepository();
            //    $this->manageSort($sr, $listName);
            $paginator = new Paginator($sr->getPaginator($data, $listName));
            $this->setPaginatorParams($paginator);
            $jsonList  = [];

            $hydr = $this->getHydrator($listName, 'lists');
//            $outFilter = $this->getConfig("lists.$listName.jsonFilter");
            foreach ($paginator as $object) {

                $array      = $hydr->extract($object);
//                if ($outFilter) {
//                    $jsonList[] = $sr->jsonFilter($array, $listName);
//                } else {
                $jsonList[] = $array;
//                }
            }

            return new JsonModel(
                    //[
                    //               'state' => array_merge($sr->getSortJson($listName), $this->getPaginatorArray($paginator)),
                    //      'data' => 
                    $jsonList
                    //]
            );
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
            $this->expect($this->isGranted($perm, $object)
                    , $this->trnsl(self::DENIED)
                    , 1000101, [$perm, $this->getUsername()]);

            $this->expect($object, $this->trnsl('Objekt ne obstaja'), 100100);

            $form = $this->buildForm($view);
            $form->setMode('EDIT');

            $form->bind($object);
            $data['id'] = $id;
            $form->setData($data);

            if ($form->isValid()) {
                /* @var $sr  AbstractMaxRepository */
                $sr = $this->getRepository();
                $sr->update($object);

                $this->getEm()->flush();
                $hydr = $this->getHydrator($view);
                $data = $hydr->extract($object);
                return new JsonModel($data);
            } else {
                $this->addFormMessages($form);
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
            $perm   = $this->getFormPermission('create', $view);
            $this->expect($this->isGranted($perm, $object)
                    , $this->trnsl(self::DENIED)
                    , 100008, [$perm, $this->getUsername()]);

            $form = $this->buildForm($view);
            $form->setMode('NEW');
            $form->bind($object);
            $form->setData($data);

            if ($form->isValid()) {
                /* @var $sr  AbstractMaxRepository */
                $sr = $this->getRepository();
                if ($sr instanceof CrudInterface) {
                    $sr->create($object);
                }
                $this->em->flush();

                $hydr = $this->getHydrator($view);
                $data = $hydr->extract($object);
                return new JsonModel($data);
            } else {
                $this->addFormMessages($form);
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
        $sr     = $this->getRepository();
        $object = $sr->find($id);

        $perm = $this->getEntityPermission('delete');
        $this->expect($this->isGranted($perm, $object)
                , $this->trnsl(self::DENIED)
                , 100201
                , [$perm, $this->getUsername()]);

        if ($sr instanceof CrudInterface) {
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

    public function replaceList($data)
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
            return [ 'currentPage'  => $paginator->getCurrentPageNumber(),
                'totalRecords' => $paginator->getTotalItemCount(),
                'lastPage'     => $lastPage,
                'pageSize'     => $paginator->getItemCountPerPage(),
            ];
        } else {
            $c = count($paginator);
            return ['currentPage'  => 1,
                'totalRecords' => $c,
                'lastPage'     => 1,
                'pageSize'     => max($c, 1)];
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
            $dir   = $this->params()->fromQuery('order');
            if (!$dir) {
                $so  = $repository->getSort();
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

    /**
     * Vrne permission za seznam, ki ga zahtevamo.
     * 
     * @param string $view
     * @return string
     */
    public function getListPermission($view)
    {
        $p1 = $this->getConfig("lists.$view.perm");
        if ($p1) {
            return $p1;
        }
        return $this->getEntityPermission('list');
    }

    /**
     * Zgradi permission string za akcijo v določenem viewu
     * @param string $action
     * @param string $view
     * @return string
     */
    public function getFormPermission($action, $view = 'default')
    {
        $p1 = $this->getConfig("forms.$view.perm");
        if ($p1) {
            return $p1;
        }
        return $this->getEntityPermission($action);
    }

    /**
     * Zgradi filter formo iz podatkov v konfigu
     * 
     * @param string  $view
     */
    public function buildFilterForm($view)
    {
        $fc = $this->getConfig("lists.$view.filter");

        // default je simple filter forma, ki vsebuje samo en element
        // in sicer q tipa string.
        if (empty($fc['elements']) && empty($fc['class'])) {
            return $this->getForm('Max\Form\Filter\Simple');
        }
        // če je v konfigu class, potem naredim formo tistega class-a 
        if ($fc['class']) {
            $form = $this->getForm($fc['class']);
            return $form;
        }

        // če je v konfiguraciji namedeno polje elementov, potem iz tega naredimo
        // filter formo
        if ($fc['elements']) {
            $form = new JsonForm();
            $form->add($fc['elements']);
            return $form;
        }
    }

    /**
     * Zgradi filter formo iz podatkov v konfigu
     * 
     * @param string  $view
     */
    public function buildForm($view)
    {
        $fc = $this->getConfig("forms.$view");

        // če je v konfigu class, potem naredim formo tistega class-a 
        if (!empty($fc['class'])) {
            $form = $this->getForm($fc['class']);
            return $form;
        }

        // če je v konfiguraciji navedeno polje elementov, potem iz tega naredimo
        // formo
        if (!empty($fc['elements'])) {
            $form = $this->getForm('\Max\Form\JsonForm');
            $form->setEntityClass($this->getEntityClass());
            foreach ($fc['elements'] as $opts) {
                if (is_array($opts)) {
                    $form->addWithMeta($opts['name'], $opts['options']);
                } else {

                    $form->addWithMeta($opts);
                }
            }
            return $form;
        }
    }

    /**
     * Vrne json hidrator za entiteto
     *
     * @return Json
     */
    public function getHydrator($name = 'default', $section = 'forms')
    {

        $options = $this->getConfig("$section.$name.hydrator");

        if (empty($options)) {
            $options = $this->getConfig('hydrator');
        }

        $hydr = new Json($this->getEm()
                , $this->entityClass
                , $options
                , $this->getServiceLocator());
        return $hydr;
    }

    
    public function getUsername() {
         $auth = $this->getServiceLocator()->get('Zend\Authentication\AuthenticationService');
         $ident = $auth->getIdentity();
         if ($ident) {
             return $ident->getUsername();
         } else {
             return "anon";
         }

    }
}
