<?php

/*
 *  Licenca GPLv3
 */
namespace Koledar\Repository;

use Doctrine\Common\Collections\Criteria;
use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineModule\Paginator\Adapter\Selectable;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Max\Repository\AbstractMaxRepository;


/**
 * Description of Sezone
 *
 * @author rado
 */
class Sezone
        extends AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "imeSezone" => ["alias" => "p.imeSezone"]
        ],
        "vse"     => [
            "imeSezone" => ["alias" => "p.imeSezone"]
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

            $naz = $e->like('p.imeSezone', ':imeSezone');

            $qb->andWhere($e->orX($naz));

            $qb->setParameter('imeSezone', "{$options['q']}%", "string");
        }
        return $qb;
    }

}
