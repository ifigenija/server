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
class EnotaProgramaService
        extends \Max\Service\AbstractMaxService
{

    /**
     * pridobitev podatkov o uprizoritvi, ki se uporabljajo v programu dela
     * 
     * Podatke, ki jih pridobi ta procedura lahko uporabnik po želji prenese v enoto programa - 
     * npr. v program premiera, program ponovitve premiere ipd.
     * 
     * @param entity  $uprizoritev
     * @param string $zacetek       začetek programa dela v ISO8601 obliki, npr. "1970-01-01T01:00:00+01:00"
     * @param string $konec         konec programa dela v ISO8601 obliki, npr. "2999-01-01T01:00:00+01:00"
     * 
     * @returns data                strukturirani podatki uprizoritve 
     */
    public function podatkiUprizoritve($uprizoritev, $zacetek = \Max\Consts::MINISODATE, $konec = \Max\Consts::MAXISODATE)
    {

        $data = $this->initData();

        $tr = $this->getServiceLocator()->get('translator');

        $data['naziv'] = $uprizoritev->getNaslov();

        /**
         * seštejem stroške iz Stroškov uprizoritve
         */
        $vrMatDoSum = $vrMatNaSum = 0; //init
        foreach ($uprizoritev->getStroski() as $numObject => $strosekU) {
            switch ($strosekU->getTipstroska()) {
                case 'materialni':
                    $vrMatDoSum+=$strosekU->getVrednostDo();
                    $vrMatNaSum+=$strosekU->getVrednostNa();
                    break;
                case 'tantiema':
                    $data['Do']['tantieme']+=$strosekU->getVrednostDo();
                    $data['Na']['tantieme']+=$strosekU->getVrednostNa();
                    break;
                case 'avtorprav':
                    $data['Do']['avtorskePravice']+=$strosekU->getVrednostDo();
                    $data['Na']['avtorskePravice']+=$strosekU->getVrednostNa();
                    break;
                default:
                    $this->expect(false
                            , "Tip stroška uprizoritve je lahko le materialni ali tantiema ali avtorprav, je pa:" . $strosekU->getTipstroska(), 1000951);
            }
        }

        /**
         * seštejem stroške iz pogodb 
         */
        foreach ($uprizoritev->getFunkcije() as $numFun => $funkcija) {
            $tipfunkcije = $funkcija->getTipFunkcije();
            if ($tipfunkcije) {
                $podrocje = $tipfunkcije->getPodrocje();
            };
            foreach ($funkcija->getAlternacije() as $numAlt => $alternacija) {
                /**
                 * upoštevamo le tiste alternacije, ki se vsaj delno prekrivajo z intervalom začetka in konca programa dela 
                 */
                $az = is_null($alternacija->getZacetek()) ? null : $alternacija->getZacetek()->format('c');
                $ak = is_null($alternacija->getKonec()) ? null : $alternacija->getKonec()->format('c');

                /**
                 * $začasno:
                 */
                $sifra = $alternacija->getSifra();
                $baz   = $az <= $konec;
                $bak   = $ak >= $zacetek;

                if ((!is_null($az) ? $az <= $konec : true ) && (!is_null($ak) ? $ak >= $zacetek : true )) {
                    if ($alternacija->getZaposlen()) {
                        if (in_array($podrocje, ["igralec", "umetnik"])) {
                            $data['stZaposUmet'] += 1;
                        } else {
                            $data['stZaposDrug'] += 1;
                        }
                    }
                    if ($alternacija->getPomembna()) {
                        $oseba = $alternacija->getOseba();
                        $this->expect($oseba, "Ni osebe pri alternaciji " . $alternacija->getSifra(), 1000952);
                        array_push($data['Funkcije'], ["funkcija" => $funkcija->getNaziv(),
                            "ime"      => $oseba->getIme(), "priimek"  => $oseba->getPriimek(),
                            "sort"     => $alternacija->getSort()]);
                    }
                    if ($alternacija->getImaPogodbo()) {
                        $data['stHonorarnih'] += 1;
                        $pogodba = $alternacija->getPogodba();
                        if ($pogodba) {
                            if ($pogodba->getAktivna()) {
                                //$$ tu obstaja možnost, da bo honorarje 2x štel, če bo ista pogodba na več alternacijah
                                $data['Do']['avtorskiHonorarji'] += $pogodba->getVrednostDoPremiere();
                                $data['Na']['avtorskiHonorarji'] += $pogodba->getVrednostPredstave();
                                if ($pogodba->getIgralec()) {
                                    $data['stHonorarnihIgr'] += 1;      //$$
                                    if ($pogodba->getZaposlenVDrJz()) {
                                        $data['stHonorarnihIgrTujJZ'] += 1;
                                    }
                                    if ($pogodba->getSamozaposlen()) {
                                        $data['stHonorarnihIgrSamoz'] += 1;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        $data['Do']['nasDelez']  = $data['Do']['avtorskiHonorarji'] + $data['Do']['tantieme'] + $data['Do']['avtorskePravice'] + $vrMatDoSum;
        $data['Na']['nasDelez']  = $data['Na']['avtorskiHonorarji'] + $data['Na']['tantieme'] + $data['Na']['avtorskePravice'] + $vrMatNaSum;
        $data['datumZacStudija'] = $uprizoritev->getDatumZacStudija()->format('c');       // datum v ISO8601 obliki 
        $data['datumPremiere']   = $uprizoritev->getDatumPremiere()->format('c');       // datum v ISO8601 obliki 
//$$ še naziv , izpostavljene funkcije ...
//        upr.naslov naziv Naslov upr. 
//        
//        funkcija: (naziv fje, oseba)  funkcija.naziv, alternacija.oseba.  ime, priimek
//        alternacija.pomembna: 
//        
//        
        return $data;
    }

    /**
     * inicializira podatke
     * 
     * @param array $data
     */
    private function initData()
    {
        $polje                        = [
            'nasDelez'          => 0,
            'avtorskiHonorarji' => 0,
            'tantieme'          => 0,
            'avtorskePravice'   => 0,
        ];
        $data['naziv']                = '';
        $data['Funkcije']             = [];
        $data['Do']                   = $polje;
        $data['Na']                   = $polje;
        $data['stZaposDrug']          = 0;
        $data['stHonorarnih']         = 0;
        $data['stHonorarnihIgr']      = 0;
        $data['stHonorarnihIgrTujJZ'] = 0;
        $data['stHonorarnihIgrSamoz'] = 0;
        $data['stZaposUmet']          = 0;
        return $data;
    }

}
