<?php

/**
 * Licenca GPLv3 or later
 */

namespace App\Repository;

use Doctrine\ORM\Tools\Pagination\Paginator;
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
            "sifra" => ["alias" => "p.sifra"],
            "naziv" => ["alias" => "p.naziv"],
            "isoNaziv" => ["alias" => "p.isoNaziv"],
            "isoNum" => ["alias" => "p.isoNum"]
        ]
    ];

    /**
     * 
     */
    public function getPaginator(array $options, $name = "default")
    {
        switch ($name) {

            default:

                $qb = $this->getDefaultQb($options);
                $this->getSort($name, $qb);
                return new DoctrinePaginator(new Paginator($qb));
        }
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

            $naz    = $e->like('p.naziv', ':naz');
            $isoNaz = $e->like('p.isoNaziv', ':naz');
            $iso    = $e->eq('p.isoNum', ':sif');
            $sif    = $e->eq('p.sifra', ':sif');

            $qb->andWhere($e->orX($naz, $sif, $iso, $isoNaz));

            $qb->setParameter('sif', $options['q'], "string");
            $qb->setParameter('naz', "{$options['q']}%", "string");
        }

        if (!empty($options['isoNum'])) {

            $iso    = $e->eq('p.isoNum', ':isoN');

            $qb->andWhere($iso);

            $qb->setParameter('isoN', $options['isoNum'], "string");
        }

        return $qb;
    }

}
