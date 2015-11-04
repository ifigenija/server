<?php

/* 
 * Licenca GPL V3 or later
 *  
 */

namespace Crpalka;

use Zend\ModuleManager\Feature\ConsoleUsageProviderInterface;
use Zend\Console\Adapter\AdapterInterface;

class Module implements ConsoleUsageProviderInterface
{

    public function getConfig()
    {
        return include __DIR__ . '/config/module.config.php';
    }

    public function getAutoloaderConfig()
    {
        return array(
            'Zend\Loader\ClassMapAutoloader' => array(
                __DIR__ . '/autoload_classmap.php',//crpalka
                __DIR__ . '/../Aaa/autoload_classmap.php',//aaa
                __DIR__ . '/../Logistika/autoload_classmap.php',//Logistika
                __DIR__ . '/../Tip/autoload_classmap.php',//Tip
                __DIR__ . '/../Jobs/autoload_classmap.php',//Jobs
                __DIR__ . '/../Zapisi/autoload_classmap.php',//Zapisi
                __DIR__ . '/../Narocila/autoload_classmap.php',//Narocila
                __DIR__ . '/../Tehnologija/autoload_classmap.php',//Tehnologija
                __DIR__ . '/../Proizvodnja/autoload_classmap.php',//Proizvodnja
                __DIR__ . '/../Max/autoload_classmap.php',//Max
                __DIR__ . '/../Checklist/autoload_classmap.php',//Checklist

            )
        );
    }
    
     public function getConsoleUsage(AdapterInterface $console)
     {
         return [
             "Crpalka",
             "crpalka precrpaj <entity> <id>" => "Prestavi eno entiteto v drugo baz s vsemi relacijami",
             "crpalka precrpajVse <entity> " => "Prestavi v drugo baz vse entitete tega tipa s vsemi relacijami",
             "crpalka schema-update " => "Posodobi schemo"
         ];
     }

}
