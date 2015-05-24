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
 * Description of Besedila
 *
 * @author rado
 */
class Besedila
        extends \Max\Repository\AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "naslov" => ["alias" => "p.naslov"]
        ],
        "vse"     => [
            "naslov" => ["alias" => "p.naslov"]
        ],
    ];
      public function getPaginator(array $options, $name = "default")
    {
        switch ($name) {
            case "default":
            case "vse":
                $qb   = $this->getVseQb($options);
                $this->getSort($name, $qb);
                return new DoctrinePaginator(new Paginator($qb));
        }
    }

    public function getVseQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();
        if (!empty($options['q'])) {

            $naz = $e->like('p.naslov', ':naslov');

            $qb->andWhere($e->orX($naz));

            $qb->setParameter('naslov', "{$options['q']}%", "string");
        }

        return $qb;
    }

    
    public function create($object, $params = null)
    {
        if (!$object->getStevilka()) {
            $num = $this->getServiceLocator()->get('stevilcenje.generator');
            $object->setStevilka($num->generate('besedilo'));
        }
        parent::create($object, $params);
        
        
    }

}
