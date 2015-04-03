<?php

/*
 * 
 * Pomožni modul, ki se uporablja samo pri unit testih 
 * za override konfiguracije iz drugih modulov
 * 
 */

namespace TestAssets;

Class Module
{

    public function getConfig()
    {
        return array_merge(include __DIR__ . '/config/module.config.php');
    }

    public function getAutoloaderConfig()
    {
        return [
            'Zend\Loader\ClassMapAutoloader' => [
                'module/App/autoload_classmap.php',
                'tests/TestAssets/autoload_classmap.php',
            ]
        ];
    }



}
