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
 * Description of ProgramiFestival
 *
 * @author rado
 */
class ProgramiFestival
        extends \Max\Repository\AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "naziv" => ["alias" => "p.naziv"]
        ],
        "vse"     => [
            "naziv" => ["alias" => "p.naziv"]
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

            $naz = $e->like('p.naziv', ':naziv');

            $qb->andWhere($e->orX($naz));

            $qb->setParameter('naziv', "{$options['q']}%", "string");
        }

        return $qb;
    }

}
