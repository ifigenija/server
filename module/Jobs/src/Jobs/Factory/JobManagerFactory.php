<?php


namespace Jobs\Factory;


use Zend\ServiceManager\FactoryInterface;
use Zend\ServiceManager\ServiceLocatorInterface;

class JobManagerFactory implements FactoryInterface
{
    public function createService(ServiceLocatorInterface $serviceLocator)
    {
        $em = $serviceLocator->get('doctrine.entitymanager.orm_default');
        $rep = $em->getRepository('Jobs\Entity\Job');
        $rep->setServiceLocator($serviceLocator);
        return $rep;
    }


}