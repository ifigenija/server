<?php

/*
 *  Licenca GPLv3
 */

namespace Prisotnost\Repository;

use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;

/**
 * Description of TipiDodatka
 *
 * @author rado
 */
class TipiDodatka
        extends \Max\Repository\AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "sifra" => ["alias" => "p.sifra"],
            "ime"   => ["alias" => "p.ime"],
        ],
        "vse"     => [
            "sifra" => ["alias" => "p.sifra"],
            "ime" => ["alias" => "p.ime"]
        ]
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
            $ime  = $e->like('lower(p.ime)', ':query');
            $opis = $e->like('lower(p.opis)', ':query');
            $qb->andWhere($e->orX($ime, $opis));
            $qb->setParameter('query', strtolower("%{$options['q']}%"), "string");
        }
        return $qb;
    }

    /**
     * Preverim, če ima šifro
     * @param TipPopa $object
     * @param array $params
     */
    public function create($object, $params = null)
    {
        if (empty($object->getSifra())) {
            $num = $this->getServiceLocator()->get('stevilcenje.generator');
            $object->setSifra($num->generate('tipdodatka'));
        }
        parent::create($object, $params);
    }

}
