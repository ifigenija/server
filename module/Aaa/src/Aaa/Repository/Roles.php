<?php

namespace Aaa\Repository;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Proxy\__CG__\Aaa\Entity\Role;
use Max\Repository\AbstractMaxRepository;
use Max\Repository\LookupInterface;
use Max\Repository\PagingInterface;

/**
 * Role - vloge uporabnikov
 */
class Roles
        extends AbstractMaxRepository
        implements LookupInterface, PagingInterface
{

    /**
     * default sort opcije
     *
     * @var \Max\Config\Sort
     */
    protected $sortOptions = [
        'default' => [
            'name' => [ 'alias' => 'r.name',],
            'description' => [ 'alias' => 'r.description']
        ]
    ];
    
    protected $hydratorOptions = [
        'default' => [
            'exclude' => ['roles']
        ],
        'roles' => [
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


}
