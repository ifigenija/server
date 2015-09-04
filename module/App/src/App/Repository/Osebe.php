<?php

/**
 * LicencOa GPLv3 or later
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
class Osebe
        extends \Max\Repository\AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "priimek" => ["alias" => "p.priimek"],
            "ime"     => ["alias" => "p.ime"],
            "sifra"     => ["alias" => "p.sifra"],
            "email"     => ["alias" => "p.email"],
            "psevdonim"     => ["alias" => "p.psevdonim"],
        ],
        "vse"     => [
            "priimek" => ["alias" => "p.priimek"],
            "ime"     => ["alias" => "p.ime"],
        ],
    ];

    public function getPaginator(array $options, $name = "default")
    {
        switch ($name) {
            case "default":
            case "vse":
                $qb = $this->getVseQb($options);
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

            $ime     = $e->like('lower(p.ime)', ':naz');
            $priimek = $e->like('lower(p.priimek)', ':naz');
            $qb->andWhere($e->orX($ime, $priimek));

            $qb->setParameter('naz', strtolower("{$options['q']}%"), "string");
        }
        
        if(!empty($options['naslov'])){
            $qb->leftJoin('p.naslovi', 'naslov');
            
            $ulica     = $e->like('lower(naslov.ulica)', ':naslov');
            $dodatnaUlica     = $e->like('lower(naslov.ulicaDva)', ':naslov');
            $posta     = $e->like('lower(naslov.postaNaziv)', ':naslov');
            $postnaStevilka     = $e->like('lower(naslov.posta)', ':naslov');
            
            
            $qb->andWhere($e->orX($ulica, $dodatnaUlica, $posta, $postnaStevilka));
            
            $qb->setParameter('naslov', strtolower("{$options['naslov']}%"), "string");
        }

        return $qb;
    }

    /**
     * 
     * 
     * @param Oseba $object
     * @param array $params
     */
    public function create($object, $params = null)
    {
        if (empty($object->getSifra())) {
            $num = $this->getServiceLocator()->get('stevilcenje.generator');
            $object->setSifra($num->generate('oseba'));
        }
        parent::create($object, $params);
    }

}
