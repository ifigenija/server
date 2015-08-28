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
 * Description of Gostovanja
 *
 * @author rado
 */
class Gostovanja
        extends \Max\Repository\AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "vrsta" => ["alias" => "p.vrsta"]
        ],
        "vse"     => [
            "vrsta" => ["alias" => "p.vrsta"]
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
//                $this->expect(!(empty($options['drzava']) ), "Država je obvezna", 770121);
//                $crit = new Criteria();
//                $e    = $crit->expr();
//
//                if (!empty($options['drzava'])) {
//                    $drzava = $this->getEntityManager()->find('App\Entity\Drzava', $options['drzava']);
//                    $exp    = $e->eq('drzava', $drzava);
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

            $naslov = $e->like('p.vrsta', ':vrsta');

            $qb->andWhere($e->orX($naslov));

            $qb->setParameter('vrsta', "{$options['q']}%", "string");
        }

        return $qb;
    }

}
