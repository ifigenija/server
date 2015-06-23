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
class DrugiViri
        extends \Max\Repository\AbstractMaxRepository
{
        protected $sortOptions = [
        "default" => [
            "opis" => ["alias" => "p.opis"]
        ],
        "vse"     => [
            "opis" => ["alias" => "p.opis"]
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

            $opis = $e->like('p.opis', ':opis');

            $qb->andWhere($e->orX($opis));

            $qb->setParameter('opis', "{$options['q']}%", "string");
        }

        return $qb;
    }
}
