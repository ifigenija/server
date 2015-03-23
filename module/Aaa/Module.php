<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Aaa;

use Aaa\Entity\Role;
use Aaa\Entity\User;
use Aaa\EntityEvents\PrePersistListener;
use Aaa\EntityEvents\RevisionsListener;
use Aaa\Resolver\DoctrineResolver;
use Doctrine\ORM\EntityManager;
use Zend\Authentication\Adapter\Http;
use Zend\Authentication\Storage\NonPersistent;
use Zend\Console\Adapter\AdapterInterface;
use Zend\Console\Request;
use Zend\Http\Response;
use Zend\ModuleManager\Feature\ConsoleUsageProviderInterface;
use Zend\Mvc\ModuleRouteListener;
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
                __DIR__ . '/autoload_classmap.php'
            ]
        ];
    }

    public function onBootstrap(MvcEvent $e)
    {

        $eventManager = $e->getApplication()->getEventManager();
        $sm = $e->getApplication()->getServiceManager();

        $moduleRouteListener = new ModuleRouteListener();
        $moduleRouteListener->attach($eventManager);

        // strategija za reagiranje ob neautoriziranem dostopu
        $eventManager->attach($sm->get('rbac_strategy'));
        $authService = $sm->get('Zend\Authentication\AuthenticationService');



        if ($e->getRequest() instanceof Request) {
            // handling autorizacij preko konzole
            $identity = $this->setConsoleAuthorization($authService, $em);
            // za consolne zahteve nastavim politiko na allow
            $gm = $sm->get('ZfcRbac\Guard\GuardPluginManager');
            $rbac = $gm->get('ZfcRbac\Guard\ControllerGuard');
            $rbac->setProtectionPolicy('allow');
        } else {
            if ($authService->hasIdentity()) {
                $identity = $authService->getIdentity();
            } else {
                $identity = $this->tryHttpAuth($authService, $em, $e);
            }
        }

        $list->setIdentity($identity);
        $em = $sm->get('doctrine.entitymanager.orm_default');
        $evm = $em->getEventManager();
        $evm->addEventSubscriber(new RevisionsListener($sm, $identity));
    }

    /**
     * Privzeto hendlanje autorizacij preko konzole 
     */
    public function setConsoleAuthorization(\Zend\Authentication\AuthenticationService $authService, EntityManager $em)
    {

        $rep = $em->getRepository('Aaa\Entity\User');
        try {
            $user = $rep->findOneByUsername('console');
        } catch (\Exception $e) {
            $user = null;
        }
        if (!$user) {
            $role = new Role();
            $role->setName('tip-vse');
            $role->setBuiltIn(true);

            $guest = new Role();
            $guest->setName('guest');
            $guest->setBuiltIn(true);

            $pu = new Role();
            $pu->setName('prijavljen-uporabnik');
            $pu->setBuiltIn(true);

            $user = new User();
            $user->setUsername('console')
                    ->setName('console')
                    ->setSurname('console')
                    ->setPassword('console')
                    ->setEnabled('true')
                    ->setEmail('console@locahost');
            $user->getRoles()->add($role);
            $user->getHierRoles()->add($role);

            $em->persist($user);
            $em->persist($role);
            $em->persist($guest);
            $em->persist($pu);
            $em->flush();
        }
        $storage = $authService->getStorage();
        $storage->write($user);
        return $user;
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
            'user (setgroup|removegroup) <username> <group>' => 'Dodaj/odstrani uporabnika v/iz skupino(e)',
            'user updateCache' => 'Kreira job za update uporabniškega medpomnilnika'
        ];
    }

    public function tryHttpAuth($authService, $em, MvcEvent $e)
    {

        $resolver = new DoctrineResolver($em, '\Aaa\Entity\User');
        $adapter = new Http([
            'realm' => 'Tip',
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

}
