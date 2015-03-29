<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App;

use Zend\EventManager\EventInterface;
use Zend\Mvc\ModuleRouteListener;
use Zend\Paginator\Paginator;

/**
 * Base nastavitve za Ifigenijo
 *
 * @author boris
 */
class Module
{

    //put your code here
    public function getConfig()
    {
        return array_merge(include __DIR__ . '/config/module.config.php', include __DIR__ . '/config/doctrine.config.php');
    }

    public function getAutoloaderConfig()
    {
        return [
            'Zend\Loader\ClassMapAutoloader' => [
                __DIR__ . '/autoload_classmap.php'
            ]
        ];
    }

    // priključim service 
    public function onBootstrap(EventInterface $e)
    {
        Paginator::setDefaultItemCountPerPage(30);

        $eventManager = $e->getApplication()->getEventManager();        
        $moduleRouteListener = new ModuleRouteListener();
        $moduleRouteListener->attach($eventManager);
    }

}
