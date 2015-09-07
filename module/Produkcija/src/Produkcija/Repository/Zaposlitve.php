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
            "id" => ["alias" => "p.id"]
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
        if (!empty($options['q'])) {
            $naz = $e->like('p.id', ':id');
            $qb->andWhere($e->orX($naz));
            $qb->setParameter('id', "{$options['q']}%", "string");
        }
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
