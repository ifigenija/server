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
     * @returns data                strukturirani podatki priloge C2
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
                if ($strosek->getTipStroska() === 'materialni') {
                    $skupina    = (string) $strosek->getVrstaStroska()->getSkupina();
                    $podskupina = (string) $strosek->getVrstaStroska()->getPodskupina();
                    $vrednost   = $strosek->getVrednostDo();
                    $data['premiere'][$skupina . ".0"]['vrednost']+=$vrednost;      //glava
                    $data['premiere'][$skupina . "." . $podskupina]['vrednost']+=$vrednost;
                }
            }
        }

        /**
         * ponovitve premier
         */
        foreach ($programdela->getPonovitvePremiere() as $ep) {
            $uprizoritev = $ep->getUprizoritev();
            foreach ($uprizoritev->getStroski() as $strosek) {
                if ($strosek->getTipStroska() === 'materialni') {
                    $skupina    = (string) $strosek->getVrstaStroska()->getSkupina();
                    $podskupina = (string) $strosek->getVrstaStroska()->getPodskupina();
                    $vrednost   = $strosek->getVrednostNa() *
                            ($ep->getPonoviDoma() + $ep->getPonoviKopr() + $ep->getPonoviZamejo() + $ep->getPonoviGost());
                    $data['ponovitvePremier'][$skupina . ".0"]['vrednost']+=$vrednost;          //glava
                    $data['ponovitvePremier'][$skupina . "." . $podskupina]['vrednost']+=$vrednost;
                }
            }
        }

        /**
         * ponovitve prejšnjih
         */
        foreach ($programdela->getPonovitvePrejsnjih() as $ep) {
            $uprizoritev = $ep->getUprizoritev();
            foreach ($uprizoritev->getStroski() as $strosek) {
                if ($strosek->getTipStroska() === 'materialni') {
                    $skupina    = (string) $strosek->getVrstaStroska()->getSkupina();
                    $podskupina = (string) $strosek->getVrstaStroska()->getPodskupina();
                    $vrednost   = $strosek->getVrednostNa() *
                            ($ep->getPonoviDoma() + $ep->getPonoviKopr() + $ep->getPonoviZamejo() + $ep->getPonoviGost());
                    $data['ponovitvePrejsnjih'][$skupina . ".0"]['vrednost']+=$vrednost;            //glava
                    $data['ponovitvePrejsnjih'][$skupina . "." . $podskupina]['vrednost']+=$vrednost;
                }
            }
        }

        return $data;
    }

    /**
     * inicializira podatke
     * 
     * @param array $data
     */
    private function initDataC2()
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

        foreach ($stolpci as $stolpec) {
            $data[$stolpec] = $vrstice;
        }

        return $data;
    }

}
