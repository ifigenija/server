<?php

/*
 *  Licenca GPLv3
 */

namespace ProgramDela\Repository;
use Doctrine\Common\Collections\Criteria;
use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineModule\Paginator\Adapter\Selectable;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Max\Repository\AbstractMaxRepository;


/**
 * Description of ProgramDelai
 *
 * @author boris
 */
class ProgramiDela
        extends \Max\Repository\AbstractMaxRepository
{
        protected $sortOptions = [
        "default" => [
            "sifra" => ["alias" => "p.sifra"]
        ],
        "vse"     => [
            "sifra" => ["alias" => "p.sifra"]
        ],
        "seznam"     => [
            "zacetek" => ["alias" => "p.zacetek"]
        ],
    ];

    public function getPaginator(array $options, $name = "default")
    {
        switch ($name) {
            case "default":
            case "vse":
                $qb = $this->getVseQb($options);
                $this->getSort($name, $qb);
                return new DoctrinePaginator(new Paginator($qb));
            case "seznam":
                $qb = $this->getSeznamQb($options);
                $this->getSort($name, $qb);
                return new DoctrinePaginator(new Paginator($qb));
        }
    }

    public function getVseQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();
        if (!empty($options['q'])) {

            $sifra = $e->like('p.sifra', ':sifra');

            $qb->andWhere($e->orX($sifra));

            $qb->setParameter('sifra', "{$options['q']}%", "string");
        }

        return $qb;
    }
    public function getSeznamQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();
        if (!empty($options['q'])) {

            $znaziv = $e->like('p.naziv', ':naziv');

            $qb->andWhere($e->orX($naziv));

            $qb->setParameter('naziv', "{$options['q']}%", "string");
        }

        return $qb;
    }

}
