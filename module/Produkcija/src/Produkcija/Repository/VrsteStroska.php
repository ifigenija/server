<?php

/*
 *  Licenca GPLv3
 */

namespace Produkcija\Repository;

use Doctrine\Common\Collections\Criteria;
use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineModule\Paginator\Adapter\Selectable;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Max\Repository\AbstractMaxRepository;

/**
 * Description of TipiFunkcije
 *
 * @author rado
 */
class VrsteStroska
        extends AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "skupina"    => ["alias" => "p.skupina"],
            "podskupina" => ["alias" => "p.podskupina"],
            "naziv"      => ["alias" => "p.naziv"],
        ],
    ];

    public function getPaginator(array $options, $name = "default")
    {
        switch ($name) {
            case "default":
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

            $naziv = $e->like('lower(p.naziv)', ':query');

            $qb->andWhere($e->orX($naziv));

            $qb->setParameter('query', strtolower("%{$options['q']}%"), "string");
        }
        if (!empty($options['skupina'])) {
            $skupina    = $e->eq('p.skupina', ':st');
            $podskupina = $e->eq('p.podskupina', ':st');

            $qb->andWhere($e->orX($skupina, $podskupina));
            $qb->setParameter('st', strtolower("{$options['skupina']}"), "integer");
        }

        return $qb;
    }

}
