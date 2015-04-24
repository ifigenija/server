<?php

namespace Aaa\Repository;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Aaa\Entity\Role;
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
    protected $sortOptions = [
        'default' => [
            'name'        => [ 'alias' => 'r.name',],
            'description' => [ 'alias' => 'r.description']
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
     * @param type $options['text'] je obvezen
     * @return Paginator
     */
    public function getPaginator(array $options, $name = 'default')
    {
        $srch = strtolower($options['text']);

        $em   = $this->getEntityManager();
        $qb   = $em->createQueryBuilder();
        $ex   = $qb->expr();
        $qb->select('r');
        $qb->from('\Aaa\Entity\Role', 'r');
        $sort = $this->getSort($name);
        $qb->orderBy($sort->order, $sort->dir);

        if ($srch) {
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
     * @param \Aaa\Entity\User $user
     * @param string[] $names
     */
    public function resolveNames(\Aaa\Entity\User $user, $names)
    {

        foreach ($names as $name) {
            $r = $this->findOneByName($name);
            if ($r) {
                $user->getRoles()->add($r);
                $r->getUsers()->add($user);
            }
        }
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

}
