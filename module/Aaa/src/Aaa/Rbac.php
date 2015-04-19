<?php

/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/zf2 for the canonical source repository
 * @copyright Copyright (c) 2005-2014 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Aaa;

use Doctrine\ORM\EntityManager;
use Rbac\Rbac as RbacOriginal;
use Rbac\Role\RoleInterface;
use Traversable;
use Zend\ServiceManager\ServiceLocatorAwareInterface;

/**
 * Rbac object. It is used to check a permission against roles
 */
class Rbac
        extends RbacOriginal
        implements ServiceLocatorAwareInterface
{

    use \Zend\ServiceManager\ServiceLocatorAwareTrait;

    /**
     * Determines if access is granted by checking the roles for permission.
     *
     * Prodecura pogleda v MtM relacijo entitet role:permission, če obstaja relacija med
     * konkretno vlogo in konkretnim dovoljenjem
     * 
     * @param  RoleInterface|RoleInterface[]|Traversable $roles
     * @param  mixed                                     $permission
     * @return bool
     */
    public function isGranted($roles, $permission)
    {

        foreach ($roles as $role) {
            $roleNames[] = $role instanceof RoleInterface ? $role->getName() : (string) $role;
        }

        // Pogledamo če je možno dati dostop po kratkem postopku
        // 
        if ($this->shortCircuit($roleNames, $permission)) {
            return true;
        }

        return $this->matchRoles($roleNames, $permission);
    }

    /**
     * Determines if access is granted by checking the roles for permission.
     *
     * @param  RoleInterface|RoleInterface[]|Traversable $roles
     * @param  mixed                                     $permission
     * @return bool
     */
    private function shortCircuit($roles, $permission)
    {

        foreach ($roles as $role) {
// vloga ifi-all ima dostop do vsega, tako da takoj vrnemo true
            if ($role === 'ifi-all') {
                return true;
            }
// 
            if ($role === 'ifi-readall') {
                $part = substr($permission, -5);
                if ($part === '-read' || $part === '-list') {
                    return true;
                }
            }
        }

// default je prepovedan, in jee potrebno preveriti ali 
        return false;
    }

    /**
     * 
     * direktno pogledam ali ima skupina vlog določen permission
     * 
     * @param array $roles
     * @param string  $perm
     * @return bool
     */
    private function matchRoles($roles, $perm)
    {
        /* @var $em EntityManager */
        $em = $this->getServiceLocator()->get('doctrine.entitymanager.orm_default');

        $qb = $em->createQueryBuilder();
        $e  = $qb->expr();
        $qb->select('count(r) c');
        $qb->from('Aaa\Entity\Role', 'r');
        $qb->join('r.permissions', 'perm');
        $qb->where($e->eq('perm.name', ':perm'));
        $qb->andWhere($e->in('r.name', $roles));

        $qb->setParameter('perm', $perm);
        $cnt = $qb->getQuery()->getSingleScalarResult();
        return $cnt > 0;
    }

}
