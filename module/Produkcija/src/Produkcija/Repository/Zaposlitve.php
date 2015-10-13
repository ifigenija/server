<?php

/*
 *  Licenca GPLv3
 */

namespace Produkcija\Repository;

use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Max\Repository\AbstractMaxRepository;

/**
 * Description of Zaposlitve
 *
 * @author rado
 */
class Zaposlitve
        extends AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "sifra" => ["alias" => "p.sifra"],
        ],
        "vse"     => [
            "oseba.priimek"   => ["alias" => "oseba.priimek"],
            "oseba.ime"       => ["alias" => "oseba.ime"],
            "oseba.polnoIme"  => ["alias" => "oseba.polnoIme"],
            "oseba.psevdonim" => ["alias" => "oseba.psevdonim"],
            "sifra"           => ["alias" => "p.sifra"],
            "delovnoMesto"    => ["alias" => "p.delovnoMesto"],
            "status"          => ["alias" => "p.status"],
            "zacetek"         => ["alias" => "p.zacetek"],
            "konec"           => ["alias" => "p.konec"]
        ]
    ];

    public function getPaginator(array $options, $name = "default")
    {
        switch ($name) {
            case "vse":
                $qb   = $this->getVseQb($options);
                $sort = $this->getSort($name);
                $qb->orderBy($sort->order, $sort->dir);
                return new DoctrinePaginator(new Paginator($qb));
            case "default":
                $this->expect(!empty($options['oseba']), "Oseba je obvezna", 770051);
                $qb   = $this->getDefaultQb($options);
                $sort = $this->getSort($name);
                $qb->orderBy($sort->order, $sort->dir);
                return new DoctrinePaginator(new Paginator($qb));
        }
    }

    public function getVseQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();
        $qb->join('p.oseba', 'oseba');
        if (!empty($options['q'])) {
            $ime       = $e->like('lower(oseba.ime)', ':q');
            $priimek   = $e->like('lower(oseba.priimek)', ':q');
            $polnoIme  = $e->like('lower(oseba.polnoIme)', ':q');
            $psevdonim = $e->like('lower(oseba.psevdonim)', ':q');

            $qb->andWhere($e->orX($ime, $priimek, $polnoIme, $psevdonim));
            $qb->setParameter('q', strtolower("%{$options['q']}%"), "string");
        }

        if (!empty($options['delovno'])) {
            $naz = $e->like('lower(p.delovnoMesto)', ':d');
            $qb->andWhere($e->orX($naz));
            $qb->setParameter('d', strtolower("%{$options['delovno']}%"), "string");
        }

        if (!empty($options['status'])) {
            $naz = $e->in('p.status', $options['status']);
            $qb->andWhere($naz);
        }
        //$sort = $this->getSort('vse', $qb);
        //$qb->orderBy($sort->order, $sort->dir);
        return $qb;
    }

    public function getDefaultQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();
        if (!empty($options['q'])) {
            $naz = $e->like('p.sifra', ':sifra');
            $qb->andWhere($e->orX($naz));
            $qb->setParameter('sifra', "{$options['q']}%", "string");
        }
        if (!empty($options['oseba'])) {
            $qb->join('p.oseba', 'oseba');
            $naz = $e->eq('oseba.id', ':oseba');
            $qb->andWhere($naz);
            $qb->setParameter('oseba', "{$options['oseba']}", "string");
        }
        return $qb;
    }

    /**
     * Prenesem šifro osebe na zaposlitev.
     * Uporabim kar šifro osebe, za šifro zaposlitve 
     * @param type $zap
     */
    public function prepisiSifroOsebe($zap)
    {
        if ($zap) {
            
        }
    }

}
