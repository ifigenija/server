<?php

/*
 *  Licenca GPLv3
 */

namespace ProgramDela\Service;

use Produkcija\Entity\Uprizoritev;
use ProgramDela\Entity\ProgramDela;

/**
 * Description of EnotaProgramaRpcService
 *
 * @author rado
 */
class ProgramDelaService
        extends \Max\Service\AbstractMaxService
{

    /**
     * priprava podatkov za finančno prilogo C2 na osnovi programa dela, enot program in pripadajočih 
     * uprizoritev 
     * 
     * @param ProgramDela   $programdela
     * 
     * @return $data                strukturirani podatki priloge C2
     */
    public function podatkiPrilogaC2(ProgramDela $programdela)
    {
        $data = $this->initDataC2();

        $tr = $this->getServiceLocator()->get('translator');

        /**
         * premiere
         */
        foreach ($programdela->getPremiere() as $ep) {
            $uprizoritev   = $ep->getUprizoritev();
            $stPonovitev   = 1;
            $stPonovZamejo = 0;
            $data          = $this->napolniDataPoStolpcu($data, 'premiere', TRUE, $uprizoritev, $stPonovitev, $stPonovZamejo, $programdela);
        }

        /**
         * ponovitve premier
         */
        foreach ($programdela->getPonovitvePremiere() as $ep) {
            $uprizoritev   = $ep->getUprizoritev();
            $stPonovitev   = $ep->getPonoviDoma() + $ep->getPonoviKopr() + $ep->getPonoviGost();
            $stPonovZamejo = $ep->getPonoviZamejo();
            $data          = $this->napolniDataPoStolpcu($data, 'ponovitvePremier', false, $uprizoritev, $stPonovitev, $stPonovZamejo, $programdela);
        }

        /**
         * ponovitve prejšnjih
         */
        foreach ($programdela->getPonovitvePrejsnjih() as $ep) {
            $uprizoritev   = $ep->getUprizoritev();
            $stPonovitev   = $ep->getPonoviDoma() + $ep->getPonoviKopr() + $ep->getPonoviGost();
            $stPonovZamejo = $ep->getPonoviZamejo();
            $data          = $this->napolniDataPoStolpcu($data, 'ponovitvePrejsnjih', false, $uprizoritev, $stPonovitev, $stPonovZamejo, $programdela);
        }
        return $data;
    }

    /**
     * dopolni podatke v stolpec   $stolpec   in v stolpec  gostovanjaZamejstvo
     * 
     * @param array $data           tabela, ki jo dopolnjujemo
     * @param string $stolpec ime stolpca npr. premiere ali ponovitvePrejsnjih
     * @param boolean $upostevajDo   pri premierah mora biti true, pri ostalih false    
     * @param entity $uprizoritev enota programa
     * @param integer $stPonovitev število ponovitev doma, v Sloveniji
     * @param integer $stPonovZamejo število ponovitev v zamejstvu
     * @param entity $programDela      programa dela - rabimo zaradi začetka in konca
     * 
     * @return array $data      dopolnjeni podatki v stolpcu $stolpec
     */
    protected function napolniDataPoStolpcu($data, $stolpec, $upostevajDo, Uprizoritev $uprizoritev, $stPonovitev, $stPonovZamejo, ProgramDela $programDela)
    {
        foreach ($uprizoritev->getStroski() as $strosek) {
            switch ($strosek->getTipstroska()) {
                case 'materialni':
                    $skupina    = (string) $strosek->getVrstaStroska()->getSkupina();
                    $podskupina = (string) $strosek->getVrstaStroska()->getPodskupina();

                    // stolpec
                    $vrednost = $upostevajDo ? $strosek->getVrednostDo() : 0;        // le za premiere
                    $vrednost += $strosek->getVrednostNa() * $stPonovitev;
                    $data[$skupina . ".0"]['vrednost'][$stolpec]+=$vrednost;          //glava
                    $data[$skupina . "." . $podskupina]['vrednost'][$stolpec]+=$vrednost;
                    $data["Skupaj"]['vrednost'][$stolpec] +=$vrednost;

                    // zamejstvo
                    $vrednost = $strosek->getVrednostNa() * $stPonovZamejo;
                    $data[$skupina . ".0"]['vrednost']['gostovanjaZamejstvo']+=$vrednost;          //glava
                    $data[$skupina . "." . $podskupina]['vrednost']['gostovanjaZamejstvo']+=$vrednost;
                    $data["Skupaj"]['vrednost']['gostovanjaZamejstvo'] +=$vrednost;
                    break;
            }
        }
        $honorInAvt = $this->sestejVrednostiPogodb($uprizoritev, $programDela);
        /**
         * avtorske pravice
         */
        // stolpec
        $vrednost   = $upostevajDo ? $honorInAvt['Do']['avtorskePravice'] : 0;        // le za premiere
        $data["T.0"]['vrednost'][$stolpec]+=$vrednost;      //glava
        $data["T.1"]['vrednost'][$stolpec]+=$vrednost;
        $data["Skupaj"]['vrednost'][$stolpec] +=$vrednost;

        /**
         * tantieme
         */
        // stolpec
        $vrednost += $honorInAvt['Na']['avtorskePravice'] * $stPonovitev;
        $data["T.0"]['vrednost'][$stolpec]+=$vrednost;      //glava
        $data["T.2"]['vrednost'][$stolpec]+=$vrednost;
        $data["Skupaj"]['vrednost'][$stolpec] +=$vrednost;

        // zamejstvo
        $vrednost += $honorInAvt['Na']['avtorskePravice'] * $stPonovZamejo;
        $data["T.0"]['vrednost']['gostovanjaZamejstvo']+=$vrednost;      //glava
        $data["T.2"]['vrednost']['gostovanjaZamejstvo']+=$vrednost;
        $data["Skupaj"]['vrednost']['gostovanjaZamejstvo'] +=$vrednost;

        /**
         * avtorski honorarji
         */
        // stolpec
        $vrednost = $upostevajDo ? $honorInAvt['Do']['avtorskiHonorarji'] : 0;        // le za premiere
        $vrednost += $honorInAvt['Na']['avtorskiHonorarji'] * $stPonovitev;
        $data["H.0"]['vrednost'][$stolpec]+=$vrednost;      //glava
        $data["H.1"]['vrednost'][$stolpec]+=$vrednost;
        $data["Skupaj"]['vrednost'][$stolpec]+=$vrednost;

        // zamejstvo
        $vrednost = $honorInAvt['Na']['avtorskiHonorarji'] * $stPonovZamejo;
        $data["H.0"]['vrednost']['gostovanjaZamejstvo']+=$vrednost;      //glava
        $data["H.1"]['vrednost']['gostovanjaZamejstvo']+=$vrednost;
        $data["Skupaj"]['vrednost']['gostovanjaZamejstvo'] +=$vrednost;

        return $data;
    }

    /**
     * inicializira podatke
     * 
     * @return array $data
     */
    protected function initDataC2()
    {
        $stolpci = [
            'premiere'            => 0,
            'ponovitvePremier'    => 0,
            'ponovitvePrejsnjih'  => 0,
            'gostovanjaZamejstvo' => 0,
                /**
                 * nimajo uprizoritve ali ustreznih podatkov v njej:
                 */
//            'mednarodnaGostovanja',
//            'festivali',
//            'skupaj',
        ];

        $vrStrR = $this->getEm()->getRepository('Produkcija\Entity\VrstaStroska');
        $vrStrR->setServiceLocator($this->getServiceLocator());
        $vrStrA = $vrStrR->findAll();

//        $data['test']=$stolpci;
        foreach ($vrStrA as $vrstaStroska) {
            $skupina                               = (string) $vrstaStroska->getSkupina();
            $podskupina                            = (string) $vrstaStroska->getPodskupina();
            $vrstice[$skupina . "." . $podskupina] = ['nazivStr' => $vrstaStroska->getNaziv(), 'vrednost' => $stolpci];
        }
        $vrstice["H.0"]    = ['nazivStr' => "AVTORSKI HONORARJI", 'vrednost' => $stolpci];
        $vrstice["H.1"]    = ['nazivStr' => "stroški avtorskih honorarjev", 'vrednost' => $stolpci];
        $vrstice["T.0"]    = ['nazivStr' => "AVTORSKE PRAVICE", 'vrednost' => $stolpci];
        $vrstice["T.1"]    = ['nazivStr' => "stroški odkupa avtorskih pravic", 'vrednost' => $stolpci];
        $vrstice["T.2"]    = ['nazivStr' => "stroški tantiem", 'vrednost' => $stolpci];
        $vrstice["Skupaj"] = ['nazivStr' => "Skupaj C.2", 'vrednost' => $stolpci];
        $data              = $vrstice;

        return $data;
    }

    /**
     * sešteje avtorske honorarje in avtorske pravice iz pogodb
     * 
     * @param entity $uprizoritev enota programa
     * @param entity $programDela      programa dela
     * 
     * @return array $data       honorarji in avtorske pravice (in tantieme)   
     */
    protected function sestejVrednostiPogodb(Uprizoritev $uprizoritev, ProgramDela $programDela)
    {
        $data['Do']['avtorskePravice']   = 0; // init 
        $data['Na']['avtorskePravice']   = 0;
        $data['Do']['avtorskiHonorarji'] = 0;
        $data['Na']['avtorskiHonorarji'] = 0;

        $pdz = $programDela->getZacetek();
        $pdk = $programDela->getKonec();

        foreach ($uprizoritev->getFunkcije() as $numFun => $funkcija) {
            foreach ($funkcija->getAlternacije() as $numAlt => $alternacija) {
                /**
                 * upoštevamo le tiste alternacije, ki se vsaj delno prekrivajo z intervalom začetka in konca programa dela 
                 */
                $az = is_null($alternacija->getZacetek()) ? null : $alternacija->getZacetek();
                $ak = is_null($alternacija->getKonec()) ? null : $alternacija->getKonec();

                if ((!is_null($az) ? $az <= $pdk : true ) && (!is_null($ak) ? $ak >= $pdz : true )) {
                    if ($alternacija->getImaPogodbo()) {
                        $pogodba = $alternacija->getPogodba();
                        if ($pogodba) {
                            if ($pogodba->getAktivna()) {
                                /**
                                 *  $$ tu obstaja možnost, da bo honorarje 2x štel, če bo ista pogodba na več alternacijah
                                 */
                                if ($pogodba->getJeAvtorskePravice()) {
                                    /**
                                     * avtorske pravice
                                     */
                                    $data['Do']['avtorskePravice']+= $pogodba->getVrednostDoPremiere();
                                    $data['Na']['avtorskePravice']+= $pogodba->getVrednostPredstave(); // to so tantieme
                                } else {
                                    /**
                                     * avtorski honorarji
                                     */
                                    $data['Do']['avtorskiHonorarji'] += $pogodba->getVrednostDoPremiere();
                                    $data['Na']['avtorskiHonorarji'] += $pogodba->getVrednostPredstave();
                                }
                            }
                        }
                    }
                }
            }
        }
        return $data;
    }

    /**
     * priprava podatkov za finančno prilogo C2 na osnovi programa dela, enot program in pripadajočih 
     * uprizoritev 
     * 
     * kreira oz. osveži postavke C2 za dotičen program dela. Osveži le tiste kolone, 
     * za katerega obstajajo podatki (npr. iz uprizoritev)
     * 
     * @param entity   $programDela
     * 
     * @returns       True|False                uspeh oz. neuspeh klica procedure
     */
    public function osveziTabeloC2(ProgramDela $programdela)
    {
        $em = $this->getEm();

        $data = $this->podatkiPrilogaC2($programdela);

        /**
         * iz tabele C2 pobriši vse postavke, ki jih ni v $data
         */
        foreach ($programdela->getPostavkeC2() as $postavkaC2) {
            $skupina    = (string) $postavkaC2->getSkupina();
            $podskupina = (string) $postavkaC2->getPodskupina();
            if (!array_key_exists($skupina . "." . $podskupina, $data)) {
                $em->remove($postavkaC2);
            };
        }

        /**
         * za vse postavke $data
         *  - kreiraj postavko v tabeli c2, če-le ta še ne obstaja  (če ista skupina, podskupina)
         *  - update-iraj postavko v tabeli c2 na osnovi vrednosti postavke v $data
         */
        foreach ($data as $key => $val) {
            if (!strpos($key, ".") === FALSE) {     //Skupaj preskočimo
                $skupina    = explode(".", $key, 2)[0];
                $podskupina = (integer) explode(".", $key, 2)[1];
                $postColl   = $programdela->getPostavkeC2()
                        ->filter(function($ent) use (&$skupina, &$podskupina) {
                    return ($ent->getSkupina() === $skupina && $ent->getPodskupina() === $podskupina);   
                });
                if ($postColl->count() == 0) {
                    /**
                     * če postavka še ne obstaja v tabeli, jo kreiramo
                     */
                    $postavkaC2 = new \ProgramDela\Entity\PostavkaCDve();
                    $em->persist($postavkaC2);
                    $postavkaC2->setProgramDela($programdela);
                    $postavkaC2->setSkupina($skupina);
                    $postavkaC2->setPodskupina($podskupina);
                } else {
                    $this->expect(!($postColl->count() > 1), "Več vrstic v tabeli C2 z isto skupino, podskupino:" . $skupina . "." . $podskupina, 1001040);
                    $postavkaC2 = $postColl->first();  // vrne 1. in edini element 
                }
                $postavkaC2->setNaziv($val['nazivStr']);
                $postavkaC2->setVrPremiere($val['vrednost']['premiere']);
                $postavkaC2->setVrPonovitvePremier($val['vrednost']['ponovitvePremier']);
                $postavkaC2->setVrPonovitvePrejsnjih($val['vrednost']['ponovitvePrejsnjih']);
                $postavkaC2->setVrGostovanjaZamejstvo($val['vrednost']['gostovanjaZamejstvo']);
                $postavkaC2->setVrFestivali(0);
                $postavkaC2->setVrGostovanjaInt(0);
                $postavkaC2->setVrOstalo(0);
            }
        }
        return TRUE;
    }

}
