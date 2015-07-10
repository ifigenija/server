<?php

/*
 *  Licenca GPLv3
 */

namespace ProgramDela\Rpc;

use Zend\View\Model\JsonModel;

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
     * Kreiranje nove koprodukcije za lastno gledališče za določeno enoto programa
     * 
     * 
     * @param string $programDelaId
     * 
     * @returns boolean     uspeh 
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

}
