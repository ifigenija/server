<?php

namespace Aaa\Controller;

use Zend\Paginator\Paginator;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use DoctrineModule\Paginator\Adapter\Collection;
use Doctrine\Common\Collections\ArrayCollection;
use Max\Controller\AbstractMaxController;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
Use Doctrine\Common\Collections\Criteria;

/**
 * Kontroler za vloge
 *
 */
class RoleController extends AbstractMaxController
{

    use \Max\Controller\ActionTrait\EntityPaginator,
        \Max\Controller\ActionTrait\EntityBrisi,
        \Max\Controller\ActionTrait\EntityUredi,
        \Max\Controller\ActionTrait\EntityPregled,
        \Aaa\Controller\ActionTrait\RoleSelect;

    /**
     * Ime razred entitet
     *
     * @var string
     */
    protected $entityClass = 'Aaa\Entity\Role';

    /**
     *
     */
    public function init()
    {
        $this->toolbar = new \Aaa\Navigation\Role($this);
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
     * Akcija za pregled ene entitete. Naredi privzeto formo za entiteto in jo poveže
     * z entiteto. Potrebuje Id parameter route. formo prikaže disablano.
     *
     * @return \Zend\View\Model\ViewModel
     */
    public function pregledAction()
    {
        $object = $this->loadEntity();
        $vm = $this->handleEntityPregled($object);
        $vm->addChild($this->assignedRoles($object), 'roleList');
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
        $object = new $this->entityClass;
        $vm = $this->handleEntityDodaj($object);
        if ($vm instanceof ViewModel) {
            $toolbar = new \Aaa\Navigation\Role($this);
            $this->setToolbar($toolbar->getDodajPages());
            $vm->setTemplate('aaa/role/pregled');
        }
        return $vm;
    }

    /**
     * Naredi formo, poveže obstoječo entiteto , s formo. Pri postu formo validira in
     * shrani spremembe
     *
     * @return \Zend\View\Model\ViewModel
     */
    public function urediAction()
    {
        $object = $this->loadEntity();
        $vm = $this->handleEntityUredi($object);
        if ($vm instanceof ViewModel) {
            $vm->addChild($this->roleList($object), 'roleList');
            $vm->addChild($this->assignedRoles($object, 'uredi'), 'assignedRoles');
        }
        $this->setToolbar($this->toolbar->getUrediPages());
        return $vm;
    }

    /**
     * Pokaže seznam dovoljen, ki so že na vlogi in seznam dovoljenj, ki že obstajajo
     * 
     *
     * @return \Zend\View\Model\ViewModel
     */
    public function urediDovoljenjaAction()
    {
        $object = $this->loadEntity();
        $vm = $this->handleEntityUredi($object);
        if ($vm instanceof ViewModel) {
            if ($this->request->isPost()) {
                $data = $this->request->getPost();
                $sr = $this->getRepository();
                if (array_key_exists('removeSelectedBtn', $data)) {
                    $sr->removePermissions($object, $data['izbor']);
                }

                if (array_key_exists('addSelectedBtn', $data)) {
                    $sr->addPermissions($object, $data['izbor']);
                }
                $this->flashShrani($object);
            }

            $dovoljenja = $this->getEm()->getRepository('Aaa\Entity\Permission')->findAll();
            $vm->setVariable('dovoljenja', $dovoljenja);
            $this->setToolbar($this->toolbar->getUrediDovoljenjaPages());
        }
        return $vm;
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
            return $this->redirect()->toRoute('aaa', ['action' => 'index', 'controller' => 'Role'], [], true);
        }
        return $vm;
    }

}
