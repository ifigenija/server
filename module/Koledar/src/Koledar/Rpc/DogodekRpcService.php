<?php

namespace Koledar\Rpc;

use Max\Filter\IsoDateFilter;
use Max\Functions;

/**
 * Description of DogodekRpcService
 *
 * @author rado
 */
class DogodekRpcService
        extends \Max\Service\AbstractMaxService
{

    const MAXNOVIH = 100;   //največje število dogodkov, ki jih lahko razmnožimo naenkrat

    /**
     * Shrani dogodek in pripadajoče ažurirane termine storitve
     * 
     * @param guid $dogodekId           
     * @param array $terminiStoritev   polje terminov storitev v obliki:
     *                                   [ { 'id' : 'id-ts'
     *                                      ,'dogodek' : 'id-dogodek'
     *                                      ,'planiranZacetek' : 'iso-date'
     *                                      ,'planiranKonec' : 'iso-date'
     *                                      ,'alternacija' : 'id-alternacije'
     *                                      ,'dezurni' : 'boolean'
     *                                      ,'gost' : 'boolean'
     *                                      ,'sodelujoc' : 'boolean'
     *                                      ,'oseba' : 'oseba-id'
     *                                     } ,...]
     * @return type
     */

    public function azurirajTSDogodka($dogodekId, array $terminiStoritev = [])
    {
        /*
         *  preverjanje avtorizacije
         */
        $this->expectPermission("Dogodek-write");
        $this->expectPermission("TerminStoritve-write");
        $this->expectPermission("Alternacija-read");
        $this->expectPermission("Oseba-read");

        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");

        $dogodek = $em->getRepository("Koledar\Entity\Dogodek")
                ->findOneById($dogodekId);
        if (!$dogodek) {
            throw new \Max\Exception\UnauthException($this->translate('Ni dogodka'), 1001240);
        }
        /*
         * ali vsi termini storitve pripadajo pravemu dogodku
         */
        foreach ($terminiStoritev as $ts) {
            if (array_key_exists("dogodek", $ts)) {
                $this->expect(!array_key_exists("dogodek", $ts) || $ts['dogodek'] == $dogodekId
                        , "Dogodek termina storitve " . $ts['dogodek'] . " ni isti kot pri Dogodku", 1001241);
            }
        }

        $srv = $this->getServiceLocator()->get('dogodek.service');

        $srv->azurirajTSDogodka($dogodek, $terminiStoritev);

        $em->flush();

        return true;
    }

    /**
     * Skopira/klonira dogodek skupaj z vsemi termini storitve v nov dogodek, ki ima različen začetek in konec
     * 
     * @param type $dogodekId
     * @param type $zacetek         začetek novega dogodka
     * @return boolean
     * @throws \Max\Exception\UnauthException
     */
    public function kopirajDogodek($dogodekId, $zacetek)
    {
        /*
         *  preverjanje avtorizacije
         */
        $this->expectPermission("Dogodek-write");
        $this->expectPermission("TerminStoritve-write");

        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");

        $dogodek = $em->getRepository("Koledar\Entity\Dogodek")
                ->findOneById($dogodekId);
        if (!$dogodek) {
            throw new \Max\Exception\UnauthException($this->translate('Ni dogodka'), 1001242);
        }
        if (!empty($zacetek)) {
            $this->expectIsoDate($zacetek, $this->translate('Začetek (' . $zacetek . ') ni datum v ISO8601 obliki'), 1001243);
        }
        $this->expect(!empty($zacetek), "Začetek in konec morata biti prisotna", 1001245);
        $zacetekD = Functions::stringToDateTime($zacetek);


        $srv = $this->getServiceLocator()->get('dogodek.service');

        $novId = $srv->kopirajDogodek($dogodek, $zacetekD);

        $em->flush();

        return $novId;
    }

    /**
     * Razmnoži dogodek
     * 
     * novi dogodki so v obdobju začetek obdobja - konec obdobja (oz. število ponovitev), 
     * upoštevajoč flage za praznik, soboto in nedeljo,  
     * in tedenske termine, če le ti obstajajo
     * 
     * @param uuid $dogodekId                   dogodek, ki ga kopiramo 
     * @param datetime $zacetekObdobja          začetek obdobja, kjer naj bodo kopirani dogodki
     * @param datetime $konecObdobja            začetek obdobja, kjer naj bodo kopirani dogodki
     * @param boolean $upostevajPraznike        če true, potem novi dogodki ne bodo na praznik
     * @param boolean $upostevajSobote          če true, potem novi dogodki ne bodo v soboto
     * @param boolean $upostevajNedelje         če true, potem novi dogodki ne bodo v nedeljo
     *                                          [ h => ura, m=> minuta]
     * @param integer $steviloPonovitev         če polje obstaja, se kreira toliko novih dogodkov
     *                                        
     *                                          spodnji parametri se upoštevajo le, če ni števila ponovitev 
     * @param array $dopoldanOd                 čas začetka dopoldanskega termina v obliki
     * @param array $popoldanOd                 čas začetka popoldanskega termina v obliki
     *                                          [ h => ura, m=> minuta]
     * @param array $zvecerOd                   čas začetka večernega termina v obliki
     *                                          [ h => ura, m=> minuta]
     * @param array $tedenskiTermini            če polje obstaja, se dogodki kreirajo v sklopu teh omejitev
     * 
     * @return array                            id-ji kreiranih dogodkov
     * @throws \Max\Exception\UnauthException
     */
    public function razmnozi($dogodekId, $zacetekObdobja = null, $konecObdobja = null
    , $upostevajPraznike = false, $upostevajSobote = false, $upostevajNedelje = false
    , $dopoldanOd = null, $popoldanOd = null, $zvecerOd = null
    , $steviloPonovitev = null
    , $tedenskiTermini = null
    )
    {

        /*
         *  preverjanje avtorizacije
         */
        $this->expectPermission("Dogodek-write");
        $this->expectPermission("TerminStoritve-write");
        $this->expectPermission("Option-read");
        $this->expectPermission("OptionValue-read");
        $this->expectPermission("Praznik-read");
        /*
         * $$ ali še dodatna dovoljenja?
         */

        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");

        /*
         * preverjanje parametrov
         */
        $dogodek = $em->getRepository("Koledar\Entity\Dogodek")
                ->findOneById($dogodekId);
        if (!$dogodek) {
            throw new \Max\Exception\UnauthException($this->translate('Ni dogodka'), 1001249);
        }
        if (!empty($zacetekObdobja)) {
            $this->expectIsoDate($zacetekObdobja, $this->translate('Začetek obdobja (' . $zacetekObdobja . ') ni datum v ISO8601 obliki'), 1001250);
        } else {
            /*
             * takoj naslednji dan zjutraj
             */
            $zacetekObdobja = clone $dogodek->getKonec();
            $zacetekObdobja->modify("+1 day");
            $zacetekObdobja->setTime(0, 0);
        }
        $zacetekObdobjaD = Functions::stringToDateTime($zacetekObdobja);
        if (!empty($steviloPonovitev)) {
            $this->expect(is_integer($steviloPonovitev), 'Število ponovitev ' . $steviloPonovitev . 'mora biti integer', 1001251);
            $this->expect($steviloPonovitev > 0, 'Število ponovitev (' . $steviloPonovitev . ') mora biti pozitivno število', 1001254);
        }
        if (!empty($konecObdobja)) {
            $this->expectIsoDate($konecObdobja, $this->translate('Konec obdobja(' . $konecObdobja . ') ni datum v ISO8601 obliki'), 1001252);
            $konecObdobjaD = Functions::stringToDateTime($konecObdobja);
            $this->expect($zacetekObdobjaD < $konecObdobjaD, 'Konec obdobja(' . $konecObdobja . 'mora biti po začetku', 1001253);
        } else {
            $konecObdobjaD = null;
        }
        $this->expect(!empty($konecObdobja) || !empty($steviloPonovitev)
                , "Prisoten mora biti parameter ali konec obdobja ali število ponovitev", 1001255);

        $stNovih = 0;
        if (empty($steviloPonovitev)) {
            if (!empty($dopoldanOd)) {
                $this->expect(is_array($dopoldanOd) &&
                        array_key_exists("h", $dopoldanOd) &&
                        array_key_exists("m", $dopoldanOd) &&
                        $dopoldanOd['h'] >= 0 &&
                        $dopoldanOd['h'] <= 23 &&
                        $dopoldanOd['m'] >= 0 &&
                        $dopoldanOd['m'] <= 59
                        , 'Parameter dopoldanOd mora biti polje v obliki h=>ura,m=>minuta', 1001256);
            } else {
                /*
                 * $$ napolni parameter iz opcij
                 */
                $this->expect(false, 'dopoldanOd je obvezen parameter', 1001257);
            }
        }

        /*
         * izvedba kopiranj
         */
        $srv           = $this->getServiceLocator()->get('dogodek.service');
        $srvPraznik    = $this->serviceLocator->get('praznik.service');
        $noviIds       = [];
        $zacPrejsnjega = clone $zacetekObdobjaD;
        $zacPrejsnjega->modify('-1 day');
        $zacPrejsnjega->setTime(
                intval($dogodek->getZacetek()->format('h')) // ura
                , intval($dogodek->getZacetek()->format('i'))    //min
        );
        if (!empty($steviloPonovitev)) {
            /*
             * glede na št. ponovitev
             */
            $konec = FALSE;
            $i     = 1;
            while ($i <= $steviloPonovitev && !$konec) {
                /*
                 * določi naslednji datum dogodka
                 */
                $zacetekNaslednjega = clone $zacPrejsnjega;
                do {
                    $zacetekNaslednjega->modify("+1 day");
                    $ustrezenCas = TRUE; //init
                    /*
                     * kontrole potencialnega začetka novega dogodka 
                     */
                    if (!is_null($konecObdobjaD) && $zacetekNaslednjega > $konecObdobjaD) {
                        /*
                         * $$ zaenkrat še vedno dovoli, da je konec dogodka po koncu obdobja
                         */
                        $konec = true;
                    } else {
                        if ($ustrezenCas && $upostevajSobote) {
                            $ustrezenCas = $zacetekNaslednjega->format("N") == '6' ? false : true;
                        }
                        if ($ustrezenCas && $upostevajNedelje) {
                            $ustrezenCas = $zacetekNaslednjega->format("N") == '7' ? false : true;
                        }
                        if ($ustrezenCas && $upostevajPraznike) {
                            $ustrezenCas = $srvPraznik->delaProstDan($zacetekNaslednjega) ? false : true;
                        }
                    }
                } while (!$ustrezenCas && !$konec);
                if (!$konec) {
                    $novId     = $srv->kopirajDogodek($dogodek, $zacetekNaslednjega);
                    $stNovih++;
                    $noviIds[] = $novId;
                    $this->expect($stNovih <= self::MAXNOVIH, "Razmnoži se lahko največ " . self::MAXNOVIH . " dogodkov", 1001259);
                }
                $zacPrejsnjega = clone $zacetekNaslednjega;
                $i++;
            }
        } else {
            /*
             * $$ po po tedenskem vzorcu
             */
        }


        /*
         * $$ preverjanje tedenskih terminov
         */
//    , $tedenskiTermini
//            , $dopoldanOd, $popoldanOd, $zvecerOd



        $em->flush();

        return $noviIds;
    }

}
