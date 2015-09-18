<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\Uprizoritev;

use ApiTester;

/**
 * Description of UprizoritevCest
 * 
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto - je ni
 * relacije z drugimi entitetami
 * - maticniOder/prostor $$ 
 *      - besedilo
 *      - funkcije O2M   
 *      - arhivi         O2M   
 *      - rekviziterstva     O2M   
 *      - vaje O2M   
 *      - predstave     O2M   
 *      - gostujoce  O2M   
 *      - zvrstUprizoritve 
 *      - zvrstSurs        
 *      - producent M2O
 * -stroski O2M $$
 *      getlist različne variante relacij
 *      - vse
 *      - besedilo
 *
 * @author rado
 */
class UprizoritevCest
{

    private $restUrl                = '/rest/uprizoritev';
    private $besediloUrl            = '/rest/besedilo';
    private $zvrstUprizoritveUrl    = '/rest/zvrstuprizoritve';
    private $zvrstSursUrl           = '/rest/zvrstsurs';
    private $produkcijaDelitevUrl   = '/rest/produkcijadelitev';
    private $uprizoritevUrl         = '/rest/uprizoritev';
    private $produkcijskaHisaUrl    = '/rest/produkcijskahisa';
    private $popaUrl                = '/rest/popa';
    private $drzavaUrl              = '/rest/drzava';
    private $funkcijaUrl            = '/rest/funkcija';
    private $arhivalijaUrl          = '/rest/arhivalija';
    private $rekviziterstvoUrl      = '/rest/rekviziterstvo';
    private $rekvizitUrl            = '/rest/rekvizit';
    private $vajaUrl                = '/rest/vaja';
    private $predstavaUrl           = '/rest/predstava';
    private $gostujocaUrl           = '/rest/gostujoca';
    private $prostorUrl             = '/rest/prostor';
    private $strosekUprizoritveUrl  = '/rest/strosekuprizoritve';
    private $obj;
    private $obj2;
    private $objProstor;
    private $lookProstor;
    private $lookBesedilo;
    private $objBesedilo;
    private $objZvrstUprizoritve;
    private $lookZvrstUprizoritve;
    private $objZvrstSurs;
    private $lookZvrstSurs;
    private $objUprizoritev;
    private $objKoprodukcija1;
    private $objKoprodukcija2;
    private $objProdukcijskaHisa1;
    private $objProdukcijskaHisa2;
    private $lookProdukcijskaHisa1;
    private $lookProdukcijskaHisa2;
    private $objPopa1;
    private $objPopa2;
    private $objDrzava;
    private $objFunkcija1;
    private $objArhivalija1;
    private $objArhivalija2;
    private $objRekviziterstva1;
    private $objRekviziterstva2;
    private $objRekvizit1;
    private $objRekvizit2;
    private $objVaja1;
    private $objVaja2;
    private $objPredstava1;
    private $objPredstava2;
    private $objGostujoca1;
    private $objGostujoca2;
    private $lookTipFunkcije;
    private $objStrosekUprizoritve1;
    private $objStrosekUprizoritve2;
    private $lookupProdukcijskaHisa = '/lookup/produkcijskahisa';
    private $objVrstaStroska1;
    private $objVrstaStroska2;
    private $objVrstaStroska3;
    private $objVrstaStroska4;
    private $objVrstaStroskaGlava;
    private $vrstaStroskaUrl = '/rest/vrstastroska';

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupTipFunkcije(ApiTester $I)
    {
        $this->lookTipFunkcije = $ent                   = $I->lookupEntity("tipfunkcije", "04", false);
        $I->assertNotEmpty($ent);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupProstor(ApiTester $I)
    {
        $this->lookProstor = $ent               = $I->lookupEntity("prostor", "0006", false);
        $I->assertNotEmpty($ent);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupBesedilo(ApiTester $I)
    {
        $this->lookBesedilo = $ent                = $I->lookupEntity("besedilo", "0001", false);
        $I->assertNotEmpty($ent);
    }

    /**
     * 
     * @param ApiTester $I
     */
//    public function lookupZvrstUprizoritve(ApiTester $I)
//    {
//        $this->lookZvrstUprizoritve = $ent                        = $I->lookupEntity("zvrstuprizoritve", "08", false);
//        $I->assertNotEmpty($ent);
//    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupZvrstSurs(ApiTester $I)
    {
        $this->lookZvrstSurs = $ent                 = $I->lookupEntity("zvrstsurs", "01", false);
        $I->assertNotEmpty($ent);
    }

    /**
     *  kreiramo zapis
     * 
     * @param ApiTester $I
     */
//    public function createProstor(ApiTester $I)
//    {
//        $data             = [
//            'sifra'        => '12',
//            'naziv'        => 'Z Z',
//            'jePrizorisce' => true,
//            'kapaciteta'   => 1,
//            'opis'         => 'zz',
//        ];
////        
////        $data             = [
////            'ime'          => 'zz',
////            'jePrizorisce' => true,
////            'kapaciteta'   => 1,
////            'opis'         => 'zz',
////        ];
//        $this->objProstor = $ent              = $I->successfullyCreate($this->prostorUrl, $data);
//        $I->assertNotEmpty($ent['id']);
//        $I->assertEquals($ent['naziv'], 'Z Z');
//    }

    /**
     *  kreiramo besedilo
     * 
     * @param ApiTester $I
     */
//    public function createBesedilo(ApiTester $I)
//    {
//        $data              = [
//            'naslov'          => 'zz',
//            'avtor'           => 'zz',
//            'podnaslov'       => 'zz',
//            'jezik'           => 'zz',
//            'naslovIzvirnika' => 'zz',
//            'datumPrejema'    => '2010-02-01T00:00:00+0100',
//            'moskeVloge'      => 1,
//            'zenskeVloge'     => 2,
//            'prevajalec'      => 'zz',
//            'povzetekVsebine' => 'zz',
//        ];
//        $this->objBesedilo = $ent               = $I->successfullyCreate($this->besediloUrl, $data);
//        $I->assertNotEmpty($ent['id']);
//        $I->assertEquals($ent['naslov'], 'zz');
//    }

    /**
     *  napolnimo vsaj en zapis
     * 
     * @param ApiTester $I
     */
//    public function createZvrstUprizoritve(ApiTester $I)
//    {
//        $data                      = [
//            'ime'  => 'zz',
//            'opis' => 'zz',
//        ];
//        $this->objZvrstUprizoritve = $ent                       = $I->successfullyCreate($this->zvrstUprizoritveUrl, $data);
//        $I->assertEquals($ent['ime'], 'zz');
//        $I->assertNotEmpty($ent['id']);
//    }

    /**
     *  napolnimo vsaj en zapis
     * 
     * @param ApiTester $I
     */
//    public function createZvrstSurs(ApiTester $I)
//    {
//        $data               = [
//            'ime'   => 'zz',
//            'naziv' => 'zz',
//        ];
//        $this->objZvrstSurs = $ent                = $I->successfullyCreate($this->zvrstSursUrl, $data);
//        $I->assertEquals($ent['ime'], 'zz');
//        $I->assertNotEmpty($ent['id']);
//    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupProdukcijskaHisa(ApiTester $I)
    {

        $resp                        = $I->successfullyGetList($this->lookupProdukcijskaHisa, []);
        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->assertTrue(array_key_exists('data', $resp), "ima data");
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords'], "total records");
        $this->lookProdukcijskaHisa1 = $resp['data'][0];
        $this->lookProdukcijskaHisa2 = $resp['data'][1];
        $I->assertNotEmpty($this->lookProdukcijskaHisa1);
        $I->assertNotEmpty($this->lookProdukcijskaHisa2);
    }

    /**
     *  kreiramo zapis
     * 
     * @depends lookupBesedilo
     * @depends lookupProdukcijskaHisa
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'faza'                  => 'produkcija',
            'naslov'                => 'zz',
            'podnaslov'             => 'zz',
            'delovniNaslov'         => 'zz',
            'datumZacStudija'       => '2011-02-01T00:00:00+0100',
            'datumPremiere'         => '2012-02-01T00:00:00+0100',
            'maticniOder'           => $this->lookProstor['id'],
            'stOdmorov'             => 1,
//            'avtor'                 => 'avzz',
            'gostujoca'             => FALSE,
            'trajanje'              => 2,
            'opis'                  => 'zz',
            'arhIdent'              => 'zz',
            'arhOpomba'             => 'zz',
            'datumZakljucka'        => '2019-02-01T00:00:00+0100',
            'sloAvtor'              => FALSE,
            'kratkiNaslov'          => 'zz',
            'besedilo'              => $this->lookBesedilo['id'],
            'zvrstUprizoritve'      => null,
            'zvrstSurs'             => $this->lookZvrstSurs['id'],
            'internacionalniNaslov' => 'zz',
            'steviloVaj'            => 4,
            'planiranoSteviloVaj'   => 5,
            'producent'             => null,
            'krstna'                => true,
            'prvaSlovenska'         => true,
            'naslovIzvirnika'       => 'zz',
            'podnaslovIzvirnika'    => 'zz',
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['opis'], 'zz');

        // kreiram še en zapis
        $data       = [
            'faza'                  => 'predprodukcija-potrjen_program',
            'naslov'                => 'aa',
            'podnaslov'             => 'aa',
            'delovniNaslov'         => 'aa',
            'datumZacStudija'       => '2011-02-01T00:00:00+0100',
            'datumPremiere'         => '2012-02-01T00:00:00+0100',
            'maticniOder'           => $this->lookProstor['id'],
            'stOdmorov'             => 3,
//            'avtor'                 => 'avaa',
            'gostujoca'             => true, // $$ bool vrača napako convertToBool
            'trajanje'              => 4,
            'opis'                  => 'aa',
            'arhIdent'              => 'aa',
            'arhOpomba'             => 'aa',
            'datumZakljucka'        => '2019-02-01T00:00:00+0100',
            'sloAvtor'              => true, // $$ bool vrača napako convertToBool
            'kratkiNaslov'          => 'aa',
            'besedilo'              => $this->lookBesedilo['id'],
            'zvrstUprizoritve'      => null,
            'zvrstSurs'             => $this->lookZvrstSurs['id'],
            'internacionalniNaslov' => 'aa',
            'steviloVaj'            => 6,
            'planiranoSteviloVaj'   => 7,
            'producent'             => null,
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['opis'], 'aa');

        // kreiram še en zapis z drugim producentom
        $data = [
            'faza'                  => 'predprodukcija-potrjen_program',
            'naslov'                => 'bb',
            'podnaslov'             => 'bb',
            'delovniNaslov'         => 'bb',
            'datumZacStudija'       => '2012-02-01T00:00:00+0100',
            'datumPremiere'         => '2013-02-01T00:00:00+0100',
            'maticniOder'           => $this->lookProstor['id'],
            'stOdmorov'             => 5,
//            'avtor'                 => 'avbb',
            'gostujoca'             => true, // $$ bool vrača napako convertToBool
            'trajanje'              => 5,
            'opis'                  => 'bb',
            'arhIdent'              => 'bb',
            'arhOpomba'             => 'bb',
            'datumZakljucka'        => '2014-02-01T00:00:00+0100',
            'sloAvtor'              => true, // $$ bool vrača napako convertToBool
            'kratkiNaslov'          => 'bb',
            'besedilo'              => $this->lookBesedilo['id'],
            'zvrstUprizoritve'      => null,
            'zvrstSurs'             => $this->lookZvrstSurs['id'],
            'internacionalniNaslov' => 'bb',
            'steviloVaj'            => 5,
            'planiranoSteviloVaj'   => 5,
            'producent'             => $this->lookProdukcijskaHisa1['id'],
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['opis'], 'bb');
        $I->assertEquals($ent['producent'], $this->lookProdukcijskaHisa1['id']);
    }

    /**  kreiramo zapis
     * 
     * @depends lookupBesedilo
     * @param ApiTester $I
     */
    public function createBrezTrajanja(ApiTester $I)
    {
        // kreiram še en zapis brez trajanja
        $data = [
            'faza'             => 'postprodukcija',
            'naslov'           => 'bb',
            'podnaslov'        => 'bb',
            'delovniNaslov'    => 'bb',
            'datumPremiere'    => '2010-02-01T00:00:00+0100',
            'stOdmorov'        => null, // testiramo notEmpty filter
//            'avtor'            => null,
            'gostujoca'        => false,
            'trajanje'         => null, // testiramo notEmpty filter   $$ rb preveri unit test za integer!
            'opis'             => 'b',
            'arhIdent'         => 'b',
            'arhOpomba'        => 'b',
            'datumZakljucka'   => '2019-02-01T00:00:00+0100',
            'sloAvtor'         => true, // $$ bool vrača napako convertToBool
            'kratkiNaslov'     => 'bb',
            'maticniOder'      => $this->lookProstor['id'],
            'besedilo'         => $this->lookBesedilo['id'],
            'zvrstUprizoritve' => null,
            'zvrstSurs'        => $this->lookZvrstSurs['id'],
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['opis'], 'b');
    }

    /**
     *  kreiramo rekvizit
     * 
     * @param ApiTester $I
     */
    public function createRekvizit(ApiTester $I)
    {
        $data               = [
            'ime'   => 'zz',
            'vrsta' => 'zz',
        ];
        $this->objRekvizit1 = $ent                = $I->successfullyCreate($this->rekvizitUrl, $data);
        $I->assertNotEmpty($ent['id']);
    }

    /**
     *  napolnimo vsaj en zapis
     * 
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function createVecRekviziterstev(ApiTester $I)
    {
        $data                     = [
            'namenUporabe'   => true,
            'opisPostavitve' => 'zz',
            'rekvizit'       => $this->objRekvizit1['id'],
            'uprizoritev'    => $this->obj2['id'],
        ];
        $this->objRekviziterstva1 = $ent                      = $I->successfullyCreate($this->rekviziterstvoUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['opisPostavitve'], 'zz');

        // kreiramo še en zapis
        $data                     = [
            'namenUporabe'   => true,
            'opisPostavitve' => 'aa',
            'rekvizit'       => $this->objRekvizit2['id'],
            'uprizoritev'    => $this->obj2['id'],
        ];
        $this->objRekviziterstva2 = $ent                      = $I->successfullyCreate($this->rekviziterstvoUrl, $data);
        $I->assertNotEmpty($ent['id']);
    }

    /**
     * najde državo
     * 
     * @param ApiTester $I
     */
    public function getListDrzava(ApiTester $I)
    {
        $resp            = $I->successfullyGetList($this->drzavaUrl, []);
        $list            = $resp['data'];
        $I->assertNotEmpty($list);
        $this->objDrzava = $drzava          = array_pop($list);
        $I->assertNotEmpty($drzava);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupPopa(ApiTester $I)
    {
        $this->lookPopa = $ent            = $I->lookupEntity("popa", "0988", false);
        $I->assertNotEmpty($ent);
    }

    /**
     * kreiram popa
     *  
     * @param ApiTester $I
     */
//    public function createPopa(ApiTester $I)
//    {
//        $data           = [
//            'sifra'  => 'X12',
//            'naziv'  => 'zz',
////            'naziv1'    => 'zz',
////            'panoga'    => 'zz',
////            'email'     => 'z@zzz.zz',
////            'url'       => 'zz',
////            'opomba'    => 'zz',
//            'drzava' => $this->objDrzava['id'],
////            'idddv'     => 'zz',
////            'maticna'   => 'ZZ123',
////            'zavezanec' => 'Da',
////            'jeeu'      => 'Da',
////            'datZav'    => '2010-02-01T00:00:00+0100',
////            'datnZav'   => '2017-02-01T00:00:00+0100',
////            'zamejstvo' => FALSE,
//        ];
//        $this->objPopa1 = $popa           = $I->successfullyCreate($this->popaUrl, $data);
//
//        $I->assertNotEmpty($popa['id']);
//
//        $data           = [
//            'sifra'  => 'A12',
//            'naziv'  => 'aa',
//            'drzava' => $this->objDrzava['id'],
//        ];
//        $this->objPopa2 = $popa           = $I->successfullyCreate($this->popaUrl, $data);
//
//        $I->assertNotEmpty($popa['id']);
//    }

    /**
     *  kreiramo zapis
     * 
     * @depends createPopa
     * 
     * @param ApiTester $I
     */
//    public function createProdukcijskaHisa(ApiTester $I)
//    {
//        $data                       = [
//            'status' => 'zz',
//            'popa'   => $this->objPopa1['id'],
//        ];
//        $this->objProdukcijskaHisa1 = $ent                        = $I->successfullyCreate($this->produkcijskaHisaUrl, $data);
//        $I->assertNotEmpty($ent['id']);
//        $I->assertEquals($ent['status'], 'zz');
//
//
//        $data                       = [
//            'status' => 'bb',
//            'popa'   => $this->objPopa2['id'],
//        ];
//        $this->objProdukcijskaHisa2 = $ent                        = $I->successfullyCreate($this->produkcijskaHisaUrl, $data);
//        $I->assertNotEmpty($ent['id']);
//    }

    /**
     *  kreiramo zapis
     * 
     * @depends create
     * @depends lookupProdukcijskaHisa
     * 
     * @param ApiTester $I
     */
//    public function createVecKoproducentov(ApiTester $I)
//    {
//        $data                   = [
//            'odstotekFinanciranja' => 1.23,
//            'nasStrosek'           => false,
//            'uprizoritev'          => $this->obj2['id'],
//            'koproducent'          => $this->lookProdukcijskaHisa1['id'],
//        ];
//        $I->assertTrue(true);
//        $this->objKoprodukcija1 = $ent                    = $I->successfullyCreate($this->produkcijaDelitevUrl, $data);
//        $I->assertNotEmpty($ent['id']);
//        $I->assertFalse($ent['nasStrosek']);
//        codecept_debug($ent);
//
//
//        // kreiram še en zapis
//        $data                   = [
//            'odstotekFinanciranja' => 7.90,
//            'nasStrosek'           => true,
//            'uprizoritev'          => $this->obj2['id'],
//            'koproducent'          => $this->lookProdukcijskaHisa2['id'],
//        ];
//        $this->objKoprodukcija2 = $ent                    = $I->successfullyCreate($this->produkcijaDelitevUrl, $data);
//        $I->assertNotEmpty($ent['id']);
//        codecept_debug($ent);
//        $I->assertTrue($ent['nasStrosek']);
//    }

    /**
     *  napolnimo vsaj en zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function createVecArhivalij(ApiTester $I)
    {
        $data                 = [
            'oznakaDatuma'      => 'zz',
            'datum'             => '2019-02-01T00:00:00+0100',
            'fizicnaOblika'     => 'zz',
            'izvorDigitalizata' => 'zz',
            'povzetek'          => 'zz',
            'opombe'            => 'zz',
            'lokacijaOriginala' => 'zz',
            'objavljeno'        => 'zz',
            'naslov'            => 'zz',
            'avtorstvo'         => 'zz',
            'dogodek'           => null,
            'uprizoritev'       => $this->obj2['id'],
        ];
        $this->objArhivalija1 = $ent                  = $I->successfullyCreate($this->arhivalijaUrl, $data);
        $I->assertEquals($ent['naslov'], 'zz');
        $I->assertNotEmpty($ent['id']);

        // kreiramo še en zapis
        $data                 = [
            'oznakaDatuma'      => 'aa',
            'datum'             => '2016-02-01T00:00:00+0100',
            'fizicnaOblika'     => 'aa',
            'izvorDigitalizata' => 'aa',
            'povzetek'          => 'aa',
            'opombe'            => 'aa',
            'lokacijaOriginala' => 'aa',
            'objavljeno'        => 'aa',
            'naslov'            => 'aa',
            'avtorstvo'         => 'aa',
            'dogodek'           => null,
            'uprizoritev'       => $this->obj2['id'],
        ];
        $this->objArhivalija2 = $ent                  = $I->successfullyCreate($this->arhivalijaUrl, $data);
        $I->assertNotEmpty($ent['id']);
    }

    /**
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function createVecVaj(ApiTester $I)
    {
        $I->assertTrue(true);
        $data           = [
            'zaporedna'   => 1,
            'porocilo'    => 'zz',
            'dogodek'     => null, // najprej mora biti kreirana vaja, šele potem dogodek.
            'uprizoritev' => $this->obj2['id'],
        ];
        $this->objVaja1 = $ent            = $I->successfullyCreate($this->vajaUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['porocilo'], 'zz');

        $data           = [
            'zaporedna'   => 1,
            'porocilo'    => 'cc',
            'dogodek'     => null, // najprej mora biti kreirana vaja, šele potem dogodek.
            'uprizoritev' => $this->obj2['id'],
        ];
        $this->objVaja2 = $ent            = $I->successfullyCreate($this->vajaUrl, $data);
        $I->assertNotEmpty($ent['id']);
    }

    /**
     *  kreiramo zapis
     * 
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function createVecPredstav(ApiTester $I)
    {
        $data                = [
            'dogodek'     => NULL,
            'uprizoritev' => $this->obj2['id'],
            'gostovanje'  => null,
            'gostujoca'   => null,
        ];
        $this->objPredstava1 = $ent                 = $I->successfullyCreate($this->predstavaUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // kreiramo še en zapis
        $data                = [
            'dogodek'     => NULL,
            'uprizoritev' => $this->obj2['id'],
            'gostovanje'  => null,
            'gostujoca'   => null,
        ];
        $this->objPredstava2 = $ent                 = $I->successfullyCreate($this->predstavaUrl, $data);
        $I->assertNotEmpty($ent['id']);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
//    public function getListVse(ApiTester $I)
//    {
//        $listUrl = $this->restUrl . "/vse";
//        $resp    = $I->successfullyGetList($listUrl, []);
//        $list    = $resp['data'];
//
//        $I->assertNotEmpty($list);
//        $I->assertGreaterThanOrEqual(3, $resp['state']['totalRecords']);      //$$ začasno izključimo, dokler integer =null ne stestiramo
////        $I->assertEquals("aa", $list[0]['naslov']);      //glede na sort   
//        // iščemo naprimer tudi po vrednosti v avtor
//        $listUrl = $this->restUrl . "/vse?q=avzz";
//        $resp    = $I->successfullyGetList($listUrl, []);
//        $list    = $resp['data'];
//
//        $I->assertNotEmpty($list);
//        $I->assertEquals(1, $resp['state']['totalRecords']);      //$$ začasno izključimo, dokler integer =null ne stestiramo
////        $I->assertEquals("avzz", $list[0]['avtor']);
//    }

    /**
     *  napolnimo vsaj en zapis
     * 
     * @param ApiTester $I
     */
    public function createFunkcijo(ApiTester $I)
    {
        $data               = [
            'podrocje'          => 'igralec',
            'naziv'             => 'zz',
            'velikost'          => 'mala',
            'pomembna'          => true,
            'sort'              => 2,
            'uprizoritev'       => $this->obj2['id'],
            'privzeti'          => null,
            'tipFunkcije'       => $this->lookTipFunkcije['id'],
            'sePlanira'         => true,
            'dovoliPrekrivanje' => false,
            'maxPrekrivanj'     => 1
        ];
        $this->objFunkcija1 = $ent                = $I->successfullyCreate($this->funkcijaUrl, $data);
        $I->assertEquals($ent['naziv'], 'zz');
        $I->assertNotEmpty($ent['id']);

        $data               = [
            'podrocje'          => 'umetnik',
            'naziv'             => 'aa',
            'velikost'          => 'srednja',
            'pomembna'          => true,
            'sort'              => 4,
            'uprizoritev'       => $this->obj2['id'],
            'privzeti'          => null,
            'tipFunkcije'       => $this->lookTipFunkcije['id'],
            'sePlanira'         => false,
            'dovoliPrekrivanje' => true,
            'maxPrekrivanj'     => 2
        ];
        $this->objFunkcija2 = $ent                = $I->successfullyCreate($this->funkcijaUrl, $data);
        $I->assertNotEmpty($ent['id']);
    }

    /**
     * preberi vse zapise od osebe
     * 
     * @depends create
     * @param ApiTester $I
     */
//    public function getListPoBesedilu(ApiTester $I)
//    {
//        $listUrl = $this->restUrl . "?besedilo=" . $this->lookBesedilo['id'];
//
//        $resp = $I->successfullyGetList($listUrl, []);
//        $list = $resp['data'];
//        codecept_debug($resp);
//
//        $I->assertGreaterThanOrEqual(3, $resp['state']['totalRecords']);
//        $I->assertNotEmpty($list);
////        $I->assertEquals("aa", $list[0]['opis']);      // $$ sortiranje ne deluje v redu? b namesto aa
//    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent         = $this->obj;
        $ent['opis'] = 'yy';

        $this->obj = $entR      = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['opis'], 'yy');
    }

    /**
     * Preberem zapis in preverim vsa polja
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function read(\ApiTester $I)
    {
        $ent = $I->successfullyGet($this->restUrl, $this->obj['id']);
        codecept_debug($ent);

        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['faza'], 'produkcija');
        $I->assertEquals($ent['naslov'], 'zz');
        $I->assertEquals($ent['podnaslov'], 'zz');
        $I->assertEquals($ent['delovniNaslov'], 'zz');
        $I->assertEquals($ent['datumZacStudija'], '2011-02-01T00:00:00+0100');
        $I->assertEquals($ent['datumPremiere'], '2012-02-01T00:00:00+0100');
        $I->assertEquals($ent['maticniOder'], $this->lookProstor['id']);
        $I->assertEquals($ent['stOdmorov'], 1);
//        $I->assertEquals($ent['avtor'], 'avzz');
        $I->assertEquals($ent['gostujoca'], FALSE);
        $I->assertEquals($ent['trajanje'], 2);
        $I->assertEquals($ent['opis'], 'yy');
        $I->assertEquals($ent['arhIdent'], 'zz');
        $I->assertEquals($ent['arhOpomba'], 'zz');
        $I->assertEquals($ent['datumZakljucka'], '2019-02-01T00:00:00+0100');
        $I->assertEquals($ent['sloAvtor'], FALSE);
        $I->assertEquals($ent['kratkiNaslov'], 'zz');
        $I->assertEquals($ent['besedilo']['id'], $this->lookBesedilo['id'], "Besedilo");
        $I->assertEquals($ent['zvrstUprizoritve'], null);
        $I->assertEquals($ent['zvrstSurs'], $this->lookZvrstSurs['id']);
        $I->assertEquals($ent['internacionalniNaslov'], 'zz');
//        $I->assertEquals($ent['steviloVaj'], 4,"Število vaj");
        $I->assertEquals($ent['planiranoSteviloVaj'], 5);
        $I->assertEquals($ent['krstna'], true, "krstna");
        $I->assertEquals($ent['prvaSlovenska'], true);
        $I->assertEquals($ent['naslovIzvirnika'], 'zz');
        $I->assertEquals($ent['podnaslovIzvirnika'], 'zz');

        $I->assertFalse(isset($ent['producent']), "producent");
        $I->assertTrue(isset($ent['funkcije']));
        $I->assertTrue(isset($ent['arhivi']));
        $I->assertTrue(isset($ent['rekviziterstva']));
        $I->assertTrue(isset($ent['vaje']));
        $I->assertTrue(isset($ent['predstave']));
//        $I->assertTrue(isset($ent['gostujoce']));

        $I->assertEquals(0, count($ent['funkcije']));
        $I->assertEquals(0, count($ent['arhivi']));
        $I->assertEquals(0, count($ent['rekviziterstva']));
        $I->assertEquals(0, count($ent['vaje']));
        $I->assertEquals(0, count($ent['predstave']));
//        $I->assertEquals(0, count($ent['gostujoce']));
    }

    /**
     * brisanje zapisa
     * 
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $I->successfullyDelete($this->restUrl, $this->obj['id']);
        $I->failToGet($this->restUrl, $this->obj['id']);
    }

    /**
     *  kreiramo zapis
     * 
     * @depends create
     * 
     * @param ApiTester $I
     */
//    public function createVecGostujocih(ApiTester $I)
//    {
//        $data                = [
//            'uprizoritev' => $this->obj2['id'],
//        ];
//        $this->objGostujoca1 = $ent                 = $I->successfullyCreate($this->gostujocaUrl, $data);
//        $I->assertNotEmpty($ent['id']);
//
//        // kreiramo še en zapis
//        $data                = [
//            'uprizoritev' => $this->obj2['id'],
//        ];
//        $this->objGostujoca2 = $ent                 = $I->successfullyCreate($this->gostujocaUrl, $data);
//        $I->assertNotEmpty($ent['id']);
//    }

        /**
     * najde enoto programa
     * 
     * @param ApiTester $I
     */
    public function getListVrstaStroska(ApiTester $I)
    {
        $resp = $I->successfullyGetList($this->vrstaStroskaUrl, []);
        $list = $resp['data'];
        $I->assertNotEmpty($list);

        /**
         * preberemo vrsto stroška, ki ni  glava 
         */
        $glava = TRUE;
        while ($glava) {
            $this->objVrstaStroska1 = $vrstaStroska           = array_pop($list);
            $glava                  = ($vrstaStroska['podskupina'] === 0) ? true : false;
        }
        codecept_debug($vrstaStroska);
        /**
         * preberemo še eno glavo
         */
        $glava = false;
        while (!$glava) {
            $this->objVrstaStroskaGlava = $vrstaStroska               = array_pop($list);
            $glava                      = ($vrstaStroska['podskupina'] === 0) ? true : false;
        }
        codecept_debug($vrstaStroska);
    }

    
    /**
     *  kreiramo zapis
     * 
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function createVecStroskov(ApiTester $I)
    {
        $data                         = [
            'uprizoritev'  => $this->obj2['id'],
            'naziv'        => 'bb',
            'vrednostDo'   => 2.34,
            'vrednostNa'   => 4.56,
            'tipstroska'   => 'materialni',
            'vrstaStroska' => $this->objVrstaStroska1['id'],
            'opis'         => 'bb',
            'sort'         => 1,
        ];
        $this->objStrosekUprizoritve1 = $ent                          = $I->successfullyCreate($this->strosekUprizoritveUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // kreiramo še en zapis
        $data                         = [
            'uprizoritev'  => $this->obj2['id'],
            'naziv'        => 'cc',
            'vrednostDo'   => 8.9,
            'vrednostNa'   => 9.1,
            'tipstroska'   => 'materialni',
            'vrstaStroska' => $this->objVrstaStroska1['id'],
            'opis'         => 'cc',
            'sort'         => 2,
        ];
        $this->objStrosekUprizoritve2 = $ent                          = $I->successfullyCreate($this->strosekUprizoritveUrl, $data);
        $I->assertNotEmpty($ent['id']);
    }

    /**
     * preberemo relacije
     * 
     * @depends createVecKoproducentov
     * 
     * @param ApiTester $I
     */
//    public function preberiRelacijeSKoproducenti(ApiTester $I)
//    {
//        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "koprodukcije", "");
//        $I->assertEquals(2, count($resp));
//
//        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "koprodukcije", $this->objKoprodukcija1['id']);
//        $I->assertEquals(1, count($resp));
//    }

    /**
     * preberemo relacije
     * 
     * @depends createFunkcijo
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeSFunkcijami(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "funkcije", "");
        $I->assertEquals(2, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "funkcije", $this->objFunkcija1['id']);
        $I->assertEquals(1, count($resp));
    }

    /**
     * preberemo relacije
     * @depends createVecArhivalij
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeZArhivalijami(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "arhivi", "");
        $I->assertEquals(2, count($resp));

        // get po popa id  
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "arhivi", $this->objArhivalija1['id']);
        $I->assertEquals(1, count($resp));
    }

    /**
     * preberemo relacije
     * 
     * @depends createVecRekviziterstev
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeZRekviziterstvi(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "rekviziterstva", "");
        $I->assertEquals(2, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "rekviziterstva", $this->objRekviziterstva1['id']);
        $I->assertEquals(1, count($resp));
    }

    /**
     * preberemo relacije
     * 
     * @depends createVecVaj
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeZVajami(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "vaje", "");
        $I->assertEquals(2, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "vaje", $this->objVaja1['id']);
        $I->assertEquals(1, count($resp));
    }

    /**
     * preberemo relacije
     * @depends createVecPredstav
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeSPredstavami(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "predstave", "");
        $I->assertEquals(2, count($resp));

        // get po popa id  
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "predstave", $this->objPredstava1['id']);
        $I->assertEquals(1, count($resp));
    }

    /**
     * preberemo relacije
     * @depends createVecGostujocih
     * 
     * @param ApiTester $I
     */
//    public function preberiRelacijeZGostujocimi(ApiTester $I)
//    {
//        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "gostujoce", "");
//        $I->assertEquals(2, count($resp));
//
//        // get po popa id  
//        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "gostujoce", $this->objGostujoca1['id']);
//        $I->assertEquals(1, count($resp));
//    }

    /**
     * preberemo relacije
     * @depends createVecStroskov
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeSStroski(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "stroski", "");
        $I->assertEquals(2, count($resp));

        // get po popa id  
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "stroski", $this->objStrosekUprizoritve1['id']);
        $I->assertEquals(1, count($resp));
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updateZaValidacijoDatumov(ApiTester $I)
    {
        $ent = $I->successfullyGet($this->restUrl, $this->obj2['id']);

        // enaka datuma
        $ent['datumZacStudija'] = '2016-02-01T00:00:00+0100';
        $ent['datumPremiere']   = '2016-02-20T00:00:00+0100';
        $ent['datumZakljucka']  = '2016-02-27T00:00:00+0200';
        $ent                    = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        // prazen konec
        $ent['datumZakljucka'] = '';
        $ent                   = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        //  konec pred začetkom
        $ent['datumZakljucka'] = '2016-01-31T00:00:00+0100';
        $resp                  = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertEquals(1000880, $resp[0]['code']);

        //  konec pred premiero
        $ent['datumZakljucka'] = '2016-02-15T00:00:00+0100';
        $resp                  = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertEquals(1000879, $resp[0]['code']);

        // prazen začetek
        $ent['datumZacStudija'] = '';
        $ent['datumPremiere']   = '2016-01-30T00:00:00+0100';
        $ent['datumZakljucka']  = '2016-02-27T00:00:00+0200';
        $ent                    = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        // premiera pred začetkom
        $ent['datumZacStudija'] = '2016-02-01T00:00:00+0100';
        $ent['datumPremiere']   = '2016-01-30T00:00:00+0100';
        $resp                   = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertEquals(1000878, $resp[0]['code']);
    }

}
