<?php

/*
 *  Licenca GPLv3
 */

namespace Koledar\Repository;

use DateTime;
use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Koledar\Entity\Dogodek;
use Max\Repository\AbstractMaxRepository;

/**
 * Description of Dogodki
 *
 * @author rado
 */
class Dogodki
        extends AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "title" => ["alias" => "p.title"]
        ],
        "vse"     => [
            "title" => ["alias" => "p.title"]
        ],
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
                $qb   = $this->getDefaultQb($options);
                $sort = $this->getSort($name);
                $qb->orderBy($sort->order, $sort->dir);

                return new DoctrinePaginator(new Paginator($qb));
        }
    }

    public function getDefaultQb($options)
    {
        /**
         * nastavimo defaultne vrednosti nekaterih opcij, če so prazne
         */
        /* Če ni postavljenega začetka, smatramo, da gledamo od danes naprej */
        if (empty($options['zacetek'])) {
            $options['zacetek'] = new DateTime();
        }
        /*
         * Če ni postavljenega konca smatramo, da nas zanima 1 mesec 
         */
        if (empty($options['konec'])) {
            /**
             * konec = začetek + 1 mesec
             */
            $options['konec'] = clone $options['zacetek'];
            $options['konec']->modify('+1 month');
        }


        return $this->getVseQb($options);
    }

    public function getVseQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();
        if (!empty($options['q'])) {
            $naslov = $e->like('p.title', ':title');
            $qb->andWhere($naslov);
            $qb->setParameter('title', "{$options['q']}%", "string");
        }
        if (!empty($options['razred'])) {
            $raz = $e->in('p.razred', $options['razred']);
            $qb->andWhere($raz);
            //$qb->setParameter('razred', $options['razred'], "array");
        }

        if (!empty($options['zacetek'])) {

            $cas = $e->gte('p.zacetek', ':zac');
            $qb->andWhere($cas);
            $qb->setParameter('zac', $options['zacetek'], "date");
        }
        if (!empty($options['konec'])) {
            /**
             * konec <= zacetek
             */
            $cas = $e->lt('p.zacetek', ':konec');
            $qb->andWhere($cas);
            $qb->setParameter('konec', $options['konec'], "date");
        }

        /**
         * navadni uporabniki lahko vidijo le dogodke od 500s naprej
         */
        if (!$this->getAuth()->isGranted('Dogodek-readVse')) {
            if (empty($options['status'])) {
                $options['status'] = ['600s', '610s', '710s', '720s', '790s'];       //  > 500s
            }
            /**
             * pobriši statuse < 500s
             */
            $options['status'] = array_intersect(['500s', '600s', '610s', '710s', '720s', '790s'], $options['status']);
        }

        if (!empty($options['status'])) {
            $this->expect(is_array($options['status']), "Parameter status mora biti array", 1000580);
            $naz = $e->in('p.status', $options['status']);
            $qb->andWhere($naz);
            //   $qb->setParameter('statusi', , 'array');
        }
        if (!empty($options['prostor'])) {
            $this->expect(is_array($options['prostor']), "Parameter prostor mora biti array idjev", 1000581);
            $qb->join('p.prostor', 'prostor');
            $naz = $e->in('prostor.id', $options['prostor']);
            $qb->andWhere($naz);
        }
        if (!empty($options['uprizoritev'])) {
            $this->expect(is_array($options['uprizoritev']), "Parameter uprizoritev mora biti array idjev", 1000582);
            $qb->leftJoin('p.vaja', 'vaja');
            $qb->leftJoin('p.predstava', 'predstava');

            $pu = $e->in('vaja.uprizoritev', $options['uprizoritev']);
            $vu = $e->in('predstava.uprizoritev', $options['uprizoritev']);

            $qb->andWhere($e->orX($pu, $vu));
            //$qb->setParameter('uprizoritev', $options['uprizoritev'], "string");
        }
        return $qb;
    }

    /**
     * Opravila pri ustvarjanju nove entitete
     *
     * @param Dogodek $object
     * @param Parameters $params
     */
    public function create($object, $params = null)
    {

        if (!$object->getStatus()) {
            $object->setStatus(Dogodek::PLANIRAN);
        }

        if (!empty($params['alternacija'])) {
            $this->expect(is_array($params['alternacija']), "Parameter alternacija mora biti array id-jev", 1000584);
            $alternacijaIds = $params['alternacija']; //$$ glej , če je null
        } else {
            $alternacijaIds = [];
        }


        parent::create($object, $params);
        /*
         * $$ todo:
         * - kreiraj termine storitve
         *  . za vse alternacije 
         *  . za vse goste
         *  . za vse dežurne
         * - v terminih storitve kontrola, za katere dogodke je so dovoljeni TS
         * - omogoči delete TS pri delete dogodka
         *   . prav tako popravi update
         * 
         */
        
        /*
         * preberemo delte iz opcij
         */
        $optionR = $this->getEntityManager()->getRepository('App\Entity\Option');
        $option  = $optionR->findOneByName("dogodek.delte");
        $this->expect($option, "Opcija dogodek.delte ne obstaja", 1000587);
        $delte   = $option->getDefaultValue();
        
        /*
         * init delt
         */
        switch ($object->getRazred()) {
            case $object::PREDSTAVA:
                $deltaZacetek    = $delte['delPreZac']['value'];
                $deltaKonec      = $delte['delPreKon']['value'];
                $deltaZacetekTeh = $delte['delPreZacTeh']['value'];
                $deltaKonecTeh   = $delte['delPreKonTeh']['value'];
                break;
            case $object::VAJA:
                $deltaZacetek    = $delte['delVajZac']['value'];
                $deltaKonec      = $delte['delVajKon']['value'];
                $deltaZacetekTeh = $delte['delVajZacTeh']['value'];
                $deltaKonecTeh   = $delte['delVajKonTeh']['value'];
                break;
            case $object::SPLOSNO:
                $deltaZacetek    = $delte['delSplZac']['value'];
                $deltaKonec      = $delte['delSplKon']['value'];
                break;
            case $object::TEHNICNI:
                $deltaZacetek    = $delte['delTehZac']['value'];
                $deltaKonec      = $delte['delTehKon']['value'];
                break;
            default:
                $deltaZacetek    = 0;
                $deltaKonec      = 0;
                break;
        }

        $terminStoritveR = $this->getEntityManager()->getRepository('Prisotnost\Entity\TerminStoritve');
        $altR            = $this->getEntityManager()->getRepository('Produkcija\Entity\Alternacija');
        foreach ($alternacijaIds as $altId) {
            $alt = $altR->findOneById($altId);
            $this->expect($alt, "Alternacija ($altId) ne obstaja", 1000586);

            $aliTehnik = false;   //init
            if ($alt->getFunkcija()) {
                if ($alt->getFunkcija()->getPodrocje() == 'tehnik') {
                    $aliTehnik = true;
                }
            }

            $ts = new \Prisotnost\Entity\TerminStoritve();
            $ts->setDogodek($object);
            $ts->setAlternacija($alt);

            $deltaZ = $aliTehnik ? $deltaZacetekTeh : $deltaZacetek;
            $ts->setPlaniranZacetek($this->dodajInterval($object->getZacetek(), $deltaZ));
            
            $deltaK = $aliTehnik ? $deltaKonecTeh : $deltaKonec;
            $ts->setPlaniranKonec($this->dodajInterval($object->getKonec(), $deltaK));
            
            $ts->setDezurni(false);
            $ts->setGost(false);
            $ts->setZasedenost(false);
            $ts->setVirtZasedenost(false);
            $ts->setUra(null);
            $object->terminiStoritve->add($ts); // verjetno to ni potrebno
            $terminStoritveR->create($ts);
        }
    }

    /**
     * Privzeti postopek posodabljanja
     * preveri avtorizacijo in
     *
     * @param Dogodek $object
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
     * @param Dogodek $object
     */
    public function delete($object)
    {
        parent::delete($object); // TODO: Change the autogenerated stub
    }

    /**
     * K nekemu času dodamo število minut
     * 
     * @param datetime $cas      
     * @param integer $delta    delta čas v minutah
     * @return datetime 
     */
    public function dodajInterval($cas, $delta)
    {
        $novCas   = clone $cas;
        $interval = new \DateInterval('PT' . abs($delta) . 'M');
        if ($delta < 0) {
            $interval->invert = 1;
        }
        $novCas->add($interval);
        return $novCas;
    }

}
