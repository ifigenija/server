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

    public function onBootstrap(MvcEvent $e)
    {

        $sm = $e->getApplication()->getServiceManager();
        $em = $sm->get('doctrine.entitymanager.orm_default');
        $auth = $sm->get('Zend\Authentication\AuthenticationService');
        $auth->setStorage(new Session('ifigenija'));
        
        // poskrbim za identiteto uporabnika 
        if ($e->getRequest() instanceof Request) {
            // handling autorizacij preko konzole
            $this->setIdentity('console', $auth, $em);
        } else {
            if (!$auth->hasIdentity()) {
                $identity = $this->tryHttpAuth($auth, $em, $e);
                if (!$identity) {
                    $this->setIdentity('anonymous', $auth, $em);
                }
            }
        }

        $identity = $auth->getIdentity();
        // $identity = $this->setConsoleAuthorization($authService, $em);
        $evm = $em->getEventManager();
        $evm->addEventSubscriber(new RevisionsListener($sm, $identity));
    }

    /**
     * Privzeta identiteta za anonimnega uporabnika 
     */
    public function setIdentity($name, AuthenticationService $authService, EntityManager $em)
    {

        $rep = $em->getRepository('Aaa\Entity\User');
        try {
            $user = $rep->findOneByUsername($name);
        } catch (Exception $e) {
            $user = null;
        }
        if (!$user) {
            throw new UnauthException('Access denied identity not found');
        }

        $storage = $authService->getStorage();
        $storage->write($user);
        return $user;
    }

    /**
     * 
     * @param type $authService
     * @param type $em
     * @param \App\MvcEvent $e
     * @return type
     */
    public function tryHttpAuth($authService, $em, MvcEvent $e)
    {

        $resolver = new DoctrineResolver($em, '\Aaa\Entity\User');
        $adapter = new Http([
            'realm' => 'Max',
            'accept_schemes' => 'basic',
        ]);
        $adapter->setBasicResolver($resolver);
        $adapter->setRequest($e->getRequest());
        // zato da se ne pošiljajo http auth challenge nastavimo novi response, ki 
        // ne vpliva na pravi response
        $adapter->setResponse(new Response());

        // shranim si doctrine adapter
        $originalAdapter = $authService->getAdapter();
        $authService->setAdapter($adapter);
        $authResult = $authService->authenticate();
        if ($authResult->isValid()) {
            $identity = $authResult->getIdentity();
            $authService->getStorage()->write($identity);
        } else {
            $authService->setAdapter($originalAdapter);
        }
        return $authResult->isValid();
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
