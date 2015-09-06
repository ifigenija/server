<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Util\Controller;

use Doctrine\Common\DataFixtures\Executor\ORMExecutor;
use Doctrine\Common\DataFixtures\Loader;
use Zend\Config\Config;
use Zend\Mvc\Controller\AbstractActionController;

/**
 * Description of InstallController
 *
 * @author boris
 */
class InstallController
        extends AbstractActionController
{
   
    /**
     * Napolni podatke iz Fixtures
     */
    public function populateAction()
    {
        $logger = function ($message) {
            echo $message . PHP_EOL;
        };

        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");
        $config = new Config($this->serviceLocator->get('config'));

        $loader = new Loader();

        $fixtures = isset($config->fixtures) ? $config->fixtures : [];
        foreach ($fixtures as $dir) {
            $loader->loadFromDirectory($dir);
        }

        $executor = new ORMExecutor($em);
        $executor->setLogger($logger);
        $executor->execute($loader->getFixtures(), true);
    }

        /**
     * Napolni podatke iz Fixtures
     */
    public function populateTestAction()
    {
        $logger = function ($message) {
            echo $message . PHP_EOL;
        };

        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");
        $config = new Config($this->serviceLocator->get('config'));

        $loader = new Loader();

        $fixtures = isset($config->test_fixtures) ? $config->test_fixtures : [];
        foreach ($fixtures as $dir) {
            $loader->loadFromDirectory($dir);
        }

        $executor = new ORMExecutor($em);
        $executor->setLogger($logger);
        $executor->execute($loader->getFixtures(), true);
    }

}
