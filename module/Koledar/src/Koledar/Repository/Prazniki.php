<?php

/*
 *  Licenca GPLv3
 */

namespace Koledar\Repository;

use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Max\Repository\AbstractMaxRepository;

/**
 * Description of Prazniki
 *
 * @author rado
 */
class Prazniki
        extends AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "ime"   => ["alias" => "p.ime"]
        ],
        "vse"     => [
            "ime"   => ["alias" => "p.ime"]
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

            $ime = $e->like('lower(p.ime)', ':query');

            $qb->andWhere($e->orX($ime));

            $qb->setParameter('query', "%{$options['q']}%", "string");
        }
        return $qb;
    }

}
