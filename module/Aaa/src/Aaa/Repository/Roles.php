<?php

namespace Aaa\Repository;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Proxy\__CG__\Aaa\Entity\Role;
use Tip\Repository\AbstractTipRepository;
use Tip\Repository\LookupInterface;
use Tip\Repository\PagingInterface;

/**
 * Role - vloge uporabnikov
 */
class Roles extends AbstractTipRepository implements LookupInterface, PagingInterface
{

    /**
     * default sort opcije
     *
     * @var \Tip\Config\Sort
     */
    protected $sortOptions = [
        'default' => [
            'naziv' => [
                'alias' => 'r.name',
                'alias' => 'r.description'
            ]
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

        $em = $this->getEntityManager();
        $qb = $em->createQueryBuilder();
        $ex = $qb->expr();
        $qb->select('r');
        $qb->from('\Aaa\Entity\Role', 'r');
        $sort = $this->getSort($name);
        $qb->orderBy($sort->order, $sort->dir);

        if ($srch) {
            $qb->Where($ex->like('lower(r.name)', ':name'));
            $qb->setParameter('name', "%" . $srch . "%");
        }
        return new \DoctrineORMModule\Paginator\Adapter\DoctrinePaginator(new Paginator($qb));
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
                }
            }
        }
    }

    /**
     * odstrani dovoljenja iz objekta
     *
     * @param $object
     * @param $resIds array id ključ dovoljenj
     */
    public function removeChildren($object, $resIds)
    {

        if ($resIds) {
            foreach ($resIds as $resId => $v) {
                $perm = $this->findOneById($resId);
                $object->getChildren()->removeElement($perm);
            }
        }
    }

    /**
     * dodaja izbrana dovoljenja v objekt
     *
     * @param $object
     * @param $resIds array id ključ dovoljenja
     */
    public function addChildren($object, $resIds)
    {
        if ($resIds) {
            foreach ($resIds as $resId => $v) {
                $perm = $this->findOneById($resId);
                if (!$object->getChildren()->contains($perm)) {
                    $object->getChildren()->add($perm);
                };
            }
        }
    }

    /**
     * Vrne seznam role objektov, kot array collection 
     * @param string[] $names
     * @return Role[]
     */
    public function resolveNames($names)
    {
        $ret = new ArrayCollection();
        foreach ($names as $name) {
            $r = $this->findOneByName($name);
            if ($r) {
                $ret->add($r);
            }
        }
        return $ret;
    }

    /**
     *   Poišče podvloge, ali pa vse vloge, ki so vrhnje
     * 
     */
    public function getRoleLevel($parent = null)
    {

        if ($parent == null) {
            $q = $this->getEntityManager()->createQuery('select r from \Aaa\Entity\Role r '
                    . 'where r.id  not in '
                    . '(select chld.id from \Aaa\Entity\Role prnt '
                    . 'Join prnt.children chld)');
            $res = $q->getResult();
        } else {
            $role = $this->find($parent);
            $res = $role->getChildren();
        }

        return $res;
    }

}
