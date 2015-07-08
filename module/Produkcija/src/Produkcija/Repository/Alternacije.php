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
use Produkcija\Entity\Alternacija;
use Max\Form\Element\DateTime;

/**
 * Description of Alternacije
 *
 * @author rado
 */
class Alternacije
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
                $this->expect(!(empty($options['funkcija']) && empty($options['uprizoritev']) ), "Ali funkcija  ali uprizoritev je obvezna", 770081);
                $this->expect(!(!empty($options['funkcija']) && !empty($options['uprizoritev']) ), "Le funkcija ali uprizoritev ne oba hkrati", 770082);
                $qb = $this->getDefaultQb($options);
                return new DoctrinePaginator(new Paginator($qb));
//                $crit = new Criteria();
//                $e    = $crit->expr();
//
//                if (!empty($options['funkcija'])) {
//                    $funkcija = $this->getEntityManager()->find('Produkcija\Entity\Funkcija', $options['funkcija']);
//                    $exp      = $e->eq('funkcija', $funkcija);
//                    $crit->andWhere($exp);
//                }
//                if (!empty($options['uprizoritev'])) {
//                    $uprizoritev = $this->getEntityManager()->find('Produkcija\Entity\Uprizoritev', $options['uprizoritev']);
//                    $exp      = $e->eq('uprizoritev', $uprizoritev);  //$$ še za dopolniti
//                    $crit->andWhere($exp);
//                }
//
//                return new Selectable($this, $crit);
        }
    }

    public function getVseQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();
        if (!empty($options['q'])) {

            $naz = $e->like('p.sifra', ':sifra');

            $qb->andWhere($e->orX($naz));

            $qb->setParameter('sifra', "{$options['q']}%", "string");
        }
        $qb->join('p.funkcija', 'funkcija');
        $qb->join('funkcija.uprizoritev', 'uprizoritev');
        if (!empty($options['uprizoritev'])) {
            $naz = $e->eq('uprizoritev.id', ':upriz');
            $qb->andWhere($naz);
            $qb->setParameter('upriz', "{$options['uprizoritev']}", "string");
        }
        if (!empty($options['funkcija'])) {
            $naz = $e->eq('funkcija.id', ':fun');
            $qb->andWhere($naz);
            $qb->setParameter('fun', "{$options['funkcija']}", "string");
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
        $qb->join('p.funkcija', 'funkcija');
        $qb->join('funkcija.uprizoritev', 'uprizoritev');
        if (!empty($options['uprizoritev'])) {
            $naz = $e->eq('uprizoritev.id', ':upriz');
            $qb->andWhere($naz);
            $qb->setParameter('upriz', "{$options['uprizoritev']}", "string");
        }
        if (!empty($options['funkcija'])) {
            $naz = $e->eq('funkcija.id', ':fun');
            $qb->andWhere($naz);
            $qb->setParameter('fun', "{$options['funkcija']}", "string");
        }

        return $qb;
    }

    /**
     * Preverim, če ima šifro in če je oseba zaposlena 
     * @param Alternacija $object
     * @param array $params
     */
    public function create($object, $params = null)
    {
        if (empty($object->getSifra())) {
            $num = $this->getServiceLocator()->get('stevilcenje.generator');
            $object->setSifra($num->generate('alternacija'));
        }

        $object->preracunaj();

        $this->preveriZaposlitev($object);
        parent::create($object, $params);
    }

    /**
     * 
     * Preverim če je oseba zaposlena, potem alternacijo nastavim kot zaposlitev 
     * 
     */
    public function update($object, $params = null)
    {
        $this->preveriZaposlitev($object);
        
        $object->preracunaj();

        parent::update($object, $params);
    }

    /**
     * Preverim če ima oseba veljavno zaposlitev,
     * potem jo samodejno povežem z zaposlitvijo
     * @param Alternacija $alternacija
     */
    public function preveriZaposlitev(Alternacija $alternacija)
    {

        if (!$alternacija->getZaposlitev()) {
            $zr = $this->getEntityManager()->getRepository('Produkcija\Entity\Zaposlitev');

            $zap = $zr->findOneBy([
                'oseba'  => $alternacija->getOseba()->getId(),
                'status' => 'A'
            ]);

            if ($zap) {
                if ($zap->getKonec() === null || ($zap->getKonec() < new DateTime())) {
                    $alternacija->setZaposlen(true);
                    $alternacija->setZaposlitev($zap);
                    return;
                }
            }
            $alternacija->setZaposlen(false);
        }
    }

}
