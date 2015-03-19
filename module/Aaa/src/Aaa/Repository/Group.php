<?php

namespace Aaa\Repository;

use Doctrine\ORM\Query;
use Doctrine\ORM\Tools\Pagination\Paginator;
use Tip\Repository\AbstractTipRepository;
use Tip\Repository\LookupInterface;
use Tip\Repository\PagingInterface;

/**
 * Group - skupine uporabnikov
 *
 */
class Group extends AbstractTipRepository implements LookupInterface, PagingInterface
{

    /**
     * default sort opcije
     *
     * @var \Tip\Config\Sort
     */
    protected $sortOptions = [
        'default' => [
            'naziv' => ['alias' => 's.name'],
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
        $qb->select('s');
        $qb->from('\Aaa\Entity\Group', 's');
        $sort = $this->getSort($name);
        $qb->orderBy($sort->order, $sort->dir);

        if ($srch) {
            $qb->Where($ex->like('lower(s.name)', ':name'));
            $qb->setParameter('name', "%" . $srch . "%");
        }
        return new \DoctrineORMModule\Paginator\Adapter\DoctrinePaginator(new Paginator($qb));
    }

    public function getList()
    {

        $em = $this->getEntityManager();
        $qb = $em->createQueryBuilder();

        $qb->select(['s']);
        $qb->from('\Aaa\Entity\Group', 's');


        $l = $qb->getQuery()->getResult(Query::HYDRATE_ARRAY);
        $list = [];
        foreach ($l as $g) {
            $list[] = ['id' => $g['id'], 'name' => $g['name']];
        }
        return $list;
    }

}

