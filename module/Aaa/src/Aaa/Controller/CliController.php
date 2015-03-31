<?php

/*
* cli vmesnik za upravljanje uorabnikov
 */
namespace Aaa\Controller;
/**
 * Description of Cli
 *
 * @author boris
 */
class CliController extends \Zend\Mvc\Controller\AbstractActionController
{
    //put your code here
    
    /**
     * Reset gesla preko cli
     */
    public function  passwordAction() {
        echo "pass.\n";
    }
    
    
    /**
     * Omogoči / onemogoči uporabnika
     */
    public function enableAction()
    {
        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");
        $username = $this->params('username');

        // poiščemo uporabnika v tabeli
        $user = $em->getRepository(Aaa\Entity\User)
                ->findOneBy(array('username' => $name));
        $user -> setEnable(true);      
        
        echo "enable.\n";
    }
    
    /**
     * Omogoči / onemogoči uporabnika
     */
    public function disableAction()
    {
        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");
        $username = $this->params('username');

        // poiščemo uporabnika v tabeli
        $user = $em->getRepository(Aaa\Entity\User)
                ->findOneBy(array('username' => $name));
        $user -> setEnable(false);      
        
        echo "disable.\n";
    }
        
        /**
     * Granta vlogo uporabniku uporabnika
         *
     */
    public function grantAction()
    {
        echo "grant\n";
    }
    
    /**
     * Odstrani vlogo uporabniku 
     */
    public function revokeAction()            {
        echo "revoke\n";
    }
    
    
    /**
     * Prikaže seznam uporabnikov
     * - user list  - prikaže vse
     * - user list --role=role - prikaže uporabnike za vlogo
     * - role list  - prikaže vse vloge 
     * - role list --user=user - prikaže vloge za uporabnika 
     */
    public function listAction() {
        echo "list\n";
    }
    
    /**
     * 
     */
}
