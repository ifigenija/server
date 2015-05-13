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
 * Description of Arhivalije
 *
 * @author rado
 */
class Arhivalije
        extends \Max\Repository\AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "naslov" => ["alias" => "p.naslov"]
        ],
        "vse" => [
            "naslov" => ["alias" => "p.naslov"]
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
                $this->expect(!(empty($options['uprizoritev']) && empty($options['dogodek'])), "Uprizoritev ali dogodek sta obvezna", 770091);
                $crit = new Criteria();
                $e    = $crit->expr();

                if (!empty($options['uprizoritev'])) {
                    $uprizoritev = $this->getEntityManager()->find('Produkcija\Entity\Uprizoritev', $options['uprizoritev']);
                    $exp  = $e->eq('uprizoritev', $uprizoritev);
                } else {
                    $dogodek = $this->getEntityManager()->find('Koledar\Entity\Dogodek', $options['dogodek']);

                    $exp = $e->eq('dogodek', $dogodek);
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

            $naz = $e->like('p.naslov', ':naslov');

            $qb->andWhere($e->orX($naz));

            $qb->setParameter('naslov', "{$options['q']}%", "string");
        }

        return $qb;
    }

}
