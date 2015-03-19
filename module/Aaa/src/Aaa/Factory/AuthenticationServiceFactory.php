<?php


namespace Aaa\Factory;

use Zend\ServiceManager\FactoryInterface;
use Zend\ServiceManager\ServiceLocatorInterface;


/**
 * Factory to create authentication service 
 *
 * @author  boris@max.si
 * @licence MIT
 */
class AuthenticationServiceFactory implements FactoryInterface
{
    /**
     * {@inheritDoc}
     */
    public function createService(ServiceLocatorInterface $serviceLocator)
    {
        
        /** @var DoctrineModule\Authentication\Adapter\ObjectRepository $authenticationService */
        return $serviceLocator->get('doctrine.authenticationservice.orm_default');

        
    }
}
