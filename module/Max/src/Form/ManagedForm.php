<?php

namespace Tip\Form;

use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityRepository;
use Zend\Form\Form;
use Zend\ServiceManager\ServiceLocatorAwareInterface;

/**
 * Description of Daterange
 *
 * @author boris
 */
class ManagedForm
    extends Form
    implements ServiceLocatorAwareInterface
{

    use \Zend\ServiceManager\ServiceLocatorAwareTrait;

    /**
     *
     * @var EntityRepository
     */
    protected $repository;

    /**
     *
     * @var EntityManager
     */
    protected $em;

    public function init()
    {
        parent::init();
        $sm = $this->getServiceLocator()->getServiceLocator();
        $this->em = $sm->get('doctrine.entitymanager.orm_default');
    }

    public function getObjectRepository()
    {
        return $this->objectRepository;
    }

    public function getRepository()
    {
        return $this->repository;
    }

    public function setRepository(EntityRepository $repository)
    {
        $this->repository = $repository;
        return $this;
    }

    public function getEm()
    {
        return $this->em;
    }

    public function setEm(EntityManager $em)
    {
        $this->em = $em;
        return $this;
    }

    protected function ensureIdElement()
    {
        if (!$this->baseFieldset->has('id')) {
            if ($this->baseFieldset instanceof ManagedFieldset && $this->baseFieldset->getEntityClass()) {
                $this->getBaseFieldset()->addWithMeta('id');
            }
        }
    }

}
