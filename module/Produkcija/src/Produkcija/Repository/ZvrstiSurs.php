<?php

/*
 *  Licenca GPLv3
 */

namespace Produkcija\Repository;

use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;

/**
 * Description of ZvrstiSurs
 *
 * @author rado
 */
class ZvrstiSurs
        extends \Max\Repository\AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "sifra" => ["alias" => "p.sifra"],
            "naziv" => ["alias" => "p.naziv"]
        ],
        "vse"     => [
            "sifra" => ["alias" => "p.sifra"]
        ],
    ];

    public function getPaginator(array $options, $name = "default")
    {
        switch ($name) {
            case "default":
            case "vse":
                $qb = $this->getVseQb($options);
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
            
            $sifra     = $e->like('lower(p.sifra)', ':query');
            $naziv = $e->like('lower(p.naziv)', ':query');

            $qb->andWhere($e->orX($sifra, $naziv));

            $qb->setParameter('query', mb_strtolower("%{$options['q']}%"), "string");
        }

        return $qb;
    }

}
