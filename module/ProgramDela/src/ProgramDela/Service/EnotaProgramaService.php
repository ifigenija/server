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
     * Kreiranje nove koprodukcije za lastno gledališče za določeno enoto programa
     * 
     * 
     * @param entity $enotaPrograma
     * 
     * @returns koprodukcija id 
     */
    public function novaMaticnaKoprodukcija($enotaPrograma)
    {
        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");

        $optionR = $em->getRepository('App\Entity\Option');
        $option  = $optionR->findOneByName("application.tenant.maticnopodjetje");
        $sifra   = $option->getDefaultValue();      // šifra matičnega podjetja t.j. lastnega gledališča

        $phisaR = $em->getRepository('ProgramDela\Entity\ProdukcijskaHisa');
        $phisa  = $phisaR->findOneBySifra($sifra);       // lastno gledališče
        // seštejemo vrednosti iz stroškom uprizoritve

        $matkoprColl = $enotaPrograma->getKoprodukcije()
                ->filter(function($ent) use (&$sifra) {
            return $ent->getKoproducent()->getSifra() === $sifra;     //vrne  koprodukcijo lastnega gledališča
        });

        // če koprodukcija še ne obstaja, jo kreiramo
        if ($matkoprColl->isEmpty()) {
            $kopr = new \ProgramDela\Entity\ProdukcijaDelitev();
            $em->persist($kopr);
            $kopr->setKoproducent($phisa);
            $kopr->setEnotaPrograma($enotaPrograma);
            $kopr->setOdstotekFinanciranja(100);
            $kopr->setMaticniKop(true);
        } else {
            // če matična koprodukcija že obstaja, jo le preberemo
            $kopr = $matkoprColl->get(0);
        }

        $kopr->preracunaj();
        $kopr->validate();

        return $kopr->getId();
    }

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
        $data['Do']['materialni'] = $data['Na']['materialni'] = 0; //init
        foreach ($uprizoritev->getStroski() as $numObject => $strosekU) {
            switch ($strosekU->getTipstroska()) {
                case 'materialni':
                    $data['Do']['materialni']+=$strosekU->getVrednostDo();
                    $data['Na']['materialni']+=$strosekU->getVrednostNa();
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
                            , "Tip stroška uprizoritve je lahko le materialni ali tantiema ali avtorske pravice, je pa:" . $strosekU->getTipstroska(), 1000951);
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
                                        $data['Do']['avtorskiHonorarjiSamoz'] += $pogodba->getVrednostDoPremiere();
                                        $data['Na']['avtorskiHonorarjiSamoz'] += $pogodba->getVrednostPredstave();
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        $data['Do']['nasDelez'] = $data['Do']['avtorskiHonorarji'] + $data['Do']['tantieme'] + $data['Do']['avtorskePravice'] + $data['Do']['materialni'];

        $data['datumZacStudija'] = date(\DateTime::ISO8601, strtotime($uprizoritev->getDatumZacStudija()->format('c')));       // datum v ISO8601 obliki 
        $data['datumPremiere']   = date(\DateTime::ISO8601, strtotime($uprizoritev->getDatumPremiere()->format('c')));       // datum v ISO8601 obliki 
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
            'avtorskiHonorarji'      => 0,
            'avtorskiHonorarjiSamoz' => 0,
            'tantieme'               => 0,
            'avtorskePravice'        => 0,
            'materialni'             => 0,
        ];
        $data['naziv']                = '';
        $data['Funkcije']             = [];
        $data['Na']                   = $polje;
        $data['Do']                   = $polje;
        $data['Do']['nasDelez']       = 0;           // nasDelez na predstavo se izracunava na klientu
        $data['stZaposDrug']          = 0;
        $data['stHonorarnih']         = 0;
        $data['stHonorarnihIgr']      = 0;
        $data['stHonorarnihIgrTujJZ'] = 0;
        $data['stHonorarnihIgrSamoz'] = 0;
        $data['stZaposUmet']          = 0;
        return $data;
    }

}
