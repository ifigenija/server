<?php

/*
 *  Licenca GPLv3
 */

namespace Produkcija\Repository;

use Doctrine\ORM\Tools\Pagination\Paginator;
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
            "sifra"         => ["alias" => "p.sifra"],
            "naslov"        => ["alias" => "p.naslov"],
            "avtor"         => ["alias" => "p.avtor"],
            "datumPremiere" => ["alias" => "p.datumPremiere"]
        ]
    ];

    public function getPaginator(array $options, $name = "default")
    {
        switch ($name) {
            case "vse":
                $qb   = $this->getVseQb($options);
                $sort = $this->getSort($name);
                $qb->orderBy($sort->order, $sort->dir);
                return new DoctrinePaginator(new Paginator($qb));
            case "default":
                $this->expect(!(empty($options['besedilo']) ), "Besedilo je obvezno", 770071);
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
            $naslov    = $e->like('lower(p.naslov)', ':naz');
            $podnaslov = $e->like('lower(p.podnaslov)', ':naz');
            $avtor     = $e->like('lower(p.avtor)', ':naz');
            $qb->andWhere($e->orX($naslov, $podnaslov, $avtor));
            $qb->setParameter('naz', mb_strtolower("{$options['q']}%"), "string");
        }
        if (!empty($options['status'])) {
            $qb->andWhere($e->in('p.faza', $options['status']));
        }

        if (!empty($options['gostujoca'])) {
            $qb->andWhere($e->eq('p.gostujoca', ':gostujoca'));
            $qb->setParameter('gostujoca', $options['gostujoca'], "boolean");
        } else {
            /**
             * prikaže naj vse negostujoče
             */
            $gostFalse=($e->eq('p.gostujoca', "false"));
            $gostNull=($e->isNull('p.gostujoca'));
            $qb->andWhere($e->orX($gostFalse,$gostNull));
        }

        if (!empty($options['avtor'])) {
            $qb->leftJoin('p.besedilo', 'besedilo');
            $qb->leftJoin('besedilo.avtorji', 'avtor');
            $qb->leftJoin('avtor.oseba', 'oseba');

            $ime        = $e->like('lower(oseba.ime)', ':avtor');
            $priimek    = $e->like('lower(oseba.priimek)', ':avtor');
            $srednjeIme = $e->like('lower(oseba.srednjeIme)', ':avtor');
            $psevdonim  = $e->like('lower(oseba.psevdonim)', ':avtor');


            $qb->andWhere($e->orX($ime, $priimek, $psevdonim, $srednjeIme));

            $qb->setParameter('avtor', mb_strtolower("{$options['avtor']}%"), "string");
        }
        if (!empty($options['sodelujoci'])) {
            $qb->leftJoin('p.funkcije', 'funkcija');
            $qb->leftJoin('funkcija.alternacije', 'alternacija');
            $qb->leftJoin('alternacija.oseba', 'oseba');

            $ime        = $e->like('lower(oseba.ime)', ':sodelujoci');
            $priimek    = $e->like('lower(oseba.priimek)', ':sodelujoci');
            $srednjeIme = $e->like('lower(oseba.srednjeIme)', ':sodelujoci');
            $psevdonim  = $e->like('lower(oseba.psevdonim)', ':sodelujoci');


            $qb->andWhere($e->orX($ime, $priimek, $psevdonim, $srednjeIme));

            $qb->setParameter('sodelujoci', mb_strtolower("{$options['sodelujoci']}%"), "string");
        }
        return $qb;
    }

    public function getDefaultQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();
        if (!empty($options['q'])) {
            $naslov    = $e->like('lower(p.naslov)', ':naz');
            $podnaslov = $e->like('lower(p.podnaslov)', ':naz');
            $avtor     = $e->like('lower(p.avtor)', ':naz');
            $qb->andWhere($e->orX($naslov, $podnaslov, $avtor));
            $qb->setParameter('naz', mb_strtolower("{$options['q']}%"), "string");
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
        $object->preracunaj();
        parent::create($object, $params);
    }

    public function update($object, $params = null)
    {
        $object->preracunaj();
        parent::update($object, $params);
    }

}
