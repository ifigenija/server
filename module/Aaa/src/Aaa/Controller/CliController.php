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
class CliController
        extends \Zend\Mvc\Controller\AbstractActionController
{
    //put your code here

    /**
     * Reset gesla preko cli
     */
    public function passwordAction()
    {
        /* @var $em \Doctrine\ORM\EntityManager */
        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");
        $username = $this->params('username');
        $password = $this->params('password');

        $conf = $this->serviceLocator->get("Config");
        var_dump($conf['doctrine']['connection']);
        // nastavimo novo geslo
        $user = $em->getRepository("Aaa\Entity\User")
                ->resetPassword($username, $password);

        $em->flush();
        echo "Uporabniku  " . $username . " zamenjano geslo." . PHP_EOL;
    }

    /**
     * Omogoči / onemogoči uporabnika
     */
    public function enableAction()
    {
        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");
        $username = $this->params('username');

        // nastavimo na enable
        $user = $em->getRepository("Aaa\Entity\User")
                ->enable($username, TRUE);

        $em->flush();
        echo "Uporabnik  " . $username . "  enable-an." . PHP_EOL;
    }

    /**
     * Omogoči / onemogoči uporabnika
     */
    public function disableAction()
    {
        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");
        $username = $this->params('username');

        // postavimo na disable 
        $user = $em->getRepository("Aaa\Entity\User")
                ->enable($username, false);

        $em->flush();
        echo "Uporabnik " . $username . "  disable-an." . PHP_EOL;
    }

    /**
     * Granta vlogo uporabniku uporabnika
     *
     */
    public function grantAction()
    {
        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");
        $username = $this->params('username');
        $rolename = $this->params('role');

        $userR = $em->getRepository("Aaa\Entity\User");
        $user = $userR->findOneByUsername($username);
        if (!$user) {
            echo 'ni user -ja';
            throw new \Exception();
        }
        $roleR = $em->getRepository("Aaa\Entity\Role");
        $role = $roleR->findOneByName($rolename);
        if (!$role) {
            echo 'Ni role\n';
            throw new \Exception();
        }
        $roles = $user->getRoles();

        
        // z metodo contains bomo preverili, če uporabnik že ima vlogo
        if (!$roles->contains($role)) {
            // vloga uporabniku se ni dodeljena, zato jo dodaj:
            $user->addRoles($role);  // dodajamo na owner strani
            $em->flush();
            echo "dodana vloga.\n";
            return;
        }
        echo "user že ima vlogo.\n";
    }

    /**
     * Odstrani vlogo uporabniku 
     */
    public function revokeAction()
    {
//         removeRoles($role)
        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");
        $username = $this->params('username');
        $rolename = $this->params('role');

        $userR = $em->getRepository("Aaa\Entity\User");
        $user = $userR->findOneByUsername($username);
        if (!$user) {
            echo 'ni user -ja\n';
            throw new \Exception();
        }
        $roleR = $em->getRepository("Aaa\Entity\Role");
        $role = $roleR->findOneByName($rolename);
        if (!$role) {
            echo 'Ni role\n';
            throw new \Exception();
        }
        $roles = $user->getRoles();

        // z metodo contains bomo preverili, če uporabnik že ima vlogo
        if ($roles->contains($role)) {
            // vloga uporabniku se ni dodeljena, zato jo dodaj:
            $user->removeRoles($role);  // odstranimo na owner strani
            $em->flush();
            echo "odstranjena vloga.\n";
            return;
        }
        echo "uporabnik ni imel vloge.\n";
    }

    /**
     * Prikaže seznam uporabnikov
     * - user list  - prikaže vse
     * - user list --role=role - prikaže uporabnike za vlogo
     * - role list  - prikaže vse vloge 
     * - role list --user=user - prikaže vloge za uporabnika 
     */
    public function listAction()
    {
        echo "list\n";
    }

    /**
     * 
     */
}
