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
 * Description of Uprizoritve
 *
 * @author rado
 */
class Uprizoritve
        extends AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "sifra"  => ["alias" => "p.sifra"],
            "naslov" => ["alias" => "p.naslov"]
        ],
        "vse"     => [
            "sifra"  => ["alias" => "p.sifra"],
            "naslov" => ["alias" => "p.naslov"],
            "avtor" => ["alias" => "p.avtor"],
            "datumPremiere" => ["alias" => "p.datumPremiere"]
        ]
    ];

    public function getPaginator(array $options, $name = "default")
    {
        switch ($name) {
            case "vse":
                $qb = $this->getVseQb($options);
                $sort = $this->getSort($name);
                $qb->orderBy($sort->order, $sort->dir);
                return new DoctrinePaginator(new Paginator($qb));
            case "default":
                $this->expect(!(empty($options['besedilo']) ), "Besedilo je obvezno", 770071);
                $qb = $this->getVseQb($options);
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
            $naslov    = $e->like('lower(p.naslov)', ':naz');
            $podnaslov = $e->like('lower(p.podnaslov)', ':naz');
            $avtor     = $e->like('lower(p.avtor)', ':naz');
            $qb->andWhere($e->orX($naslov, $podnaslov, $avtor));
            $qb->setParameter('naz', strtolower("{$options['q']}%"), "string");
        }
        if (!empty($options['status'])) {
            $qb->andWhere($e->in('p.faza', $options['status']));
        }
        return $qb;
    }

    public function getDefaultQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();
        if (!empty($options['q'])) {
            $naslov    = $e->like('p.naslov', ':naz');
            $podnaslov = $e->like('p.podnaslov', ':naz');
            $avtor     = $e->like('p.avtor', ':naz');
            $qb->andWhere($e->orX($naslov, $podnaslov, $avtor));
            $qb->setParameter('naz', "{$options['q']}%", "string");
        }
        if (!empty($options['besedilo'])) {
            $qb->join('p.besedilo', 'besedilo');
            $naz = $e->eq('besedilo.id', ':besedilo');
            $qb->andWhere($naz);
            $qb->setParameter('besedilo', "{$options['besedilo']}", "string");
        }
        return $qb;
    }

    public function create($object, $params = null)
    {
        if (empty($object->getSifra())) {
            $num = $this->getServiceLocator()->get('stevilcenje.generator');
            $object->setSifra($num->generate('uprizoritev'));
        }
        parent::create($object, $params);
    }

}
