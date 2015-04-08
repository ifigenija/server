<?php

namespace Max\Form;

use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityRepository;
use Max\Ann\EntityMetadata;
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
        $this->sm = $this->getServiceLocator()->getServiceLocator();
        $this->em = $this->sm->get('doctrine.entitymanager.orm_default');
        $this->mf = $this->sm->get('entity.metadata.factory');
        //$this->opts = $sm->get('options.service');
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
        if (!$this->has('id')) {
            $this->addWithMeta('id');
        }
    }

    /**
     * getter za metadata
     *
     * @return EntityMetadata
     */
    public function getMetadata()
    {
        return $this->metadata;
    }

    /**
     * setter za metadata
     *
     * @param EntityMetadata $metadata
     * @return ManagedFieldset
     */
    public function setMetadata($metadata)
    {
        $this->metadata = $metadata;
        return $this;
    }

    /**
     * getter za metadata factory
     *
     * @return Max\Ann\EntityMetadataFactory;
     */
    public function getMf()
    {
        return $this->mf;
    }

}
