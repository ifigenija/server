<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Max\Controller\Traits;

use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityRepository;
use Max\Exception\EntitetaNeObstaja;
use Max\Exception\NepopolniParametriZaAkcijo;
use Max\Exception\ParamsException;
use Max\Form\ManagedForm;
use ZfcRbac\Service\AuthorizationService;

/**
 * Description of EntityTrait
 *
 * @author boris
 */
trait EntityTrait
{

    /**
     * Entity Manager
     * @var EntityManager
     */
    protected $em;

    /**
     *
     * Razred entitete, ki jo obdelujemo z rest controllerjem.
     * 
     * 
     * @var string
     */
    protected $entityClass;

    /**
     *  Servis za dostop do ACL-jev
     * 
     * @var AuthorizationService
     */
    protected $auth;

    /**
     * @var array
     */
    protected $config;

    /**
     * Getter za entityClass
     * @return string 
     */
    function getEntityClass()
    {
        return $this->entityClass;
    }

    /**
     * Geter za EntityManager
     * @return EntityManager;
     */
    public function getEm()
    {
        if (!$this->em) {
            $this->em = $this->serviceLocator->get('doctrine.entitymanager.orm_default');
        }
        return $this->em;
    }

    /**
     * Seter za entityManager 
     * @param EntityManager $em
     * 
     */
    public function setEm(EntityManager $em)
    {
        $this->em = $em;
        return $this;
    }

    /**
     * Short hand metoda za pridobitev repozitorija v 
     * kontroller kodi
     * 
     * @param string $class
     * @return EntityRepository
     */
    public function getRepository($class = null)
    {
        
        if (!$class) {
            $rep = $this->getEm()->getRepository($this->getEntityClass());
        } else {
            $rep = $this->getEm()->getRepository($class);
        }
        $rep->setServiceLocator($this->getServiceLocator());
        return $rep;
    }

    /**
     * Naredi formo poljubnega razreda s pomočjo FormElementManagerja
     * @param string $class class forme
     * @return ManagedForm
     */
    public function getForm($config = null)
    {
        if (is_string($config)) {
            
        }
        $formManager = $this->serviceLocator->get('FormElementManager');
        $formManager = $this->serviceLocator->get('FormElementManager');
        
        if (isset($config['type'])) {
        $form = $formManager->get($class);
        return $form;
        } else {
            
        }
    }

    /**
     * Vrne nastavljeno, ali pa naredi privzeto json  formo 
     * za entiteto razreda $class
     * @param type $class
     * @return type
     */
    public function getJsonForm($class = null)
    {

        $formManager = $this->serviceLocator->get('FormElementManager');
        $form = $formManager->get('\Max\Form\JsonForm');
        if (!$class) {
            return $form->setEntity($this->getEntityClass());
        } else {
            return $form->setEntity($class);
        }
    }

    /**
     * Iz parametrov requesta poskuša poiskati parameter id iz route 
     * ali pa iz query parametrov
     * 
     * @param string $param ime parametra, ki ga naj iščem
     * @param boolean $optional a mora biti parameter prisoten
     * @return string
     * @throws NepopolniParametriZaAkcijo
     */
    public function getFromRouteOrQuery($param = 'id', $optional = false)
    {
        $id = $this->params($param, null);
        if (!$id) {
            $id = $this->params()->fromQuery($param, null);
        }
        if (!($optional || $id)) {
            $translator = $this->getServiceLocator()->get('translator');
            $msg = sprintf($translator->translate('Parameter %s je obvezen'), $param);
            throw new NepopolniParametriZaAkcijo($msg, 100004);
        }
        return $id;
    }

    /**
     * Naloži entiteto glede na nastavljen $this->entityClass ali pa 
     * glede na $class in ime parametra, iz katerega iščemo id entitete
     * 
     * @param string $class razred entitete
     * @param string $param ime parametra z id-jem entitete
     * @param boolean $optional je prisotnost entitete opcijska
     * @return type
     * @throws EntitetaNeObstaja
     */
    public function loadEntity($class = null, $param = 'id', $optional = false)
    {
        $id = $this->getParamFromAny($param, $optional);
        if (!$id && $optional) {
            return null;
        }

        $sr = $this->getRepository($class);
        $object = $sr->find($id);
        if (!$object && !$optional) {
            $translator = $this->getServiceLocator()->get('translator');
            $msg = sprintf($translator->translate('Entiteta z id (%s) ne obstaja v %s'), $id, $sr->getClassName());
            throw new EntitetaNeObstaja($msg, 100097);
        }

        return $object;
    }

    /**
     * Setter, ki uredi tudi $this->entity
     * @param type $entityClass
     * @return type
     */
    function setEntityClass($entityClass)
    {
        $this->entityClass = $entityClass;
        return $this;
    }

    /**
     * Metoda s katero pridobimo default permission 
     * za entiteto, ki jo obdelujemo
     * @param type $action
     * @return type
     */
    public function getEntityPermission($action)
    {
        $prefix = $this->getConfig('permPrefix', $this->getDefaultPermPrefix());
        return $prefix . '-' . $action;
    }

    /**
     * Privzeti permission prefix je zadnji del entitete \Max\Entity\Entiteta -> entiteta
     * return string
     */
    public function getDefaultPermPrefix()
    {
        
        if ($this->entityClass) {
            $segments = explode('\\', $this->entityClass);

            return strtolower(array_pop($segments));
        } else {
            throw new ParamsException('Entity class ni nastavljen', 100003);
        }
    }

    public function stripEntity()
    {
        $segments = explode('\\', $this->entityClass);
        return strtolower(array_pop($segments));
    }

    abstract public function getServiceLocator();

    function getAuth()
    {
        return $this->auth;
    }

    function getConfig($name = null, $default = null)
    {
        if (!$name) {
            return $this->config;
        } else {
            $fields = explode('.', $name);
            foreach ($fields as $f) {
                if (isset($config[$f])) {
                    $config = $config[$f];
                } else {
                    return $default;
                }
            }
            return $config;
        }
    }

    /**
     * 
     * 
     * @param AuthorizationService $auth
     * @return self
     */
    function setAuth(AuthorizationService $auth)
    {
        $this->auth = $auth;
        return $this;
    }

    /**
     * Nastavimo konfig iz razreda entitete
     * 
     * @param array $config
     * @throws ParamsException
     */
    function setConfig($config)
    {
        $this->config = $config;

        if (empty($config['entityClass'])) {
            throw new ParamsException('EntityClass missing in controller config', 100000);
        }
        $this->entityClass = $config['entityClass'];  
        return $this;
    }

}
