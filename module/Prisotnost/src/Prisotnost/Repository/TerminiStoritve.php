<?php

/*
 *  Licenca GPLv3
 */

namespace Prisotnost\Repository;

use Doctrine\Common\Collections\Criteria;
use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineModule\Paginator\Adapter\Selectable;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Max\Repository\AbstractMaxRepository;


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
            "id" => ["alias" => "p.id"]
        ],
        "vse" => [
            "id" => ["alias" => "p.id"]
        ],
        "ure" => [
            "id" => ["alias" => "p.id"]
        ],
    ];  
    
     public function getPaginator(array $options, $name = "default")
    {
        switch ($name) {
            case "vse":
                $qb   = $this->getVseQb($options);
                $this->getSort($name, $qb);
                return new DoctrinePaginator(new Paginator($qb));
            case "default":
                $this->expect(!empty($options['alternacija']), "Alternacija je obvezna", 770081);
                $crit = new Criteria();
                $e    = $crit->expr();

                if (!empty($options['alternacija'])) {
                    $alternacija = $this->getEntityManager()->find('Produkcija\Entity\Alternacija', $options['alternacija']);
                    $exp   = $e->eq('alternacija', $alternacija);
                }
                $crit->andWhere($exp);
                return new Selectable($this, $crit);
            case "ure":
                $this->expect(!empty($options['dogodek']), "Dogodek je obvezen", 770082);
                $crit = new Criteria();
                $e    = $crit->expr();

                if (!empty($options['dogodek'])) {
                    $dogodek = $this->getEntityManager()->find('Koledar\Entity\Dogodek', $options['dogodek']);
                    $exp   = $e->eq('dogodek', $dogodek);
                }
                $crit->andWhere($exp);
                // $$ rb tu nekje bi še preverili, če je api enable-an za posamezen zapis
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
