<?php

namespace Jobs;


use Zend\Console\Adapter\AdapterInterface as Console;
use Zend\ModuleManager\Feature\ConsoleUsageProviderInterface;


class Module
    implements  ConsoleUsageProviderInterface
{

    public function getServiceConfig()
    {
        return [
            'factories' => [
                'jobmanager.service' => function ($sm) {
                }]
        ];
    }

    public function getConfig()
    {
        return array_merge(include __DIR__ . '/config/module.config.php', include __DIR__ . '/config/doctrine.config.php');
    }

    public function getAutoloaderConfig()
    {
        return [
            'Zend\Loader\ClassMapAutoloader' => [
                __DIR__ . '/autoload_classmap.php'
            ]
        ];
    }


    public function getConsoleUsage(Console $console)
    {
        return [
            'Job manager',
            'job run <id>' => 'Poženi job',
            'job runall' => 'Poženi vse jobe',
            'job list' => 'Seznam čakajočih jobov',
            'job list-running' => 'Seznam jobov v izvajanju',
            'job log <id>' => 'Prikaži log joba',
            'job reset <id>' => 'Job, ki je v napaki ali končan, vrni v čakanje',
            'job fail <id> <error>' => 'Končaj job s statusom napake (v log se shrani sporočilo <error>)'
        ];
    }

}
