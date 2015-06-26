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
 * Description of ProdukcijaDelitve
 *
 * @author rado
 */
class ProdukcijaDelitve
        extends AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "id" => ["alias" => "p.id"]
        ],
        "vse"     => [
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
                $this->expect(!(empty($options['enotaPrograma']) ), "Enota programa je obvezna", 770061);
                $crit = new Criteria();
                $e    = $crit->expr();

                if (!empty($options['enotaPrograma'])) {
                    $enotaPrograma = $this->getEntityManager()->find('ProgramDela\Entity\EnotaPrograma', $options['enotaPrograma']);
                    $exp         = $e->eq('enotaPrograma', $enotaPrograma);
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

            $vrKop = $e->like('p.vrstaKoproducenta', ':vrkop');

            $qb->andWhere($e->orX($vrKop));

            $qb->setParameter('vrkop', "{$options['q']}%", "string");
        }

        return $qb;
    }

    
    
}
