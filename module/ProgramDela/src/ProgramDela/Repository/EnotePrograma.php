<?php

/*
 *  Licenca GPLv3
 */

namespace ProgramDela\Repository;

/**
 * Description of ProgramDela
 *
 * @author boris
 */
class EnotePrograma
        extends \Max\Repository\AbstractMaxRepository
{
     protected $sortOptions = [
        "default" => [
            "id" => ["alias" => "p.id"]
        ],
        "vse" => [
            "id" => ["alias" => "p.id"]
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

            $naz = $e->like('p.id', ':id');

            $qb->andWhere($e->orX($naz));

            $qb->setParameter('id', "{$options['q']}%", "string");
        }

        return $qb;
    }

     
}
