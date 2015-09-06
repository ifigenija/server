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
 * Description of Zaposlitve
 *
 * @author rado
 */
class Zaposlitve
        extends AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "id" => ["alias" => "p.id"]
        ],
        "vse"     => [
            "oseba.label" => ["alias" => "oseba.polnoIme"],
            "sifra" => ["alias" => "p.sifra"],
            "delovnoMesto" => ["alias" => "p.delobnoMesto"]
        ]
    ];

    public function getPaginator(array $options, $name = "default")
    {
        switch ($name) {
            case "vse":
                $qb = $this->getVseQb($options);
                return new DoctrinePaginator(new Paginator($qb));
            case "default":
                $this->expect(!empty($options['oseba']), "Oseba je obvezna", 770051);
                $qb = $this->getDefaultQb($options);
                $this->getSort($name, $qb);
                return new DoctrinePaginator(new Paginator($qb));
//                $this->expect(!empty($options['oseba']), "Oseba je obvezna", 770051);
//                $crit = new Criteria();
//                $e    = $crit->expr();
//
//                if (!empty($options['oseba'])) {
//                    $oseba = $this->getEntityManager()->find('App\Entity\Oseba', $options['oseba']);
//                    $exp   = $e->eq('oseba', $oseba);
//                }
//                $crit->andWhere($exp);
//                return new Selectable($this, $crit);
        }
    }

    public function getVseQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();
            $qb->join('p.oseba', 'oseba');
        if (!empty($options['q'])) {
            $naz = $e->like('lower(oseba.polnoIme)', ':q');
            $qb->andWhere($e->orX($naz));
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
        $sort = $this->getSort('vse', $qb);
        $qb->orderBy($sort->order, $sort->dir);
        return $qb;
    }

    public function getDefaultQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();
        if (!empty($options['q'])) {
            $naz = $e->like('p.id', ':id');
            $qb->andWhere($e->orX($naz));
            $qb->setParameter('id', "{$options['q']}%", "string");
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
