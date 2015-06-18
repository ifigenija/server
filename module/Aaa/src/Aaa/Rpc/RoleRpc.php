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
class RoleRpcService
        extends \Max\Service\AbstractMaxService
{

    /**
     * Dodeljevanje dovoljenja vlogi
     * 
     * @param string $rolename  ime vloge
     * @param string $permname  ime dovoljenja
     * 
     * @returns boolean uspešno/neuspešno
     */
    public function grant($rolename, $permname)
    {
        // preverjanje avtorizacije
        $this->expectPermission("Aaa-write");
        
        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");
        $tr = $this->getServiceLocator()->get('translator');

        $role = $em->getRepository("Aaa\Entity\Role")
                ->findOneByName($rolename);
        if (!$role) {
            throw new \Max\Exception\UnauthException($tr->translate('Ni role'), 1000911);
        }
        $perm = $em->getRepository("Aaa\Entity\Permission")
                ->findOneByName($permname);
        if (!$perm) {
            throw new \Max\Exception\UnauthException($tr->translate('Ni dovoljenja'), 1000912);
        }

        $perms = $role->getPermissions();

        // z metodo contains bomo preverili, če vloga že ima permission
        if (!$perms->contains($perm)) {
            $role->addPermissions($perm);
            $em->flush();
        }
        return true;
    }

    /**
     * Odvzem dovoljenja vlogi
     * 
     * @param string $rolename  ime vloge
     * @param string $permname  ime dovoljenja
     * 
     * @returns boolean uspešno/neuspešno
     */
    public function revoke($rolename, $permname)
    {
        // preverjanje avtorizacije
        $this->expectPermission("Aaa-write");

        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");
        $tr = $this->getServiceLocator()->get('translator');

        $role = $em->getRepository("Aaa\Entity\Role")
                ->findOneByName($rolename);
        if (!$role) {
            throw new \Max\Exception\UnauthException($tr->translate('Ni role'), 1000914);
        }
        $perm = $em->getRepository("Aaa\Entity\Permission")
                ->findOneByName($permname);
        if (!$perm) {
            throw new \Max\Exception\UnauthException($tr->translate('Ni permission-a'), 1000915);
        }
        
        $perms = $role->getPermissions();   //$$ rb za implementirati

        // z metodo contains bomo preverili, če vloga že ima permission
        if ($perms->contains($perm)) {
            // permission vlogi dodeljen, zato ga odvzami:
            $role->removePermissions($perm);  
            $em->flush();
        }
        return true;
    }

}
