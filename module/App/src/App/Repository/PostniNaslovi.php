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
class PostniNaslovi
        extends AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "naziv" => ["alias" => "naziv"]
        ],
        "vse" => [
            "naziv" => ["alias" => "naziv"]
        ]
    ];

    public function getPaginator(array $options, $name = "default")
    {
        switch ($name) {

            case "vse":
                
             
                $qb = $this->getVseQb($options);
                $this->getSort($name, $qb);
                return new DoctrinePaginator(new Paginator($qb));   
            default:
                $this->expect(!(empty($options['popa']) && empty($options['oseba'] )), "Oseba ali Partner ali država sta obvezna", 770001);
                $crit = new Criteria();
                $e    = $crit->expr();

                if (!empty($options['popa'])) {
                    $popa = $this->getEntityManager()->find('App\Entity\Popa', $options['popa']);
                    $exp  = $e->eq('popa', $popa);
                } else {
                    $oseba = $this->getEntityManager()->find('App\Entity\Oseba', $options['oseba']);

                    $exp = $e->eq('oseba', $oseba);
                }
                $crit->andWhere($exp);
                return new Selectable($this, $crit);
        }
    }

    
    public function getVseQb($options) {
        
            $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();


        if (!empty($options['q'])) {

            $naz    = $e->like('p.naziv', ':naz');
          

            $qb->andWhere($e->orX($naz));

           
            $qb->setParameter('naz', "{$options['q']}%", "string");
        }

        return $qb;
    }
}
