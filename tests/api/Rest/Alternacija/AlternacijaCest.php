<?php

namespace Rest\Alternacija;

use ApiTester;

/**
 * Description of AlternacijaCest
 * 
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto - je ni
 *      relacije z drugimi entitetami
 *      - funkcija
 *      - zaposlitev (zaposlitev)
 *      - oseba
 *      - pogodba
 * - storitve O2M $$
 *      getlist različne variante relacij
 *      - vse
 *      - funkcija
 *      - uprizoritev
 *
 * @author rado
 */
class AlternacijaCest
{

    private $restUrl                = '/rest/alternacija';
    private $osebaUrl               = '/rest/oseba';
    private $funkcijaUrl            = '/rest/funkcija';
    private $uprizoritevUrl         = '/rest/uprizoritev';
    private $zaposlitevUrl          = '/rest/zaposlitev';
    private $produkcijskaHisaUrl    = '/rest/produkcijskahisa';
    private $koprodukcijaUrl        = '/rest/produkcijadelitev';
    private $pogodbaUrl             = '/rest/pogodba';
    private $dogodekUrl             = '/rest/dogodek';
    private $terminStoritveUrl      = '/rest/terminstoritve';
    private $obj;
    private $obj2;
    private $obj3;
    private $objOseba;
    private $lookOseba;
    private $objFunkcija;
    private $lookFunkcija;
    private $objUprizoritev;
    private $lookUprizoritev1;
    private $lookUprizoritev2;
    private $objZaposlitev;
    private $lookProdukcijskaHisa;
    private $objProdukcijskaHisa;
    private $objKoprodukcija1;
    private $objKoprodukcija2;
    private $objPogodba;
    private $objTerminStoritve1;
    private $objTerminStoritve2;
    private $objDogodek;
    private $lookupProdukcijskaHisa = '/lookup/produkcijskahisa';

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     * najde nek dogodek
     * 
     * @param ApiTester $I
     */
    public function getListDogodkov(ApiTester $I)
    {
        $resp             = $I->successfullyGetList($this->dogodekUrl, []);
        $list             = $resp['data'];
        $I->assertNotEmpty($list);
        $this->objDogodek = $drzava           = array_pop($list);
        $I->assertNotEmpty($drzava);
    }

    /**
     * @param ApiTester $I
     */
    public function lookupFunkcijo(ApiTester $I)
    {
        $this->lookFunkcija = $look               = $I->lookupEntity("funkcija", "Tezej", false);
        $I->assertNotEmpty($look);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupOsebo(ApiTester $I)
    {
        $this->lookOseba = $ent             = $I->lookupEntity("oseba", "0006", false);
        $I->assertNotEmpty($ent);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupUprizoritev(ApiTester $I)
    {
        $this->lookUprizoritev1 = $look                   = $I->lookupEntity("uprizoritev", "0001", false);
        $I->assertNotEmpty($look);

        $this->lookUprizoritev2 = $look                   = $I->lookupEntity("uprizoritev", "0002", false);
        $I->assertNotEmpty($look);
    }

    /**
     *  kreiramo zapis
     * 
     * @depends lookupOsebo
     * 
     * @param ApiTester $I
     */
    public function createZaposlitev(ApiTester $I)
    {
        $data                = [
            'status'              => 'A',
            'zacetek'             => '2010-02-01T00:00:00+0100',
            'konec'               => '2010-02-01T00:00:00+0100',
            'tip'                 => 1,
            'delovnaObveza'       => 2,
            'malica'              => 'zz',
            'izmenskoDelo'        => true,
            'individualnaPogodba' => true,
            'jeZaposlenVdrugemJz' => TRUE,
            'jeNastopajoci'       => TRUE,
            'oseba'               => $this->lookOseba['id'],
        ];
        $this->objZaposlitev = $ent                 = $I->successfullyCreate($this->zaposlitevUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['status'], 'A');
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupProdukcijskaHisa(ApiTester $I)
    {

        $resp                       = $I->successfullyGetList($this->lookupProdukcijskaHisa, []);
        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->assertTrue(array_key_exists('data', $resp), "ima data");
        $this->lookProdukcijskaHisa = $resp['data'][0];
//        $I->assertTrue(array_key_exists('label', $resp['data'][0]), "ima labelo");
//        $I->assertTrue(array_key_exists('totalRecords', $resp['state']), "ima total records");
        $I->assertGreaterThanOrEqual(1, $resp['state']['totalRecords'], "total records");
    }

    /**
     *  kreiramo zapis
     * 
     * @depends lookupOsebo
     * @depends lookupFunkcijo
     * @depends createZaposlitev
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'zaposlen'   => false, // v validaciji postavimo na true, če je zaposlitev
            'zacetek'    => '2010-02-01T00:00:00+0100',
            'konec'      => '2020-02-01T00:00:00+0100',
            'opomba'     => 'zz',
            'sort'       => 1,
            'privzeti'   => true,
            'aktivna'    => true,
            'funkcija'   => $this->lookFunkcija['id'],
            'zaposlitev' => $this->objZaposlitev['id'],
            'oseba'      => $this->lookOseba['id'],
            'pogodba'    => null,
            'pomembna'   => TRUE,
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['opomba'], 'zz');

        // kreiram še en zapis
        $data       = [
            'zaposlen'   => false, // se lahko povozi v validaciji
            'zacetek'    => '2011-02-01T00:00:00+0100',
            'konec'      => '2021-02-01T00:00:00+0100',
            'opomba'     => 'aa',
            'sort'       => 2,
            'privzeti'   => true,
            'aktivna'    => true,
            'funkcija'   => $this->lookFunkcija['id'],
            'zaposlitev' => null,
            'oseba'      => $this->lookOseba['id'],
            'pogodba'    => null,
            'pomembna'   => FALSE,
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['opomba'], 'aa');

        // kreiram še en zapis
        $data       = [
            'zaposlen'   => false,
            'zacetek'    => '2013-02-01T00:00:00+0100',
            'konec'      => '2024-02-01T00:00:00+0100',
            'opomba'     => 'bb',
            'sort'       => 3,
            'privzeti'   => true,
            'aktivna'    => true,
            'funkcija'   => $this->lookFunkcija['id'],
            'zaposlitev' => $this->objZaposlitev['id'],
            'oseba'      => $this->lookOseba['id'],
            'pogodba'    => null,
            'imaPogodbo' => false,
            'pomembna'   => FALSE,
        ];
        $this->obj3 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['opomba'], 'bb');
    }

    /**
     * preberi vse zapise po določeni funkciji
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoFunkciji(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?funkcija=" . $this->lookFunkcija['id'];

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];
        codecept_debug($resp);

        $I->assertGreaterThanOrEqual(4, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
//        $I->assertEquals("xx", $list[0]['status']);      // odvisno od sortiranja
    }

    /**
     * preberi vse zapise po določeni uprizoritvi
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoUprizoritvi(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?uprizoritev=" . $this->lookUprizoritev2['id'];
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];
        codecept_debug($resp);

        $I->assertGreaterThanOrEqual(9, $resp['state']['totalRecords'], "po uprizoritvi");
//        $I->assertNotEmpty($list);
//        $I->assertEquals("xx", $list[0]['status']);      // odvisno od sortiranja
        // še po uprizoritvi, ki nima alternacij
        $listUrl = $this->restUrl . "?uprizoritev=" . $this->lookUprizoritev1['id'];
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];
        codecept_debug($resp);

        $I->assertEquals(0, $resp['state']['totalRecords']);
//        $I->assertNotEmpty($list);
//        $I->assertEquals("xx", $list[0]['status']);      // odvisno od sortiranja
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
//    public function getListVse(ApiTester $I)
//    {
//        $listUrl = $this->restUrl . "/vse";             // $$ rb to je nehalo delovati - ne vem zakaj
//        codecept_debug($listUrl);
//        $resp    = $I->successfullyGetList($listUrl, []);
//        $list    = $resp['data'];
//        codecept_debug($list);
//
//
//        $I->assertNotEmpty($list);
//        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
////        $I->assertEquals("zz", $list[0]['status']);      //glede na sort
//    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent           = $this->obj;
        $ent['opomba'] = 'uu';

        $this->obj = $entR      = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['opomba'], 'uu');
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

        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['zacetek'], '2010-02-01T00:00:00+0100');
        $I->assertEquals($ent['konec'], '2020-02-01T00:00:00+0100');
        $I->assertEquals($ent['opomba'], 'uu');
        $I->assertEquals($ent['sort'], 1);
        $I->assertEquals($ent['privzeti'], true);
        $I->assertEquals($ent['aktivna'], true, "aktivna");
        $I->assertEquals($ent['funkcija']['id'], $this->lookFunkcija['id']);
        $I->assertEquals($ent['zaposlitev'], $this->objZaposlitev['id'], "zaposlitev");
        $I->assertEquals($ent['zaposlen'], true);               // v validaciji se bi moralo postaviti na true, če je zaposlitev
        $I->assertEquals($ent['oseba']['id'], $this->lookOseba['id'], "oseba");
        $I->assertEquals($ent['pogodba'], $this->objPogodba['id']);
        $I->assertEquals($ent['imaPogodbo'], false);
        $I->assertEquals($ent['pomembna'], true, "pomembna");
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
     * kreiramo vsaj en zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function createVecTerminovStoritev(ApiTester $I)
    {
        $data                     = [
            'planiranZacetek' => '2011-02-01T00:00:00+0100',
            'planiranKonec'   => '2012-02-01T00:00:00+0100',
            'zacetek'         => '2013-02-01T00:00:00+0100',
            'konec'           => '2014-02-01T00:00:00+0100',
            'planiranoTraja'  => 1.23,
            'dogodek'         => $this->objDogodek['id'],
            'alternacija'     => $this->obj2['id'],
            'oseba'           => $this->lookOseba['id'],
        ];
        $this->objTerminStoritve1 = $ent                      = $I->successfullyCreate($this->terminStoritveUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['planiranoTraja'], 1.23);


// še en zapis
        $data                     = [
            'planiranZacetek' => '2013-02-01T00:00:00+0100',
            'planiranKonec'   => '2014-02-01T00:00:00+0100',
            'zacetek'         => NULL,
            'konec'           => NULL,
            'planiranoTraja'  => 6.32,
            'dogodek'         => $this->objDogodek['id'],
            'alternacija'     => $this->obj2['id'],
            'oseba'           => $this->lookOseba['id'],
        ];
        $this->objTerminStoritve1 = $ent                      = $I->successfullyCreate($this->terminStoritveUrl, $data);
        $I->assertNotEmpty($ent['id']);
    }

    /**
     * preberemo relacije
     * 
     * @depends createVecTerminovStoritev
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeSTerminiStoritev(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "storitve", "");
//        codecept_debug($resp);
        $I->assertEquals(2, count($resp));

        // get po oseba id  
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "storitve", $this->objTerminStoritve1['id']);
        $I->assertEquals(1, count($resp));
    }

    //$$ še relacije vec t.s.
//    /**
//     * spremenim zapis - dodam pogodbo
//     * 
//     * @depends create
//     * @param ApiTester $I
//     */
//    public function updateZDodajPogodbo(ApiTester $I)
//    {
//        $ent            = $this->obj3;
//        codecept_debug($ent);
//        $ent['pogodba'] = $this->objPogodba['id'];
//        $entR           = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
//
//        $I->assertEquals($entR['pogodba'], $this->objPogodba['id']);
//        $I->assertEquals($entR['imaPogodbo'], true);   // nastavi  v validaciji
//    }

    /**
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function odstranimZaposlitev(\ApiTester $I)
    {
        $ent               = $I->successfullyGet($this->restUrl, $this->obj3['id']);
        $I->assertEquals($ent['zaposlitev'], $this->objZaposlitev['id'], "zaposlitev");
        $I->assertEquals($ent['zaposlen'], true);               // v validaciji se bi moralo postaviti na true, če je zaposlitev
        // odstranimo zaposlitev
        $ent['zaposlitev'] = null;
        $ent               = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertEquals($ent['zaposlitev'], null, "zaposlitev");
        $I->assertEquals($ent['zaposlen'], false);

        // preverimo zaposlitev po Get
        $ent = $I->successfullyGet($this->restUrl, $ent['id']);
        $I->assertEquals($ent['zaposlitev'], null, "zaposlitev");
        $I->assertEquals($ent['zaposlen'], false);
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updateZaValidacijoDatumov(ApiTester $I)
    {
        $ent            = $I->successfullyGet($this->restUrl, $this->obj3['id']);
        
        // enaka datuma
        $ent['zacetek'] = '2016-02-01T00:00:00+0100';
        $ent['konec']   = '2016-02-01T00:00:00+0100';
        $ent            = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
       
        // prazen konec
        $ent['konec']   = '';
        $ent            = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        //  konec pred začetkom
        $ent['konec'] = '2016-01-31T00:00:00+0100';
        $resp         = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertEquals(1000337, $resp[0]['code']);
       
        // prazen začetek
        $ent['zacetek'] = '';
        $ent['konec']   = '2016-02-01T00:00:00+0100';
        $ent            = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
    }

}
