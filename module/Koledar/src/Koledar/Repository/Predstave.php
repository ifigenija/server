<?php

/*
 *  Licenca GPLv3
 */

namespace Koledar\Repository;

use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Max\Repository\AbstractMaxRepository;

/**
 * Description of Predstave
 *
 * @author rado
 */
class Predstave
        extends AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "zaporedna" => ["alias" => "p.zaporedna"]
        ],
        "vse"     => [
            "zaporedna" => ["alias" => "p.zaporedna"]
        ]
    ];

    public function getPaginator(array $options, $name = "default")
    {
        switch ($name) {
            case "default":
                $this->expect(!empty($options['uprizoritev']), "Uprizoritev je obvezna", 770111);
            case "vse":
                $qb   = $this->getVseQb($options);
                $sort = $this->getSort($name);
                $qb->orderBy($sort->order, $sort->dir);
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
        if (!empty($options['uprizoritev'])) {
            $qb->join('p.uprizoritev', 'uprizoritev');
            $naz = $e->eq('uprizoritev.id', ':upr');
            $qb->andWhere($naz);
            $qb->setParameter('upr', "{$options['uprizoritev']}", "string");
        }
        return $qb;
    }

}
