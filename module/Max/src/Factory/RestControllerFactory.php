<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Max\Factory;

/**
 * Injecta Max\Controller\RestController
 *
 * @author boris
 * returns \Max\Controller\RestController
 */
class RestControllerFactory
        implements \Zend\ServiceManager\FactoryInterface
{

    //put your code here
    public function createService(\Zend\ServiceManager\ServiceLocatorInterface $serviceLocator)
    {
        /* @var $app \Zend\Mvc\Application */
        $app = $serviceLocator->get('Application');
        $e = $app->getEvent();

        /* @var $em \Doctrine\ORM\EntityManager */
        $em = $serviceLocator->get('doctrine.entityManager.orm_default');


        $names = $em->getConfiguration()->getMetadataDriverImpl()->getAllClassNames();


        $cont = new \Max\Controller\RestController();

        $cont->setEntityClass($entity);

        return $controller;
    }

    protected function resolveIntoEntityClass($em, $e)
    {
        $names = $em->getConfiguration()->getMetadataDriverImpl()->getAllClassNames();
        $name = $e->getRouteMatch()->getParam('controller');

        return $names[$name];
        
    }

}
