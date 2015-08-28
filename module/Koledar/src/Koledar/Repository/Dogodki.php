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
 * Description of Dogodki
 *
 * @author rado
 */
class Dogodki
        extends \Max\Repository\AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "ime" => ["alias" => "p.ime"]
        ],
        "vse" => [
            "ime" => ["alias" => "p.ime"]
        ],
    ];
    public function getPaginator(array $options, $name = "default")
    {
        switch ($name) {
            case "default":
            case "vse":
                $qb   = $this->getVseQb($options);
                $this->getSort($name, $qb);
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

            $naslov = $e->like('p.ime', ':ime');

            $qb->andWhere($e->orX($naslov));

            $qb->setParameter('ime', "{$options['q']}%", "string");
        }

        return $qb;
    }

}
