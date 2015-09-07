<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\Arhivalija;

use ApiTester;

/**
 * Description of ArhivalijaCest
 * 
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto
 *      relacije z drugimi entitetami
 *      - dogodek 
 *      - uprizoritev 
 *      getlist različne variante relacij
 *      - vse
 *      - uprizoritev
 *
 * @author rado
 */
class ArhivalijaCest
{

    private $restUrl        = '/rest/arhivalija';
    private $besediloUrl    = '/rest/besedilo';
    private $uprizoritevUrl = '/rest/uprizoritev';
    private $dogodekUrl     = '/rest/dogodek';
    private $vajaUrl        = '/rest/vaja';
    private $obj;
    private $objDogodek;
    private $objVaja;
    private $objBesedilo;
    private $objUprizoritev;
    private $lookUprizoritev;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     *  kreiramo besedilo
     * 
     * @param ApiTester $I
     */
//    public function createBesedilo(ApiTester $I)
//    {
//        $data      = [
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
     * 
     * @param ApiTester $I
     */
    public function lookupUprizoritev(ApiTester $I)
    {
        $this->lookUprizoritev = $look                  = $I->lookupEntity("uprizoritev", "0001", false);
        $I->assertNotEmpty($look);
    }

    /**
     *  kreiramo zapis
     * 
     * @depends createBesedilo
     * @param ApiTester $I
     */
//    public function createUprizoritev(ApiTester $I)
//    {
//        $data      = [
//            'faza'             => 'produkcija',
//            'naslov'           => 'zz',
//            'podnaslov'        => 'zz',
//            'delovniNaslov'    => 'zz',
//            'datumPremiere'    => '2010-02-01T00:00:00+0100',
//            'stOdmorov'        => 1,
//            'avtor'            => 'zz',
//            'gostujoca'        => true, // $$ bool vrača napako convertToBool
//            'trajanje'         => 2,
//            'opis'             => 'zz',
//            'arhIdent'         => 'zz',
//            'arhOpomba'        => 'zz',
//            'datumZakljucka'   => '2019-02-01T00:00:00+0100',
//            'sloAvtor'         => true, // $$ bool vrača napako convertToBool
//            'kratkiNaslov'     => 'zz',
//            'besedilo'         => $this->objBesedilo['id'],
//            'zvrstUprizoritve' => null,
//            'zvrstSurs'        => null,
//        ];
//        $this->objUprizoritev = $ent                  = $I->successfullyCreate($this->uprizoritevUrl, $data);
//        $I->assertNotEmpty($ent['id']);
//        codecept_debug($ent);
//        $I->assertEquals($ent['opis'], 'zz');
//    }

    /**
     * 
     * @param ApiTester $I
     */
//    public function createVajo(ApiTester $I)
//    {
//        $data          = [
//            'zaporedna'   => 1,
//            'porocilo'    => 'zz',
//            'dogodek'     => null, //$$rb najprej mora biti kreirana vaja, šele potem dogodek.
//            'uprizoritev' => null,
//        ];
//        $this->objVaja = $ent           = $I->successfullyCreate($this->vajaUrl, $data);
//        $I->assertNotEmpty($ent['id']);
//        codecept_debug($ent);
//        $I->assertEquals($ent['porocilo'], 'zz');
//    }

    /**
     * @param ApiTester $I
     */
    public function getListDogodek(ApiTester $I)
    {
        $resp             = $I->successfullyGetList($this->dogodekUrl, []);
        $list             = $resp['data'];
        $I->assertNotEmpty($list);
        $this->objDogodek = $ent              = array_pop($list);
        $I->assertNotEmpty($ent);
    }

    /**
     * @depends createVajo
     * @param ApiTester $I
     */
//    public function createDogodek(ApiTester $I)
//    {
//        $data             = [
//            'planiranZacetek' => '2011-02-01T00:00:00+0100',
//            'zacetek'         => '2012-02-01T00:00:00+0100',
//            'konec'           => '2013-02-01T00:00:00+0100',
//            'status'          => 1,
//            'razred'          => null,
//            'termin'          => null,
//            'ime'             => null,
//            'predstava'       => null,
//            'zasedenost'      => null,
//            'vaja'            => $this->objVaja['id'],
//            'gostovanje'      => null,
//            'dogodekIzven'    => null,
//            'prostor'         => null,
//            'sezona'          => null,
//        ];
//        $this->objDogodek = $ent              = $I->successfullyCreate($this->dogodekUrl, $data);
//        $I->assertNotEmpty($ent['id']);
//        codecept_debug($ent);
//        $I->assertEquals($ent['status'], 1);
//    }

    /**
     *  napolnimo vsaj en zapis
     * 
     * @depends lookupUprizoritev
     * @depends getListDogodek
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
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
            'dogodek'           => NULL,
            'uprizoritev'       => $this->lookUprizoritev['id'],
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals($ent['naslov'], 'zz');
        $I->assertNotEmpty($ent['id']);

        // kreiramo še en zapis
        $data = [
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
            'uprizoritev'       => $this->lookUprizoritev['id'],
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals($ent['naslov'], 'aa');
        $I->assertNotEmpty($ent['id']);

        // kreiramo še en zapis
        $data                 = [
            'oznakaDatuma'      => 'bb',
            'datum'             => '2017-02-01T00:00:00+0100',
            'fizicnaOblika'     => 'bb',
            'izvorDigitalizata' => 'bb',
            'povzetek'          => 'bb',
            'opombe'            => 'bb',
            'lokacijaOriginala' => 'bb',
            'objavljeno'        => 'bb',
            'naslov'            => 'bb',
            'avtorstvo'         => 'bb',
            'dogodek'           => $this->objDogodek['id'],
            'uprizoritev'       => null,
        ];
        $this->objArhivalija2 = $ent                  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals($ent['naslov'], 'bb');
        $I->assertNotEmpty($ent['id']);
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent           = $this->obj;
        $ent['naslov'] = 'xx';

        $ent = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($ent['naslov'], 'xx');
    }

    /**
     * Preberem zapis
     * 
     * @param ApiTester $I
     * @depends create
     */
    public function read(ApiTester $I)
    {
        $ent = $I->successfullyGet($this->restUrl, $this->obj['id']);

        $I->assertEquals($ent['oznakaDatuma'], 'zz');
        $I->assertEquals($ent['datum'], "2019-02-01T00:00:00+0100");
        $I->assertEquals($ent['fizicnaOblika'], 'zz');
        $I->assertEquals($ent['izvorDigitalizata'], 'zz');
        $I->assertEquals($ent['povzetek'], 'zz');
        $I->assertEquals($ent['opombe'], 'zz');
        $I->assertEquals($ent['lokacijaOriginala'], 'zz');
        $I->assertEquals($ent['objavljeno'], 'zz');
        $I->assertEquals($ent['naslov'], 'xx');
        $I->assertEquals($ent['avtorstvo'], 'zz');
        $I->assertEquals($ent['dogodek'], NULL);
        $I->assertEquals($ent['uprizoritev'], $this->lookUprizoritev['id']);

        // preberemo še en zapis
        $ent = $I->successfullyGet($this->restUrl, $this->objArhivalija2['id']);

        $I->assertEquals($ent['oznakaDatuma'], 'bb');
        $I->assertEquals($ent['datum'], '2017-02-01T00:00:00+0100');
        $I->assertEquals($ent['fizicnaOblika'], 'bb');
        $I->assertEquals($ent['izvorDigitalizata'], 'bb');
        $I->assertEquals($ent['povzetek'], 'bb');
        $I->assertEquals($ent['opombe'], 'bb');
        $I->assertEquals($ent['lokacijaOriginala'], 'bb');
        $I->assertEquals($ent['objavljeno'], 'bb');
        $I->assertEquals($ent['naslov'], 'bb');
        $I->assertEquals($ent['avtorstvo'], 'bb');
        $I->assertEquals($ent['dogodek'], $this->objDogodek['id']);
        $I->assertEquals($ent['uprizoritev'], null);
    }

    /**
     * preberi vse zapise od osebe
     * 
     * @depends create
     * @param ApiTester $I
     */
//    public function getListPoUprizoritvi(ApiTester $I)
//    {
//        $listUrl = $this->restUrl . "?uprizoritev=" . $this->lookUprizoritev['id'];
//
//        $resp = $I->successfullyGetList($listUrl, []);
//        $list = $resp['data'];
//        codecept_debug($resp);
//
//        $I->assertGreater(2, $resp['state']['totalRecords']);
//        $I->assertNotEmpty($list);
//        $I->assertEquals("aa", $list[0]['naslov']);      //  odvisno od sortiranja
//    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListDefault(ApiTester $I)
    {
        $listUrl = $this->restUrl;
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];
        codecept_debug($list);

        $I->assertNotEmpty($list);
        $totalRecords = $resp['state']['totalRecords'];
        $I->assertGreaterThanOrEqual(3, $totalRecords);
        $I->assertEquals("aa", $list[0]['naslov']);      //glede na sort
        $I->assertEquals("zz", $list[$totalRecords-1]['naslov']);      //glede na sort
    }

    /**
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $I->successfullyDelete($this->restUrl, $this->obj['id']);
        $I->failToGet($this->restUrl, $this->obj['id']);
    }

    /**
     * test validacije
     * 
     * @param ApiTester $I
     */
    public function createArhivalijoBrezUprizoritveAliDogodka(ApiTester $I)
    {
//        $this->expect($this->uprizoritev || $this->dogodek, "Uprizoritev ali dogodek pri arhivaliji sta obvezna", 1000350);
//        $this->expect(!($this->uprizoritev && $this->dogodek), "Arhivalija ima  lahko samo ali uprizoritev ali oseba - ne oba hkrati", 1000351);

        $data = [
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
            'uprizoritev'       => null,
        ];

        // test validacije - obstajati mora ali uprizoritev ali dogodek
        $resp = $I->failToCreate($this->restUrl, $data);
        $I->assertNotEmpty($resp);
        // testiramo na enako številko napake kot je v validaciji
        $I->assertEquals(1000350, $resp[0]['code']);
    }

}
