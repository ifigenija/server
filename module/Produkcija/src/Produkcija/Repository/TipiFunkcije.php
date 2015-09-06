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
 * Description of TipiFunkcije
 *
 * @author rado
 */
class TipiFunkcije
        extends AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "sifra" => ["alias" => "p.sifra"],
            "ime" => ["alias" => "p.ime"]
        ],
        "vse"     => [
            "sifra" => ["alias" => "p.sifra"],
            "ime" => ["alias" => "p.ime"]
        ]
    ];

    public function getPaginator(array $options, $name = "default")
    {
        switch ($name) {
            case "default":
            case "vse":
                $qb   = $this->getVseQb($options);
                $this->getSort($name, $qb);
                return new DoctrinePaginator(new Paginator($qb));
        }
    }

    public function getVseQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();
        if (!empty($options['q'])) {

            $naz = $e->like('p.ime', ':ime');

            $qb->andWhere($e->orX($naz));

            $qb->setParameter('ime', "{$options['q']}%", "string");
        }

        return $qb;
    }

}
