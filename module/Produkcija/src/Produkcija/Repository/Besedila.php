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
 * Description of Besedila
 *
 * @author rado
 */
class Besedila
        extends \Max\Repository\AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "naslov"                => ["alias" => "p.naslov"],
            "stevilka"              => ["alias" => "p.stevilka"],
            "naslovIzvirnika"       => ["alias" => "p.naslovIzvirnika"],
            "zaloznik"              => ["alias" => "p.zaloznik"],
            "internacionalniNaslov" => ["alias" => "p.internacionalniNaslov"]
        ],
        "vse"     => [
            "naslov" => ["alias" => "p.naslov"]
        ],
    ];

    public function getPaginator(array $options, $name = "default")
    {
        switch ($name) {
            case "default":
            case "vse":
                $qb   = $this->getVseQb($options);
                $sort = $this->getSort($name, $qb);
                $qb->orderBy($sort->order, $sort->dir);
                return new DoctrinePaginator(new Paginator($qb));
        }
    }

    public function getVseQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();
        if (!empty($options['q'])) {

            $naslov          = $e->like('lower(p.naslov)', ':query');
            $stevilka        = $e->like('lower(p.stevilka)', ':query');
            $naslovIzvirnika = $e->like('lower(p.naslovIzvirnika)', ':query');
            $zaloznik        = $e->like('lower(p.zaloznik)', ':query');
            $intNaslov       = $e->like('lower(p.internacionalniNaslov)', ':query');

            $qb->andWhere($e->orX($naslov, $stevilka, $naslovIzvirnika, $zaloznik, $intNaslov));

            $qb->setParameter('query', strtolower("%{$options['q']}%"), "string");
        }

        return $qb;
    }

    public function create($object, $params = null)
    {
        if (!$object->getStevilka()) {
            $num = $this->getServiceLocator()->get('stevilcenje.generator');
            $object->setStevilka($num->generate('besedilo'));
        }
        parent::create($object, $params);
    }

}
