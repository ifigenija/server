<?php

/*
 *  Licenca GPLv3
 */

namespace Koledar\Repository;

use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Max\Repository\AbstractMaxRepository;

/**
 * Description of Sezone
 *
 * @author rado
 */
class Sezone
        extends AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "sifra" => ["alias" => "p.sifra"],
            "ime"   => ["alias" => "p.ime"]
        ],
        "vse"     => [
            "sifra" => ["alias" => "p.sifra"],
            "ime"   => ["alias" => "p.ime"]
        ]
    ];

    public function getPaginator(array $options, $name = "default")
    {
        switch ($name) {
            case "default":
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

            $ime   = $e->like('lower(p.ime)', ':query');
            $sifra = $e->like('lower(p.sifra)', ':query');

            $qb->andWhere($e->orX($ime, $sifra));

            $qb->setParameter('query', "%{$options['q']}%", "string");
        }
        return $qb;
    }

    /**
     * 
     * @param type $object
     * @param type $params
     */
    public function create($object, $params = null)
    {
        if (empty($object->getSifra())) {
            $num = $this->getServiceLocator()->get('stevilcenje.generator');
            $object->setSifra($num->generate('sezona'));
        }
        $this->preveriSezone($object);

        parent::create($object, $params);
    }

    public function update($object, $params = null)
    {
        $this->preveriSezone($object);

        parent::update($object, $params);
    }

    /**
     * Preveri ostale sezone 
     * 
     * ni v validate-u, ker moramo klicati repozitorij
     * 
     * @param type $object
     */
    private function preveriSezone($object)
    {
        $vsesezone = $this->getEntityManager()->getRepository('Koledar\Entity\Sezona')
                ->findAll();

        foreach ($vsesezone as $sez) {
            /*
             *  samega sebe ne sme primerjati
             */
            if ($object->getId() != $sez->getId()) {
                $this->expect(( $sez->getKonec() && $object->zacetek > $sez->getKonec() ) ||
                        ( $object->konec && $sez->getZacetek() > $object->konec )
                        , "Interval sezone se prekriva s sezono (" . $sez->ime . ")", 1001340);
            }
        }
    }

}
