<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Max\Factory;

use Max\Controller\RestController;
use Symfony\Component\Yaml\Yaml;
use Zend\Mvc\MvcEvent;
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
        /* @var $event MvcEvent */
        $event = $app->getMvcEvent();
        $controller =  $event->getRouteMatch()->getParam('controller');
        $entity =  str_replace('Rest\\', '', $controller);

        $em = $parentLocator->get('doctrine.entityManager.orm_default');
        $defaults = $this->getDefaultConfig($entity, $em);
        $config = $this->loadControllerConfig('rest', entity, $defaults);
        

        $dt = strlen($config['type']);
        $tip = $config['type']; 
        if (substr($controller, 0, $dt) !== $tip ){
        throw  new \Max\Exception\ParamsException('Napačni tip konfiga', );
        }
        
        $cont = new RestController();
        $cont->setEm($em);
        $cont->setAuth($parentLocator->get('ZfcRbac\Service\AuthorizationService'));
        $cont->setConfig($config);

        return $cont;
    }

    /**
     * Naloži konfiguracijo kontrollerja
     * @param type $controller
     */
    protected function loadControllerConfig($type, $controller, $data = [])
    {

        $glob = __DIR__ . "/../../../*/config/rest.$controller.yml";
        $files = glob($glob);
        foreach ($files as $file) {
            $content = file_get_contents($file);
            $data = array_merge($data, Yaml::parse($content));
        }
        return [];
    }

    /**
     * Get default config 
     * 
     * @param string $controller
     * @param \Doctrine\ORM\EntityManager $em 
     */
    protected function getDefaultConfig($controller, $em)
    {
        $classes = $em->getConfiguration()->getMetadataDriverImpl()->getAllClassNames();
        $dl = strlen($controller);
        $found = array_filter($array, function ($i) use ($controller, $dl) {
            return substr($i, -$dl) === $controller;
        });
        
        if ()
        
        return [
            'entityClass' => $entity,
            'form' => [
                'default' => []
            ],
            'list' => [
                'default' => []
            ]
            
        ]
    }

}
