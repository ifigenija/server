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
     *  - terminov storitev glede na časovni interval
     *
     * @param array $uprizoritveIds    seznam mora biti v obliki: [ "id-uprizoritve", ...]
     * @param array $alternacije       seznam mora biti v obliki: [ {"id-funkcije" : ["id-osebe", ...]}, ...]
     * @return type
     */
    public function dajVzporednice(array $uprizoritveIds = [], array $alternacije = [])
    {

        /*
         *  preverjanje avtorizacije
         */
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

        $srv = $this->getServiceLocator()->get('vzporednice.service');

        $konfliktiOseUpr = $srv->getKonfliktOsebaUpriz($alternacije);

        /**
         * $$ še izpis katere
         */
        $osebe = $this->getZasedeneOsebe($uprizoritveIds, $alternacije);



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
     * @return type
     */
    public function dajPrekrivanja(array $uprizoritveIds = [], array $alternacije = [])
    {
        /*
         *  preverjanje avtorizacije
         */
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
        $srv = $this->getServiceLocator()->get('vzporednice.service');

        $konfliktiOseUpr = $srv->getKonfliktOsebaUpriz($alternacije);

        $osebe = $this->getZasedeneOsebe($uprizoritveIds, $alternacije);

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
     * @return type
     */
    private function getZasedeneOsebe(array $uprizoritveIds = [], array $alternacije = [])
    {
        $uprA = $this->getEm()->getRepository('Produkcija\Entity\Uprizoritev')->findById($uprizoritveIds);

        /** @var VzporedniceService $srv */
        $srv = $this->getServiceLocator()->get('vzporednice.service');

        $osebe = $srv->getSodelujoci($uprA, $alternacije);
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
        $jsonResult['error'] = $konfliktiOseUpr;
        $jsonResult['data']  = $jsonList;

        return $jsonResult;
    }

}
