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
use Rbac\Role\RoleInterface;
use Rbac\Traversal\Strategy\TraversalStrategyInterface;
use Traversable;
use Zend\ServiceManager\ServiceLocatorAwareInterface;

/**
 * Rbac object. It is used to check a permission against roles
 */
class Rbac
    extends \Rbac\Rbac
    implements ServiceLocatorAwareInterface
{

    use \Zend\ServiceManager\ServiceLocatorAwareTrait;

    /**
     * Determines if access is granted by checking the roles for permission.
     *
     * @param  RoleInterface|RoleInterface[]|Traversable $roles
     * @param  mixed                                     $permission
     * @return bool
     */
    public function isGranted($roles, $permission)
    {
        
        $roleNames = [];

        foreach ($roles as $role) {
            $roleNames[] = $role instanceof RoleInterface ? $role->getName() : (string) $role;
        }

        // Pogledamo če je možno dati dostop po kratkem postopku
        // z wildcard oz -vse, -beri-vse vloge
        if ($this->shortCircuit($roleNames, $permission)) {
            return true;
        }

        /* @var $em EntityManager */
        $em = $this->getServiceLocator()->get('doctrine.entitymanager.orm_default');
        // uporabimo doctrine result cache 
        $cache = $em->getConfiguration()->getResultCacheImpl();
        if ($cache->contains('permission-' . $permission)) {
            $cachedRoles = $cache->fetch('permission-' . $permission);
            $croles = explode(';', $cachedRoles);
        } else {
            $rep = $em->getRepository('Aaa\Entity\Permission');
            /* @var $perm Entity\Permission */
            $perm = $rep->findOneBy(['name' => $permission]);
            if (!$perm) {
                return false;
            }
            $croles = [];
            foreach ($perm->getAllRoles() as $r) {
                $croles[] = $r->getName();
            }
            $cache->save('permission-' . $permission, \implode(';', $croles));
        }

        return $this->matchRoles($croles, $roleNames);
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
// razdelim permission string na dele
        $perm = explode('-', strtolower($permission));
// preverim ali gre za read dovoljenje
        $is_read = $perm[count($perm) - 1] === 'read' || $perm[count($perm) - 1] === 'lookup';

        foreach ($roles as $role) {

// vloga tip-vse ima dostop do vsega, tako da takoj vrnemo true
            if ($role === 'ifi-vse') {
                return true;
            }

// če je zahtevan -read in -lookup, potem pogledamo če ima uporabnik vlogo branja,
// vsega v modulu ali pa globalno vlogo -beri-vse        
            if ($is_read) {
                if ($role === 'ifi-beri-vse') {
                    return true;
                }

                if (count($perm) >= 3
                    && substr($role, - 9) === '-beri-vse'
                    && $this->roleInModule($perm[0], $role)) {
                    return true;
                }
            }
// pohendlam ostale -vse vloge, ki niso -beri-vse ampak omogočajo poln
// dostop 
            if (substr($role, -4) === '-vse'
                && substr($role, - 9) !== '-beri-vse'
                && $this->roleInModule($perm[0], $role)) {
                return true;
            }
        }

// default je prepovedan, in jee potrebno preveriti ali 
        return false;
    }

    /**
     * 
     * Preveri ali je vloga iz modula, kjer imamo univerzalne vloge 
     * 
     * @param string $perm
     * @param $roleName
     * @return boolean
     */
    private function roleInModule($perm, $roleName)
    {
// preverimo ali smo v modulu, ki predvideva  wildcard vloge 
        if (in_array($perm, [
                'predprodukcija',
                'produkcija',
                'arhiv',
                'statistika',
                'workflow',
                'vfs'], true)) {
// prvi del permission stringa se ujema z imenom modula
            if ($perm === strtolower(substr($roleName, 0, strlen($perm[0])))) {
                return true;
            }
        }
    }

    /**
     * Preveri, če ima uporabnik vsaj eno potrebno vlogo
     * 
     * @param array $needs
     * @param array $has
     * @return boolean
     */
    public function matchRoles(array $needs, array $has)
    {
        // katere vloge od potrebnih ima uporabnik
        $intersect = array_intersect($needs, $has);
        
        // če ima vsaj eno potrebno vlogo
        return !empty($intersect);
    }

}
