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
                __DIR__ . '/autoload_classmap.php',
            )
        );
    }
    
     public function getConsoleUsage(AdapterInterface $console)
     {
         return [
             "Crpalka - zahteva, nastavljeno spremeljivo DEST_DB in config file crpalka.\$DEST_DB.php",
             "precrpaj <entity> <id>" => "Prečrpaj eno entiteto v drugo baz z vsemi relacijami",
             "precrpajVse <entity> " => "Prečrpaj vse entitete tega tipa z vsemi relacijami",
             "schema-update " => "Posodobi schemo v ciljni bazi"
         ];
     }

}
