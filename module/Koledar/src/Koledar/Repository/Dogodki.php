<?php

/*
 *  Licenca GPLv3
 */

namespace Koledar\Repository;

use DateTime;
use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Max\Repository\AbstractMaxRepository;

/**
 * Description of Dogodki
 *
 * @author rado
 */
class Dogodki
        extends AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "title" => ["alias" => "p.title"]
        ],
        "vse"     => [
            "title" => ["alias" => "p.title"]
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
//            case "default":
//                $this->expect(!(empty($options['sezona']) ), "Sezona je obvezna", 770101);
//                $crit = new Criteria();
//                $e    = $crit->expr();
//
//                if (!empty($options['sezona'])) {
//                    $sezona = $this->getEntityManager()->find('\Koledar\Entity\Sezona', $options['sezona']);
//                    $exp      = $e->eq('sezona', $sezona);
//                }
//                $crit->andWhere($exp);
//                return new Selectable($this, $crit);
        }
    }

    public function getVseQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();
        if (!empty($options['q'])) {
            $naslov = $e->like('p.title', ':title');
            $qb->andWhere($e->orX($naslov));
            $qb->setParameter('title', "{$options['q']}%", "string");
        }

        /* Če ni postavljenega začetka, smatramo, da gledamo od danes naprej */
        if (empty($options['zacetek'])) {
            $options['zacetek'] = new DateTime();
        }
        /*
         * Če ni postavljenega konca smatramo, da nas zanima 1 mesec 
         */
        if (empty($options['konec'])) {
            $options['konec'] = clone $options['zacetek'];
            $options['konec']->modify('+1 month');
        }

        /**
         * Če ni zahtevan status potem prikažemo samo tiste s statusom 500 - potrjen - javno
         */
        if (!$this->getAuth()->isGranted('Dogodek-readVse') || empty($options['status'])) {
            $options['status'] = ['500'];
        }

        return $qb;
    }

}
