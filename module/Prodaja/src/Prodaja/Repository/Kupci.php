<?php

/*
 *  Licenca GPLv3
 */

namespace Prodaja\Repository;

use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Max\Repository\AbstractMaxRepository;

/**
 * Description of Kupci
 *
 * @author rado
 */
class Kupci
        extends AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "id" => ["alias" => "p.id"],
        ],
        "vse"     => [
            "id" => ["alias" => "p.id"],
        ],
    ];

    public function getPaginator(array $options, $name = "default")
    {
        switch ($name) {
            case "default":
            case "vse":
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

            $id = $e->like('p.id', ':id');
            $qb->orWhere($id);

            $qb->setParameter('id', "%{$options['q']}%", "string");
        }
        return $qb;
    }

}
