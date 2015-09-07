<?php

/*
 *  Licenca GPLv3
 */

namespace Prodaja\Repository;

use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Max\Repository\AbstractMaxRepository;

/**
 * Description of Prostori
 *
 * @author rado
 */
class Prostori
        extends AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "sifra"  => ["alias" => "p.sifra"],
            "naziv"  => ["alias" => "p.naziv"],
            "popa"   => ["alias" => "p.popa"],
            "naslov" => ["alias" => "p.naslov"]
        ],
        "vse"     => [
            "sifra" => ["alias" => "p.sifra"],
            "naziv" => ["alias" => "p.naziv"]
        ]
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

            $sifra = $e->like('lower(p.sifra)', ':query');
            $naziv = $e->like('lower(p.naziv)', ':query');

            $qb->andWhere($e->orX($sifra, $naziv));

            $qb->setParameter('query', strtolower("%{$options['q']}%"), "string");
        }
        if (!empty($options['popa'])) {
            $qb->leftJoin('p.popa', 'popa');

            $sifraPopa = $e->like('lower(popa.sifra)', ':popa');
            $nazivPopa = $e->like('lower(popa.naziv)', ':popa');

            $qb->andWhere($e->orX($sifraPopa, $nazivPopa));

            $qb->setParameter('popa', strtolower("%{$options['popa']}%"), "string");
        }

        if (!empty($options['naslov'])) {
            $qb->leftJoin('p.naslov', 'naslov');

            $ulica          = $e->like('lower(naslov.ulica)', ':naslov');
            $dodatnaUlica   = $e->like('lower(naslov.ulicaDva)', ':naslov');
            $posta          = $e->like('lower(naslov.postaNaziv)', ':naslov');
            $postnaStevilka = $e->like('lower(naslov.posta)', ':naslov');


            $qb->andWhere($e->orX($ulica, $dodatnaUlica, $posta, $postnaStevilka));

            $qb->setParameter('naslov', strtolower("%{$options['naslov']}%"), "string");
        }
        return $qb;
    }

    public function create($object, $params = null)
    {
        if (empty($object->getSifra())) {
            $num = $this->getServiceLocator()->get('stevilcenje.generator');
            $object->setSifra($num->generate('prostor'));
        }
        parent::create($object, $params);
    }

}
