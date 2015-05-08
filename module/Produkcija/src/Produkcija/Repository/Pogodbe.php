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
 * Description of Pogodbe
 *
 * @author rado
 */
class Pogodbe
        extends AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "sifra" => ["alias" => "p.sifra"]
        ],
        "vse"     => [
            "sifra" => ["alias" => "p.sifra"]
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
                $this->expect(!(empty($options['popa']) && empty($options['oseba'])), "Oseba ali Partner ali država sta obvezna", 770031);
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

    public function getVseQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();
        if (!empty($options['q'])) {

            $naz = $e->like('p.sifra', ':sif');

            $qb->andWhere($e->orX($naz));

            $qb->setParameter('sif', "{$options['q']}%", "string");
        }

        return $qb;
    }

}
