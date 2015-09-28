<?php

/*
 *  Licenca GPLv3
 */

namespace Koledar\Repository;

use DateTime;
use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Max\Repository\AbstractMaxRepository;

/**
 * Description of Dogodki
 *
 * @author rado
 */
class Dogodki
        extends AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "title" => ["alias" => "p.title"]
        ],
        "vse"     => [
            "title" => ["alias" => "p.title"]
        ],
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
                $qb   = $this->getDefaultQb($options);
                $sort = $this->getSort($name);
                $qb->orderBy($sort->order, $sort->dir);

                return new DoctrinePaginator(new Paginator($qb));
        }
    }

    public function getDefaultQb($options)
    {
        /**
         * nastavimo defaultne vrednosti nekaterih opcij, če so prazne
         */
        /* Če ni postavljenega začetka, smatramo, da gledamo od danes naprej */
        if (empty($options['zacetek'])) {
            $options['zacetek'] = new DateTime();
        }
        /*
         * Če ni postavljenega konca smatramo, da nas zanima 1 mesec 
         */
        if (empty($options['konec'])) {
            /**
             * konec = začetek + 1 mesec
             */
            $options['konec'] = clone $options['zacetek'];
            $options['konec'] ->modify('+1 month');
        }


        return $this->getVseQb($options);
    }

    public function getVseQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();
        if (!empty($options['q'])) {
            $naslov = $e->like('p.title', ':title');
            $qb->andWhere($naslov);
            $qb->setParameter('title', "{$options['q']}%", "string");
        }
        if (!empty($options['razred'])) {
            $raz = $e->in('p.razred', ':razred');
            $qb->andWhere($raz);
            $qb->setParameter('razred', $options['razred'], "array");
        }

        if (!empty($options['zacetek'])) {

            $cas = $e->gte( 'p.zacetek',':zac');
            $qb->andWhere($cas);
            $qb->setParameter('zac', $options['zacetek'], "date");
        }
        if (!empty($options['konec'])) {
            /**
             * konec <= zacetek
             */
            $cas = $e->lt( 'p.zacetek',':konec' );
            $qb->andWhere($cas);
            $qb->setParameter('konec', $options['konec'], "date");
        }

        /**
         * navadni uporabniki lahko vidijo le dogodke od 500s naprej
         */
        if (!$this->getAuth()->isGranted('Dogodek-readVse')) {
            if (empty($options['status'])) {
                $options['status'] = ['500s', '600s', '700s'];       //  > 500s
            }
            /**
             * pobriši statuse < 500s
             */
            $options['status'] = array_intersect(['500s', '600s', '700s'], $options['status']);
        }

        if (!empty($options['status'])) {
            $this->expect(is_array($options['status']), "Parameter status mora biti array", 1000580);
            $naz = $e->in('p.status', ':statusi');
            $qb->andWhere($naz);
            $qb->setParameter('statusi', $options['status'], 'array');
        }
        if (!empty($options['prostor'])) {
            $qb->join('p.prostor', 'prostor');
            $naz = $e->eq('prostor.id', ':pros');
            $qb->andWhere($naz);
            $qb->setParameter('pros', $options['prostor'], "string");
        }
        if (!empty($options['uprizoritev'])) {
            $qb->leftJoin('p.vaja', 'vaja');
            $qb->leftJoin('p.predstava', 'predstava');
            $pvup = $e->orx($e->eq('predstava.uprizoritev', ':uprizoritev'), $e->eq('vaja.uprizoritev', ':uprizoritev'));
            $qb->andWhere($pvup);
            $qb->setParameter('uprizoritev', $options['uprizoritev'], "string");
        }
        return $qb;
    }

}
