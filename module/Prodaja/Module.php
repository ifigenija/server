<?php

/*
 * 
 *  
 * 
 */

namespace Prodaja;

use Zend\Console\Adapter\AdapterInterface;
use Zend\ModuleManager\Feature\ConsoleUsageProviderInterface;
use Zend\Mvc\MvcEvent;

Class Module
        implements ConsoleUsageProviderInterface
{

    public function getConfig()
    {
        return array_merge(include __DIR__ . '/config/module.config.php', include __DIR__ . '/config/doctrine.config.php');
    }

    public function getAutoloaderConfig()
    {
        return [
            'Zend\Loader\ClassMapAutoloader' => [
                'module/Prodaja/autoload_classmap.php',
            ]
        ];
    }

    public function onBootstrap(MvcEvent $e)
    {
        
    }

    public function getConsoleUsage(AdapterInterface $console)
    {
        return [];
    }

}
