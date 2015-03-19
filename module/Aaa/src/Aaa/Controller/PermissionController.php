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
 * Kontroler za dovoljenja
 *
 */
class PermissionController extends AbstractTipController
{

    use \Tip\Controller\ActionTrait\EntityPaginator,
        \Tip\Controller\ActionTrait\EntityPregled,
        \Tip\Controller\ActionTrait\EntityUredi,
        \Tip\Controller\ActionTrait\EntityBrisi;

    /**
     * Ime razred entitete
     *
     * @var string
     */
    protected $entityClass = 'Aaa\Entity\Permission';

    /**
     * Prikaže seznam entitet v paginatorju
     * @return \Zend\View\Model\ViewModel
     */
    public function indexAction()
    {
        $vm = $this->handleEntityPaginator('\Aaa\Form\Filter\Simple');
        $toolbar = new \Aaa\Navigation\Toolbar($this);
        $this->setToolbar($toolbar->getIndexPages());
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
        $toolbar = new \Aaa\Navigation\Toolbar($this);
        $this->setToolbar($toolbar->getPregledPages());
        $vm->setTemplate('aaa/permission/uredi');
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
        $vm = $this->handleEntityDodaj($object,'aaa');
        if ($vm instanceof ViewModel) {
            $toolbar = new \Aaa\Navigation\Toolbar($this);
            $this->setToolbar($toolbar->getDodajPages());
            $vm->setTemplate('aaa/permission/uredi');
        }
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
            $toolbar = new \Aaa\Navigation\Toolbar($this);
            $this->setToolbar($toolbar->getUrediPages());
            $vm->setTemplate('aaa/permission/uredi');
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
            return $this->redirect()->toRoute('aaa', ['action' => 'index', 'controller' => 'Permission']);
        }
        return $vm;
    }

}
