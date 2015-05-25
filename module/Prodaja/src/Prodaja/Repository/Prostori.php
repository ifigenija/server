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
            "sifra" => ["alias" => "p.sifra"],
            "naziv" => ["alias" => "p.naziv"]
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

            $naz = $e->like('p.sifra', ':sif');
            $qb->orWhere($naz);
            $naz = $e->like('p.naziv', ':naz');
            $qb->orWhere($naz);

            $qb->setParameter('sif', "{$options['q']}%", "string");
            $qb->setParameter('naz', "%{$options['q']}%", "string");
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
