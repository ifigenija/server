<?php

/**
 * LicencOa GPLv3 or later
 */

namespace App\Repository;

use Doctrine\Common\Collections\Criteria;
use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineModule\Paginator\Adapter\Selectable;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Max\Repository\AbstractMaxRepository;

/**
 * Description of Drzave
 *
 * @author boris
 */
class Osebe
        extends \Max\Repository\AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "priimek" => ["alias" => "p.priimek"],
            "ime"     => ["alias" => "p.ime"],
        ],
        "vse"     => [
            "priimek" => ["alias" => "p.priimek"],
            "ime"     => ["alias" => "p.ime"],
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

            $ime     = $e->like('p.ime', ':naz');
            $priimek = $e->like('p.priimek', ':naz');
            $emso    = $e->like('p.emso', ':emso');

            $qb->andWhere($e->orX($ime, $priimek, $emso));

            $qb->setParameter('naz', "{$options['q']}%", "string");
            $qb->setParameter('emso', $options['q'], "string");
        }

        return $qb;
    }

}
