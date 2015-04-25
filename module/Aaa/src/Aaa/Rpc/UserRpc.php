<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Aaa\Rpc;

/**
 * Wrapper za strežbo rpc klicev v AaaService
 *
 * @author rado
 */
class UserRpcService
        extends \Max\Service\AbstractMaxService
{

    /**
     * Dodeljevanje vloge uporabniku
     * 
     * procedura deluje podobno kot konzolni ukaz: 
     *              bin/ifi user grant <username> <rolename>
     * 
     * @param string $username
     * @param string $rolename
     * 
     * @returns boolean uspešno/neuspešno
     */
    public function grant($username, $rolename)
    {
        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");
        $tr = $this->getServiceLocator()->get('translator');

        $user = $em->getRepository("Aaa\Entity\User")
                ->findOneByEmail($username);
        if (!$user) {
            throw new \Max\Exception\UnauthException($tr->translate('Ni user-ja'), 1000901);
        }
        $role = $em->getRepository("Aaa\Entity\Role")
                ->findOneByName($rolename);
        if (!$role) {
            throw new \Max\Exception\UnauthException($tr->translate('Ni role'), 1000902);
        }
        $roles = $user->getRoles();

        // z metodo contains bomo preverili, če uporabnik že ima vlogo
        if (!$roles->contains($role)) {
            $user->addRoles($role);
            $em->flush();
        }
        return true;
    }

    /**
     * Odvzem vloge userju
     * 
     * procedura deluje podobno kot konzolni ukaz: 
     *              bin/ifi user revoke <username> <rolename>
     * 
     * @param string $username
     * @param string $rolename
     * 
     * @returns boolean uspešno/neuspešno
     */
    public function revoke($username, $rolename)
    {
        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");
        $tr = $this->getServiceLocator()->get('translator');

        $user = $em->getRepository("Aaa\Entity\User")
                ->findOneByEmail($username);
        if (!$user) {
            throw new \Max\Exception\UnauthException($tr->translate('ni user -ja'), 1000905);
        }
        $roleR = $em->getRepository("Aaa\Entity\Role");
        $role  = $roleR->findOneByName($rolename);
        if (!$role) {
            throw new \Max\Exception\UnauthException($tr->translate('Ni role'), 1000906);
        }
        $roles = $user->getRoles();

        // z metodo contains bomo preverili, če uporabnik že ima vlogo
        if ($roles->contains($role)) {
            // vloga uporabniku se ni dodeljena, zato jo dodaj:
            $user->removeRoles($role);
            $em->flush();
        }
        return true;
    }

}
