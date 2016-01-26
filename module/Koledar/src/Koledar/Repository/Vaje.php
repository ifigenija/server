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
        if ($object->dogodek) {
            /** @var Dogodki $rep */
            $rep = $this->getEntityManager()->getRepository('Koledar\Entity\Dogodek');
            $rep->create($object->getDogodek(), $params);
        }
        parent::create($object, $params);
        $this->preracunajZaporedne($object, 'create');
    }

    /**
     * 
     * @param type $object
     * @param type $params
     */
    public function update($object, $params = null)
    {
        if ($object->dogodek) {
            /** @var Dogodki $rep */
            $rep = $this->getEntityManager()->getRepository('Koledar\Entity\Dogodek');
            $rep->update($object->getDogodek(), $params);
        }
        parent::update($object, $params); // TODO: Change the autogenerated stub      
        $this->preracunajZaporedne($object, 'update');
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
        if ($object->getDogodek()) {
            $this->getEntityManager()->remove($object->getDogodek());
        }
        $this->preracunajZaporedne($object, 'delete');
    }

    /**
     * preračunaj zaporedne številke
     * 
     * @param type $object
     */
    private function preracunajZaporedne($object, $mode = 'update')
    {
        $vsevaje = $this->findByUprizoritev($object->getUprizoritev());

        switch ($mode):
            case "create":
                $vsevaje[] = $object;
                break;
            case "delete":
                foreach ($vsevaje as $key => $v) {
                    if ($v->getId() == $object->getId()) {
                        unset($vsevaje[$key]);
                    }
                }
                break;
        endswitch;

        /*
         * ostranimo odpovedane dogodke
         */
        foreach ($vsevaje as $key => $v) {
            if ($v->getDogodek()->getStatus()== \Koledar\Entity\Dogodek::ODPOVEDAN) {
                unset($vsevaje[$key]);
            }
        }

        /**
         * sort po datumu začetka
         */
        usort($vsevaje, function($a, $b) {
            return $a->getDogodek()->getZacetek() < $b->getDogodek()->getZacetek() ? -1 : 1;
        });

        $i = 1;
        foreach ($vsevaje as $vaja) {
            $vaja->setZaporedna($i);
            $i++;
        }
    }

}
