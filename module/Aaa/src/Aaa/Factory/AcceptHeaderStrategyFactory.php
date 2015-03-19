<?php


namespace Aaa\Factory;

use Aaa\View\Strategy\AcceptHeaderStrategy;
use Zend\Authentication\AuthenticationService;
use Zend\ServiceManager\FactoryInterface;
use Zend\ServiceManager\ServiceLocatorInterface;

/**
 * Factory to create a content type strategy
 *
 * @author  boris@max.si
 * @licence MIT
 */
class AcceptHeaderStrategyFactory implements FactoryInterface
{
    /**
     * {@inheritDoc}
     */
    public function createService(ServiceLocatorInterface $serviceLocator)
    {
        
        /** @var AuthenticationService $authenticationService */
        $authenticationService = $serviceLocator->get('Zend\Authentication\AuthenticationService');

        return new AcceptHeaderStrategy($authenticationService);
    }
}
