<?php

/*
 *  Licenca GPLv3
 */

namespace App\Repository;

use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Max\Repository\AbstractMaxRepository;

/**
 * Description of KontaktneOsebe
 *
 * @author rado
 */
class KontaktneOsebe
        extends AbstractMaxRepository
{
    protected $sortOptions = [
        "default" => [
            "funkcija" => ["alias" => "p.funkcija"]
        ],
        "vse"     => [
            "funkcija" => ["alias" => "p.funkcija"]
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
                $this->expect(!(empty($options['popa']) && empty($options['oseba'])), "Oseba ali Partner ali država sta obvezna", 770161);
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
            $naz = $e->like('p.funkcija', ':funkcija');
            $qb->andWhere($e->orX($naz));
            $qb->setParameter('funkcija', "{$options['q']}%", "string");
        }
        return $qb;
    }
    public function getDefaultQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();
        if (!empty($options['q'])) {
            $naz = $e->like('p.funkcija', ':funkcija');
            $qb->andWhere($e->orX($naz));
            $qb->setParameter('funkcija', "{$options['q']}%", "string");
        }
                if (!empty($options['popa'])) {
            $qb->join('p.popa', 'popa');
            $naz = $e->eq('popa.id', ':popa');
            $qb->andWhere($naz);
            $qb->setParameter('popa', "{$options['popa']}", "string");
        }
        if (!empty($options['oseba'])) {
            $qb->join('p.oseba', 'oseba');
            $naz = $e->eq('oseba.id', ':oseba');
            $qb->andWhere($naz);
            $qb->setParameter('oseba', "{$options['oseba']}", "string");
        }
        return $qb;
    }
}
