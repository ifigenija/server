<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Aaa;

use Aaa\EntityEvents\RevisionsListener;
use Aaa\Resolver\DoctrineResolver;
use Doctrine\ORM\EntityManager;
use Exception;
use Max\Exception\UnauthException;
use Zend\Authentication\Adapter\Http;
use Zend\Authentication\AuthenticationService;
use Zend\Authentication\Storage\Session;
use Zend\Console\Adapter\AdapterInterface;
use Zend\Console\Request;
use Zend\Http\Response;
use Zend\ModuleManager\Feature\ConsoleUsageProviderInterface;
use Zend\Mvc\MvcEvent;

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
            'user resetpass <username>' => 'Ponastavi uporabnikovo geslo',
            'user (enable|disable) <username>' => 'Omogoči/onemogoči uporabnika',
            'user (grant|revoke) <username> <role>' => 'Dodaj/odstrani uporabnika v/iz skupino(e)',
            '(user|role) list [--user=user] [--role=role]' => 'Seznam uporavnikov / vlog'
        ];
    }

}
