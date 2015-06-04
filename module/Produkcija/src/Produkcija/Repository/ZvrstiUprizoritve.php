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
 * Description of ZvrstiUprizoritve
 *
 * @author rado
 */
class ZvrstiUprizoritve
        extends \Max\Repository\AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "sifra" => ["alias" => "p.sifra"]
        ],
        "vse" => [
            "sifra" => ["alias" => "p.sifra"]
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
        }
    }

    public function getVseQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();
        if (!empty($options['q'])) {

            $naz = $e->like('p.sifra', ':sifra');

            $qb->andWhere($e->orX($naz));

            $qb->setParameter('sifra', "{$options['q']}%", "string");
        }

        return $qb;
    }

    
}
