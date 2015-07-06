<?php

/*
 *  Licenca GPLv3
 */

namespace ProgramDela\Rpc;

use Zend\View\Model\JsonModel;

/**
 * Description of EnotaProgramaRpcService
 *
 * @author rado
 */
class EnotaProgramaRpcService
        extends \Max\Service\AbstractMaxService
{

    /**
     * Kreiranje nove koprodukcije za lastno gledališče za določeno enoto programa
     * 
     * 
     * @param string $enotaProgramaId
     * 
     * @returns koprodukcija id 
     */
    public function novaMaticnaKoprodukcija($enotaProgramaId)
    {
        // preverjanje avtorizacije
        $this->expectPermission("ProdukcijaDelitev-write");
        $this->expectPermission("EnotaPrograma-read");
        $this->expectPermission("Option-read");
        $this->expectPermission("Alternacija-read");

        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");
        $tr = $this->getServiceLocator()->get('translator');

        $enotaProgramaId = $em->getRepository("ProgramDela\Entity\EnotaPrograma")
                ->findOneById($enotaProgramaId);

        if (!$enotaProgramaId) {
            throw new \Max\Exception\UnauthException($tr->translate('Ni enote programa'), 1000941);
        }

        $optionR = $em->getRepository('App\Entity\Option');
        $option  = $optionR->findOneByName("application.tenant.maticnopodjetje");
        $sifra   = $option->getDefaultValue();      // šifra matičnega podjetja t.j. lastnega gledališča

        $phisaR = $em->getRepository('ProgramDela\Entity\ProdukcijskaHisa');
        $phisa  = $phisaR->findOneBySifra($sifra);       // lastno gledališče
        // seštejemo vrednosti iz stroškom uprizoritve

        $matkoprColl = $enotaProgramaId->getKoprodukcije()
                ->filter(function($ent) use (&$sifra) {
            return $ent->getKoproducent()->getSifra() === $sifra;     //vrne  koprodukcijo lastnega gledališča
        });

        if ($matkoprColl->count() > 1) {
            throw new \Max\Exception\UnauthException($tr->translate('Obstaja več koprodukcij (' . $matkoprColl->count() . ') lastega gledališča '), 1000942);
        }

        // če koprodukcija še ne obstaja, jo kreiramo
        if ($matkoprColl->isEmpty()) {
            $kopr = new \ProgramDela\Entity\ProdukcijaDelitev();
            $kopr->setKoproducent($phisa);
            $kopr->setEnotaPrograma($enotaProgramaId);
            $em->persist($kopr);
        } else {
            $kopr = $matkoprColl->get(0);
        }

        $kopr->setOdstotekFinanciranja(100);
        $kopr->validate();

        // sedaj, ko imamo entitete ponovimo preverjanje avtorizacije zaradi morebitnega assert preverjanja!
        $this->expectPermission("ProdukcijaDelitev-write", $kopr);
        $this->expectPermission("EnotaPrograma-read", $enotaProgramaId);
        $this->expectPermission("Funkcija-read", $funkcija);
        $this->expectPermission("ProdukcijskaHisa-read", $phisa);

        $em->flush();

        return $kopr->getId();
    }

    /**
     * pridobitev podatkov o uprizoritvi, ki se uporabljajo v programu dela
     * 
     * Podatke, ki jih pridobi ta procedura lahko uporabnik po želji prenese v enoto programa - 
     * npr. v program premiera, program ponovitve premiere ipd.
     * 
     * @param string $uprizoritevId
     * 
     * @returns koprodukcija id 
     */
    public function podatkiUprizoritve($uprizoritevId)
    {
        // preverjanje avtorizacije
        $this->expectPermission("Uprizoritev-read");
        $this->expectPermission("StrosekUprizoritve-read");
        $this->expectPermission("Funkcija-read");
        $this->expectPermission("TipFunkcije-read");
        $this->expectPermission("ProdukcijskaHisa-read");
        $this->expectPermission("Oseba-read");
        $this->expectPermission("Pogodba-read");

        $data = $this->initData();

        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");
        $tr = $this->getServiceLocator()->get('translator');

        $uprizoritev = $em->getRepository("Produkcija\Entity\Uprizoritev")
                ->findOneById($uprizoritevId);
        $this->expectPermission("Uprizoritev-read", $uprizoritev);

        if (!$uprizoritev) {
            throw new \Max\Exception\UnauthException($tr->translate('Ni uprizoritve'), 1000950);
        }
        $data['naziv'] = $uprizoritev->getNaslov();


        /**
         * seštejem stroške iz Stroškov uprizoritve
         */
        $vrMatDoSum = $vrMatNaSum = 0; //init
        foreach ($uprizoritev->getStroski() as $numObject => $strosekU) {
            $this->expectPermission("StrosekUprizoritve-read", $strosekU);
            switch ($strosekU->getTipstroska()) {
                case 'materialni':
                    $vrMatDoSum+=$strosekU->getVrednostDo();
                    $vrMatNaSum+=$strosekU->getVrednostNa();
                    break;
                case 'tantiema':
                    $data['Do']['tantieme']+=$strosekU->getVrednostDo();
                    $data['Na']['tantieme']+=$strosekU->getVrednostNa();
                    break;
                default:
                    $this->expect(false
                            , "Tip stroška uprizoritve je lahko le materialni ali tantiema, je pa:" . $strosekU->getTipstroska(), 1000951);
            }
        }

        /**
         * seštejem stroške iz pogodb 
         */
        foreach ($uprizoritev->getFunkcije() as $numFun => $funkcija) {
            $this->expectPermission("Funkcija-read", $funkcija);
            $tipfunkcije = $funkcija->getTipFunkcije();
            if ($tipfunkcije) {
                $this->expectPermission("TipFunkcije-read", $tipfunkcije);
                $podrocje = $tipfunkcije->getPodrocje();
            };
            foreach ($funkcija->getAlternacije() as $numAlt => $alternacija) {
                $this->expectPermission("Alternacija-read", $alternacija);
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
                        "sort" => $alternacija->getSort()]);
                }
                if ($alternacija->getImaPogodbo()) {
                    $data['stHonorarnih'] += 1;
                    if ($podrocje == "igralec") {
                        $data['stHonorarnihIgr'] += 1;
                    }
                    $pogodba = $alternacija->getPogodba();
                    if ($pogodba) {
                        $this->expectPermission("Pogodba-read", $pogodba);
                        if ($pogodba->getAktivna()) {
                                    //$$ tu obstaja možnost, da bo honorarje 2x štel, če bo ista pogodba na več alternacijah
                            $data['Do']['avtorskiHonorarji'] += $pogodba->getVrednostDoPremiere();
                            $data['Na']['avtorskiHonorarji'] += $pogodba->getVrednostPredstave();
                            if ($pogodba->getZaposlenVDrJz()) {
                                $data['stHonorarnihIgrTujJZ'] += 1;
                            }
                        }
                    }
                }
            }
        }
        $data['Do']['nasDelez'] = $data['Do']['avtorskiHonorarji'] + $data['Do']['tantieme'] + $vrMatDoSum;
        $data['Na']['nasDelez'] = $data['Na']['avtorskiHonorarji'] + $data['Na']['tantieme'] + $vrMatNaSum;
//$$ še naziv , izpostavljene funkcije ...
//        upr.naslov naziv Naslov upr. 
//        
//        funkcija: (naziv fje, oseba)  funkcija.naziv, alternacija.oseba.  ime, priimek
//        alternacija.pomembna: 
//        
//        

        $em->flush();

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
            'avtorskiHonorarji' => 0,
            'nasDelez'          => 0,
            'tantieme'          => 0,
        ];
        $data['naziv']                = $polje;
        $data['Funkcije']             = [];
        $data['Do']                   = $polje;
        $data['Na']                   = $polje;
        $data['stZaposDrug']             = 0;
        $data['stHonorarnih']         = 0;
        $data['stHonorarnihIgr']      = 0;
        $data['stHonorarnihIgrTujJZ'] = 0;
        $data['stZaposUmet']         = 0;
        return $data;
    }

}
