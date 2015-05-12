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
 * Description of Rekviziterstva
 *
 * @author rado
 */
class Rekviziterstva
  extends \Max\Repository\AbstractMaxRepository
{   
    protected $sortOptions = [
        "default" => [
            "opisPostavitve" => ["alias" => "p.opisPostavitve"]
        ],
        "vse" => [
            "opisPostavitve" => ["alias" => "p.opisPostavitve"]
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

            $naz = $e->like('p.opisPostavitve', ':opisPostavitve');

            $qb->andWhere($e->orX($naz));

            $qb->setParameter('opisPostavitve', "{$options['q']}%", "string");
        }

        return $qb;
    }

    
}