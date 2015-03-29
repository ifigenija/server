<?php

namespace Max\Controller;

use Max\Controller\AbstractRestfulController;
use Max\Exception\EntitetaNotFound;
use Max\Exception\UnauthorizedException;
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

    use ActionTrait\EntityTrait,
        JsonErrorsTrait;

    /**
     *  Servis za dostop do ACL-jev
     * @var AuthorizationService
     */
    protected $authorization;

    /**
     *  @var EntityManager

      protected $em;
     */

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
        try {
            $sr = $this->getRepository();
            $object = $sr->find($id);
            if ($object) {
                $perm = $this->getEntityPermission('read');
                if (!$this->isGranted($perm, $object)) {
                    throw new MaxAccessDeniedException($perm, $object->id);
                }
                $data = $this->hydr->extract($object);
                return new JsonModel($data);
            } else {
                $this->addError('Ni entitete z id-jem', 'TIP-CRD-000X', 'warning');
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

        $queryParams = $this->params()->fromQuery();

        $paginatorName = $this->params()->fromQuery('paginator', 'default');


        /* @var $sr  AbstractMaxRepository */
        $sr = $this->getRepository();
        try {


            $perm = $this->getEntityPermission('read');
            if (!$this->isGranted($perm)) {
                throw new MaxAccessDeniedException($perm);
            }

            if (isset($queryParams['filter'])) {
                $params = $queryParams['filter'];
            } else {
                $params = $queryParams;
            }

            if ($this->filterFormName) {
                $filter = $this->getForm($this->filterFormName);
                $filter->setData($params);
                if (!$filter->isValid()) {
                    $this->addFormMessages($filter);
                    return $this->getErrors();
                }
                $params = $filter->getData();
            }

            $this->manageSort($sr, $paginatorName);
            $paginator = new Paginator($sr->getPaginator($params, $paginatorName));
            $this->setPaginatorParams($paginator);
            $jsonList = [];

            $filter = method_exists($sr, 'jsonFilter');
            foreach ($paginator as $object) {

                $array = $this->hydr->extract($object);
                if ($filter) {
                    $jsonList[] = $sr->jsonFilter($array, $paginatorName);
                } else {
                    $jsonList[] = $array;
                }
                //  }
            }

            return new JsonModel([
                'state' => array_merge($sr->getSortJson($paginatorName), $this->getPaginatorArray($paginator)),
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
        /* @var $sr  AbstractMaxRepository */
        $sr = $this->getRepository();

        $this->form->setMode('EDIT');
        $object = $sr->find($id);
        try {

            $perm = $this->getEntityPermission('update');
            if (!$this->isGranted($perm, $object)) {
                throw new MaxAccessDeniedException($perm, $object->id);
            }

            if (!$object) {
                throw new MaxException('Objekt ne obstaja', 'TIP-CRD-0001');
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
        try {
            $object = new $this->entityClass;
            $perm = $this->getEntityPermission('create');
            if (!$this->isGranted($perm, $object)) {
                throw new MaxAccessDeniedException($perm, null);
            }

            $this->form->setMode('NEW');
            $this->form->bind($object);
            $this->form->setData(['fieldset' => $data]);

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

        if (!$object)
            throw new \Max\Exception\EntityNotFound('Entiteta ne obstaja', 'TIP-CRD-000X');

        $perm = $this->getEntityPermission('delete');
        if (!$this->isGranted($perm, $object)) {
            throw new MaxAccessDeniedException($perm, $object->id);
        }

        if (method_exists($sr, 'delete')) {
            try {
                $sr->delete($object);
                $this->em->flush();
                $this->addError('Uspešno brisano.', 'info');
                return $this->getErrors('200');
            } catch (\Exception $exc) {
                $this->addErrorFromException($exc);
                $this->addError('Brisanje ni uspelo! ');
            }
        } else {
            try {
                $this->em->remove($object);
                $this->em->flush();
                $this->addError('Uspešno brisano.', 'info');
                return $this->getErrors('200');
            } catch (\Exception $exc) {
                $this->addErrorFromException($exc);
                $this->addError('Brisanje ni uspelo! ');
            }
        }

        return $this->getErrors();
    }

    public function getAction()
    {
        if ($this->request->isGet()) {
            if ($this->params('id')) {
                return 'get';
            } else {
                return 'getList';
            }
        }
        if ($this->request->isPost()) {
            return 'create';
        }
        if ($this->request->isPut()) {
            return 'update';
        }
        if ($this->request->isDelete()) {
            return 'delete';
        }
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
        $translator = $this->getServiceManager()->get('translator');
        $this->addError($this->translate('Neveljavna REST akcija'), $code);
        return $this->getErrors();
    }

    /**
     * Dispatch metoda
     *
     * @param MvcEvent $e
     * @return mixed
     */
    public function onDispatch(MvcEvent $e)
    {
        $this->auth = $this->serviceLocator->get('ZfcRbac\Service\AuthorizationService');
        $this->em = $this->serviceLocator->get('doctrine.entitymanager.orm_default');
    
        if (!class_exists($this->entityClass)) {
            $this->addError($this->translate('Razred entitete ni nastavljen'), 920100);
        }
        
        if (!$this->request->isGet() && !$this->form) {
            $this->form = $this->getJsonForm();
        }
    
        return parent::onDispatch($e);
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
     * @param string $paginatorName
     */
    public function manageSort($repository, $paginatorName = 'default', $suffix = 'sort')
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
            $repository->setSort($field, $dir, $paginatorName);
        }
    }

}
