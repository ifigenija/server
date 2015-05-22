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
 * Description of Uprizoritve
 *
 * @author rado
 */
class Uprizoritve
        extends AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "naslov" => ["alias" => "p.naslov"]
        ],
        "vse"     => [
            "naslov" => ["alias" => "p.naslov"]
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
                $this->expect(!(empty($options['besedilo']) ), "Besedilo je obvezno", 770071);
                $crit = new Criteria();
                $e    = $crit->expr();

                if (!empty($options['besedilo'])) {
                    $besedilo = $this->getEntityManager()->find('Produkcija\Entity\Besedilo', $options['besedilo']);
                    $exp      = $e->eq('besedilo', $besedilo);
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
            $naslov    = $e->like('p.naslov', ':naz');
            $podnaslov = $e->like('p.podnaslov', ':naz');
            $avtor     = $e->like('p.avtor', ':naz');

            $qb->andWhere($e->orX($naslov, $podnaslov, $avtor));

            $qb->setParameter('naz', "{$options['q']}%", "string");
        }

        return $qb;
    }

}
