<?php

/**
 * Licenca GPLv3 or later
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
class Poste
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
                $sort = $this->getSort($name, $qb);
                $qb->orderBy($sort->order,$sort->dir);
                return new DoctrinePaginator(new Paginator($qb));
        }
    }

    public function getVseQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();
        if (!empty($options['q'])) {

            $naziv = $e->like('lower(p.naziv)', ':query');
            $sifra = $e->like('lower(p.sifra)', ':query');

            $qb->andWhere($e->orX($naziv, $sifra));

            $qb->setParameter('query', "%{$options['q']}%", "string");
        }

        return $qb;
    }

    
}
