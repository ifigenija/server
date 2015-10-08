<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Util\Controller;

use Zend\Mvc\Controller\AbstractActionController;

/**
 * Import besedil iz csv datoteke 
 * 
 * Narejeno za SLG-CE
 *
 * @author rado
 */
class ImportBesedilController
        extends AbstractActionController
{

    private $references = [];

    /**
     */
    private $src;

    /**
     *  @var  \Doctrine\ORM\EntityManager 
     */
    private $em;

    /**
     * Napolni podatke iz Fixtures
     */
    public function importBesedilAction()
    {
        $this->em = $this->getServiceLocator()->get('doctrine.entitymanager.orm_default');

        $this->loadCsv();
        $this->loadBesedila();
        $this->loadAvtorji();

        $this->em->flush();
    }

    /**
     * prebere csv datoteko in jo da v polje $this->src
     */
    public function loadCsv()
    {
        echo "reading CSV file" . PHP_EOL;
        $this->src = array();
        $handle    = fopen($this->params('csvfile'), "r");
        if ($handle) {
            while (($data = fgetcsv($handle, 1000, ",")) !== FALSE) {
                $this->src[] = $data;
            }
            fclose($handle);
        }
        echo "CSV file has been read" . PHP_EOL;
    }

    public function loadBesedila()
    {
        echo "loading besedila" . PHP_EOL;
        $besediloR = $this->em->getRepository('Produkcija\Entity\Besedilo');
        $besediloR->setServiceLocator($this->getServiceLocator());

        /**
         * iz csv breberi vse vrstice besedil
         * in jih daj (če se ne ponavlja) v Besedilo
         */
        foreach ($this->src as $key => $vrsta) {
            /**
             * v prvi vrsti csv-ja je glava
             */
            if ($key == 0) {
                continue;
            }

            /**
             * če je naslov besedila v csv prazen, to pomeni, da se besedilo ponavlja (isti id) 
             * zaradi več avtorjev
             */
            if (!empty(trim($vrsta[1]))) {
                $besedilo = new \Produkcija\Entity\Besedilo();
                $besedilo->setNaslov($vrsta[1]);
                $besedilo->setJezik($vrsta[2]);

                $besediloR->create($besedilo);
                $besediloR->update($besedilo);

                echo "besedilo $vrsta[0] $vrsta[1]" . PHP_EOL;
                $this->addRef('besedilo', intval($vrsta[0]), $besedilo);
            }
        }
    }

    public function loadAvtorji()
    {
        echo "loading avtorji" . PHP_EOL;

        $osebaR = $this->em->getRepository('App\Entity\Oseba');
        $osebaR->setServiceLocator($this->getServiceLocator());
        $avtorR = $this->em->getRepository('Produkcija\Entity\AvtorBesedila');
        $avtorR->setServiceLocator($this->getServiceLocator());

        /**
         * iz csv breberi vse vrstice avtorjev
         * in jih daj (če se ne ponavlja) v Besedilo
         */
        foreach ($this->src as $key => $vrsta) {
            /**
             * v prvi vrsti csv-ja je glava
             */
            if ($key == 0) {
                continue;
            }

            /**
             * najprej dodamo/ažuriramo osebo
             */
            $oseba = null;    //init
            $oseba = $osebaR->findOneBy(["ime" => trim($vrsta[3]), "priimek" => trim($vrsta[4])]);
            if (!$oseba) {
                $oseba = new \App\Entity\Oseba();
                $oseba->setIme(trim($vrsta[3]));
                $oseba->setPriimek(trim($vrsta[4]));
                $oseba->setPolnoIme(trim($oseba->getIme() . " " . $oseba->getPriimek()));
                $oseba->setSpol($vrsta[7] == 'Z' ? 'Z' : 'M');
                if (!$oseba->getPriimek()) {
                    continue;
                }

                $osebaR->create($oseba);
            }
            if (!$oseba->getPriimek()) {
                continue;
            }

            $osebaR->update($oseba);

            /**
             * dodamo avtorja besedila
             */
            $avtor = new \Produkcija\Entity\AvtorBesedila();
            $avtor->setOseba($oseba);
            $avtor->setTipAvtorja(trim($vrsta[5]));
            $avtor->setAliVNaslovu($vrsta[6] ? true : FALSE);
            $avtor->setBesedilo($this->getRef('besedilo', intval($vrsta[0])));
            $avtor->setZaporedna($vrsta[8]);

            $avtorR->create($avtor);


            $polnoIme = $oseba->getPolnoIme();
            echo "oseba $vrsta[0] $polnoIme " . PHP_EOL;

            /**
             * da bo lahko našel osebe, ki smo jih prej dodali
             * 
             * performančno je sicer slabše
             */
            $this->em->flush();
        }
    }

    public function addRef($name, $key, $val)
    {
        $this->references["$name-$key"] = $val;
    }

    /**
     * Poiščem poimenovano referenco 
     * @param type $name
     * @param type $key
     * @return type
     */
    public function getRef($name, $key)
    {
        if (isset($this->references["$name-$key"])) {
            return $this->references["$name-$key"];
        }
        return null;
    }

}
