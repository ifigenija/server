<?php

/*
 */

namespace Aaa\Factory;

use Aaa\Rbac;
use Rbac\Traversal\Strategy\GeneratorStrategy;
use Rbac\Traversal\Strategy\RecursiveRoleIteratorStrategy;
use Zend\ServiceManager\FactoryInterface;
use Zend\ServiceManager\ServiceLocatorInterface;

/**
 * @author Boris
 * @licence GPL-V3
 */
class RbacFactory
        implements FactoryInterface
{

    /**
     * {@inheritDoc}
     */
    public function createService(ServiceLocatorInterface $serviceLocator)
    {
        if (version_compare(PHP_VERSION, '5.5.0', '>=')) {
            $traversalStrategy = new GeneratorStrategy();
        } else {
            $traversalStrategy = new RecursiveRoleIteratorStrategy();
        }
        return new Rbac($traversalStrategy);
    }

}
