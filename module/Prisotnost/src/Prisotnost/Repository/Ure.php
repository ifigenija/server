<?php

/*
 *  Licenca GPLv3
 */

namespace Prisotnost\Repository;

use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;

/**
 * @author rado
 */
class Ure
        extends \Max\Repository\AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "zacetek" => ["alias" => "p.zacetek"]
        ],
        "vse"     => [
            "zacetek" => ["alias" => "p.zacetek"]
        ],
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
            $naz = $e->like('p.zacetek', ':zacetek');
            $qb->andWhere($e->orX($naz));
            $qb->setParameter('zacetek', "{$options['q']}%", "string");
        }
        return $qb;
    }

}
