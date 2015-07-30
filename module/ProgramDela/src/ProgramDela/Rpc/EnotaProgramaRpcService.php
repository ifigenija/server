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
        $this->expectPermission("ProdukcijskaHisa-read");
        $this->expectPermission("Option-read");

        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");
        $tr = $this->getServiceLocator()->get('translator');

        $enotaPrograma = $em->getRepository("ProgramDela\Entity\EnotaPrograma")
                ->findOneById($enotaProgramaId);

        if (!$enotaPrograma) {
            throw new \Max\Exception\UnauthException($tr->translate('Ni enote programa'), 1000941);
        }

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

        if ($matkoprColl->count() > 1) {
            throw new \Max\Exception\UnauthException($tr->translate('Obstaja več koprodukcij (' . $matkoprColl->count() . ') lastnega gledališča '), 1000942);
        }

        // če koprodukcija še ne obstaja, jo kreiramo
        if ($matkoprColl->isEmpty()) {
            $kopr = new \ProgramDela\Entity\ProdukcijaDelitev();
            $kopr->setKoproducent($phisa);
            $kopr->setEnotaPrograma($enotaPrograma);
            $em->persist($kopr);
        } else {
            $kopr = $matkoprColl->get(0);
        }

        $kopr->setOdstotekFinanciranja(100);
        $kopr->setMaticniKop(true);

        $kopr->preracunaj();
        $kopr->validate();

        // sedaj, ko imamo entitete ponovimo preverjanje avtorizacije zaradi morebitnega assert preverjanja!
        $this->expectPermission("ProdukcijaDelitev-write", $kopr);
        $this->expectPermission("EnotaPrograma-read", $enotaPrograma);
        $this->expectPermission("ProdukcijskaHisa-read", $phisa);
        $this->expectPermission("Option-read", $option);

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
     * @param string $zacetek       začetek programa dela v ISO8601 obliki, npr. "1970-01-01T01:00:00+01:00"
     * @param string $konec         konec programa dela v ISO8601 obliki, npr. "2999-01-01T01:00:00+01:00"
     * 
     * @returns data                strukturirani podatki uprizoritve 
     */
    public function podatkiUprizoritve($uprizoritevId, $zacetek = \Max\Consts::MINISODATE, $konec = \Max\Consts::MAXISODATE)
    {

        // preverjanje avtorizacije
        $this->expectPermission("Uprizoritev-read");
        $this->expectPermission("StrosekUprizoritve-read");
        $this->expectPermission("Funkcija-read");
        $this->expectPermission("TipFunkcije-read");
        $this->expectPermission("ProdukcijskaHisa-read");
        $this->expectPermission("Oseba-read");
        $this->expectPermission("Pogodba-read");

        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");
        $tr = $this->getServiceLocator()->get('translator');

        $this->expectUUID($uprizoritevId, $this->translate('Pričakujem ID uprizoritve'), 1000971);
        $this->expectIsoDate($zacetek, $this->translate('Začetek (' . $zacetek . ') ni datum v ISO8601 obliki'), 1000972);
        $this->expectIsoDate($konec, $this->translate('Konec (' . $konec . ') ni datum v ISO8601 obliki'), 1000973);

        $uprizoritev = $em->getRepository("Produkcija\Entity\Uprizoritev")
                ->findOneById($uprizoritevId);
        $this->expectPermission("Uprizoritev-read", $uprizoritev);

        if (!$uprizoritev) {
            throw new \Max\Exception\UnauthException($tr->translate('Ni uprizoritve'), 1000970);
        }

        /**
         * preračun imamo v posebnem servisu, tako, da ga lahko kličemo direktno iz PHP-ja na strežniški strani
         */
        $service = $this->serviceLocator->get('enotaprograma.service');
        $data    = $service->podatkiUprizoritve($uprizoritev, $zacetek, $konec);

        $em->flush();

        return $data;
    }

}
