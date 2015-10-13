<?php

/*
 *  Licenca GPLv3
 */

namespace App\Repository;

use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Max\Repository\AbstractMaxRepository;

/**
 * Description of TipiPopa
 *
 * @author rado
 */
class TipiPopa
        extends AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "ime"       => ["alias" => "p.ime"],
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

            $ime       = $e->like('lower(p.ime)', ':query');
            $opis = $e->like('lower(p.opis)', ':query');

            $qb->andWhere($e->orX($ime, $opis));

            $qb->setParameter('query', strtolower("%{$options['q']}%"), "string");
        }

        return $qb;
    }

}
