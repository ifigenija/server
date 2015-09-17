<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Util\Controller;

use Prodaja\Entity\Prostor;
use Produkcija\Entity\Zaposlitev;
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
        $this->loadUprizoritve();

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
    public function loadVrsteRef()
    {

        $oznake = $this->src->fetchAll('select * from dbo."s_vrstaSodelavca" ');
        foreach ($oznake as $oznaka) {
            $this->addRef('vrstasodelavca', $oznaka['IDvrstaSodelavca'], trim($oznaka['vrstaSodelavca']));
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
        $zr->setServiceLocator($this->getServiceLocator());
        foreach ($zap as $z) {
            if ($z['IDtipSodelavca'] === 1 || $z['IDtipSodelavca'] === 6) {
                $os = $this->getRef('sodelavec', $z['IDsodelavca']);
                if (!$os) {
                    continue;
                }
                $zaposlitev = new Zaposlitev();
                $zaposlitev->setOseba($os);
                $os->getZaposlitve()->add($zaposlitev);
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

    public function loadProstori()
    {

        $zap = $this->src->fetchAll('select * from dbo."s_dvorane"');
        $pr  = $this->em->getRepository('Prodaja\Entity\Prostor');
        $pr->setServiceLocator($this->getServiceLocator());

        foreach ($zap as $u) {
            $prostor = new Prostor();
            if (!$u['IDdvorane']) {
                continue;
            }
            $prostor->setNaziv(trim($u['imeDvorane']));
            $prostor->setKapaciteta(trim($u['steviloSedezev']));
            $prostor->setSifra(trim($u['kratica']));
            $prostor->setJePrizorisce(true);
            $pr->create($prostor);
            $this->em->persist($prostor);
            $this->addRef('prostor', $u['IDdvorane'], $prostor);
        }
    }

    /**
     * Nalagam uprizoritve 
     */
    public function loadUprizoritve()
    {
        $this->loadProstori();
        $zap = $this->src->fetchAll('select * from dbo."tblUprizoritve"');
        $ur  = $this->em->getRepository('Produkcija\Entity\Uprizoritev');
        $ur->setServiceLocator($this->getServiceLocator());

        foreach ($zap as $u) {
            $uprizoritev = new \Produkcija\Entity\Uprizoritev();

            $uprizoritev->setNaslov(trim($u['naslov']));
            $uprizoritev->setAvtor(trim($u['avtor']));
            $uprizoritev->setPodnaslov(trim($u['podnaslov']));
            $uprizoritev->setDelovniNaslov(trim($u['delovniNaslov']));
            $uprizoritev->setDatumPremiere($u['datumPremiere'] ? new \DateTime($u['datumPremiere']) : null);
            $uprizoritev->setTrajanje($u['trajanje']);
            $uprizoritev->setMaticniOder($this->getRef('oder', $u['IDdvorane']));
            $uprizoritev->setOpis(trim($u['opomba']));

            if ($u['izvajalec'] === 'G') {
                $uprizoritev->setGostujoca(true);
            }

            if ($u['aktivna']) {
                $uprizoritev->setFaza('postprodukcija');
            } else {
                $uprizoritev->setFaza('arhiv');
            }

            $uprizoritev->setZvrstSurs($this->getRef('surs', $u['IDzvrstiSURS']));
            $uprizoritev->setMaticniOder($this->getRef('prostor', $u['IDdvorane']));
            $ur->create($uprizoritev);
            $this->em->persist($uprizoritev);
            $this->addRef('uprizoritev', $u['IDuprizoritve'], $uprizoritev);
        }
        $this->loadVloge();
        $this->loadFunkcije();
    }

    public function loadVloge()
    {
        $zap = $this->src->fetchAll('select * from dbo."tblUprizoritve_vloge"');
        $ur  = $this->em->getRepository('Produkcija\Entity\Funkcija');
        $ur->setServiceLocator($this->getServiceLocator());

        $tr = $this->em->getRepository('Produkcija\Entity\TipFunkcije');
        $ar = $this->em->getRepository('Produkcija\Entity\Alternacija');
        $ar->setServiceLocator($this->getServiceLocator());

        $tipIgralec = $tr->findOneBy(['ime' => "Vloga"]);

        foreach ($zap as $u) {
            $vloga = new \Produkcija\Entity\Funkcija();
            $vloga->setUprizoritev($this->getRef('uprizoritev', $u['IDuprizoritve']));
            $vloga->setNaziv($u['imeVloge']);
            $vloga->setPodrocje('igralec');
            $vloga->setTipFunkcije($tipIgralec);
            $vloga->setPomembna(true);
            $vloga->setSePlanira(true);
            $vloga->setDovoliPrekrivanje(false);
            $vloga->setSort($u['sort']);
            switch ($u['IDvelikostVloge']) {
                case 1:
                    $vloga->setVelikost("mala");
                    break;
                case 2:
                    $vloga->setVelikost("srednja");
                    break;
                case 3:
                case 4:
                    $vloga->setVelikost("velika");
                    break;
                default:
                    $vloga->setVelikost("stataza");
            }
            if ($u['IDsodelavca']) {
                $os = $this->getRef('sodelavec', $u['IDsodelavca']);
                if (!$os) {
                    echo "ne najdem sodelavca " . $u['IDsodelavca'];
                    continue;
                }
                $alt = new \Produkcija\Entity\Alternacija();
                $alt->setFunkcija($vloga);
                $vloga->getAlternacije()->add($alt);
                $alt->setOseba($os);
                $alt->setPrivzeti(true);
                if ($os->getZaposlitve() && $os->getZaposlitve()->count() > 0) {
                    $alt->setZaposlen(true);
                    $alt->setZaposlitev($os->getZaposlitve()[0]);
                }
                $ar->create($alt);
                $this->em->persist($alt);
            }


            $ur->create($vloga);
            $this->em->persist($vloga);
            $this->addRef('vloga', $u['IDvloge'], $vloga);
        }
    }

    public function loadFunkcije()
    {


        $this->loadVrsteRef();
        $zap = $this->src->fetchAll('select * from dbo."tblUprizoritve_sodelavci"');
        $ur  = $this->em->getRepository('Produkcija\Entity\Funkcija');
        $ur->setServiceLocator($this->getServiceLocator());

        $tr = $this->em->getRepository('Produkcija\Entity\TipFunkcije');
        $ar = $this->em->getRepository('Produkcija\Entity\Alternacija');
        $ar->setServiceLocator($this->getServiceLocator());
        $tipOstalo = $tr->findOneBy(['sifra' => "17"]);
        $tipAvtor = $tr->findOneBy(['sifra' => "01"]);
        foreach ($zap as $u) {
            $vloga = new \Produkcija\Entity\Funkcija();
            $vloga->setUprizoritev($this->getRef('uprizoritev', $u['IDuprizoritve']));
            $vloga->setNaziv($this->getRef('vrstasodelavca', $u['IDvrstaSodelavca']));
            $vloga->setPodrocje($u['skupina'] === 'U' ? 'umetnik': 'tehnik');
            $vloga->setTipFunkcije($u['skupina'] === 'U' ?  $tipAvtor:$tipOstalo);
            $vloga->setPomembna(true);
            $vloga->setSePlanira($u['planirajPrisotnost']? true: false);
            $vloga->setDovoliPrekrivanje(false);
            $vloga->setSort($u['sort']);
            if ($u['IDsodelavca']) {
                $os = $this->getRef('sodelavec', $u['IDsodelavca']);
                if (!$os) {
                    echo "ne najdem sodelavca " . $u['IDsodelavca'];
                    continue;
                }
                $alt = new \Produkcija\Entity\Alternacija();
                $alt->setFunkcija($vloga);
                $alt->setPrivzeti(true);
                $vloga->getAlternacije()->add($alt);
                $alt->setOseba($os);
                if ($os->getZaposlitve() && $os->getZaposlitve()->count() > 0) {
                    $alt->setZaposlen(true);
                    $alt->setZaposlitev($os->getZaposlitve()[0]);
                }
                $ar->create($alt);
                $this->em->persist($alt);
            }


            $ur->create($vloga);
            $this->em->persist($vloga);
            $this->addRef('funkcija', $u['ID'], $vloga);
        }
    }

}
