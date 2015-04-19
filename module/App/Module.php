<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App;

use Aaa\EntityEvents\RevisionsListener;
use Aaa\Resolver\DoctrineResolver;
use App\EntityEvents\PrePersistListener;
use Doctrine\ORM\EntityManager;
use Exception;
use Max\Exception\UnauthException;
use Zend\Authentication\Adapter\Http;
use Zend\Authentication\AuthenticationService;
use Zend\Console\Request;
use Zend\EventManager\EventInterface;
use Zend\Http\Response;
use Zend\Mvc\ModuleRouteListener;
use Zend\Mvc\MvcEvent;
use Zend\Paginator\Paginator;

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

    // priključim service 
    public function onBootstrap(EventInterface $e)
    {
        Paginator::setDefaultItemCountPerPage(30);

        ini_set('html_errors', 'Off');
        $eventManager        = $e->getApplication()->getEventManager();
        $moduleRouteListener = new ModuleRouteListener();
        $moduleRouteListener->attach($eventManager);

        $sm   = $e->getApplication()->getServiceManager();
        $em   = $sm->get('doctrine.entitymanager.orm_default');
        $auth = $sm->get('Zend\Authentication\AuthenticationService');

        //
        // Narediti session tako, da se virtual hosti ne bodo med seboj mešali 
        // da se avtentikacija ne prenaša med vhosti
        // poskrbim za identiteto uporabnika 
        if ($e->getRequest() instanceof Request) {
            // handling autorizacij preko konzole
            $this->setIdentity('console', $auth, $em);
        } else {
            if (!$auth->hasIdentity()) {
                $id = $this->tryHttpAuth($auth, $em, $e);
                if (!$id) {
                    $this->setIdentity('anonymous', $auth, $em);
                }
            }
        }

        $identity = $auth->getIdentity();
        // $identity = $this->setConsoleAuthorization($authService, $em);
        $evm      = $em->getEventManager();
        $evm->addEventSubscriber(new RevisionsListener($sm, $identity));

        $config = $sm->get('entity.metadata.factory')->getAllEntityConfig();
        $evm->addEventSubscriber(new PrePersistListener($config));
    }

    /**
     * Za programsko nastavljanje identitete. Se uporablja za
     * nastavitve identitete v konzolnih requestih in 
     * nastavitev identitete za anonimni dostop
     * 
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
        $adapter  = new Http([
            'realm'          => 'Max',
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
        /* @var $authService AuthenticationService */
        $authResult = $authService->authenticate();
        if ($authResult->isValid()) {
            $identity = $authResult->getIdentity();
            $authService->getStorage()->write($identity);
        } else {
            $authService->setAdapter($originalAdapter);
            $identity = null;
        }
        return $identity;
    }

}
