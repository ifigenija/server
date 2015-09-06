<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Util\Controller;

use Zend\Mvc\Controller\AbstractActionController;

/**
 * Description of InstallController
 *
 * @author boris
 */
class MigrateController
        extends AbstractActionController
{

    private $references = [];

    /**
     *  @var \Doctrine\DBAL\Connection 
     */
    private $src;

    /**
     *  @var  \Doctrine\ORM\EntityManager 
     */
    private $em;

    /**
     * Napolni podatke iz Fixtures
     */
    public function migrateAction()
    {
        $this->em  = $this->getServiceLocator()->get('doctrine.entitymanager.orm_default');
        echo "connectiong" . PHP_EOL;
        $this->src = $this->getServiceLocator()->get('doctrine.connection.migrate_' . $this->params('db'));
        echo "connected" . PHP_EOL;


        $this->loadSursRef();

        $this->loadSodelavci();

        $this->em->flush();
    }

    public function loadSursRef()
    {

        $zvrsti = $this->em->getRepository("\Produkcija\Entity\ZvrstSurs")->findAll();

        foreach ($zvrsti as $zvrst) {
            $this->addRef('surs', intval($zvrst->getSifra()), $zvrst);
        }
    }

    /**
     * Oznake sodelvcev gredo v osebo v naziv
     */
    public function loadOznakeRef()
    {

        $oznake = $this->src->fetchAll('select * from dbo."s_oznake" ');
        foreach ($oznake as $oznaka) {
            $this->addRef('oznaka', $oznaka['IDoznake'], trim($oznaka['oznaka']));
        }
    }

    /**
     * Oznake sodelvcev gredo v osebo v naziv
     */
    public function loadPosteRef()
    {

        $oznake = $this->src->fetchAll('select * from dbo."s_poste" ');
        foreach ($oznake as $oznaka) {
            $this->addRef('postaSt', $oznaka['IDposte'], $oznaka['postaSt']);
            $this->addRef('postaIme', $oznaka['IDposte'], $oznaka['postaIme']);
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

    public function loadSodelavci()
    {

        $this->loadOznakeRef();
        $sodelavci = $this->src->fetchAll('select * from dbo."tblSodelavci" ');
        $or        = $this->em->getRepository('App\Entity\Oseba');
        $or->setServiceLocator($this->getServiceLocator());

        foreach ($sodelavci as $sodelavec) {

            $oseba = new \App\Entity\Oseba();

            $oseba->setIme(trim($sodelavec['ime']));
            $oseba->setPriimek(trim($sodelavec['priimek']));

            if (!($oseba->getPriimek() && $oseba->getIme())) {
                continue;
            }
            
            $oseba->setPsevdonim(trim($sodelavec['psevdonim']));
            $oseba->setEmail(trim($sodelavec['eposta']));
            $oseba->setPolnoIme(trim($sodelavec['ime']) . " " . trim($sodelavec['priimek']));
            $oseba->setEmso($sodelavec['EMSO']);
            $oseba->setDavcna(trim($sodelavec['davcna']));
            $oseba->setDatumRojstva($sodelavec['datumRojstva'] ? new \DateTime($sodelavec['datumRojstva']) : null);
            $oseba->setDrzavljanstvo(trim($sodelavec['drzavljanstvo']));
            $oseba->setKrajRojstva(trim($sodelavec['krajRojstva']));
            $oseba->setSpol($sodelavec['spol'] == 'M' ? 'M' : 'Z');
            $oseba->setNaziv($this->getRef('oznaka', $sodelavec['IDoznake']));
            $oseba->delovnoMesto = trim($sodelavec['delovnoMesto']);
            if (trim($sodelavec['GSM'])) {
                $t = new \App\Entity\Telefonska();
                $t->setOseba($oseba);
                $t->setVrsta('mobilna');
                $t->setPrivzeta(true);
                $t->setStevilka(trim($sodelavec['GSM']));
                $this->em->persist($t);
                $oseba->getTelefonske()->add($t);
            }
            if (trim($sodelavec['telefon'])) {
                $t = new \App\Entity\Telefonska();
                $t->setOseba($oseba);
                $t->setVrsta('fiksna');
                $t->setPrivzeta(true);
                $t->setStevilka(trim($sodelavec['telefon']));
                $this->em->persist($t);
                $oseba->getTelefonske()->add($t);
            }
            if (trim($sodelavec['TRR'])) {
                $r = new \App\Entity\Trr();
                $r->setOseba($oseba);
                $r->setStevilka(trim($sodelavec['TRR']));
                $r->setSwift(trim($sodelavec['opombeOsebni']));
                $this->em->persist($r);
                $r->setBanka(trim($sodelavec['TRRbanka']));
            }

            if (trim($sodelavec['naslov'])) {
                $n = new \App\Entity\PostniNaslov();
                $n->setNaziv($sodelavec['naslovZaPosto'] === 1 ? "Naslov za pošto" : "Naslov");
                $n->setPrivzeti($sodelavec['naslovZaPosto'] === 1);
                $n->setOseba($oseba);
                $n->setUlica(trim($sodelavec['naslov']));
                $n->setPosta($this->getRef('posta', $sodelavec['postaSt']));
                $n->setPostaNaziv($this->getRef('postaIme', $sodelavec['postaSt']));
                $this->em->persist($n);
            }

            if (trim($sodelavec['naslovZ'])) {
                $n = new \App\Entity\PostniNaslov();
                $n->setNaziv($sodelavec['naslovZaPosto'] === 2 ? "Naslov za pošto" : "Naslov");
                $n->setOseba($oseba);
                $n->setPrivzeti($sodelavec['naslovZaPosto'] === 2);
                $n->setUlica(trim($sodelavec['naslovZ']));
                $n->setPosta($this->getRef('postaSt', $sodelavec['postaStZ']));
                $n->setPostaNaziv($this->getRef('postaIme', $sodelavec['postaStZ']));
                $this->em->persist($n);
            }

            $or->create($oseba);
            $this->em->persist($oseba);
            $this->addRef('sodelavec', $sodelavec['IDsodelavca'], $oseba);
        }

        $this->loadZaposlitve();
    }

    public function loadZaposlitve()
    {

        $zap = $this->src->fetchAll('select * from dbo."tblSodelavci_zaposlitev"');
        $zr  = $this->em->getRepository('Produkcija\Entity\Zaposlitev');
        foreach ($zap as $z) {
            if ($z['IDtipSodelavca'] === 1 || $z['IDtipSodelavca'] === 6) {
                $os         = $this->getRef('sodelavec', $z['IDsodelavca']);
                if (!$os) {
                    continue;
                }
                $zaposlitev = new \Produkcija\Entity\Zaposlitev();
                $zaposlitev->setOseba($os);
                $zaposlitev->setJeZaposlenVdrugemJz($z['jeZaposlenDrugJZ']);
                $zaposlitev->setDelovnoMesto($os->delovnoMesto);
                $zaposlitev->setZacetek($z['datumOd'] ? new \DateTime($z['datumOd']) : null);
                $zaposlitev->setKonec($z['datumDo'] ? new \DateTime($z['datumDo']) : null);
                $zaposlitev->setIndividualnaPogodba($z['jeIndividualnaPogodba']);
                $zaposlitev->setStatus('A');
                $zr->create($zaposlitev);
                $this->em->persist($zaposlitev);
            }
        }
    }

}
