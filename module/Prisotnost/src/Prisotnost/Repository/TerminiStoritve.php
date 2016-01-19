<?php

/*
 *  Licenca GPLv3
 */

namespace Prisotnost\Repository;

use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;

/**
 * Description of TerminIStoritve
 *
 * @author rado
 */
class TerminiStoritve
        extends \Max\Repository\AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "planiranZacetek" => ["alias" => "p.planiranZacetek"]
        ],
        "vse"     => [
            "planiranZacetek" => ["alias" => "p.planiranZacetek"]
        ],
        "ure"     => [
            "planiranZacetek" => ["alias" => "p.planiranZacetek"]
        ],
    ];

    public function getPaginator(array $options, $name = "default")
    {
        switch ($name) {
            case "default":
            case "vse":
                $qb   = $this->getVseQb($options);
                $sort = $this->getSort($name);
                $qb->orderBy($sort->order, $sort->dir);
                return new DoctrinePaginator(new Paginator($qb));
            case "ure":
                $this->expect(!empty($options['dogodek']), "Dogodek je obvezen", 770082);
                $qb   = $this->getUreQb($options);
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
            $naz = $e->like('p.planiranZacetek', ':planiranZacetek');
            $qb->andWhere($naz);
            $qb->setParameter('planiranZacetek', "{$options['q']}%", "string");
        }
        if (!empty($options['oseba'])) {
            $qb->join('p.oseba', 'oseba');
            $naz = $e->eq('oseba.id', ':os');
            $qb->andWhere($naz);
            $qb->setParameter('os', "{$options['oseba']}", "string");
        }
        if (!empty($options['dogodek'])) {
            $qb->join('p.dogodek', 'dogodek');
            $naz = $e->eq('dogodek.id', ':dogodek');
            $qb->andWhere($naz);
            $qb->setParameter('dogodek', "{$options['dogodek']}", "string");
        }
        return $qb;
    }

    public function getUreQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();
        if (!empty($options['q'])) {
            $naz = $e->like('p.planiranZacetek', ':planiranZacetek');
            $qb->andWhere($e->orX($naz));
            $qb->setParameter('planiranZacetek', "{$options['q']}%", "string");
        }
        if (!empty($options['dogodek'])) {
            $qb->join('p.dogodek', 'dogodek');
            $naz = $e->eq('dogodek.id', ':dogodek');
            $qb->andWhere($naz);
            $qb->setParameter('dogodek', "{$options['dogodek']}", "string");
        }
        return $qb;
    }

    /**
     * 
     * @param type $object
     * @param type $params
     */
    public function create($object, $params = null)
    {
        /*
         * $$ vprašanje je,  ali bo ta kontrola tukaj in ali bo jo potrebno prilagoditi, ko bomo delili dogodek?
         * 
         * $$ morda še bomo vključili, ko bomo popravili fixturje in teste
         */
//        $this->expect(!$object->getDogodek(), "Kreiranje termina storitve ni možno, če je vezan na dogodek", 1001800);

        parent::create($object, $params);
    }

}
