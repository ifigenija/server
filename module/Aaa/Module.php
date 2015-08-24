<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Aaa;

use Zend\Console\Adapter\AdapterInterface;
use Zend\ModuleManager\Feature\ConsoleUsageProviderInterface;

Class Module
        implements ConsoleUsageProviderInterface
{

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

    public function getServiceConfig()
    {
        return [
            'factories' => [
                'Zend\Authentication\AuthenticationService' => function ($serviceManager) {
                    return $serviceManager->get('Zend\Authentication\AuthenticationService');
                }
            ]
        ];
    }

    public function getConsoleUsage(AdapterInterface $console)
    {
        return [
            'Upravljanje uporabnikov',
            'user resetpass <username> <password>'                         => 'Ponastavi uporabnikovo geslo',
            'user (enable|disable) <username>'                             => 'Omogoči/onemogoči uporabnika',
            'user (grant|revoke) <username> <rolename>'                    => 'Dodaj/odstrani uporabnika v/iz skupino(e)',
            '(user|role) list [--username=username] [--rolename=rolename]' => 'Seznam uporavnikov / vlog',
        ];
    }

}
