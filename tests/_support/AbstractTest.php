<?php

use Codeception\TestCase\Test;
use Doctrine\ORM\EntityManager;
use Zend\ServiceManager\ServiceManager;

 class AbstractTest
    extends Test
{

    protected $actor = 'tester';

    /**
     * @var UnitTester
     */
    protected $tester;

    /**
     * @var ServiceManager
     */
    private $sm;

    /**
     * @var EntityManager
     */
    private $em;

    public function __get($name)
    {
        $I = $this->tester;
        if ($name == 'sm') {
            return $I->grabServiceManager();
        }
        if ($name == 'em') {
            return $I->grabEntityManager();
        }

        throw new Exception('getter-error-abstract-test');
    }

    protected function setIdentity($name = 'console')
    {

        $authService = $this->tester
            ->grabServiceManager()
            ->get('Zend\Authentication\AuthenticationService');
        $user = $this->tester
            ->grabEntityManager()
            ->getRepository('Aaa\Entity\User')
            ->findOneByUsername($name);

        $authService->getStorage()->write($user);
    }

    
}     