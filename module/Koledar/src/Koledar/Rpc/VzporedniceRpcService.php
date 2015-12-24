<?php

/*
 *  Licenca GPLv3
 */

namespace Koledar\Rpc;

/**
 * Description of VzporedniceRpcService
 *
 * @author rado
 */
class VzporedniceRpcService
        extends \Max\Service\AbstractMaxService
{

    /**
     * Poišče vzporednice glede na zasedene osebe.
     * Zasedene osebe lahko dobimo iz:
     *  - uprizoritev (to so privzete alternacije)
     *  - alternacijah (če izberemo ne neprivzete alternacije na funkciji) 
     *      $$ tu je potrebno raziskati - kaj če je izbor več alternacij v isti funkciji (bi jih moralo vrniti vse te osebe)
     *  - terminov storitev glede na časovni interval
     *
     * @param array $uprizoritveIds
     * @param array $alternacije
     * @return type
     */
    public function vzporednice( array $uprizoritveIds = [] ,array $alternacije=[])
    {

        // preverjanje avtorizacije
        $this->expectPermission("Uprizoritev-read");
        $this->expectPermission("Funkcija-read");
        $this->expectPermission("Alternacija-read");
        $this->expectPermission("Oseba-read");

        /**
         * $$ preverjanje vhodnih parametrov 
         *   - morda če so guid?
         *    - kako so lahko prazni ([], null)
         */
//$$        $this->expectIsoDate($datum, $this->translate("Datum ($datum) ni datum v ISO8601 obliki"), 1001110);

        $uprR   = $this->getEm()->getRepository('Produkcija\Entity\Uprizoritev');
        $osebaR = $this->getEm()->getRepository('App\Entity\Oseba');

        $uprA = $uprR->findById($uprizoritveIds);

        /** @var VzporedniceService $srv */
        $srv = $this->getServiceLocator()->get('vzporednice.service');

        $osebe = $srv->getSodelujoci($uprA, $alternacije);

        $uprizoritveMozne = $srv->getMozneUprizoritve($osebe);

        $pogojneFunkcije = $srv->getPogojneUprizoritve($osebe);

        /*
         * vzporednice so najdene. Še priprava izhoda 
         */
        $metaFac = $this->getServiceLocator()->get('entity.metadata.factory');
        $metaU   = $metaFac->factory("Produkcija\Entity\Uprizoritev");
        $metaF   = $metaFac->factory("Produkcija\Entity\Funkcija");
        $metaO   = $metaFac->factory("App\Entity\Oseba");

        /**
         * še hidriramo
         */
        $jsonList = [];

        foreach ($uprizoritveMozne as $u) {
            $array                       = $metaU->filterForLookup($u);
            $array['konfliktneFunkcije'] = [];
            $jsonList[]                  = $array;
        }
        /**
         * zanašamo se, da so pogojne funkcije razvrščene po uprizoritvi
         */
        $u = '';
        foreach ($pogojneFunkcije as $fun) {
            if (!in_array($fun->getUprizoritev()->getId(), $uprizoritveIds)) {
                if ($u !== $fun->getUprizoritev()->getSifra()) {
                    if ($u !== '') {
                        $jsonList[] = $array;
                    };
                    $array = $metaU->filterForLookup($fun->getUprizoritev());
                    $u     = $fun->getUprizoritev()->getSifra();
                }
                $konF = $metaF->filterForLookup($fun);

                /**
                 * doddamo zasedene osebe
                 */
                $konF[zasedeneOsebe] = [];
                $zasedeneOsebe       = $this->getOsebe($fun, $osebe, true);
                foreach ($zasedeneOsebe as $zos) {
                    $o                     = $osebaR->findOneById($zos);
                    $konF[zasedeneOsebe][] = $metaO->filterForLookup($o);
                }

                /**
                 * doddamo nezasedene osebe
                 */
                $konF[nezasedeneOsebe] = [];
                $nezasedeneOsebe       = $this->getOsebe($fun, $osebe, false);
                foreach ($nezasedeneOsebe as $nos) {
                    $o                       = $osebaR->findOneById($nos);
                    $konF[nezasedeneOsebe][] = $metaO->filterForLookup($o);
                }

                $array['konfliktneFunkcije'][] = $konF;
            }
        };
        if ($u !== '') {
            $jsonList[] = $array;
        }

        /**
         * vsem uprizoritvam  dodamo funkcije z večimi alternacijammi (alterCount>1) 
         */
//        $jsonList2 = [];
//        foreach ($jsonList as $jsonItem) {
//            $u = $uprR->findOneById($jsonItem['id']);
//            foreach ($u->getFunkcije() as $fun) {
//                if ($fun->getSePlanira() && ($fun->getAlterCount() > 1)) {
//
//                    $vecaltF = $metaF->filterForLookup($fun);
//
//                    $zasedeneOsebe = $this->getOsebe($fun, $osebe, true);
//                    foreach ($zasedeneOsebe as $zos) {
//                        $o                        = $osebaR->findOneById($zos);
//                        $vecaltF[zasedeneOsebe][] = $metaO->filterForLookup($o);
//                    }
//                    $nezasedeneOsebe = $this->getOsebe($fun, $osebe, false);
//                    foreach ($nezasedeneOsebe as $nos) {
//                        $o                          = $osebaR->findOneById($nos);
//                        $vecaltF[nezasedeneOsebe][] = $metaO->filterForLookup($o);
//                    }
//
//                    $jsonItem['vecaltFunkcije'][] = $vecaltF;
//                }
//            }
//            $jsonList2[] = $jsonItem;
//        }

        return $jsonList;
    }

    /**
     * Vrne Osebe bodis zasedene bodisi nezasedene v obliki [funId => osebaId]
     * 
     * @param \Produkcija\Entity\Funkcija $funkcija
     * @param array $zasedeneOsebe
     * @param type $izpisiZasedene
     * @return string
     */
    private function getOsebe(\Produkcija\Entity\Funkcija $funkcija, array $zasedeneOsebe = [], $izpisiZasedene = false)
    {
        $rezultat    = [];
        $privzetoIme = "";
        foreach ($funkcija->getAlternacije() as $alter) {
            /* @var $alter \Produkcija\Entity\Alternacija */
            if ($alter->getOseba()) {
                $osebaId = $alter->getOseba()->getId();
                if ((($izpisiZasedene) && in_array($osebaId, $zasedeneOsebe)) ||
                        ((!$izpisiZasedene) && !in_array($osebaId, $zasedeneOsebe))) {
                    $rezultat[] = $osebaId;
                }
            }
        }
        return $rezultat;
    }

}
