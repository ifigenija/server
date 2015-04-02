<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
namespace Max;
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
        return include __DIR__ . '/config/module.config.php';
    }
    
    /**
     * 
     */
    public function onBootstrap() {
               // dodaj driver za anotacije
        AnnotationRegistry::registerAutoloadNamespace('Max\Ann\Entity', __DIR__ . '/src');
 
    }

    public function getAutoloaderConfig()
    {
        return [
            'Zend\Loader\ClassMapAutoloader' => [
                __DIR__ . '/autoload_classmap.php'
            ]
        ];
    }
}
