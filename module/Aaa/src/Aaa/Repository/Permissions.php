<?php

namespace Aaa\Repository;

use Aaa\Entity\Permission;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Max\Repository\AbstractMaxRepository;

/**
 * Resource - dovoljenja
 *
 */
class Permissions extends AbstractMaxRepository 
{

    /**
     * default sort opcije
     *
     * @var array
     */
    protected $sortOptions = [
        'default' => [
            'name' => ['alias' => 'p.name'],
            'description' => ['alias' => 'p.description'],
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

        $type = isset($options['type']) ? $options['type'] : null;
        $skupine = isset($options['skupine']) ? $options['skupine'] : null;

        $srch = strtolower($options['text']);

        $em = $this->getEntityManager();
        $qb = $em->createQueryBuilder();
        $ex = $qb->expr();
        $sort = $this->getSort($name);

        $qb->select('p');
        $qb->from('\Aaa\Entity\Permission', 'p');
        $qb->orderBy($sort->order, $sort->dir);

        if ($srch || $type) {
            $qb->Where($ex->orx(
                            $ex->like('lower(p.name)', ':name'), $ex->like('lower(p.description)', ':description')
            ));


            $qb->setParameter('name', "%" . $srch . "%");
            $qb->setParameter('description', "%" . $srch . "%");
        }
        return new DoctrinePaginator(new Paginator($qb));
    }


        /** 
     * Vrne seznam Permission objektov, kot array collection 
     * @param string[] $names
     * @return Permission[]
     */
    public function resolveNames($names) {
        $ret = new ArrayCollection([]);
        foreach($names as $name) {
            $r = $this->findOneByName($name);
            if ($r) {
                $ret->add($r);
            }
        }
        return $ret;
    }
    
    
    
}
