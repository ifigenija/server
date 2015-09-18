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
        return array_merge(include __DIR__ . '/config/module.config.php', include __DIR__ . '/config/doctrin.config.php');
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
