<?php

/*
 *  Licenca GPLv3
 */

namespace ProgramDela\Repository;

use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Max\Repository\AbstractMaxRepository;

/**
 * Description of TipiFunkcije
 *
 * @author rado
 */
class PostavkeCDve
        extends AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "skupina"    => ["alias" => "p.skupina"],
            "podskupina" => ["alias" => "p.podskupina"],
            "naziv"      => ["alias" => "p.naziv"],
        ],
    ];

    public function getPaginator(array $options, $name = "default")
    {
        switch ($name) {
            case "default":
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
            $naziv = $e->like('lower(p.naziv)', ':query');
            $qb->andWhere($e->orX($naziv));
            $qb->setParameter('query', strtolower("%{$options['q']}%"), "string");
        }
        if (!empty($options['skupina'])) {
            $skupina    = $e->eq('p.skupina', ':sk');
            $qb->andWhere($e->orX($skupina));
            $qb->setParameter('sk', "{$options['skupina']}", "string");
        }
        if (!empty($options['podskupina'])) {
            $podskupina = $e->eq('p.podskupina', ':psk');
            $qb->andWhere($e->orX($podskupina));
            $qb->setParameter('psk', "{$options['podskupina']}", "integer");
        }
        if (!empty($options['programDela'])) {
            $qb->join('p.programDela', 'programDela');
            $pd = $e->eq('programDela.id', ':pd');
            $qb->andWhere($pd);
            $qb->setParameter('pd', "{$options['programDela']}", "string");
        }
        return $qb;
    }

}
