<?php

/*
 * Licenca GPL V3 or later
 *  
 */

namespace Aaa\Task;

use Aaa\Entity\Permission;
use Aaa\Entity\Role;
use Doctrine\Common\Collections\ArrayCollection;
use Max\Task\AbstractTask;
use Max\Annotation\Task as Max;
/**
 * Task, ki posodobi "flat" cache vlog na uporabniku in dovoljenjih
 * @Max\Meta(name="Posodobi uporabnika", acl="Aaa-User-update")
 * @author boris
 */
class UpdateUserCacheTask
    extends AbstractTask
{

    /**
     * 
     */
    protected $silent = false;

    public function checkData()
    {
        if (isset($this->data['silent'])) {
            $this->siltent = true;
        }
    }

    /**
     * Task body, leti čez uporabnike in dovoljenja
     * in posodobi cache za vsakega
     *  
     */
    public function taskBody()
    {

        $this->pq = $this->em->createQuery('select r from \Aaa\Entity\Role r '
            . 'join r.children chld '
            . 'where chld.id  = :id ');
        $this->q = $this->em->createQuery('select r from \Aaa\Entity\Role r '
            . ' join r.permissions p '
            . 'where p.id  = :id ');


        $rep = $this->em->getRepository('Aaa\Entity\User');
        foreach ($rep->findAll() as $u) {
            $this->log('Posodabjam uporabnika' . $u->getName());
            $this->updateUserRoleCache($u);
        }
        $this->em->flush();
        $rep = $this->em->getRepository('Aaa\Entity\Permission');
        $i = 0;
        foreach ($rep->findAll() as $p) {
            $this->log('Posodabljam permission ' . $p->getName());
           
            $this->updatePermissionCache($p);
        }
    }

    /**
     * 
     * Posodobi allroles na uporabniku
     */
    public function updateUserRoleCache($u)
    {

        $coll = $u->getRoles()->toArray();
        $newState = new ArrayCollection();
        $children = $u->getRoles();

        $this->computeAllRoles($u->getHierRoles(), $newState);

        $cmpr = function ($a, $b) {
            return strcmp(spl_object_hash($a), spl_object_hash($b));
        };
        $toAdd = array_udiff($newState->toArray(), $coll, $cmpr);
        $toRemove = array_udiff($coll, $newState->toArray(), $cmpr);

        foreach ($toAdd as $element) {
            $children->add($element);
        }

        foreach ($toRemove as $element) {
            $children->removeElement($element);
        }
    }

    /**
     * Izračuna vse vloge, ki jih ima uporabnik dodeljene. Gre po hierarhiji 
     * vlog
     * 
     * @param array $roles
     * @param ArrayCollection $all
     */
    public function computeAllRoles($roles, ArrayCollection $all)
    {
        foreach ($roles as $role) {
            if (!$all->contains($role)) {
                $this->computeAllRoles($role->getChildren(), $all);
                if (!$all->contains($role)) {
                    $all->add($role);
                }
            }
        }
    }

    /**
     * 
     * funkcija posodobi cache allRoles  na 
     * objektu permission 
     * @param Permission $name Description
     */
    public function updatePermissionCache(Permission $perm)
    {

// posodobim vse child vloge 
        $coll = $perm->getAllRoles()->toArray();
        $children = $perm->getAllRoles();

        $newState = $this->getAllRolesContaining($perm);

        $cmpr = function ($a, $b) {
            return strcmp(spl_object_hash($a), spl_object_hash($b));
        };
        $toAdd = array_udiff($newState->toArray(), $coll, $cmpr);
        $toRemove = array_udiff($coll, $newState->toArray(), $cmpr);

        foreach ($toAdd as $element) {
            $children->add($element);
            
            $this->log("dodajam " . $perm->getName() . ' ' . $element->getName());
            
        }

        foreach ($toRemove as $element) {
            $children->removeElement($element);
        }
    }

    /**
     * 
     * Sestavim vse vloge, ki jih potrebuje eno
     * 
     * @param Permission $permission
     * @return ArrayCollection
     */
    private function getAllRolesContaining(Permission $permission)
    {

        $this->q->setParameter('id', $permission->id, 'string');
        $level1s = $this->q->getResult();
        $roles = new ArrayCollection();

        foreach ($level1s as $role) {
            if (!$roles->contains($role)) {
                $this->getParents($role, $roles);
                if (!$roles->contains($role)) {
                    $roles->add($role);
                }
            }
        }

        return $roles;
    }

    /**
     * Poišče vse, ki imajo to vlogo, kot child-a, ne glede na nivo
     * Efektivno poišče vse, vloge, ki vsebujejo iskano vlogo
     * @param type $role
     * @param type $roles
     */
    private function getParents($role, $roles)
    {
        $parents = $this->getParentsForRole($role);
        foreach ($parents as $pr) {
            if (!$roles->contains($pr)) {
                $this->log('dodana vloga ' . $pr->getName());
                $roles->add($pr);
                $this->getParents($pr, $roles);
            }
        }
    }

    /**
     * Poišče starše za vlogo.
     * Poiščemo jih s query, ker je asociacija enosmerna
     * @param Role $role
     * @return array
     */
    private function getParentsForRole($role)
    {
        $this->pq->setParameter('id', $role->id, 'string');
        return $this->pq->getResult();
    }

}
