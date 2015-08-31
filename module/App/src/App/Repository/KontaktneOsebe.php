<?php

/*
 *  Licenca GPLv3
 */

namespace App\Repository;

use Doctrine\Common\Collections\Criteria;
use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineModule\Paginator\Adapter\Selectable;
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
                $this->getSort($name, $qb);
                return new DoctrinePaginator(new Paginator($qb));
            case "default":
                $this->expect(!(empty($options['popa']) && empty($options['oseba'])), "Oseba ali Partner ali država sta obvezna", 770161);
                $qb   = $this->getVseQb($options);
                $this->getSort($name, $qb);
                return new DoctrinePaginator(new Paginator($qb));
//                $crit = new Criteria();
//                $e    = $crit->expr();
//
//                if (!empty($options['popa'])) {
//                    $popa = $this->getEntityManager()->find('App\Entity\Popa', $options['popa']);
//                    $exp  = $e->eq('popa', $popa);
//                } else {
//                    $oseba = $this->getEntityManager()->find('App\Entity\Oseba', $options['oseba']);
//
//                    $exp = $e->eq('oseba', $oseba);
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
