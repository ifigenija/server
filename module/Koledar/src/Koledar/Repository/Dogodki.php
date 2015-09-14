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
            $zacetek            = new DateTime();
            $options['zacetek'] = $zacetek->format('c');
        }
        /*
         * Če ni postavljenega konca smatramo, da nas zanima 1 mesec 
         */
        if (empty($options['konec'])) {
            /**
             * konec = začetek + 1 mesec
             */
            $konec            = new \DateTime();   //init
            date_timestamp_set($konec, strtotime($options['zacetek']));
            $konec->modify('+1 month');
            $options['konec'] = $konec->format('c');
        }

        /**
         * Če ni zahtevan status potem prikažemo samo tiste s statusom 500 - potrjen - javno in več
         */
        if (empty($options['status'])) {
            $options['status'] = ['500s', '600s', '700s'];       //  > 500s
        }

        $qb = $this->getVseQb($options);

        return $qb;
    }

    public function getVseQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();
        if (!empty($options['q'])) {
            $naslov = $e->like('p.title', ':title');
            $qb->andWhere($e->orX($naslov));
            $qb->setParameter('title', "{$options['q']}%", "string");
        }
        if (!empty($options['zacetek'])) {
            /**
             * zac <= konec
             */
            $cas = $e->lte(':zac', 'p.konec');
            $qb->andWhere($cas);
            $qb->setParameter('zac', "{$options['zacetek']}", "string");
        }
        if (!empty($options['konec'])) {
            /**
             * konec <= zacetek
             */
            $cas = $e->gte(':konec', 'p.zacetek');
            $qb->andWhere($cas);
            $qb->setParameter('konec', "{$options['konec']}", "string");
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
//                || $options['status'] < '500s'))) {
        if (!empty($options['status'])) {
            $this->expect(is_array($options['status']), "Parameter status mora biti array", 1000580);
            $naz = $e->in('p.status', ':statusi');
            $qb->andWhere($naz);
            $qb->setParameter('statusi', $options['status']);
        }
        if (!empty($options['prostor'])) {
            $qb->join('p.prostor', 'prostor');
            $naz = $e->eq('prostor.id', ':pros');
            $qb->andWhere($naz);
            $qb->setParameter('pros', "{$options['prostor']}", "string");
        }
        if (!empty($options['uprizoritev'])) {
            $qb->leftJoin('p.vaja', 'vaja');
            $qb->leftJoin('p.predstava', 'predstava');
            $pvup = $e->orx($e->eq('predstava.uprizoritev', ':uprizoritev'), $e->eq('vaja.uprizoritev', ':uprizoritev'));
            $qb->andWhere($pvup);
            $qb->setParameter('uprizoritev', "{$options['uprizoritev']}", "string");
        }
        return $qb;
    }

}
