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
            "sort" => ["alias" => "p.sort"]
        ],
        "vse"     => [
            "sort" => ["alias" => "p.sort"]
        ]
    ];

    public function getPaginator(array $options, $name = "default")
    {
        switch ($name) {
            case "vse":
                $qb = $this->getVseQb($options);
                $this->getSort($name, $qb);
                return new DoctrinePaginator(new Paginator($qb));
            case "default":
                $this->expect(!empty($options['uprizoritev']), "Uprizoritev je obvezna", 1000670);
                $qb = $this->getDefaultQb($options);
                $this->getSort($name, $qb);
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
            $qb->andWhere($e->orX($id));
            $qb->setParameter('id', "{$options['q']}%", "string");
        }
        $qb->join('p.uprizoritev', 'uprizoritev');
        if (!empty($options['uprizoritev'])) {
            $naz = $e->eq('uprizoritev.id', ':upriz');
            $qb->andWhere($naz);
            $qb->setParameter('upriz', "{$options['uprizoritev']}", "string");
        }
        if (!empty($options['podrocje'])) {
            $this->expect(is_array($options['podrocje']), "Parameter področje mora biti array", 1000671);
            $naz = $e->in('p.podrocje', ':podrocja');
            $qb->andWhere($naz);
            $qb->setParameter('podrocja', $options['podrocje']);
        }
        return $qb;
    }

}
