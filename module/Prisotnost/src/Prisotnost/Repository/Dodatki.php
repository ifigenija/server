<?php

/*
 *  Licenca GPLv3
 */

namespace Prisotnost\Repository;

use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;

/**
 * Description of Dodatki
 *
 * @author rado
 */
class Dodatki
        extends \Max\Repository\AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "sifra" => ["alias" => "p.id"],
        ],
        "vse"     => [
            "sifra" => ["alias" => "p.id"],
        ]
    ];

    public function getPaginator(array $options, $name = "default")
    {
        switch ($name) {
            case "default":
            case "vse":
                $qb   = $this->getVseQb($options);
                $sort = $this->getSort($name);
                $qb->orderBy($sort->order, $sort->dir);
                return new DoctrinePaginator(new Paginator($qb));
        }
    }

    public function getVseQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();
        if (!empty($options['q'])) {
            $naz = $e->like('p.id', ':id');
            $qb->andWhere($e->orX($id));
            $qb->setParameter('id', "{$options['q']}%", "string");
        }
        if (!empty($options['terminStoritve'])) {
            $qb->join('p.terminStoritve', 'terminStoritve');
            $naz = $e->eq('terminStoritve.id', ':termins');
            $qb->andWhere($naz);
            $qb->setParameter('termins', "{$options['terminStoritve']}", "string");
        }
        return $qb;
    }

}
