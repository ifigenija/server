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
 * Description of Alternacije
 *
 * @author rado
 */
class Alternacije
        extends \Max\Repository\AbstractMaxRepository
{
    protected $sortOptions = [
        "default" => [
            "id" => ["alias" => "p.id"]
        ],
        "vse" => [
            "id" => ["alias" => "p.id"]
            
            
        ]
    ];  
    
     public function getPaginator(array $options, $name = "default")
    {
        switch ($name) {
            case "vse":
                $qb   = $this->getVseQb($options);
                $this->getSort($name, $qb);
                return new DoctrinePaginator(new Paginator($qb));
            case "default":
                $this->expect(!empty($options['funkcija']), "Funkcija je obvezna", 770081);
                $crit = new Criteria();
                $e    = $crit->expr();

                if (!empty($options[''])) {
                    $oseba = $this->getEntityManager()->find('Produkcija\Entity\Funkcija', $options['funkcija']);
                    $exp   = $e->eq('funkcija', $oseba);
                }
                $crit->andWhere($exp);
                return new Selectable($this, $crit);
        }
    }
    
    
      public function getVseQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();
        if (!empty($options['q'])) {

            $naz = $e->like('p.id', ':id');

            $qb->andWhere($e->orX($naz));

            $qb->setParameter('id', "{$options['q']}%", "string");
        }

        return $qb;
    }

    
}
