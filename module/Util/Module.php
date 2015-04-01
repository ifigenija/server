<?php

/*
 * 
 *  
 * 
 */

namespace Util;

use App\EntityEvents\PrePersistListener;
use Zend\Console\Adapter\AdapterInterface;
use Zend\ModuleManager\Feature\ConsoleUsageProviderInterface;
use Zend\Mvc\MvcEvent;


Class Module
        implements ConsoleUsageProviderInterface
{

    public function getConfig()
    {
        return include __DIR__ . '/config/module.config.php';
    }

    public function getAutoloaderConfig()
    {
        return [
            'Zend\Loader\ClassMapAutoloader' => [
                 'module/Max/autoload_classmap.php',
                 'module/Util/autoload_classmap.php',
                 'module/Aaa/autoload_classmap.php',
                 'module/App/autoload_classmap.php',
                 'module/Util/autoload_classmap.php',
                 'module/Prisotnost/autoload_classmap.php',
                 'module/Prodaja/autoload_classmap.php',
                 'module/Produkcija/autoload_classmap.php',
                 'module/Koledar/autoload_classmap.php',
                 'module/Abonmaji/autoload_classmap.php',
            ]
        ];
    }

    public function onBootstrap(MvcEvent $e)
    {
        $eventManager = $e->getApplication()->getEventManager();        
        
        $sm = $e->getApplication()->getServiceManager();
        $em = $sm->get('doctrine.entitymanager.orm_default');
        $evm = $em->getEventManager();
        $config = $sm->get('Config');        
        $evm->addEventSubscriber(new PrePersistListener($config['entity_config']));
        
    }

    public function getConsoleUsage(AdapterInterface $console)
    {
        return [
            'Pomožne operacije ',
            'populate' => 'Vnese inicialne podatke v prazno bazo. Če se požene na polni bazi poskuša dopolniti manjkajoče vnose'
        ];
    }

   

}
