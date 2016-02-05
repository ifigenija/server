<?php

/*
 *  Licenca GPLv3
 */

namespace Koledar\Rpc;

use Max\Filter\IsoDateFilter;
use Max\Functions;

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
     *  - terminov storitev glede na časovni interval
     *
     * @param array $uprizoritveIds    seznam mora biti v obliki: [ "id-uprizoritve", ...]
     * @param array $alternacije       seznam mora biti v obliki: [ {"id-funkcije" : ["id-osebe", ...]}, ...]
     * @param string $zacetek            začetek  intervala v ISO8601 obliki, npr. "2016-04-20T00:00:00+0200"
     * @param string $konec              konec intervala v katerem iščemo že zasedene osebe iz terminov storitev
     * @return string
     */
    public function dajVzporednice(array $uprizoritveIds = [], array $alternacije = [], $zacetek = null, $konec = null)
    {
        /*
         *  preverjanje avtorizacije
         */
        $this->expectPermission("Uprizoritev-read");
        $this->expectPermission("Funkcija-read");
        $this->expectPermission("Alternacija-read");
        $this->expectPermission("Oseba-read");
        $this->expectPermission("TerminStoritve-read");

        $this->preveriVhodneParametre($uprizoritveIds, $alternacije, $zacetek, $konec);
        $zacetekD = Functions::stringToDateTime($zacetek);
        $konecD   = Functions::stringToDateTime($konec);

        $srv = $this->getServiceLocator()->get('vzporednice.service');

        $konfliktiOseUpr = $srv->getKonfliktOsebaUpriz($alternacije);

        $osebe = $this->getZasedeneOsebe($uprizoritveIds, $alternacije, $zacetekD, $konecD);

        $uprizoritveMozne = $srv->getMozneUprizoritve($osebe);

        $pogojneFunkcije = $srv->getPogojneUprizoritve($osebe);

        /*
         * vzporednice so najdene. Še priprava izhoda 
         */

        $jsonResult = $this->dajJson($uprizoritveMozne, $pogojneFunkcije, $osebe, $uprizoritveIds, $konfliktiOseUpr);

        return $jsonResult;
    }

    /**
     * Vrne brezpogojno konfliktne uprizoritve
     * 
     * parametri so enaki kot v dajVzporednice
     *  
     * @param array $uprizoritveIds    seznam mora biti v obliki: [ "id-uprizoritve", ...]
     * @param array $alternacije       seznam mora biti v obliki: [ {"id-funkcije" : ["id-osebe", ...]}, ...]
     * @param type $zacetek
     * @param type $konec
     * @return type
     */
    public function dajPrekrivanja(array $uprizoritveIds = [], array $alternacije = [], $zacetek = null, $konec = null)
    {
        /*
         *  preverjanje avtorizacije
         */
        $this->expectPermission("Uprizoritev-read");
        $this->expectPermission("Funkcija-read");
        $this->expectPermission("Alternacija-read");
        $this->expectPermission("Oseba-read");

        $this->preveriVhodneParametre($uprizoritveIds, $alternacije, $zacetek, $konec);
        $zacetekD = Functions::stringToDateTime($zacetek);
        $konecD   = Functions::stringToDateTime($konec);


        $srv = $this->getServiceLocator()->get('vzporednice.service');

        $konfliktiOseUpr = $srv->getKonfliktOsebaUpriz($alternacije);

        $osebe = $this->getZasedeneOsebe($uprizoritveIds, $alternacije, $zacetekD, $konecD);

//        $konfliktneFunkcije = $srv->getKonfliktneFunkcije($osebe)->getQuery()->getResult();
        $vrniKonfliktne     = true;
        $konfliktneFunkcije = $srv->getPogojneUprizoritve($osebe, $vrniKonfliktne);


        /*
         * prekrivanja so najdena. Še priprava izhoda 
         */

        $jsonResult = $this->dajJson([], $konfliktneFunkcije, $osebe, $uprizoritveIds, $konfliktiOseUpr);

        return $jsonResult;
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

    /**
     * 
     * @param array $uprizoritveIds
     * @param array $alternacije
     * @param type $zacetekD
     * @param type $konecD
     * @return type
     */
    private function getZasedeneOsebe(array $uprizoritveIds = [], array $alternacije = [], $zacetekD = null, $konecD = null)
    {
        $uprA = $this->getEm()->getRepository('Produkcija\Entity\Uprizoritev')->findById($uprizoritveIds);

        /** @var VzporedniceService $srv */
        $srv = $this->getServiceLocator()->get('vzporednice.service');

        $osebe = $srv->getSodelujoci($uprA, $alternacije, $zacetekD, $konecD);
        return $osebe;
    }

    /**
     * Sestavi Json
     * 
     * @param type $uprizoritveMozne
     * @param type $konfliktneFunkcije
     * @param type $osebe
     * @param type $uprizoritveIds              uprizoritve, ki jih ne damo v Json
     * @param type $konfliktiOseUpr             konflikti, ki jih naj izpiše v errorju
     * @return type
     */
    private function dajJson($uprizoritveMozne, $konfliktneFunkcije, $osebe, $uprizoritveIds = [], $konfliktiOseUpr)
    {
        $metaFac = $this->getServiceLocator()->get('entity.metadata.factory');
        $metaU   = $metaFac->factory("Produkcija\Entity\Uprizoritev");
        $metaF   = $metaFac->factory("Produkcija\Entity\Funkcija");
        $metaO   = $metaFac->factory("App\Entity\Oseba");

        /**
         * še hidriramo
         */
        $jsonList = [];
        $osebaR   = $this->getEm()->getRepository('App\Entity\Oseba');
        $uprR     = $this->getEm()->getRepository('Produkcija\Entity\Uprizoritev');

        foreach ($uprizoritveMozne as $u) {
            if (!in_array($u->getId(), $uprizoritveIds)) {
                $array                       = $metaU->filterForLookup($u);
                $array['konfliktneFunkcije'] = [];
                $jsonList[]                  = $array;
            }
        }
        /**
         * zanašamo se, da so pogojne funkcije razvrščene po uprizoritvi
         */
        $u = '';
        foreach ($konfliktneFunkcije as $fun) {
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
                $konF['zasedeneOsebe'] = [];
                $zasedeneOsebe         = $this->getOsebe($fun, $osebe, true);
                foreach ($zasedeneOsebe as $zos) {
                    $o                       = $osebaR->findOneById($zos);
                    $konF['zasedeneOsebe'][] = $metaO->filterForLookup($o);
                }

                /**
                 * doddamo nezasedene osebe
                 */
                $konF['nezasedeneOsebe'] = [];
                $nezasedeneOsebe         = $this->getOsebe($fun, $osebe, false);
                foreach ($nezasedeneOsebe as $nos) {
                    $o                         = $osebaR->findOneById($nos);
                    $konF['nezasedeneOsebe'][] = $metaO->filterForLookup($o);
                }

                $array['konfliktneFunkcije'][] = $konF;
            }
        };
        if ($u !== '') {
            $jsonList[] = $array;
        }
        $konfOsUpArray = [];
        foreach ($konfliktiOseUpr as $osId => $upIdA) {
            $oseba      = $osebaR->findOneById($osId);
            $this->expect($oseba, "Vhodne alternacije vsebujejo id neobstoječe osebe $oseba", 1001678);
            $osPolnoIme = $oseba->getPolnoIme();
            $upNazivA   = [];
            foreach ($upIdA as $uid) {
                $upr = $uprR->findOneById($uid);
                $this->expect($upr, "Vhodne alternacije vsebujejo id neobstoječe uprizoritve $upr", 1001679);
                array_push($upNazivA, $upr->getNaslov());
            }

            array_push($konfOsUpArray, [$osPolnoIme => $upNazivA]);
        }
        $jsonResult['error'] = $konfOsUpArray;
        $jsonResult['data']  = $jsonList;

        return $jsonResult;
    }

    /**
     * preveri vhodne parametre RPC klicev in nasilno prekini program, če niso v redu
     * 
     */
    private function preveriVhodneParametre($uprizoritveIds, $alternacije, $zacetek, $konec)
    {
        foreach ($uprizoritveIds as $u) {
            $this->expectUUID($u, 'Pričakujem ID uprizoritev v prvem parametru', 1001670);
        }
        foreach ($alternacije as $key => $foo) {
            $this->expect(is_array($foo) && is_integer($key), 'Pričakujem array fun:(os,os,..) v drugem parametru', 1001676);
            foreach ($foo as $fun => $osebe) {
                $this->expectUUID($fun, 'Pričakujem Id funkcije kot ključ v drugem parametru', 1001674);
                foreach ($osebe as $o) {
                    $this->expectUUID($o, 'Pričakujem Id oseb v drugem parametru', 1001675);
                }
            }
        }

        if (!empty($zacetek)) {
            $this->expectIsoDate($zacetek, $this->translate('Začetek (' . $zacetek . ') ni datum v ISO8601 obliki'), 1001671);
        }
        if (!empty($konec)) {
            $this->expectIsoDate($konec, $this->translate('Konec (' . $konec . ') ni datum v ISO8601 obliki'), 1001672);
        }
        $this->expect((empty($zacetek) && empty($konec) || (!empty($zacetek) && !empty($konec) ))
                , "Začetek in konec morata biti ali oba prazna ali oba čas", 1001673);
        /**
         * konec mora biti >=začetek
         */
        if (!empty($zacetek) && !empty($konec)) {
            /*
             * pretvorimo v datum za vsak slučaj, če bi bila $zacetek in $konec 
             * v različnih time zone-ah
             */
            $zacTime = Functions::stringToDateTime($zacetek);
            $konTime = Functions::stringToDateTime($konec);
            $this->expect($zacTime <= $konTime
                    , "Konec ne sme biti pred začetkom", 1001677);
        }
    }

}
