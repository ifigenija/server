<?php

/*
 *  Licenca GPLv3
 */

namespace ProgramDela\Service;

use Zend\View\Model\JsonModel;

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
     * @param \ProgramDela\Entity\ProgramDela   $programdela
     * 
     * @return $data                strukturirani podatki priloge C2
     */
    public function podatkiPrilogaC2(\ProgramDela\Entity\ProgramDela $programdela)
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
    protected function napolniDataPoStolpcu($data, $stolpec, $upostevajDo, \Produkcija\Entity\Uprizoritev $uprizoritev, $stPonovitev, $stPonovZamejo, \ProgramDela\Entity\ProgramDela $programDela)
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
                case 'avtorprav':
                    if ($upostevajDo) {
                        /**
                         * avtorske pravice
                         */
                        // stolpec
                        $vrednost = $strosek->getVrednostDo();
                        $data["T.0"]['vrednost']['premiere']+=$vrednost;      //glava
                        $data["T.1"]['vrednost']['premiere']+=$vrednost;
                        $data["Skupaj"]['vrednost']['premiere'] +=$vrednost;
                    }

                    /**
                     * tantieme
                     */
                    // stolpec
                    $vrednost = $strosek->getVrednostNa() * $stPonovitev;
                    $data["T.0"]['vrednost'][$stolpec]+=$vrednost;      //glava
                    $data["T.2"]['vrednost'][$stolpec]+=$vrednost;
                    $data["Skupaj"]['vrednost'][$stolpec] +=$vrednost;

                    // zamejstvo
                    $vrednost = $strosek->getVrednostNa() * $stPonovZamejo;
                    $data["T.0"]['vrednost']['gostovanjaZamejstvo']+=$vrednost;      //glava
                    $data["T.2"]['vrednost']['gostovanjaZamejstvo']+=$vrednost;
                    $data["Skupaj"]['vrednost']['gostovanjaZamejstvo'] +=$vrednost;
                    break;
            }
        }
        $honorarji = $this->sestejHonorarje($uprizoritev, $programDela);

        // stolpec
        $vrednost = $upostevajDo ? $honorarji['Do'] : 0;        // le za premiere
        $vrednost += $honorarji['Na'] * $stPonovitev;
        $data["H.0"]['vrednost'][$stolpec]+=$vrednost;      //glava
        $data["H.1"]['vrednost'][$stolpec]+=$vrednost;
        $data["Skupaj"]['vrednost'][$stolpec]+=$vrednost;

        // zamejstvo
        $vrednost = $honorarji['Na'] * $stPonovZamejo;
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
     * inicializira podatke
     * 
     * @param entity $uprizoritev enota programa
     * @param entity $programDela      programa dela
     * 
     * @return array $honorarji
     */
    protected function sestejHonorarje(\Produkcija\Entity\Uprizoritev $uprizoritev, \ProgramDela\Entity\ProgramDela $programDela)
    {
        $honorarji['Do'] = 0; //init
        $honorarji['Na'] = 0; //init

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
                                //$$ tu obstaja možnost, da bo honorarje 2x štel, če bo ista pogodba na več alternacijah
                                $honorarji['Do']+= $pogodba->getVrednostDoPremiere();
                                $honorarji['Na']+= $pogodba->getVrednostPredstave();
                            }
                        }
                    }
                }
            }
        }
        return $honorarji;
    }

}
