<?php

namespace Aaa\Repository;

use Aaa\Entity\User;
use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Max\Repository\AbstractMaxRepository;

/**
 * Role - vloge uporabnikov
 */
class Roles
        extends AbstractMaxRepository
{

    /**
     * default sort opcije
     *
     * @var array
     */
    protected $sortOptions     = [
        'default' => [
            'name'        => [ 'alias' => 'r.name',],
            'description' => [ 'alias' => 'r.description'],
            'builtIn'     => [ 'alias' => 'r.builtIn']
        ]
    ];
    protected $hydratorOptions = [
        'default' => [
            'exclude' => ['roles']
        ],
        'roles'   => [
            'byValue' => ['roles']
        ]
    ];

    /**
     * Iskanje za privzeto
     *
     * @param type $options['q'] je obvezen
     * @return Paginator
     */
    public function getPaginator(array $options, $name = 'default')
    {

        $em   = $this->getEntityManager();
        $qb   = $em->createQueryBuilder();
        $ex   = $qb->expr();
        $qb->select('r');
        $qb->from('\Aaa\Entity\Role', 'r');
        $sort = $this->getSort($name);
        $qb->orderBy($sort->order, $sort->dir);


        if (!empty($options['q'])) {
            $srch = mb_strtolower($options['q']);
            $qb->Where($ex->like('lower(r.name)', ':name'));
            $qb->setParameter('name', "%" . $srch . "%");
        }
        return new DoctrinePaginator(new Paginator($qb));
    }

    /**
     * odstrani dovoljenja iz objekta
     *
     * @param $object
     * @param $resIds array id ključ dovoljenj
     */
    public function removePermissions($object, $resIds)
    {
        $rr = $this->getEntityManager()->getRepository('\Aaa\Entity\Permission');
        if ($resIds) {
            foreach ($resIds as $resId => $v) {
                $perm = $rr->findOneById($resId);
                $object->getPermissions()->removeElement($perm);
                $perm->getRoles()->removeElement($object);
            }
        }
    }

    /**
     * dodaja izbrana dovoljenja v objekt
     *
     * @param $object
     * @param $resIds array id ključ dovoljenja
     */
    public function addPermissions($object, $resIds)
    {
        $rr = $this->getEntityManager()->getRepository('\Aaa\Entity\Permission');
        if ($resIds) {
            foreach ($resIds as $resId => $v) {
                $perm = $rr->findOneById($resId);
                if (!$object->getPermissions()->contains($perm)) {
                    $object->getPermissions()->add($perm);
                    $perm->getRoles()->add($object);
                }
            }
        }
    }

    /**
     * Vrne seznam role objektov, kot array collection 
     * @param User $user
     * @param string[] $names
     */
    public function resolveNames(User $user, $names)
    {

        foreach ($names as $name) {
            $r = $this->findOneByName($name);
            if ($r) {
                $user->getRoles()->add($r);
                $r->getUsers()->add($user);
            }
        }
    }
    
        /**
     * doda/ažurira seznam role objektov 
     * 
     * @param string[] $names
     * @return boolean  
     */
    public function azurirajNames(User $user, $names)
    {
        foreach ($names as $name) {
            $role = $this->findOneByName($name);
            if ($role) {
                if (!$user->getRoles()->contains($role)) {
                    $user->addRoles($role);
                }
            }
        }
        return true;
    }


    // vrne userje za vse vloge
    public function getRolesUsersArray()
    {
        $dql   = "SELECT r,u FROM Aaa\Entity\Role r JOIN r.users u" .
                " ORDER BY r.name,u.email ASC";
        $query = $this->getEntityManager()->createQuery($dql);
        return $query->getArrayResult();
    }

    // vrne userje za eno vlogo
    public function getRoleUsersArray($rolename)
    {
        $dql   = "SELECT r,u FROM Aaa\Entity\Role r JOIN r.users u" .
                " WHERE r.name='$rolename'ORDER BY u.email ASC";
        $query = $this->getEntityManager()->createQuery($dql);
        return $query->getArrayResult();
    }

        /**
     * 
     * @param Role $object
     * @param type $params
     * @return boolean
     */
    public function update($object, $params = null)
    {

        /**
         * rest update dovoljen le za nevgrajena dovoljenja
         */
        $this->expect(!$object->getBuiltIn(), "Vgrajenih vlog ni dovoljeno spreminjati", 1001500);

        parent::update($object, $params);
        return true;
    }

    /**
     * 
     * @param Permission $object
     */
    public function delete($object)
    {
        /**
         * rest delete dovoljen le za nevgrajena dovoljenja
         */
        $this->expect(!$object->getBuiltIn(), "Vgrajenih vlog ni dovoljeno brisati", 1001501);

        parent::delete($object);
    }

    
    
}
