<?php

/*
 *  Licenca GPLv3
 */

namespace Produkcija\Repository;

use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Max\Form\Element\DateTime;
use Max\Repository\AbstractMaxRepository;
use Produkcija\Entity\Alternacija;
use Produkcija\Entity\Funkcija;

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
            "sifra"      => ["alias" => "p.sifra"],
            "pomembna"   => ["alias" => "p.pomembna"],
            "zacetek"    => ["alias" => "p.zacetek"],
            "konec"      => ["alias" => "p.konec"],
            "zaposlen"   => ["alias" => "p.zaposlen"],
            "imaPogodbo" => ["alias" => "p.imaPogodbo"]
        ],
        "vse"     => [
            "sifra" => ["alias" => "p.sifra"],
        ]
    ];

    public function getPaginator(array $options, $name = "default")
    {
        switch ($name) {
            case "vse":
                $qb   = $this->getVseQb($options);
                $sort = $this->getSort($name);
                $qb->orderBy($sort->order, $sort->dir);
                return new DoctrinePaginator(new Paginator($qb));
            case "default":
                $this->expect(!(empty($options['funkcija']) && empty($options['uprizoritev']) ), "Ali funkcija  ali uprizoritev je obvezna", 770081);
                $this->expect(!(!empty($options['funkcija']) && !empty($options['uprizoritev']) ), "Le funkcija ali uprizoritev ne oba hkrati", 770082);
                $qb   = $this->getDefaultQb($options);
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

        /**
         * le pri creatu napolni zaposlitev iz osebe, če je še ni:
         */
        if (empty($object->getZaposlitev()) && !empty($object->getOseba())) {
            $zaposlitev = null; //init
            $zdaj       = new \DateTime();
            $danes      = $zdaj->format('Y-m-d');
            ;
            /**
             * najdi, če obstaja ustrezna zaposlitev glede na osebo
             * zaenkrat je narejeno poenostavljeno, da preverja , če je konec zaposlitve večji od danes
             * natančneje bi lahko preverjal, če je interval alternacije znotraj intervala zaposlitve. $$
             */
            foreach ($object->getOseba()->getZaposlitve() as $zap) {
                if ($zap->getStatus() == 'A' && (empty($zap->getKonec()) || $zap->getKonec()->format('Y-m-d') <= $danes )) {
                    $zaposlitev = $zap;
                }
            }
            $object->setZaposlitev($zaposlitev);
        }



        if (empty($object->getSifra())) {
            $num = $this->getServiceLocator()->get('stevilcenje.generator');
            $object->setSifra($num->generate('alternacija'));
        }


        $this->preveriZaposlitev($object);
        $this->nastaviEnPrivzeti($object->getFunkcija());

        // posodobim štetje alternacij
        $object->getFunkcija()->setAlterCount($object->getFunkcija()->getAlternacije()->count());

        parent::create($object, $params);
    }

    /**
     * 
     * Preverim če je oseba zaposlena, potem alternacijo nastavim kot zaposlitev 
     * @param Alternacija $object
     */
    public function update($object, $params = null)
    {
        $object->preracunaj();
        $this->nastaviEnPrivzeti($object->getFunkcija());

        // posodobim štetje alternacij
        $object->getFunkcija()->setAlterCount($object->getFunkcija()->getAlternacije()->count());

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
        // posodobim štetje alternacij
        $object->getFunkcija()->setAlterCount($object->getFunkcija()->getAlternacije()->count());

        parent::delete($object);
    }

    /**
     * če nima nobena funkcija alternacije nastavljenega privzeti na true 
     * in če collection ni prazen
     * potem nastavi prvega v collection-u
     * 
     * @param entity $funkcija
     */
    public function nastaviEnPrivzeti(Funkcija $funkcija)
    {
        if ($funkcija && $funkcija->getAlternacije()->count() >= 1) {
            if (!($funkcija->getAlternacije()->exists(function($key, $alt) use(&$id) {
                        return $alt->getPrivzeti(); //vrne true, če obstaja vsaj ena alternacija s privzeti
                    }))) {

                $altPr = $funkcija->getAlternacije()->first();
                $altPr->setPrivzeti(true);
                $funkcija->setPrivzeti($altPr);
            }
        } else {
            /**
             * če brišemo zadnjo alternacijo pri funkciji
             */
            $funkcija->setPrivzeti(null);
        }
    }

}
