<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Max\Factory;

use Symfony\Component\Yaml\Yaml;
use Zend\Mvc\Controller\ControllerManager;
use Zend\Mvc\MvcEvent;
use Zend\ServiceManager\FactoryInterface;
use Zend\ServiceManager\ServiceLocatorInterface;

/**
 * Injecta Max\Controller\RestController
 *
 * @author boris
 * returns \Max\Controller\RestController
 */
abstract class AbstractEntityControllerFactory
        implements FactoryInterface
{

    abstract public function createService(ServiceLocatorInterface $serviceLocator);

    /**
     * Naloži konfiguracijo kontrollerja
     * konfiguracijo išče po vseh config direktorijih v vseh modulih 
     * Če v konfigu ni določenega entity classa ali pa konfiga nismo našli
     * poskušam entity class določiti iz imena kontrollerja. Imena entitet 
     * pregledam, če vsebujejo ime kontrollerja 
     * 
     * @param string $type
     * @param string $controller
     */
    protected function loadControllerConfig($type, $controller, $locator)
    {

        $data = $this->getDefaultConfig($controller, $locator);
        $glob = __DIR__ . "/../../../*/config/$type.$controller.yml";
        $files = glob($glob);
        foreach ($files as $file) {
            $content = file_get_contents($file);
            $data = array_merge_recursive($data, Yaml::parse($content));
        }

        if (!isset($data['entityClass'])) {
            $data['entityClass'] = $this->getEntityClass($controller, $locator);
        }
        $data['meta'] = $this->getEntityMeta($data['entityClass'], $locator);
        return $data;
    }

    /**
     * Pridobi metapodatke za entiteto iz metadata factory
     */
    protected function getEntityMeta($entity, $locator)
    {
        $f = $locator->get('entity.metadata.factory');

        return $f->factory($entity);
    }

    /**
     * Get default config 
     * prazen privzeti konfig za kontroller. 
     * 
     * @param string $controller
     * @param ServiceLocatorInterface $locator
     */
    protected function getDefaultConfig($controller)
    {
        return [
            'forms' => [
                'default' => []
            ],
            'lists' => [
                'default' => []
            ]
        ];
    }

    /*
     * Iz imena zahtevanega controlerja (Rest\tralala -> Ttlala v routi naredi kratko ime entitete
     * @param MvcEvent $event 
     */

    protected function stripControllerName(MvcEvent $event)
    {
        $controller = $event->getRouteMatch()->getParam('controller');
        $entity = strtolower(preg_replace('/^[A-Z][a-z]+[\\\\]/', '', $controller));
        return $entity;
    }

    /*
     * Po kratkem imenu entitete poišče class entitete izmed vseh razredov, 
     * ki so registrirani na entieti
     * 
     * @param string $entity 
     * @param $locator ServiceLocatorInterface
     */
    protected function getEntityClass($entity, $locator)
    {
        $em = $locator->get('doctrine.entitymanager.orm_default');

        $classes = $em->getConfiguration()->getMetadataDriverImpl()->getAllClassNames();
        $dl = strlen($entity);

        foreach ($classes as $class) {
            if (strtolower(substr($class, -$dl)) === strtolower($entity)) {
                return $class;
            }
        }
        return null;
    }

    /**
     * Pridobi globalni service manager iz controller managerja 
     * 
     * @param ControllerManager $locator
     */
    protected function getParentLocator($locator)
    {
        $parentLocator = $locator->getServiceLocator();
        $parentLocator->get('Zend\ServiceManager\ServiceLocatorInterface');

        return $parentLocator;
    }

}
