<?php

/**
 * Licenca GPLv3 or later
 */

namespace App\Repository;

use Doctrine\Common\Collections\Criteria;
use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineModule\Paginator\Adapter\Selectable;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Max\Repository\AbstractMaxRepository;

/**
 * Description of Drzave
 *
 * @author boris
 */
class Drzave
        extends AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "sifra"    => ["alias" => "p.sifra"],
            "naziv"    => ["alias" => "p.naziv"],
            "isoNaziv" => ["alias" => "p.isoNaziv"],
            "isoNum"   => ["alias" => "p.isoNum"]
        ],
        "vse"     => [
            "sifra"    => ["alias" => "p.sifra"],
            "naziv"    => ["alias" => "p.naziv"],
            "isoNaziv" => ["alias" => "p.isoNaziv"],
            "isoNum"   => ["alias" => "p.isoNum"]
        ],
    ];

    public function getPaginator(array $options, $name = "default")
    {
        switch ($name) {
            case "vse":
                $qb   = $this->getVseQb($options);
                $sort = $this->getSort($name, $qb);
                $qb->orderBy($sort->order,$sort->dir);
                return new DoctrinePaginator(new Paginator($qb));
            case "default":
                $qb = $this->getDefaultQb($options);
                $sort = $this->getSort($name, $qb);
                $qb->orderBy($sort->order,$sort->dir);
                return new DoctrinePaginator(new Paginator($qb));
        }
    }

    public function getVseQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();
        if (!empty($options['q'])) {

            $naz = $e->like('lower(p.naziv)', ':naziv');

            $qb->andWhere($e->orX($naz));

            $qb->setParameter('naziv', strtolower("{$options['q']}%"), "string");
        }

        return $qb;
    }

    /**
     * Naredim quiery s query builderjem in ga vrnem 
     * uporabno samostojno ali pa preko
     * getPaginator
     * 
     * @param array $options
     */
    public function getDefaultQb($options)
    {

        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();

        if (!empty($options['q'])) {

            $naziv    = $e->like('lower(p.naziv)', ':naz');
            $isoNaziv = $e->like('lower(p.isoNaziv)', ':naz');
            $isoNum    = $e->eq('lower(p.isoNum)', ':sif');
            $sifra    = $e->eq('lower(p.sifra)', ':sif');

            $qb->andWhere($e->orX($naziv, $sifra, $isoNum, $isoNaziv));

            $qb->setParameter('sif', $options['q'], "string");
            $qb->setParameter('naz', "{$options['q']}%", "string");
        }

        return $qb;
    }

}
