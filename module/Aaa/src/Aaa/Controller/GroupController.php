<?php

namespace Aaa\Controller;

use Zend\Paginator\Paginator;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use DoctrineModule\Paginator\Adapter\Collection;
use Doctrine\Common\Collections\ArrayCollection;
use Tip\Controller\AbstractTipController;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
Use Doctrine\Common\Collections\Criteria;

/**
 * Kontroler za skupine
 *
 */
class GroupController extends AbstractTipController
{

    use \Tip\Controller\ActionTrait\EntityPaginator,
        \Tip\Controller\ActionTrait\EntityPregled,
        \Tip\Controller\ActionTrait\EntityUredi,
        \Tip\Controller\ActionTrait\EntityBrisi;

    protected $entityClass = 'Aaa\Entity\Group';

    /**
     *
     */
    public function init()
    {

        $this->toolbar = new \Aaa\Navigation\Toolbar($this);
    }

    /**
     * Prikaže seznam entitet v paginatorju
     * @return \Zend\View\Model\ViewModel
     */
    public function indexAction()
    {
        $vm = $this->handleEntityPaginator('\Aaa\Form\Filter\Simple');
        $this->setToolbar($this->toolbar->getIndexPages());

        return $vm;
    }

    /**
     * Akcija za REST metodo get list
     * @return \Zend\View\Model\JsonModel
     */
    public function getListAction()
    {
        $cache = $this->getServiceLocator()->get('cache.service');
        if (!$cache->contains('tip.grouplist')) {
            $sr = $this->getRepository();
            $list = $sr->getList();
            $vm = new \Zend\View\Model\JsonModel($list);
            $cache->save('tip.grouplist', $vm);
        } else {
            $vm = $cache->fetch('tip.grouplist');
        }

        return $vm;
    }

    /**
     * Akcija za pregled ene entitete. Naredi privzeto formo za entiteto in jo poveže
     * z entiteto. Potrebuje Id parameter route. formo prikaže disablano.
     *
     * @return \Zend\View\Model\ViewModel
     */
    public function pregledAction()
    {
        $vm = $this->handleEntityPregled();
        $this->setToolbar($this->toolbar->getPregledPages());
        return $vm;
    }

    /**
     * Naredi formo za dodjanje entitete. Če se forma validira shrani spremembo
     *
     * @return \Zend\View\Model\ViewModel
     */
    public function dodajAction()
    {

        $object = new \Aaa\Entity\Group();
        $vm = $this->handleEntityDodaj($object, 'aaa');
        $this->setToolbar($this->toolbar->getDodajPages());
        $vm->setTemplate('aaa/group/form');

        return $vm;
    }

    /**
     * Naredi formo, poveže obstoječo entiteto , s formo. Pri posti formo validira in
     * shrani spremembe
     *
     * @return \Zend\View\Model\ViewModel
     */
    public function urediAction()
    {

        $object = $this->loadEntity();
        $vm = $this->handleEntityUredi($object);
        if ($vm instanceof ViewModel) {
            $addUsers = $this->addUsers($object);
            if ($addUsers instanceof ViewModel) {
                $vm->addChild($addUsers, 'userSelect');
            }
        }

        $this->setToolbar($this->toolbar->getUrediPages());

        $vm->setTemplate('aaa/group/form');

        return $vm;
    }

    public function addUsers($object)
    {
        $userForm = $this->getForm('\Aaa\Form\UserSelectForm');
        $userForm->setName('userSelect');

        if ($this->request->isPost()) {
            $data = $this->request->getPost();
            $userForm->setData($data, $data);

            if ($userForm->isValid()) {
                $userId = $userForm->get('id')->getValue();
                $user = $this->getEm()->find('Aaa\Entity\User', $userId);
                if ($user) {
                    $object->addUser($user);
                    $this->flashShrani($object, $data);
                }
            }
        }
        $vm = new ViewModel(['userForm' => $userForm]);
        $vm->setTemplate('aaa/group/userselect');
        return $vm;
    }

    /**
     * Odstrani uproabnika iz skupine
     *
     * @return redidrect
     * @throws \Tip\Exception\NepopolniParametriZaAkcijo
     * @throws \Tip\Exception\EntitetaNeObstaja
     */
    public function odstraniUporabnikaAction()
    {

        $object = $this->loadEntity();

        $user = $this->loadEntity('Aaa\Entity\User', 'user');

        try {
            $object->getUsers()->removeElement($user);
            $this->getEm()->flush();
        } catch (\Exception $e) {
            $this->flashMessenger()->addErrorMessage('Napaka pri odstranjevanju oporabnika iz skupine');
            $this->flashMessenger()->addErrorMessage($e);
        }
        return $this->redirect()->toRoute('aaa', [
                    'controller' => 'Group',
                    'action' => 'uredi',
                    'id' => $object->id
        ]);
    }

    /**
     * Briše obstoječo entiteto
     *
     * @param ID
     * @return \Zend\View\Model\ViewModel
     */
    public function brisiAction()
    {
        $object = $this->loadEntity();
        $vm = $this->potrdiBrisanje($object);
        if (!($vm instanceof ViewModel)) {
            if ($vm === true) {
                $this->izvediBrisanje($object);
            }
            return $this->redirect()->toRoute('aaa', ['action' => 'index', 'controller' => 'Permission']);
        }
        return $vm;
    }

}
