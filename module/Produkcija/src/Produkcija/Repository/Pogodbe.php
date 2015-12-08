<?php

/*
 *  Licenca GPLv3
 */

namespace Produkcija\Repository;

use Doctrine\ORM\Tools\Pagination\Paginator;
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
                break;
            case "default":
                $this->expect(!( empty($options['popa']) && empty($options['oseba']) && empty($options['uprizoritev']) )
                        , "Oseba ali partner ali uprizoritev so obvezni", 770031);
                $qb = $this->getDefaultQb($options);
                break;
        }
        $sort = $this->getSort($name);
        $qb->orderBy($sort->order, $sort->dir);
        
        /**
         * če bo potreben getList za večji seznam, se lahko implementira posebno dovoljenje
         */
        $this->areGranted($qb, 'Pogodba-read', 1001650);

        return new DoctrinePaginator(new Paginator($qb));
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

    public function getDefaultQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();
        if (!empty($options['q'])) {

            $naz = $e->like('p.sifra', ':sifra');

            $qb->andWhere($e->orX($naz));

            $qb->setParameter('sifra', "{$options['q']}%", "string");
        }

        if (!empty($options['uprizoritev'])) {
            $qb->join('p.alternacije', 'alternacija');
            $qb->join('alternacija.funkcija', 'funkcija');
            $qb->join('funkcija.uprizoritev', 'uprizoritev');

            if (!empty($options['uprizoritev'])) {
                $naz = $e->eq('uprizoritev.id', ':upriz');
                $qb->andWhere($naz);
                $qb->setParameter('upriz', "{$options['uprizoritev']}", "string");
            }
            if (!empty($options['alternacija'])) {
                $naz = $e->eq('alternacija.id', ':alternacija');
                $qb->andWhere($naz);
                $qb->setParameter('alternacija', "{$options['alternacija']}", "string");
            }
        }
        if (!empty($options['popa'])) {
            $naz = $e->eq('p.popa', ':popa');
            $qb->andWhere($naz);
            $qb->setParameter('popa', "{$options['popa']}", "string");
        }
        if (!empty($options['oseba'])) {
            $naz = $e->eq('p.oseba', ':oseba');
            $qb->andWhere($naz);
            $qb->setParameter('oseba', "{$options['oseba']}", "string");
        }
        return $qb;
    }

    /**
     * Preverim, če ima šifro
     * @param Pogodba $object
     * @param array $params
     */
    public function create($object, $params = null)
    {
        if (empty($object->getSifra())) {
            $num = $this->getServiceLocator()->get('stevilcenje.generator');

            $object->setSifra($num->generate('pogodba', new \DateTime()));
        }

        $object->preracunaj();

        parent::create($object, $params);
    }

    /**
     * 
     * @param type $object entiteta
     * @param type $params
     */
    public function update($object, $params = null)
    {
        $object->preracunaj();

        parent::update($object, $params);
    }

}
