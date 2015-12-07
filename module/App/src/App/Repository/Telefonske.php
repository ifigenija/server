<?php

/**
 * Licenca GPLv3 or later
 */

namespace App\Repository;

use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Max\Repository\AbstractMaxRepository;

/**
 * Description of PostniNaslovi
 *
 * @author rado
 */
class Telefonske
        extends AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "stevilka" => ["alias" => "p.stevilka"]
        ],
        "vse"     => [
            "stevilka" => ["alias" => "p.stevilka"]
        ]
    ];

    public function getPaginator(array $options, $name = "default")
    {
        switch ($name) {
            case"vse":
                $qb = $this->getVseQb($options);
                break;
            case"default":
                $this->expect(!(empty($options['popa']) && empty($options['oseba'])), "Oseba ali Partner ali država sta obvezna", 770011);
                $qb = $this->getDefaultQb($options);
                break;
        }
        $sort = $this->getSort($name);
        $qb->orderBy($sort->order, $sort->dir);

        /**
         * če bo potreben getList za večji seznam, se lahko implementira posebno dovoljenje
         */
        $this->areGranted($qb, 'Telefonska-read', 1001630);


        return new DoctrinePaginator(new Paginator($qb));
    }

    public function getVseQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();
        if (!empty($options['q'])) {
            $naz = $e->like('p.stevilka', ':ste');
            $qb->andWhere($e->orX($naz));
            $qb->setParameter('ste', "{$options['q']}%", "string");
        }
        return $qb;
    }

    public function getDefaultQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();
        if (!empty($options['q'])) {
            $naz = $e->like('p.stevilka', ':ste');
            $qb->andWhere($e->orX($naz));
            $qb->setParameter('ste', "{$options['q']}%", "string");
        }
        if (!empty($options['popa'])) {
            $qb->join('p.popa', 'popa');
            $naz = $e->eq('popa.id', ':popa');
            $qb->andWhere($naz);
            $qb->setParameter('popa', "{$options['popa']}", "string");
        }
        if (!empty($options['oseba'])) {
            $qb->join('p.oseba', 'oseba');
            $naz = $e->eq('oseba.id', ':oseba');
            $qb->andWhere($naz);
            $qb->setParameter('oseba', "{$options['oseba']}", "string");
        }
        return $qb;
    }

}
