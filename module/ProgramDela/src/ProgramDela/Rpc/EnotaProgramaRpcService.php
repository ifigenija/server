<?php

/*
 *  Licenca GPLv3
 */

namespace ProgramDela\Rpc;



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
     * @return koprodukcija id
     * @throws \Max\Exception\UnauthException
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

        /**
         * kreiranje imamo v posebnem servisu, tako, da ga lahko kličemo direktno iz PHP-ja na strežniški strani
         */
        $service = $this->serviceLocator->get('enotaprograma.service');
        $koprId    = $service->novaMaticnaKoprodukcija($enotaPrograma);

        $em->flush();

        return $koprId;
    }

    /**
     * pridobitev podatkov o uprizoritvi, ki se uporabljajo v programu dela
     *
     * Podatke, ki jih pridobi ta procedura lahko uporabnik po želji prenese v enoto programa -
     * npr. v program premiera, program ponovitve premiere ipd.
     *
     * @param string $uprizoritevId
     * @param string $zacetek začetek programa dela v ISO8601 obliki, npr. "1970-01-01T01:00:00+01:00"
     * @param string $konec konec programa dela v ISO8601 obliki, npr. "2999-01-01T01:00:00+01:00"
     * @return data strukturirani podatki uprizoritve
     * @throws \Max\Exception\UnauthException
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
