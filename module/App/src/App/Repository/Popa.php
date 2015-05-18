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
 * Description of PostniNaslovi
 *
 * @author rado
 */
class Popa
        extends AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "sifra" => ["alias" => "p.sifra"],
        ],
        "vse"     => [
            "sifra" => ["alias" => "p.sifra"],
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

    /**
     * Naredim query s query builderjem in ga vrnem 
     * uporabno samostojno ali pa preko
     * getPaginator
     * 
     * @param array $options
     */
    public function getVseQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();


        if (!empty($options['q'])) {

            $naz = $e->like('p.naziv', ':naz');
            $sif = $e->like('p.sifra', ':sif');

            $qb->orWhere($naz);
            $qb->orWhere($sif);


            $qb->setParameter('sif', $options['q'], "string");
            $qb->setParameter('naz', "%{$options['q']}%");
        }

        return $qb;
    }

}
