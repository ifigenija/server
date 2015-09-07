<?php

/**
 * Licenca GPLv3 or later
 */

namespace Abonmaji\Repository;

use Doctrine\Common\Collections\Criteria;
use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineModule\Paginator\Adapter\Selectable;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Max\Repository\AbstractMaxRepository;

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
            "ime" => ["alias" => "p.ime"]
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
                $qb = $this->getVseQb($options);
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
