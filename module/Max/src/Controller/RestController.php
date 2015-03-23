<?php

namespace Tip\Controller;

use Tip\Controller\AbstractRestfulController;
use Tip\Exception\EntitetaNeObstaja;
use Tip\Exception\TipAccessDeniedException;
use Tip\Exception\TipException;
use Tip\Form\JsonForm;
use Tip\Repository\AbstractTipRepository;
use Tip\Stdlib\Hydrator\Json;
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

    use ActionTrait\EntityTrait;

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
     * @throws Exception Brez entitete ne gre
     */
    public function init()
    {

        if (!class_exists($this->entityClass)) {
            throw new TipException('Razred entitete ni nastavljen', 'TIP-REST-002');
        }

        $this->hydr = $this->getRepository()->getJsonHydrator($this->hydratorOptions);

        if (!$this->request->isGet() && !$this->form) {
            $this->form = $this->getJsonForm();
        }
    }

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
                    throw new TipAccessDeniedException($perm, $object->id);
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
        

        /* @var $sr  AbstractTipRepository */
        $sr = $this->getRepository();
        try {
            
           
            $perm = $this->getEntityPermission('read');
            if (!$this->isGranted($perm)) {
                throw new TipAccessDeniedException($perm);
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
        /* @var $sr  AbstractTipRepository */
        $sr = $this->getRepository();

        $this->form->setMode('EDIT');
        $object = $sr->find($id);
        try {
            
            $perm = $this->getEntityPermission('update');
            if (!$this->isGranted($perm, $object)) {
                throw new TipAccessDeniedException($perm, $object->id);
            }
            
            if (!$object) {
                throw new TipException('Objekt ne obstaja', 'TIP-CRD-0001');
            }
            
            $this->form->bind($object);
            $data['id'] = $id;
            $this->form->setData(['fieldset' => $data]);

            if ($this->form->isValid()) {

                /* @var $sr  AbstractTipRepository */
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
                throw new TipAccessDeniedException($perm, null);
            }

            $this->form->setMode('NEW');
            $this->form->bind($object);
            $this->form->setData(['fieldset' => $data]);

            if ($this->form->isValid()) {
                /* @var $sr  AbstractTipRepository */
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
        /* @var $sr  AbstractTipRepository */
        $sr = $this->getRepository();
        $object = $sr->find($id);

        if (!$object)
            throw new EntitetaNeObstaja('Entiteta ne obstaja', 'TIP-CRD-000X');

        $perm = $this->getEntityPermission('delete');
        if (!$this->isGranted($perm, $object)) {
            throw new TipAccessDeniedException($perm, $object->id);
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
        $translator = $this->getServiceManager()->get('translator');
        $msg = $translator->translate('Neveljavna REST akcija');
        throw new TipException($msg, 'TIP-REST-001');
    }

}
