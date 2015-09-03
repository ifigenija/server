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
            $uprizoritev = $ep->getUprizoritev();
            $stPonovitev = 1;
            foreach ($uprizoritev->getStroski() as $strosek) {
                switch ($strosek->getTipstroska()) {
                    case 'materialni':
                        $skupina    = (string) $strosek->getVrstaStroska()->getSkupina();
                        $podskupina = (string) $strosek->getVrstaStroska()->getPodskupina();
                        $vrednost   = $strosek->getVrednostDo() + $stPonovitev * $strosek->getVrednostNa();
                        $data[$skupina . ".0"]['vrednost']['premiere']+=$vrednost;      //glava
                        $data[$skupina . "." . $podskupina]['vrednost']['premiere']+=$vrednost;
                        $data["Skupaj"]['vrednost']['premiere'] +=$vrednost;
                        break;
                    case 'avtorprav':
                        /**
                         * avtorske pravice
                         */
                        $vrednost   = $strosek->getVrednostDo();
                        $data["T.0"]['vrednost']['premiere']+=$vrednost;      //glava
                        $data["T.1"]['vrednost']['premiere']+=$vrednost;
                        $data["Skupaj"]['vrednost']['premiere'] +=$vrednost;
                        /**
                         * tantieme
                         */
                        $vrednost   = $stPonovitev * $strosek->getVrednostNa();
                        $data["T.0"]['vrednost']['premiere']+=$vrednost;      //glava
                        $data["T.2"]['vrednost']['premiere']+=$vrednost;
                        $data["Skupaj"]['vrednost']['premiere'] +=$vrednost;
                        break;
                }
            }
            $honorarji = $this->sestejHonorarje($uprizoritev, $programdela);
            $vrednost  = $honorarji['Do'] + $stPonovitev * $honorarji['Na'];
            $data["H.0"]['vrednost']['premiere']+=$vrednost;      //glava
            $data["H.1"]['vrednost']['premiere']+=$vrednost;
            $data["Skupaj"]['vrednost']['premiere'] +=$vrednost;
        }

        /**
         * ponovitve premier
         */
        foreach ($programdela->getPonovitvePremiere() as $ep) {
            $uprizoritev = $ep->getUprizoritev();
            $stPonovitev = $ep->getPonoviDoma() + $ep->getPonoviKopr() + $ep->getPonoviGost();
            foreach ($uprizoritev->getStroski() as $strosek) {
                switch ($strosek->getTipstroska()) {
                    case 'materialni':
                        $skupina    = (string) $strosek->getVrstaStroska()->getSkupina();
                        $podskupina = (string) $strosek->getVrstaStroska()->getPodskupina();

                        // ponovitve premier
                        $vrednost = $strosek->getVrednostNa() * $stPonovitev;
                        $data[$skupina . ".0"]['vrednost']['ponovitvePremier']+=$vrednost;          //glava
                        $data[$skupina . "." . $podskupina]['vrednost']['ponovitvePremier']+=$vrednost;
                        $data["Skupaj"]['vrednost']['ponovitvePremier'] +=$vrednost;

                        // zamejstvo
                        $vrednost = $strosek->getVrednostNa() * $ep->getPonoviZamejo();
                        $data[$skupina . ".0"]['vrednost']['gostovanjaZamejstvo']+=$vrednost;          //glava
                        $data[$skupina . "." . $podskupina]['vrednost']['gostovanjaZamejstvo']+=$vrednost;
                        $data["Skupaj"]['vrednost']['gostovanjaZamejstvo'] +=$vrednost;
                        break;
                    case 'avtorprav':
                        /**
                         * tantieme
                         */
                        // ponovitve premier
                        $vrednost = $strosek->getVrednostNa() * $stPonovitev;
                        $data["T.0"]['vrednost']['ponovitvePremier']+=$vrednost;      //glava
                        $data["T.2"]['vrednost']['ponovitvePremier']+=$vrednost;
                        $data["Skupaj"]['vrednost']['ponovitvePremier'] +=$vrednost;

                        // zamejstvo
                        $vrednost = $strosek->getVrednostNa() * $ep->getPonoviZamejo();
                        $data["T.0"]['vrednost']['gostovanjaZamejstvo']+=$vrednost;      //glava
                        $data["T.2"]['vrednost']['gostovanjaZamejstvo']+=$vrednost;
                        $data["Skupaj"]['vrednost']['gostovanjaZamejstvo'] +=$vrednost;
                        break;
                }
            }
            $honorarji = $this->sestejHonorarje($uprizoritev, $programdela);

            // ponovitve premier
            $vrednost = $honorarji['Na'] * $stPonovitev;
            $data["H.0"]['vrednost']['ponovitvePremier']+=$vrednost;      //glava
            $data["H.1"]['vrednost']['ponovitvePremier']+=$vrednost;
            $data["Skupaj"]['vrednost'] ['ponovitvePremier']+=$vrednost;

            // zamejstvo
            $vrednost = $honorarji['Na'] * $ep->getPonoviZamejo();
            $data["H.0"]['vrednost']['gostovanjaZamejstvo']+=$vrednost;      //glava
            $data["H.1"]['vrednost']['gostovanjaZamejstvo']+=$vrednost;
            $data["Skupaj"]['vrednost']['gostovanjaZamejstvo'] +=$vrednost;
        }

        /**
         * ponovitve prejšnjih
         */
        foreach ($programdela->getPonovitvePrejsnjih() as $ep) {
            $uprizoritev = $ep->getUprizoritev();
            $stPonovitev = $ep->getPonoviDoma() + $ep->getPonoviKopr() + $ep->getPonoviGost();
            foreach ($uprizoritev->getStroski() as $strosek) {
                switch ($strosek->getTipstroska()) {
                    case 'materialni':
                        $skupina    = (string) $strosek->getVrstaStroska()->getSkupina();
                        $podskupina = (string) $strosek->getVrstaStroska()->getPodskupina();

                        // ponovitve prejšnjih
                        $vrednost = $strosek->getVrednostNa() * $stPonovitev;
                        $data[$skupina . ".0"]['vrednost']['ponovitvePrejsnjih']+=$vrednost;          //glava
                        $data[$skupina . "." . $podskupina]['vrednost']['ponovitvePrejsnjih']+=$vrednost;
                        $data["Skupaj"]['vrednost']['ponovitvePrejsnjih'] +=$vrednost;

                        // zamejstvo
                        $vrednost = $strosek->getVrednostNa() * $ep->getPonoviZamejo();
                        $data[$skupina . ".0"]['vrednost']['gostovanjaZamejstvo']+=$vrednost;          //glava
                        $data[$skupina . "." . $podskupina]['vrednost']['gostovanjaZamejstvo']+=$vrednost;
                        $data["Skupaj"]['vrednost']['gostovanjaZamejstvo'] +=$vrednost;
                        break;
                    case 'avtorprav':
                        /**
                         * tantieme
                         */
                        // ponovitve prejšnjih
                        $vrednost = $strosek->getVrednostNa() * $stPonovitev;
                        $data["T.0"]['vrednost']['ponovitvePrejsnjih']+=$vrednost;      //glava
                        $data["T.2"]['vrednost']['ponovitvePrejsnjih']+=$vrednost;
                        $data["Skupaj"]['vrednost']['ponovitvePrejsnjih'] +=$vrednost;

                        // zamejstvo
                        $vrednost = $strosek->getVrednostNa() * $ep->getPonoviZamejo();
                        $data["T.0"]['vrednost']['gostovanjaZamejstvo']+=$vrednost;      //glava
                        $data["T.2"]['vrednost']['gostovanjaZamejstvo']+=$vrednost;
                        $data["Skupaj"]['vrednost']['gostovanjaZamejstvo'] +=$vrednost;
                        break;
                }
            }
            $honorarji = $this->sestejHonorarje($uprizoritev, $programdela);

            // ponovitve prejšnjih
            $vrednost = $honorarji['Na'] * $stPonovitev;
            $data["H.0"]['vrednost']['ponovitvePrejsnjih']+=$vrednost;      //glava
            $data["H.1"]['vrednost']['ponovitvePrejsnjih']+=$vrednost;
            $data["Skupaj"]['vrednost']['ponovitvePrejsnjih']+=$vrednost;

            // zamejstvo
            $vrednost = $honorarji['Na'] * $ep->getPonoviZamejo();
            $data["H.0"]['vrednost']['gostovanjaZamejstvo']+=$vrednost;      //glava
            $data["H.1"]['vrednost']['gostovanjaZamejstvo']+=$vrednost;
            $data["Skupaj"]['vrednost']['gostovanjaZamejstvo'] +=$vrednost;
        }
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
