<?php

/*
 * cli vmesnik za upravljanje uorabnikov
 */

namespace Aaa\Controller;
use Zend\Mvc\Controller\AbstractActionController;

/**
 * Description of Cli
 *
 * @author boris
 */
class CliController
        extends AbstractActionController
{
    //put your code here

    /**
     * Reset gesla preko cli
     */
    public function passwordAction()
    {
        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");
        $username = $this->params('username');
        $password = $this->params('password');

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
        $user = $userR->findOneByEmail($username);
        if (!$user) {
            echo "ni user -ja \n";
            throw new \Exception();
        }
        $roleR = $em->getRepository("Aaa\Entity\Role");
        $role = $roleR->findOneByName($rolename);
        if (!$role) {
            echo "Ni role\n";
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
        $user = $userR->findOneByEmail($username);
        if (!$user) {
            echo "ni user -ja\n";
            throw new \Exception();
        }
        $roleR = $em->getRepository("Aaa\Entity\Role");
        $role = $roleR->findOneByName($rolename);
        if (!$role) {
            echo "Ni role\n";
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
        echo "uporabnik nima vloge.\n";
    }

    /**
     * Prikaže seznam uporabnikov
     * - user list  - prikaže vse
     * - user list --rolename=rolename - prikaže uporabnike za vlogo
     * - role list  - prikaže vse vloge 
     * - role list --username=username - prikaže vloge za uporabnika 
     */
    public function listAction()
    {
        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");
        $what = $this->params('what');
        $username = $this->params('username');
        $rolename = $this->params('rolename');

        if ($what == 'user') {
            if (strlen($username) > 0) {
                echo "        *** parameter --username se v kombinaciji z user  ne upošteva ***\n";
            }
            if (strlen($rolename) > 0) {
                // 1 vloga         
                $roleA = $em->getRepository("Aaa\Entity\Role")->getRoleUsersArray($rolename);
            } else {
                // vse vloge
                $roleA = $em->getRepository("Aaa\Entity\Role")->getRolesUsersArray();
            }
            // še izpis:
            foreach ($roleA as $role) {
                echo "vloga      : " . $role["name"] . "\n";
                foreach ($role['users'] as $user) {
                    echo " uporabnik :  " . $user['email'] . "\n";
                }
            }
        }

        // ali prikažem vloge         
        if ($what == 'role') {
            if (strlen($rolename) > 0) {
                echo "        *** parameter --rolename se v kombinaciji z role  ne upošteva ***\n";
            }
            if (strlen($username) > 0) {
                //  1 uporabnik
                $userA = $em->getRepository("Aaa\Entity\User")->getUserRolesArray($username);
            } else {
                // vse uporabnike
                $userRR = $em->getRepository("Aaa\Entity\User"); //$$rb  začasno zaradi debugginga
                $userA = $userRR->getUsersRolesArray();
            }
            // še izpis:
            foreach ($userA as $user) {
                echo "uporabnik  : " . $user["email"] . "\n";
                foreach ($user['roles'] as $role) {
                    echo "     vloga :  " . $role['name'] . "\n";
                }
            }
        }
    }

}