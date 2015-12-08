<?php

/*
 *  Licenca GPLv3
 */

namespace ProgramDela\Rpc;

use Max\Exception\MaxException;
use ProgramDela\Entity\ProgramDela;
use ProgramDela\Repository\ProgramiDela;

/**
 * Description of ProgramDelaRpcService
 *
 * @author rado
 */
class ProgramDelaRpcService
        extends \Max\Service\AbstractMaxService
{

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

        /**
         * preverimo število zapisov za vse enote programa
         */
        if (!$this->preveriStZapisov($programDela)) {
            throw new \Max\Exception\UnauthException($tr->translate('Napačno število zapisov'), 1000966);
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
     * @param entity $programDela
     * @return bool uspeh
     * @throws \Max\Exception\UnauthException
     */
    protected function preveriStZapisov($programDela)
    {
        $zaplR = $this->getEm()->getRepository('Zapisi\Entity\ZapisLastnik');
        $tr    = $this->getServiceLocator()->get('translator');

        /**
         * premiere 2 zapisa
         */
        foreach ($programDela->getPremiere() as $ep) {
            $minPriponk = $ep->getImaKoprodukcije() ? 1 : 0;
            $stZapisov  = count($zaplR->findByLastnik($ep->getId()));
            if ($stZapisov < 1 + $minPriponk) {
                throw new \Max\Exception\UnauthException($tr
                        ->translate('Program premierne uprizoritve (zaporedna ' . $ep->getSort() . ") mora imeti vsaj 1 utemeljitev in $minPriponk priponk ,ima pa " . $stZapisov)
                , 1000967);
            }
        }

        /**
         * ponovitev premiere 1 zapis
         */
        foreach ($programDela->getPonovitvePremiere() as $ep) {
            $stZapisov = count($zaplR->findByLastnik($ep->getId()));
            if ($stZapisov < 1) {
                throw new \Max\Exception\UnauthException($tr
                        ->translate('Program ponovitve premierne uprizoritve (zaporedna ' . $ep->getSort() . ') mora imeti vsaj 1 priponko ,ima pa ' . $stZapisov)
                , 1000968);
            }
        }

        /**
         * ponovitev prejšnjih 1 zapis
         */
        foreach ($programDela->getPonovitvePrejsnjih() as $ep) {
            $stZapisov = count($zaplR->findByLastnik($ep->getId()));
            if ($stZapisov < 1) {
                throw new \Max\Exception\UnauthException($tr
                        ->translate('Program ponovitve prejšnjih sezon (zaporedna ' . $ep->getSort() . ') mora imeti vsaj 1 priponko ,ima pa ' . $stZapisov)
                , 1000969);
            }
        }

        /**
         * gostujoča 1 zapis
         */
        foreach ($programDela->getGostujoci() as $ep) {
            $stZapisov = count($zaplR->findByLastnik($ep->getId()));
            if ($stZapisov < 1) {
                throw new \Max\Exception\UnauthException($tr
                        ->translate('Program gostujočih uprizoritev (zaporedna ' . $ep->getSort() . ') mora imeti vsaj 1 utemeljitev, ima pa ' . $stZapisov)
                , 1001220);
            }
        }

        /**
         * gostovanja 2 zapisa
         */
        foreach ($programDela->getGostovanja() as $ep) {
            $stZapisov = count($zaplR->findByLastnik($ep->getId()));
            if ($stZapisov < 2) {
                throw new \Max\Exception\UnauthException($tr
                        ->translate('Program mednarodnih gostovanj (zaporedna ' . $ep->getSort() . ') mora imeti vsaj 1 utemeljitev in 1 priponko, ima pa ' . $stZapisov)
                , 1001221);
            }
        }

        /**
         * festivali 3 zapise
         */
        foreach ($programDela->getProgramiFestival() as $ep) {
            $minPriponk = 1;
            if ($ep->getImaKoprodukcije()) {
                $minPriponk += 1;
            }
            $stZapisov = count($zaplR->findByLastnik($ep->getId()));
            if ($stZapisov < 1 + $minPriponk) {
                throw new \Max\Exception\UnauthException($tr
                        ->translate('Program festivali (zaporedna ' . $ep->getSort() . ") mora imeti vsaj 1 utemeljitev in $minPriponk priponk, ima pa $stZapisov")
                , 1001222);
            }
        }

        /**
         * razno 2 zapisa
         */
        foreach ($programDela->getProgramiRazno() as $ep) {
            $minPriponk = $ep->getImaKoprodukcije() ? 1 : 0;
            $stZapisov  = count($zaplR->findByLastnik($ep->getId()));
            if ($stZapisov < 1 + $minPriponk) {
                throw new \Max\Exception\UnauthException($tr
                        ->translate('Program razno (zaporedna ' . $ep->getSort() . ") mora imeti vsaj 1 utemeljitev in $minPriponk priponk, ima pa " . $stZapisov)
                , 1001223);
            }
        }
        /**
         * izjemni 3 zapisa
         */
        foreach ($programDela->getIzjemni() as $ep) {
            $minPriponk = $ep->getImaKoprodukcije() ? 1 : 0;
            if ($ep->getPonoviZamejo() + $ep->getPonoviGost() > 0) {
                $minPriponk += 1;
            }

            $stZapisov = count($zaplR->findByLastnik($ep->getId()));
            if ($stZapisov < 1 + $minPriponk) {
                throw new \Max\Exception\UnauthException($tr
                        ->translate('Program izjemni dogodki (zaporedna ' . $ep->getSort() . ") mora imeti vsaj 1 utemeljitev in $minPriponk priponk, ima pa $stZapisov")
                , 1001224);
            }
        }

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

        $programDela->setZakljuceno(false);           // tu nastavimo novo vrednost

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
                ->setZakljuceno(false);  // klon prog. dela ni zaključen

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
     * @param type $ep stara enota programa
     * @param type $newEP nova enota programa
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
     * @param type $ep stara enota programa
     * @param type $newEP nova enota programa
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
     * Klonira programske enote sklopa pod program razno
     *
     * @param type $ep stara enota programa razno
     * @param type $newEP nova enota programa razno
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
     * Naredi klon programa dela.
     * Če je kalkulacija zaključena/zaklenjena, potem
     * naredimo nezaključek program dela, zgeneriramo
     * novo začasno številko.
     *
     * @param string $programDelaId
     * @param array $srcIds polje idjev programov dela, ki jih uvažamo
     * @return string id nove kalkulacije
     *
     */
    public function uvozi($programDelaId, $srcIds)
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

        /** @var ProgramDela $newPd */
        $newPd = $this->getProgramDelaRep()->find($programDelaId);

        $this->expect($newPd
                , $this->translate('Programdela ne obstaja')
                , 520091);

        $newPd->setAvgCenaVstopnice($newPd->getAvgCenaVstopnice() * $newPd->getStProdVstopnic());
        foreach ($srcIds as $srcId) {

            $this->expectUUID($srcId, "Nepravilne oblike", 3000550);
            /** @var ProgramDela $src */
            $src = $this->getProgramDelaRep()->find($srcId);

            if (!$src || $src === $newPd) {
                continue;
            }

            $newPd->setStZaposlenih($newPd->getStZaposlenih() + $src->getStZaposlenih());
            $newPd->setStZaposIgralcev($newPd->getStZaposIgralcev() + $src->getStZaposIgralcev());
            $newPd->setStProdVstopnic($newPd->getStProdVstopnic() + $src->getStProdVstopnic());
            $newPd->setAvgCenaVstopnice($newPd->getAvgCenaVstopnice() + $src->getStProdVstopnic() * $src->getAvgCenaVstopnice());

            /**
             * kloniram Programe premiere in jih dodam na nov program dela
             */
            $coll = $src->getPremiere();
            foreach ($coll as $ep) {
                $newEP = $ep->copy();
                $newEP->setDokument($newPd);
                $newPd->getPremiere()->add($newEP);
                $this->klonirajDrugeVire($ep, $newEP);
                $this->klonirajKoprodukcije($ep, $newEP);

                $this->getEm()->persist($newEP);
                $newEP->preracunaj();
            }

            /**
             * kloniram Programe ponovitev premier in jih dodam na nov program dela
             */
            $coll = $src->getPonovitvePremiere();
            foreach ($coll as $ep) {
                $newEP = $ep->copy();
                $newEP->setDokument($newPd);
                $newPd->getPonovitvePremiere()->add($newEP);
                $this->klonirajDrugeVire($ep, $newEP);
                $this->klonirajKoprodukcije($ep, $newEP);

                $this->getEm()->persist($newEP);
                $newEP->preracunaj();
            }

            /**
             * kloniram Programe ponovitev prejšnjih in jih dodam na nov program dela
             */
            $coll = $src->getPonovitvePrejsnjih();
            foreach ($coll as $ep) {
                $newEP = $ep->copy();
                $newEP->setDokument($newPd);
                $newPd->getPonovitvePrejsnjih()->add($newEP);
                $this->klonirajDrugeVire($ep, $newEP);
                $this->klonirajKoprodukcije($ep, $newEP);

                $this->getEm()->persist($newEP);
                $newEP->preracunaj();
            }

            /**
             * kloniram Programe gostujočih in jih dodam na nov program dela
             */
            $coll = $src->getGostujoci();
            foreach ($coll as $ep) {
                $newEP = $ep->copy();
                $newEP->setDokument($newPd);
                $newPd->getGostujoci()->add($newEP);
                $this->klonirajDrugeVire($ep, $newEP);
                $this->klonirajKoprodukcije($ep, $newEP);

                $this->getEm()->persist($newEP);
                $newEP->preracunaj();
            }

            /**
             * kloniram Programe gostovanj in jih dodam na nov program dela
             */
            $coll = $src->getGostovanja();
            foreach ($coll as $ep) {
                $newEP = $ep->copy();
                $newEP->setDokument($newPd);
                $newPd->getGostovanja()->add($newEP);
                $this->klonirajDrugeVire($ep, $newEP);
                $this->klonirajKoprodukcije($ep, $newEP);

                $this->getEm()->persist($newEP);
                $newEP->preracunaj();
            }

            /**
             * kloniram Programe Festivali in jih dodam na nov program dela
             */
            $coll = $src->getProgramiFestival();
            foreach ($coll as $ep) {
                $newEP = $ep->copy();
                $newEP->setProgramDela($newPd);
                $newPd->getProgramiFestival()->add($newEP);
                $this->klonirajDrugeVire($ep, $newEP);
                $this->klonirajKoprodukcije($ep, $newEP);

                $this->getEm()->persist($newEP);
                $newEP->preracunaj();
            }

            /**
             * kloniram Programe izjemnih in jih dodam na nov program dela
             */
            $coll = $src->getIzjemni();
            foreach ($coll as $ep) {
                $newEP = $ep->copy();
                $newEP->setDokument($newPd);
                $newPd->getIzjemni()->add($newEP);
                $this->klonirajDrugeVire($ep, $newEP);
                $this->klonirajKoprodukcije($ep, $newEP);

                $this->getEm()->persist($newEP);
                $newEP->preracunaj();
            }

            /**
             * kloniram Programe razno in jih dodam na nov program dela
             */
            $coll = $src->getProgramiRazno();
            foreach ($coll as $ep) {
                $newEP = $ep->copy();
                $newEP->setDokument($newPd);
                $newPd->getProgramiRazno()->add($newEP);
                $this->klonirajDrugeVire($ep, $newEP);
                $this->klonirajKoprodukcije($ep, $newEP);
                $this->klonirajPESklopa($ep, $newEP);       // posebnost pri programi razno

                $this->getEm()->persist($newEP);
                $newEP->preracunaj();
            }
        }
        if ($newPd->getStProdVstopnic() > 0) {
            $newPd->setAvgCenaVstopnice($newPd->getAvgCenaVstopnice() / $newPd->getStProdVstopnic());
        }
        $newPd->preracunaj();
        $newPd->validate();

        $this->getEm()->flush();
        return $newPd->getId();
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

        /**
         * tu so le sumarni rezultati za vse pogodbe v uprizoritvi, tako da ni osebnih podatkov
         * in ni potrebno preverjanje OsebniPodatki-read dovoljenja
         */
        return $uspeh;
    }

    /**
     *
     * Tiskanje dokumenta
     *
     * @param string $dokument  id programa dela
     * @param array $options
     * @return array
     * @throws MaxException
     */
    public function tiskajDokument($dokument, $options)
    {
        $this->expectUUID($dokument
                , $this->translate('Pričakujem ID dokumenta')
                , 520082);
        /** @var ProgramiDela $dr */
        $dr     = $this->getEm()->getRepository('ProgramDela\Entity\ProgramDela');
        $dr->setServiceLocator($this->getServiceLocator());
        $dok    = $dr->find($dokument);
        $this->expect($dok
                , $this->translate('Dokument ne obstaja')
                , 520081);
//        $this->expectPermission('ProgramDela-write', $dok);
        $this->expectPermission('ProgramDela-read', $dok);
        $report = 'ProgramDela\Task\ProgramDelaReport';

        try {
            $job = $this->docPrint($report, $dokument, $options);
            return $job;
        } catch (\Exception $ex) {
            throw new MaxException($this->translate('Napaka pri tiskanju dokumenta:')
            . ' ' . $ex->getCode() . ' '
            . $this->translate($ex->getMessage()), 520080, $ex);
        }
    }

}
