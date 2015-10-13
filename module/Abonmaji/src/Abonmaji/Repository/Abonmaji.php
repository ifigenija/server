<?php

/**
 * Licenca GPLv3 or later
 */

namespace Abonmaji\Repository;

use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;

/**
 * 
 *  Description of Abonmaji
 * 
 * @author rado
 */
class Abonmaji
        extends \Max\Repository\AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "ime"        => ["alias" => "p.ime"],
            "stPredstav" => ["alias" => "p.stPredstav"],
            "stKuponov"  => ["alias" => "p.stKuponov"],
            "kapaciteta" => ["alias" => "p.kapaciteta"]
        ],
        "vse"     => [
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

            $ime = $e->like('lower(p.ime)', ':ime');
            $qb->andWhere($e->orX($ime));

            $qb->setParameter('ime', strtolower("%{$options['q']}%"), "string");
        }

        return $qb;
    }

}
