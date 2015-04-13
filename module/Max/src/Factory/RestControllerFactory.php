<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Max\Factory;

use Max\Controller\RestController;
use Zend\ServiceManager\ServiceLocatorInterface;

/**
 * Description of RestControllerFactory
 *
 * @author boris
 */
class RestControllerFactory
        extends AbstractEntityControllerFactory
{

    /**
     * factory za kreiranje standardiziranega rest controllerja  
     * 
     * @param \Zend\Factory\ServiceLocatorInterface $serviceLocator
     * @return \Max\Factory\MetaController
     */
    public function createService(ServiceLocatorInterface $serviceLocator)
    {
        $locator = $this->getParentLocator($serviceLocator);
        // najprej dobim privzeto ime entitete 
        $controler  = $this->stripControllerName($locator->get('Application')->getMvcEvent());        
        // naložim konfig za kontroller oz vsaj določim privzeti 
        // entity class 
        $config = $this->loadControllerConfig('rest', $controler, $locator);

        // ustvarim kontroller in mu nastavim em, auth in konfig 
        $cont = new RestController();
        $cont->setEm($locator->get('doctrine.entitymanager.orm_default'));
        $cont->setAuth($locator->get('ZfcRbac\Service\AuthorizationService'));
        $cont->setConfig($config);
        return $cont;
    }

    //put your code here
}
