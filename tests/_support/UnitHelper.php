<?php

namespace Codeception\Module;

// here you can define custom actions
// all public methods declared in helper class will be available in $I

class UnitHelper
    extends \Codeception\Module
{

    /**
     * @return \Zend\ServiceManager\ServiceManager 
     */
    public function grabServiceManager()
    {
        return $this->getModule('ZF2')->application->getServiceManager();
    }

    /**
     * @return \Doctrine\ORM\EntityManager
     */
    public function grabEntityManager()
    {
        return $this->grabServiceManager()->get('doctrine.entitymanager.orm_default');
    }

    public function impersonate($userName = 'console')
    {

        $authService = $this->grabServiceManager()
            ->get('Zend\Authentication\AuthenticationService');
        $user = $this->grabEntityManager()
            ->getRepository('Aaa\Entity\User')
            ->findOneByUsername($userName);

        $authService->getStorage()->write($user);
        return $user;
    }
    
    public function clearIdentity() {
        $authService = $this->grabServiceManager()
            ->get('Zend\Authentication\AuthenticationService');
        $authService->clearIdentity();
    }

}
