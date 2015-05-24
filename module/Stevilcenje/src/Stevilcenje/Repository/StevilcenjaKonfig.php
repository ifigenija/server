<?php

/**
 * Licenca GPLv3 or later
 */

namespace Stevilcenje\Repository;

use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Max\Repository\AbstractMaxRepository;

/**
 * Repositorij za konfige številčenja
 *
 * @author rado
 */
class StevilcenjaKonfig
        extends AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "dok" => ["alias" => "p.dok"]
        ]
    ];

    public function getPaginator(array $options, $name = "default")
    {
        switch ($name) {
            case"default":
                $qb = $this->getVseQb($options);
                $this->getSort($name, $qb);
                return new DoctrinePaginator(new Paginator($qb));
        }
    }

    public function getVseQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();
        if (!empty($options['q'])) {

            $sif = $e->like('p.sifra', ':ste');
            $naz = $e->like('p.naziv', ':naz');

            $qb->andWhere($e->orX($sif, $naz));

            $qb->setParameter('ste', "{$options['q']}%", "string");
            $qb->setParameter('naz', "%{$options['q']}%", "string");
        }

        return $qb;
    }

}
