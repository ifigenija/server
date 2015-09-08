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
class TipiFunkcije
        extends AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "sifra"     => ["alias" => "p.sifra"],
            "ime"       => ["alias" => "p.ime"],
            "imeZenski" => ["alias" => "p.imeZenski"],
            "podrocje"  => ["alias" => "p.podrocje"]
        ],
        "vse"     => [
            "sifra" => ["alias" => "p.sifra"],
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
            $imeZenski = $e->like('lower(p.imeZenski)', ':query');
            $sifra     = $e->like('lower(p.sifra)', ':query');
            $podrocje  = $e->like('lower(p.podrocje)', ':query');

            $qb->andWhere($e->orX($ime, $imeZenski, $podrocje, $sifra));

            $qb->setParameter('query', strtolower("%{$options['q']}%"), "string");
        }

        return $qb;
    }

}
