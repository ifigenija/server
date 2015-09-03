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
                $this->getSort($name, $qb);
                return new DoctrinePaginator(new Paginator($qb));
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
        if ($object->getFunkcija()) {
            $object->getFunkcija()->getAlternacije()->add($object);
        }

        if (empty($object->getSifra())) {
            $num = $this->getServiceLocator()->get('stevilcenje.generator');
            $object->setSifra($num->generate('alternacija'));
        }

        $object->preracunaj();

        $this->preveriZaposlitev($object);
        $this->nastaviEnPrivzeti($object->getFunkcija());

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
        $this->nastaviEnPrivzeti($object->getFunkcija());

        parent::update($object, $params);
    }

    /**
     * Preverim če ima oseba veljavno zaposlitev,
     * potem jo samodejno povežem z zaposlitvijo
     * @param entity $alternacija
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

    /**
     * 
     * @param type $object entiteta
     * @param type $params
     */
    public function delete($object)
    {
        if ($object->getFunkcija()) {
            $object->getFunkcija()->getAlternacije()->removeElement($object);
        }
        $this->nastaviEnPrivzeti($object->getFunkcija());
        parent::delete($object);
    }

    /**
     * če nima nobena funkcija alternacije nastavljenega privzeti na true 
     * in če collection ni prazen
     * potem nastavi prvega v collection-u
     * 
     * @param entity $funkcija
     */
    public function nastaviEnPrivzeti(\Produkcija\Entity\Funkcija $funkcija)
    {
        if ($funkcija && $funkcija->getAlternacije()->count() >= 1 && !($funkcija->getAlternacije()->exists(function($key, $alt) use(&$id) {
                    return $alt->getPrivzeti(); //vrne true, če obstaja vsaj ena alternacija s privzeti
                }))) {
            $altPr = $funkcija->getAlternacije()->first();
            $altPr->setPrivzeti(true);
            $funkcija->setPrivzeti($altPr);
        }
    }

}
