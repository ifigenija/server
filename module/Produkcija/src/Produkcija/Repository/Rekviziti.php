<?php

/*
 *  Licenca GPLv3
 */

namespace Produkcija\Repository;



use Doctrine\ORM\Tools\Pagination\Paginator;

use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;


/**
 * Description of Rekviziti
 *
 * @author rado
 */
class Rekviziti
        extends \Max\Repository\AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "ime" => ["alias" => "p.ime"]
        ],
        "vse" => [
            "ime" => ["alias" => "p.ime"]
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

            $naz = $e->like('p.ime', ':ime');

            $qb->andWhere($e->orX($naz));

            $qb->setParameter('ime', "{$options['q']}%", "string");
        }

        return $qb;
    }

}
