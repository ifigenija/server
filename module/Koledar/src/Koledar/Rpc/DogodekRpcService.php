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
    const DOPOLDAN = 'DOP';
    const POPOLDAN = 'POP';
    const ZVECER   = 'ZVE';

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
                $this->expect( $ts['dogodek']['id'] == $dogodekId
                        , "Dogodek termina storitve " . $ts['dogodek']['id'] . " ni isti kot pri Dogodku", 1001241);
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
     * upoštevajoč flage za praznik, soboto in nedelj  
     * in tedenske termine, če ni števila ponovitev
     * 
     * @param uuid $dogodekId                   dogodek, ki ga kopiramo 
     * @param string $zacetekObdobja            začetek obdobja, kjer naj bodo kopirani dogodki v ISO obliki
     * @param string $konecObdobja              začetek obdobja, kjer naj bodo kopirani dogodki
     * @param boolean $upostevajPraznike        če true, potem novi dogodki ne bodo na praznik
     * @param boolean $upostevajSobote          če true, potem novi dogodki ne bodo v soboto
     * @param boolean $upostevajNedelje         če true, potem novi dogodki ne bodo v nedeljo
     *                                          [ h => ura, m=> minuta]
     * @param integer $steviloPonovitev         če polje obstaja, se kreira toliko novih dogodkov
     *                                        
     *                                          spodnji parametri se upoštevajo le, če ni števila ponovitev: 
     * @param array $dopoldanOd                 čas začetka dopoldanskega termina v obliki
     *                                          [ h => ura, m=> minuta]
     * @param array $popoldanOd                 čas začetka popoldanskega termina v obliki
     *                                          [ h => ura, m=> minuta]
     * @param array $zvecerOd                   čas začetka večernega termina v obliki
     *                                          [ h => ura, m=> minuta]
     * @param array $tedenskiTermini            če polje obstaja, se dogodki kreirajo v sklopu teh omejitev
     *                                          oblika: [ [dan_v_tednu], [termin,...]] pri čemer je:
     *                                              dan_v_tednu  1-ponedeljek .. 7 - nedelja
     *                                              termin  DOP-dopoldan, POP-popoldan, ZVE-zvečer
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
            $strategijaPoStevilu = TRUE;
        } else {
            $strategijaPoStevilu = false;   // strategija po tedenskih terminih
        }
        if (!empty($konecObdobja)) {
            $this->expectIsoDate($konecObdobja, $this->translate('Konec obdobja(' . $konecObdobja . ') ni datum v ISO8601 obliki'), 1001252);
            $konecObdobjaD = Functions::stringToDateTime($konecObdobja);
            $this->expect($zacetekObdobjaD < $konecObdobjaD, 'Konec obdobja(' . $konecObdobja . 'mora biti po začetku', 1001253);
        } else {
            $konecObdobjaD = null;
        }
        $this->expect(!empty($konecObdobja) || $strategijaPoStevilu
                , "Prisoten mora biti parameter ali konec obdobja ali število ponovitev", 1001255);
        if (!$strategijaPoStevilu) {
            /*
             *  strategija kopiranja po tedenskih terminih
             */
            $this->expect(!empty($zacetekObdobja) && !empty($konecObdobja) && !empty($tedenskiTermini)
                    , 'V kolikor ni parametra steviloPonovitev, so parametri '
                    . 'zacetekObdobja,konecObdobja in tedenskiTermini obvezni'
                    , 1001263);
            array_walk_recursive($tedenskiTermini, function ( $val, $key) {
                $this->expect(in_array($val, [self::DOPOLDAN, self::POPOLDAN, self::ZVECER])
                        , "Dovoljene vrednosti za tedenskiTermini so le" . self::DOPOLDAN . "," . self::POPOLDAN . "," . self::ZVECER
                        , 1001264);
            });
            array_walk($tedenskiTermini, function ( $val, $key) {
                $this->expect(is_integer($key) && $key >= 0 && $key <= 7        //ključa 0 kasneje sploh ne upošteva ampak le od 1 do 7
                                                                                // ključ 0 forsira javascript
                        , "Dovoljeno ključi za tedenskiTermini so med 1 in 7"
                        , 1001266);
                $this->expect(is_array($val), "Vrednosti morajo biti v array-u"
                        , 1001267);
            });

            /*
             * napolni $tedenskiTerminiBA (boolean array) iz parametra $tedenskiTermini ,
             * tako da imamo v polju termine posortirane naraščujoče
             */
            for ($dow = 1; $dow <= 7; $dow++) {                 // dan v tednu
                for ($dpz = 1; $dpz <= 3; $dpz++) {             // dopoldan, popoldan , zvečer
                    $tedenskiTerminiBA[$dow][$dpz] = false;     //init
                }
            }
            foreach ($tedenskiTermini as $dow => $dpzA) {
                foreach ($dpzA as $dpz) {
                    switch ($dpz) {
                        case self::DOPOLDAN:
                            $tedenskiTerminiBA[$dow][1] = true;
                            break;
                        case self::POPOLDAN:
                            $tedenskiTerminiBA[$dow][2] = true;
                            break;
                        case self::ZVECER:
                            $tedenskiTerminiBA[$dow][3] = true;
                            break;
                        default:
                            $this->expect(false, "Dovoljene vrednosti za tedenskiTermini so le"
                                    . self::DOPOLDAN . ", " . self::POPOLDAN . ", " . self::ZVECER
                                    , 1001265);
                            break;
                    }
                }
            }

            $dopoldanOd = $this->preveriOdParameter($dopoldanOd, self::DOPOLDAN);
            $popoldanOd = $this->preveriOdParameter($popoldanOd, self::POPOLDAN);
            $zvecerOd   = $this->preveriOdParameter($zvecerOd, self::ZVECER);

            /*
             * dopoldanOd < popoldanOd < zvečerOd
             */
            $this->expect($dopoldanOd['h'] * 60 + $dopoldanOd['m'] < $popoldanOd['h'] * 60 + $popoldanOd['m'] &&
                    $popoldanOd['h'] * 60 + $popoldanOd['m'] < $zvecerOd['h'] * 60 + $zvecerOd['m']
                    , "Veljati mora dopoldanOd < popoldanOd < zvecerOd", 1001268);
        }

        /*
         * izvedba kopiranj
         */
        $stNovih = 0;
        $noviIds = [];
        if ($strategijaPoStevilu) {
            $zacetekNaslednjega = clone $zacetekObdobjaD;
            $zacetekNaslednjega->modify('-1 day');
            $zacetekNaslednjega->setTime(
                    intval($dogodek->getZacetek()->format('G')) // ura
                    , intval($dogodek->getZacetek()->format('i'))    //min
            );
            /*
             * glede na št. ponovitev
             */
            $konec              = FALSE;
            $i                  = 1;
            while ($i <= $steviloPonovitev && !$konec) {
                /*
                 * določi naslednji datum dogodka
                 */
                do {
                    $zacetekNaslednjega->modify("+1 day");
                    $ustrezenCas = TRUE; //init
                    $this->preveriZacetekNaslednjega($zacetekNaslednjega
                            , $konecObdobjaD
                            , $upostevajSobote
                            , $upostevajNedelje
                            , $upostevajPraznike
                            , $konec, $ustrezenCas);
                } while (!$ustrezenCas && !$konec);
                if (!$konec) {
                    $this->kopirajEnega($dogodek, $zacetekNaslednjega, $noviIds, $stNovih);
                }
                $i++;
            }
        } else {
            /*
             * kopiranje po tedenskem vzorcu 
             */

            $zacetekNaslednjega = clone $zacetekObdobjaD;
            $zacetekNaslednjega->modify('-1 minute');
            $konec              = FALSE;
            while (!$konec) {
                /*
                 * določi naslednji datum dogodka
                 */
                do {
                    $najdenNoviZacetekKorak2 = false;
                    $konec                   = false;
                    while (!$konec && !$najdenNoviZacetekKorak2) {
                        /*
                         * najdi naslednji čas glede na dopoldanske, popoldanske in večerne termine
                         */
                        $danNasl = intval($zacetekNaslednjega->format('N')); // dan
                        $uraNasl = intval($zacetekNaslednjega->format('G')); // ura 
                        $minNasl = intval($zacetekNaslednjega->format('i')); // min

                        /*
                         * najkasneje do jutrišnjega dopoldanskega termina
                         *  -> $zacetekNaslednjega, $dow, $dpz
                         */
                        $j                       = 1;
                        $najdenNoviZacetekKorak1 = FALSE;
                        while ($j <= 4 && !$najdenNoviZacetekKorak1) {
                            $jmod = fmod($j - 1, 3) + 1;
                            $hj   = $this->hmDopPopZve($jmod, $dopoldanOd, $popoldanOd, $zvecerOd)['h'];
                            $mj   = $this->hmDopPopZve($jmod, $dopoldanOd, $popoldanOd, $zvecerOd)['m'];
                            if ($j == 4 || ($hj * 60 + $mj > $uraNasl * 60 + $minNasl)) {
                                $dpz = $jmod;
                                $dow = $danNasl;
                                if ($j == 4) { // naslednji dan dopoldan
                                    $dow++;
                                    $zacetekNaslednjega->modify('+1 day');
                                }
                                $dow                     = fmod($dow - 1, 7) + 1;
                                $zacetekNaslednjega->setTime($hj, $mj);
                                $najdenNoviZacetekKorak1 = true;
                            }
                            $j++;
                        }

                        $this->expect($najdenNoviZacetekKorak1
                                , "Novi začetek v koraku 1 ni najden " . $zacetekNaslednjega->format('d.m.Y H:i O')
                                , 1001261);

                        if (!is_null($konecObdobjaD) && $zacetekNaslednjega > $konecObdobjaD) {
                            /*
                             * $$ zaenkrat še vedno dovoli, da je konec dogodka po koncu obdobja
                             */
                            $konec = true;
                        }
                        if ($tedenskiTerminiBA[$dow][$dpz]) {
                            $najdenNoviZacetekKorak2 = true;
                        }
                    }

                    $ustrezenCas = TRUE; //init
                    if (!$konec) {
                        $this->preveriZacetekNaslednjega($zacetekNaslednjega
                                , $konecObdobjaD
                                , $upostevajSobote
                                , $upostevajNedelje
                                , $upostevajPraznike
                                , $konec, $ustrezenCas);
                    }
                } while (!$ustrezenCas && !$konec);
                if (!$konec) {
                    $this->kopirajEnega($dogodek, $zacetekNaslednjega, $noviIds, $stNovih);
                }
            }
        }

        /*
         * $$ ali kontrole, da se novi dogodki ne prekrivajo med sabo?
         */

        $em->flush();

        return $noviIds;
    }

    /**
     * 
     * @param \Koledar\Rpc\Koledar\Entity\Dogodek $dogodek
     * @param \DateTime $zacetekNaslednjega
     * @param array $noviIds
     * @param type $stNovih
     */
    private function kopirajEnega(\Koledar\Entity\Dogodek $dogodek, \DateTime $zacetekNaslednjega
    , array &$noviIds, &$stNovih)
    {
        $stNovih++;
        $this->expect($stNovih <= self::MAXNOVIH
                , "Razmnoži se lahko največ " . self::MAXNOVIH . " dogodkov", 1001259);

        $srv       = $this->getServiceLocator()->get('dogodek.service');
        $novId     = $srv->kopirajDogodek($dogodek, $zacetekNaslednjega);
        $noviIds[] = $novId;
    }

    /**
     * 
     * @param \DateTime $zacetekNaslednjega
     * @param type $upostevajSobote
     * @param type $upostevajNedelje
     * @param type $upostevajPraznike
     * 
     * output:
     * @param boolean $konec
     * @param type $ustrezenCas
     */
    private function preveriZacetekNaslednjega(\DateTime $zacetekNaslednjega
    , $konecObdobjaD
    , $upostevajSobote
    , $upostevajNedelje
    , $upostevajPraznike
    , &$konec, &$ustrezenCas)
    {
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
                $srvPraznik  = $this->serviceLocator->get('praznik.service');
                $ustrezenCas = $srvPraznik->delaProstDan($zacetekNaslednjega) ? false : true;
            }
        }
    }

    /**
     * Vrne uro in minuto od dopoldanskegega oz. popold. ali večernega termina 
     * 
     * @param type $dpz
     * @return array            v obliki [ 'h' => ura, 'm' => minuta]
     */
    private function hmDopPopZve($dpz
    , $dopoldanOd, $popoldanOd, $zvecerOd)
    {
        switch ($dpz) {
            case 1:
                $ura = $dopoldanOd['h'];
                $min = $dopoldanOd['m'];
                break;
            case 2:
                $ura = $popoldanOd['h'];
                $min = $popoldanOd['m'];
                break;
            case 3:
                $ura = $zvecerOd['h'];
                $min = $zvecerOd['m'];
                break;
            default:
                $this->expect(false, "Napačen indeks za dopoldan/popoldan/zvečer ($dpz)", 1001260);
        }

        return ['h' => $ura, 'm' => $min];
    }

    /**
     * 
     * @param type $terminOd
     * @param type $dpz      je lahko DOPOLDAN, POPOLDAN, ZVEČER
     */
    private function preveriOdParameter($terminOd, $dpz)
    {
        if (!empty($terminOd)) {
            $this->expect(is_array($terminOd) &&
                    array_key_exists("h", $terminOd) &&
                    array_key_exists("m", $terminOd) &&
                    $terminOd['h'] >= 0 &&
                    $terminOd['h'] <= 23 &&
                    $terminOd['m'] >= 0 &&
                    $terminOd['m'] <= 59
                    , 'Parametri *Od morajo biti polje v obliki h=>ura,m=>minuta', 1001256);
        } else {
            $srv           = $this->serviceLocator->get('options.service');
            $opcijaTermini = $srv->getOptions('dogodek.termini');
            switch ($dpz) {
                case self::DOPOLDAN:
                    $ime = "dopoldanZacetek";
                    break;
                case self::POPOLDAN:
                    $ime = "popoldanZacetek";
                    break;
                case self::ZVECER:
                    $ime = "vecerZacetek";
                    break;
                default:
                    $this->expect(false, "Dovoljene vrednosti za tedenskiTermini so le"
                            . self::DOPOLDAN . ", " . self::POPOLDAN . ", " . self::ZVECER
                            , 1001269);
                    break;
            }
            $terminOd['h'] = $opcijaTermini[$ime]['h'];
            $terminOd['m'] = $opcijaTermini[$ime]['m'];
        }
        return $terminOd;
    }

}
