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
 * @author rado
 */
class AvtorjiBesedila
        extends \Max\Repository\AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "zaporedna" => ["alias" => "p.zaporedna"]
        ],
        "vse"     => [
            "zaporedna" => ["alias" => "p.zaporedna"]
        ],
    ];

    public function getPaginator(array $options, $name = "default")
    {
        switch ($name) {
            case "default":
                $this->expect(!(empty($options['besedilo']) ), "Besedilo je obvezno", 1001060);
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
            $naz = $e->like('p.tipAvtorja', ':tipAvtorja');
            $qb->andWhere($e->orX($naz));
            $qb->setParameter('tipAvtorja', "{$options['q']}%", "string");
        }
        if (!empty($options['besedilo'])) {
            $qb->join('p.besedilo', 'besedilo');
            $naz = $e->eq('besedilo.id', ':bes');
            $qb->andWhere($naz);
            $qb->setParameter('bes', "{$options['besedilo']}", "string");
        }
        return $qb;
    }

    /**
     * 
     * @param type $object  entiteta
     * @param type $params
     */
    public function create($object, $params = null)
    {
        if ($object->getBesedilo()) {
            $object->getBesedilo()->getAvtorji()->add($object);
        }

        // preračunamo vrednosti v smeri navzgor
        $object->preracunaj(\Max\Consts::UP);

        parent::create($object, $params);
    }

    /**
     * 
     * @param type $object entiteta
     * @param type $params
     */
    public function update($object, $params = null)
    {
        // preračunamo vrednosti v smeri navzgor
        $object->preracunaj(\Max\Consts::UP);

        parent::update($object, $params);
    }

    /**
     * 
     * @param type $object entiteta
     * @param type $params
     */
    public function delete($object)
    {
        if ($object->getBesedilo()) {
            $object->getBesedilo()->getAvtorji()->removeElement($object);
            $object->getBesedilo()->preracunaj(\Max\Consts::UP);
        }

        parent::delete($object);
    }

}
