<?php

/*
 *  Licenca GPLv3
 */

namespace Koledar\Repository;

use Doctrine\Common\Collections\Criteria;
use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineModule\Paginator\Adapter\Selectable;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Max\Repository\AbstractMaxRepository;

/**
 * Description of Vaje
 *
 * @author rado
 */
class Vaje
        extends AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "zaporedna" => ["alias" => "p.zaporedna"]
        ],
        "vse"     => [
            "zaporedna" => ["alias" => "p.zaporedna"]
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
            case "default":
                $this->expect(!empty($options['dogodek']), "Dogodek je obvezen", 770151);
                $crit = new Criteria();
                $e    = $crit->expr();

                if (!empty($options['dogodek'])) {
                    $dogodek = $this->getEntityManager()->find('\Koledar\Entity\Dogodek', $options['dogodek']);
                    $exp     = $e->eq('dogodek', $dogodek);
                }
                $crit->andWhere($exp);
                return new Selectable($this, $crit);
        }
    }

    public function getVseQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();
        if (!empty($options['q'])) {

            $naz = $e->like('p.zaporedna', ':zaporedna');

            $qb->andWhere($e->orX($naz));

            $qb->setParameter('zaporedna', "{$options['q']}%", "string");
        }
        return $qb;
    }

}
