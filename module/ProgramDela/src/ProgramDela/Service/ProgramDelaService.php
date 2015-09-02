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
            foreach ($uprizoritev->getStroski() as $strosek) {
                switch ($strosek->getTipstroska()) {
                    case 'materialni':
                        $skupina    = (string) $strosek->getVrstaStroska()->getSkupina();
                        $podskupina = (string) $strosek->getVrstaStroska()->getPodskupina();
                        $vrednost   = $strosek->getVrednostDo();
                        $data['premiere'][$skupina . ".0"]['vrednost']+=$vrednost;      //glava
                        $data['premiere'][$skupina . "." . $podskupina]['vrednost']+=$vrednost;
                        $data['premiere']["Skupaj"]['vrednost'] +=$vrednost;
                        break;
                    case 'avtorprav':
                        /**
                         * avtorske pravice
                         */
                        $vrednost   = $strosek->getVrednostDo();
                        $data['premiere']["T.0"]['vrednost']+=$vrednost;      //glava
                        $data['premiere']["T.1"]['vrednost']+=$vrednost;
                        $data['premiere']["Skupaj"]['vrednost'] +=$vrednost;
                        /**
                         * tantieme
                         */
                        $vrednost   = $strosek->getVrednostNa();
                        $data['premiere']["T.0"]['vrednost']+=$vrednost;      //glava
                        $data['premiere']["T.2"]['vrednost']+=$vrednost;
                        $data['premiere']["Skupaj"]['vrednost'] +=$vrednost;
                        break;
                }
            }
            $honorarji = $this->sestejHonorarje($uprizoritev, $programdela);
            $vrednost  = $honorarji['Do'] + 1 * $honorarji['Na'];
            $data['premiere']["H.0"]['vrednost']+=$vrednost;      //glava
            $data['premiere']["H.1"]['vrednost']+=$vrednost;
            $data['premiere']["Skupaj"]['vrednost'] +=$vrednost;
        }

        /**
         * ponovitve premier
         */
        foreach ($programdela->getPonovitvePremiere() as $ep) {
            $uprizoritev = $ep->getUprizoritev();
            $stPonovitev = $ep->getPonoviDoma() + $ep->getPonoviKopr() + $ep->getPonoviZamejo() + $ep->getPonoviGost();
            foreach ($uprizoritev->getStroski() as $strosek) {
                switch ($strosek->getTipstroska()) {
                    case 'materialni':
                        $skupina    = (string) $strosek->getVrstaStroska()->getSkupina();
                        $podskupina = (string) $strosek->getVrstaStroska()->getPodskupina();
                        $vrednost   = $strosek->getVrednostNa() * $stPonovitev;
                        $data['ponovitvePremier'][$skupina . ".0"]['vrednost']+=$vrednost;          //glava
                        $data['ponovitvePremier'][$skupina . "." . $podskupina]['vrednost']+=$vrednost;
                        $data['ponovitvePremier']["Skupaj"]['vrednost'] +=$vrednost;
                        break;
                    case 'avtorprav':
                        /**
                         * tantieme
                         */
                        $vrednost   = $strosek->getVrednostNa() * $stPonovitev;
                        $data['ponovitvePremier']["T.0"]['vrednost']+=$vrednost;      //glava
                        $data['ponovitvePremier']["T.2"]['vrednost']+=$vrednost;
                        $data['ponovitvePremier']["Skupaj"]['vrednost'] +=$vrednost;
                        break;
                }
            }
            $honorarji = $this->sestejHonorarje($uprizoritev, $programdela);
            $vrednost  = $honorarji['Na'] * $stPonovitev;
            $data['ponovitvePremier']["H.0"]['vrednost']+=$vrednost;      //glava
            $data['ponovitvePremier']["H.1"]['vrednost']+=$vrednost;
            $data['ponovitvePremier']["Skupaj"]['vrednost'] +=$vrednost;
        }

        /**
         * ponovitve prejšnjih
         */
        foreach ($programdela->getPonovitvePrejsnjih() as $ep) {
            $uprizoritev = $ep->getUprizoritev();
            $stPonovitev = $ep->getPonoviDoma() + $ep->getPonoviKopr() + $ep->getPonoviZamejo() + $ep->getPonoviGost();
            foreach ($uprizoritev->getStroski() as $strosek) {
                switch ($strosek->getTipstroska()) {
                    case 'materialni':
                        $skupina    = (string) $strosek->getVrstaStroska()->getSkupina();
                        $podskupina = (string) $strosek->getVrstaStroska()->getPodskupina();
                        $vrednost   = $strosek->getVrednostNa() * $stPonovitev;
                        $data['ponovitvePrejsnjih'][$skupina . ".0"]['vrednost']+=$vrednost;          //glava
                        $data['ponovitvePrejsnjih'][$skupina . "." . $podskupina]['vrednost']+=$vrednost;
                        $data['ponovitvePrejsnjih']["Skupaj"]['vrednost'] +=$vrednost;
                        break;
                    case 'avtorprav':
                        /**
                         * tantieme
                         */
                        $vrednost   = $strosek->getVrednostNa() * $stPonovitev;
                        $data['ponovitvePrejsnjih']["T.0"]['vrednost']+=$vrednost;      //glava
                        $data['ponovitvePrejsnjih']["T.2"]['vrednost']+=$vrednost;
                        $data['ponovitvePrejsnjih']["Skupaj"]['vrednost'] +=$vrednost;
                        break;
                }
            }
            $honorarji = $this->sestejHonorarje($uprizoritev, $programdela);
            $vrednost  = $honorarji['Na'] * $stPonovitev;
            $data['ponovitvePrejsnjih']["H.0"]['vrednost']+=$vrednost;      //glava
            $data['ponovitvePrejsnjih']["H.1"]['vrednost']+=$vrednost;
            $data['ponovitvePrejsnjih']["Skupaj"]['vrednost'] +=$vrednost;
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
            'premiere',
            'ponovitvePremier',
            'ponovitvePrejsnjih',
                /**
                 * nimajo uprizoritve ali ustreznih podatkov v njej
                 */
//            'mednarodnaGostovanja',
//            'gostovanjaZamejstvo',
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
            $vrstice[$skupina . "." . $podskupina] = ['nazivStr' => $vrstaStroska->getNaziv(), 'vrednost' => 0];
        }
        $vrstice["H.0"]    = ['nazivStr' => "AVTORSKI HONORARJI", 'vrednost' => 0];
        $vrstice["H.1"]    = ['nazivStr' => "stroški avtorskih honorarjev", 'vrednost' => 0];
        $vrstice["T.0"]    = ['nazivStr' => "AVTORSKE PRAVICE", 'vrednost' => 0];
        $vrstice["T.1"]    = ['nazivStr' => "stroški odkupa avtorskih pravic", 'vrednost' => 0];
        $vrstice["T.2"]    = ['nazivStr' => "stroški tantiem", 'vrednost' => 0];
        $vrstice["Skupaj"] = ['nazivStr' => "Skupaj C.2", 'vrednost' => 0];

        foreach ($stolpci as $stolpec) {
            $data[$stolpec] = $vrstice;
        }

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

        $pdz= $programDela->getZacetek();
        $pdk   = $programDela->getKonec();

        foreach ($uprizoritev->getFunkcije() as $numFun => $funkcija) {
            foreach ($funkcija->getAlternacije() as $numAlt => $alternacija) {
                /**
                 * upoštevamo le tiste alternacije, ki se vsaj delno prekrivajo z intervalom začetka in konca programa dela 
                 */
                $az = is_null($alternacija->getZacetek()) ? null : $alternacija->getZacetek();
                $ak = is_null($alternacija->getKonec()) ? null : $alternacija->getKonec();
                
                if ((!is_null($az) ? $az <= $pdk: true ) && (!is_null($ak) ? $ak >= $pdz : true )) {
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
