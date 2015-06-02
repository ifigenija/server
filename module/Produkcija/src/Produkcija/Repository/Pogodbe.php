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
                $qb = $this->getVseQb($options);
                $this->getSort($name, $qb);
                return new DoctrinePaginator(new Paginator($qb));
            case "default":
                $this->expect(!(empty($options['popa']) && empty($options['oseba']) && empty($options['uprizoritev']) && empty($options['alternacije']) && empty($options['oseba'])), "Oseba ali Partner ali država sta obvezna", 770031);


                $qb = $this->createQueryBuilder('p');
                $e  = $qb->expr();
                $qb->join('p.alternacije', 'alternacija');
                $qb->join('alternacija.funkcija', 'funkcija');
                if (!empty($options['uprizoritev'])) {
                    $qb->join('funkcija.uprizoritev', 'uprizoritev');
                    $qb->andWhere($e->eq('uprizoritev.id', ':upr'));
                    $qb->setParameter('upr', $options['uprizoritev'], 'string');
                }

                if (!empty($options['popa'])) {
                    $qb->andWhere($e->eq('p.popa', ':popa'));
                    $qb->setParameter('popa', $options['popa'], 'string');
                }

                if (!empty($options['alternacije'])) {
                    $qb->andWhere($e->eq('p.alternacije', ':alternacije'));
                    $qb->setParameter('alternacije', $options['alternacije'], 'string');
                }
                if (!empty($options['oseba'])) {
                    $qb->andWhere($e->eq('p.oseba', ':oseba'));
                    $qb->setParameter('oseba', $options['oseba'], 'string');
                }
                return new DoctrinePaginator(new Paginator($qb));
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
