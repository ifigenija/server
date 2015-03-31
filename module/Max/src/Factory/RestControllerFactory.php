<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Max\Factory;

use Doctrine\ORM\EntityManager;
use Max\Controller\RestController;
use Zend\Config\Config;
use Zend\Config\Reader\Yaml;
use Zend\ServiceManager\FactoryInterface;
use Zend\ServiceManager\ServiceLocatorInterface;

/**
 * Injecta Max\Controller\RestController
 *
 * @author boris
 * returns \Max\Controller\RestController
 */
class RestControllerFactory
        implements FactoryInterface
{


    public function createService(ServiceLocatorInterface $serviceLocator)
    {

        
        $parentLocator = $serviceLocator->getServiceLocator();
        $parentLocator->get('Zend\ServiceManager\ServiceLocatorInterface');

        $app = $parentLocator->get('Application');
        /* @var $event \Zend\Mvc\MvcEvent */ 
        $event = $app->getMvcEvent();
        $controller = $event->getRouteMatch()->getParam('controller');
        
        $config = $this->loadControllerConfig($controller);

        $cont = new RestController();
        $cont->setEm($parentLocator->get('doctrine.entityManager.orm_default'));
        $cont->setAuth($parentLocator->get('ZfcRbac\Service\AuthorizationService'));
        $cont->setConfig($config);     
            
        return $controller;
    }

    /**
     * Naloži konfiguracijo kontrollerja
     * @param type $controller
     */
    protected function loadControllerConfig($controller)
    {

        $configName = preg_replace('/\\*/', '.', strtolower($controller));

        $glob = 'module/*/config/' . $configName . '.yml';
        echo $glob;
        $files = glob($glob);
        foreach ($files as $file) {
            $reader = new Yaml();
            echo "$file" .PHP_EOL;
            $data = $reader->fromFile($file);
            return new Config($data);
        }
    }

}
