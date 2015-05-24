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
 * Description of Funkcije
 *
 * @author rado
 */
class Funkcije
        extends \Max\Repository\AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "naziv" => ["alias" => "p.naziv"]
        ],
        "vse"     => [
            "naziv" => ["alias" => "p.naziv"]
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
                $this->expect(!empty($options['uprizoritev']), "Uprizoritev je obvezna", 770051);
                $crit = new Criteria();
                $e    = $crit->expr();

                if (!empty($options['uprizoritev'])) {
                    $uprizoritev = $this->getEntityManager()->find('Produkcija\Entity\Uprizoritev', $options['uprizoritev']);
                    $exp         = $e->eq('uprizoritev', $uprizoritev);
                    $crit->andWhere($exp);
                }

                if (!empty($options['podrocje'])) {
                    $exp = $e->eq('podrocje', $options['podrocje']);
                    $crit->andWhere($exp);
                }

                return new Selectable($this, $crit);
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

}
