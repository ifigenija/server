<?php

/*
 *  Licenca GPLv3
 */

namespace ProgramDela\Rpc;



/**
 * Description of ProgramDelaRpcService
 *
 * @author rado
 */
class ProgramDelaRpcService
        extends \Max\Service\AbstractMaxService
{

    /**
     * 
     * Bližnjica do repozitorija 
     * 
     * @return \ProgramDela\Entity\ProgramDela objekt
     */
    private function getProgramDelaRep()
    {
        $rep = $this->getEm()->getRepository('ProgramDela\Entity\ProgramDela');
        $rep->setServiceLocator($this->getServiceLocator());
        return $rep;
    }

    /**
     * @param string $programDelaId
     * @return bool uspeh
     * @throws \Max\Exception\UnauthException
     */
    public function zakleni($programDelaId)
    {
        $this->expectUUID($programDelaId
                , $this->translate('Pričakujem ID programa dela')
                , 1000963);

        // preverjanje avtorizacije
        $this->expectPermission("ProgramDela-write");
        $this->expectPermission("ProgramDela-lock");

//        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");
        $tr = $this->getServiceLocator()->get('translator');

        $programDela = $this->getProgramDelaRep()->findOneById($programDelaId);

        if (!$programDela) {
            throw new \Max\Exception\UnauthException($tr->translate('Ni enote programa'), 1000961);
        }

        $programDela->setZakljuceno(true);           // tu nastavimo novo vrednost

        $programDela->validate();

        // sedaj, ko imamo entitete ponovimo preverjanje avtorizacije zaradi morebitnega assert preverjanja!
        $this->expectPermission("ProgramDela-write", $programDela);
        $this->expectPermission("ProgramDela-lock", $programDela);

        $this->getEm()->flush();

        return true;
    }

    /**
     * @param string $programDelaId
     * @return bool uspeh
     * @throws \Max\Exception\UnauthException
     */
    public function odkleni($programDelaId)
    {
        $this->expectUUID($programDelaId
                , $this->translate('Pričakujem ID programa dela')
                , 1000964);

        // preverjanje avtorizacije
        $this->expectPermission("ProgramDela-write");
        $this->expectPermission("ProgramDela-unlock");

//        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");
        $tr = $this->getServiceLocator()->get('translator');

        $programDela = $this->getProgramDelaRep()->findOneById($programDelaId);

        if (!$programDela) {
            throw new \Max\Exception\UnauthException($tr->translate('Ni enote programa'), 1000965);
        }

        $programDela->setZakljuceno(FALSE);           // tu nastavimo novo vrednost

        $programDela->validate();

        // sedaj, ko imamo entitete ponovimo preverjanje avtorizacije zaradi morebitnega assert preverjanja!
        $this->expectPermission("ProgramDela-write", $programDela);
        $this->expectPermission("ProgramDela-unlock", $programDela);

        $this->getEm()->flush();

        return true;
    }

    /**
     * Naredi klon programa dela. 
     * Če je kalkulacija zaključena/zaklenjena, potem 
     * naredimo nezaključek program dela, zgeneriramo 
     * novo začasno številko.
     * 
     * @param string $programDelaId
     * @return string id nove kalkulacije
     */
    public function kloniraj($programDelaId)
    {
        $this->expectUUID($programDelaId
                , $this->translate('Pričakujem ID programa dela')
                , 1000962);
        /**
         * preverjanje avtorizacije 
         */
        $this->expectPermission("ProgramDela-write");
        $this->expectPermission("ProgramDela-read");
        $this->expectPermission("ProgramPremiera-write");
        $this->expectPermission("ProgramPremiera-read");
        $this->expectPermission("ProgramPonovitevPremiere-write");
        $this->expectPermission("ProgramPonovitevPremiere-read");
        $this->expectPermission("ProgramPonovitevPrejsnjih-write");
        $this->expectPermission("ProgramPonovitevPrejsnjih-read");
        $this->expectPermission("ProgramGostujoca-write");
        $this->expectPermission("ProgramGostujoca-read");
        $this->expectPermission("ProgramGostovanje-write");
        $this->expectPermission("ProgramGostovanje-read");
        $this->expectPermission("ProgramFestival-write");
        $this->expectPermission("ProgramFestival-read");
        $this->expectPermission("ProgramIzjemni-write");
        $this->expectPermission("ProgramIzjemni-read");
        $this->expectPermission("ProgramRazno-write");
        $this->expectPermission("ProgramRazno-read");
        $this->expectPermission("ProdukcijaDelitev-write");
        $this->expectPermission("ProdukcijaDelitev-read");
        $this->expectPermission("DrugiVir-write");
        $this->expectPermission("DrugiVir-read");
        $this->expectPermission("ProgramskaEnotaSklopa-write");
        $this->expectPermission("ProgramskaEnotaSklopa-read");

        $programDela = $this->getProgramDelaRep()->findOneById($programDelaId);

        $this->expect($programDela
                , $this->translate('Programdela ne obstaja')
                , 520091);

        /**
         * naredim kopijo glave
         */
        $newPD = $programDela->copy();

        /**
         * pripravim prazne kolekcije za postavke 
         */
        $newPD
                ->setPremiere(new \Doctrine\Common\Collections\ArrayCollection())
                ->setPonovitvePremiere(new \Doctrine\Common\Collections\ArrayCollection())
                ->setPonovitvePrejsnjih(new \Doctrine\Common\Collections\ArrayCollection())
                ->setIzjemni(new \Doctrine\Common\Collections\ArrayCollection())
                ->setProgramiFestival(new \Doctrine\Common\Collections\ArrayCollection())
                ->setGostujoci(new \Doctrine\Common\Collections\ArrayCollection())
                ->setGostovanja(new \Doctrine\Common\Collections\ArrayCollection())
                ->setProgramiRazno(new \Doctrine\Common\Collections\ArrayCollection())
                ->setZakljuceno(FALSE);  // klon prog. dela ni zaključen  

        /**
         * nov program dela dobi novo šifro
         */
        $num = $this->getServiceLocator()->get('stevilcenje.generator');
        $newPD->setSifra($num->generate('programdela', new \DateTime()));

        $this->getEm()->persist($newPD);

        /**
         * kloniram Programe premiere in jih dodam na nov program dela
         */
        $coll = $programDela->getPremiere();
        foreach ($coll as $ep) {
            $newEP = $ep->copy();
            $newEP->setDokument($newPD);
            $newPD->getPremiere()->add($newEP);
            $this->klonirajDrugeVire($ep, $newEP);
            $this->klonirajKoprodukcije($ep, $newEP);

            $this->getEm()->persist($newEP);
            $newEP->preracunaj();
        }

        /**
         * kloniram Programe ponovitev premier in jih dodam na nov program dela
         */
        $coll = $programDela->getPonovitvePremiere();
        foreach ($coll as $ep) {
            $newEP = $ep->copy();
            $newEP->setDokument($newPD);
            $newPD->getPonovitvePremiere()->add($newEP);
            $this->klonirajDrugeVire($ep, $newEP);
            $this->klonirajKoprodukcije($ep, $newEP);

            $this->getEm()->persist($newEP);
            $newEP->preracunaj();
        }

        /**
         * kloniram Programe ponovitev prejšnjih in jih dodam na nov program dela
         */
        $coll = $programDela->getPonovitvePrejsnjih();
        foreach ($coll as $ep) {
            $newEP = $ep->copy();
            $newEP->setDokument($newPD);
            $newPD->getPonovitvePrejsnjih()->add($newEP);
            $this->klonirajDrugeVire($ep, $newEP);
            $this->klonirajKoprodukcije($ep, $newEP);

            $this->getEm()->persist($newEP);
            $newEP->preracunaj();
        }

        /**
         * kloniram Programe gostujočih in jih dodam na nov program dela
         */
        $coll = $programDela->getGostujoci();
        foreach ($coll as $ep) {
            $newEP = $ep->copy();
            $newEP->setDokument($newPD);
            $newPD->getGostujoci()->add($newEP);
            $this->klonirajDrugeVire($ep, $newEP);
            $this->klonirajKoprodukcije($ep, $newEP);

            $this->getEm()->persist($newEP);
            $newEP->preracunaj();
        }

        /**
         * kloniram Programe gostovanj in jih dodam na nov program dela
         */
        $coll = $programDela->getGostovanja();
        foreach ($coll as $ep) {
            $newEP = $ep->copy();
            $newEP->setDokument($newPD);
            $newPD->getGostovanja()->add($newEP);
            $this->klonirajDrugeVire($ep, $newEP);
            $this->klonirajKoprodukcije($ep, $newEP);

            $this->getEm()->persist($newEP);
            $newEP->preracunaj();
        }

        /**
         * kloniram Programe Festivali in jih dodam na nov program dela
         */
        $coll = $programDela->getProgramiFestival();
        foreach ($coll as $ep) {
            $newEP = $ep->copy();
            $newEP->setProgramDela($newPD);
            $newPD->getProgramiFestival()->add($newEP);
            $this->klonirajDrugeVire($ep, $newEP);
            $this->klonirajKoprodukcije($ep, $newEP);

            $this->getEm()->persist($newEP);
            $newEP->preracunaj();
        }

        /**
         * kloniram Programe izjemnih in jih dodam na nov program dela
         */
        $coll = $programDela->getIzjemni();
        foreach ($coll as $ep) {
            $newEP = $ep->copy();
            $newEP->setDokument($newPD);
            $newPD->getIzjemni()->add($newEP);
            $this->klonirajDrugeVire($ep, $newEP);
            $this->klonirajKoprodukcije($ep, $newEP);

            $this->getEm()->persist($newEP);
            $newEP->preracunaj();
        }

        /**
         * kloniram Programe razno in jih dodam na nov program dela
         */
        $coll = $programDela->getProgramiRazno();
        foreach ($coll as $ep) {
            $newEP = $ep->copy();
            $newEP->setDokument($newPD);
            $newPD->getProgramiRazno()->add($newEP);
            $this->klonirajDrugeVire($ep, $newEP);
            $this->klonirajKoprodukcije($ep, $newEP);
            $this->klonirajPESklopa($ep, $newEP);       // posebnost pri programi razno

            $this->getEm()->persist($newEP);
            $newEP->preracunaj();
        }

        $newPD->preracunaj();
        $newPD->validate();

        $this->getEm()->flush();
        return $newPD->getId();
    }

    /**
     * Klonira druge vire pod enoto programa
     * 
     * @param type $ep      stara enota programa
     * @param type $newEP   nova enota programa
     */
    private function klonirajDrugeVire($ep, $newEP)
    {
        $newEP->setDrugiViri(new \Doctrine\Common\Collections\ArrayCollection());
        $collDV = $ep->getDrugiViri();
        foreach ($collDV as $dv) {
            $newDV = $dv->copy();
            $newDV->setEnotaPrograma($newEP);
            $newEP->getDrugiViri()->add($newDV);

            $this->getEm()->persist($newDV);
            $newDV->preracunaj();
        }
    }

    /**
     * Klonira programske enote sklopa pod program razno
     * 
     * @param type $ep      stara enota programa razno
     * @param type $newEP   nova enota programa razno
     */
    private function klonirajPESklopa($ep, $newEP)
    {
        $newEP->setProgramskeEnoteSklopa(new \Doctrine\Common\Collections\ArrayCollection());
        $collPES = $ep->getProgramskeEnoteSklopa();
        foreach ($collPES as $pes) {
            $newPES = $pes->copy();
            $newPES->setProgramRazno($newEP);
            $newEP->getProgramskeEnoteSklopa()->add($newPES);

            $this->getEm()->persist($newPES);
            $newPES->preracunaj();
        }
    }

    /**
     * Klonira koprodukcije pod enoto programa
     * 
     * @param type $ep      stara enota programa
     * @param type $newEP   nova enota programa
     */
    private function klonirajKoprodukcije($ep, $newEP)
    {
        $newEP->setKoprodukcije(new \Doctrine\Common\Collections\ArrayCollection());
        $collKop = $ep->getKoprodukcije();
        foreach ($collKop as $kop) {
            $newKop = $kop->copy();
            $newKop->setEnotaPrograma($newEP);
            $newEP->getKoprodukcije()->add($newKop);

            $this->getEm()->persist($newKop);
            $newKop->preracunaj();
        }
    }

    /**
     * priprava podatkov za finančno prilogo C2 na osnovi programa dela, enot program in pripadajočih
     * uprizoritev
     *
     * @param string $programDelaId
     * @return  $data                strukturirani podatki priloge C2
     * @throws \Max\Exception\UnauthException
     * @todo preveriti, ali še potrebujemo ta RPC klic, ali je dovolj rpc klic osveziTabeloC2 $$
     */
    public function podatkiPrilogaC2($programDelaId)
    {
        // preverjanje avtorizacije
        $this->expectPermission("ProgramDela-read");
        $this->expectPermission("ProgramPremiera-read");
        $this->expectPermission("ProgramPonovitevPrejsnjih-read");
        $this->expectPermission("ProgramPonovitevPremiere-read");
        $this->expectPermission("ProgramGostovanje-read");
        $this->expectPermission("ProgramFestival-read");

        $this->expectPermission("Uprizoritev-read");
        $this->expectPermission("VrstaStroska-read");
        $this->expectPermission("StrosekUprizoritve-read");
        $this->expectPermission("Funkcija-read");
        $this->expectPermission("Alternacija-read");
        $this->expectPermission("Oseba-read");
        $this->expectPermission("Pogodba-read");

        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");
        $tr = $this->getServiceLocator()->get('translator');

        $this->expectUUID($programDelaId, $this->translate('Pričakujem ID programa dela'), 1000980);

        $programdela = $em->getRepository("ProgramDela\Entity\ProgramDela")
                ->findOneById($programDelaId);
        $this->expectPermission("ProgramDela-read", $programdela);

        if (!$programdela) {
            throw new \Max\Exception\UnauthException($tr->translate('Ni programa dela'), 1000981);
        }

        /**
         * preračun imamo v posebnem servisu, tako, da ga lahko kličemo direktno iz PHP-ja na strežniški strani
         */
        $service = $this->serviceLocator->get('programdela.service');
        $data    = $service->podatkiPrilogaC2($programdela);

        return $data;
    }

    /**
     * priprava podatkov za finančno prilogo C2 na osnovi programa dela, enot program in pripadajočih
     * uprizoritev
     *
     * kreira oz. osveži postavke C2 za dotičen program dela. Osveži le tiste kolone,
     * za katerega obstajajo podatki (npr. iz uprizoritev)
     *
     * @param string $programDelaId
     * @return False|True uspeh oz. neuspeh klica procedure
     * @throws \Max\Exception\UnauthException
     */
    public function osveziTabeloC2($programDelaId)
    {
        // preverjanje avtorizacije
        $this->expectPermission("PostavkaCDve-write");
        $this->expectPermission("ProgramDela-read");
        $this->expectPermission("ProgramPremiera-read");
        $this->expectPermission("ProgramPonovitevPrejsnjih-read");
        $this->expectPermission("ProgramPonovitevPremiere-read");
        $this->expectPermission("ProgramGostovanje-read");
        $this->expectPermission("ProgramFestival-read");

        $this->expectPermission("Uprizoritev-read");
        $this->expectPermission("VrstaStroska-read");
        $this->expectPermission("StrosekUprizoritve-read");
        $this->expectPermission("Funkcija-read");
        $this->expectPermission("Alternacija-read");
        $this->expectPermission("Oseba-read");
        $this->expectPermission("Pogodba-read");

        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");
        $tr = $this->getServiceLocator()->get('translator');

        $this->expectUUID($programDelaId, $this->translate('Pričakujem ID programa dela'), 1000982);

        $programdela = $em->getRepository("ProgramDela\Entity\ProgramDela")
                ->findOneById($programDelaId);
        $this->expectPermission("ProgramDela-read", $programdela);

        if (!$programdela) {
            throw new \Max\Exception\UnauthException($tr->translate('Ni programa dela'), 1000983);
        }

        /**
         * preračun imamo v posebnem servisu, tako, da ga lahko kličemo direktno iz PHP-ja na strežniški strani
         */
        $service = $this->serviceLocator->get('programdela.service');
        $uspeh   = $service->osveziTabeloC2($programdela);
        if ($uspeh) {
            $em->flush();
        }
        return $uspeh;
    }

    /**
     *
     * Tiskanje dokumenta
     *
     * @param string $dokument
     * @param array $printOptions
     * @return array
     * @throws MaxException
     */
    public function tiskajDokument($dokument, $printOptions)
    {

        $this->expectUUID($dokument
            , $this->translate('Pričakujem ID dokumenta')
            , 520082);
        $dr = $this->getDokRep();
        $dok = $dr->find($dokument);
        $this->expect($dok
            , $this->translate('Dokument ne obstaja')
            , 520081);
        $this->expectAuthorized($dok, 'read');

        $report = '\ProgramDela\Task\ProgramDelaReport';

        try {
            $job = $this->docPrint($report, $dokument, $printOptions);
            return $job;
        } catch (\Exception $ex) {
            throw new MaxException($this->translate('Napaka pri tiskanju dokumenta:')
                . ' ' . $ex->getCode() . ' '
                . $this->translate($ex->getMessage()), 520080, $ex);
        }
    }
}
