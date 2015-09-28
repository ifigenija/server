<?php

/*
 *  Licenca GPLv3
 */

namespace Koledar\Repository;

use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Max\Repository\AbstractMaxRepository;

/**
 * Description of Vaje
 *
 * @author rado
 */
class Vaje
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
//            case "default":
            case "vse":
                $qb   = $this->getVseQb($options);
                $sort = $this->getSort($name);
                $qb->orderBy($sort->order, $sort->dir);
                return new DoctrinePaginator(new Paginator($qb));
            case "default":
                $this->expect(!empty($options['uprizoritev']), "Uprizoritev je obvezna", 770151);
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
            $naz = $e->like('p.zaporedna', ':zaporedna');
            $qb->andWhere($e->orX($naz));
            $qb->setParameter('zaporedna', "{$options['q']}%", "string");
        }
        if (!empty($options['uprizoritev'])) {
            $qb->join('p.uprizoritev', 'uprizoritev');
            $naz = $e->eq('uprizoritev.id', ':upr');
            $qb->andWhere($naz);
            $qb->setParameter('upr', "{$options['uprizoritev']}", "string");
        }
        return $qb;
    }

    /**
     * Opravila pri ustvarjanju nove entitete
     *
     * @param Vaja $object
     * @param Parameters $params
     */
    public function create($object, $params = null)
    {
        parent::create($object, $params);

        if ()
    }

    /**
     * Privzeti postopek posodabljanja
     * preveri avtorizacijo in
     *
     * @param Vaja $object
     * @param Parameters $params
     */
    public function update($object, $params = null)
    {
        parent::update($object, $params); // TODO: Change the autogenerated stub
    }

    /**
     * Privzeti postopek brisanja
     * preverimo avtorizacijo in predpogoje brisanja
     *
     * @param Vaja $object
     */
    public function delete($object)
    {
        parent::delete($object); // TODO: Change the autogenerated stub
    }


}
