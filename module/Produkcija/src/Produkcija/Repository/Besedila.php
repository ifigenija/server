<?php

/*
 *  Licenca GPLv3
 */

namespace Produkcija\Repository;

use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;

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
            "internacionalniNaslov" => ["alias" => "p.internacionalniNaslov"],
            "avtor" => ["alias" => "p.avtor"],
            "letoIzida" => ["alias" => "p.letoIzida"],
            "datumPrejema" => ["alias" => "p.datumPrejema"],
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

            $qb->setParameter('query', mb_strtolower("%{$options['q']}%"), "string");
        }

        if (!empty($options['avtor'])) {
            $qb->leftJoin('p.avtorji', 'avtor');
            $qb->leftJoin('avtor.oseba', 'oseba');

            $ime        = $e->like('lower(oseba.ime)', ':avtor');
            $priimek    = $e->like('lower(oseba.priimek)', ':avtor');
            $srednjeIme = $e->like('lower(oseba.srednjeIme)', ':avtor');
            $psevdonim  = $e->like('lower(oseba.psevdonim)', ':avtor');


            $qb->andWhere($e->orX($ime, $priimek, $psevdonim, $srednjeIme));

            $qb->setParameter('avtor', mb_strtolower("{$options['avtor']}%"), "string");
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
