<?php

namespace Rest\PostniNaslov;

use ApiTester;

/**
 * Priprava ostalih relacij, ki so pogoj za kreiranje
 *      - create oseba
 * - create popa
 *      - list država
 * akcije z entiteto PostniNaslov
 *      - create naslov osebe
 * - create naslov popa
 * 
 *      - list 
 *      - update
 *      - read, preveri vsa polja
 * validacija
 * - create naslov oseba+popa 
 * - create naslov prazen naziv
 * 
 *      - delete 
 * 
 */
class PostniNaslovCest
{

    private $restUrl   = '/rest/postninaslov';
    private $osebaUrl  = '/rest/oseba';
    private $popaUrl   = '/rest/popa';
    private $drzavaUrl = '/rest/drzava';
    private $obj;
    private $objOseba;
    private $objPopa;
    private $objDrzava;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     *  Ustvari osebo
     * 
     * @param ApiTester $I
     */
    public function createOseba(ApiTester $I)
    {
        $data           = [
            'naziv'       => 'zz',
            'ime'         => 'zz',
            'priimek'     => 'zz',
            'email'       => 'x@xxx.xx',
            'krajRojstva' => 'zz',
        ];
        $this->objOseba = $oseba          = $I->successfullyCreate($this->osebaUrl, $data);
        $I->assertEquals('zz', $oseba['ime']);
        $I->assertNotEmpty($oseba['id']);
    }

    /**
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
     * kreiram poslovnega partnerja
     * 
     * @param ApiTester $I
     */
    public function createPopa(ApiTester $I)
    {
        $data          = [
            'sifra'     => 'ZZ12',
            'tipkli'    => '3', // $$ rb ko bodo opcije porihtane
            'stakli'    => 'AK', // $$ rb ko bodo opcije porihtane
            'naziv'     => 'zz',
            'naziv1'    => 'zz',
            'panoga'    => 'zz',
            'email'     => 'z@zzz.zz',
            'url'       => 'zz',
            'opomba'    => 'zz',
            'drzava'    => $this->objDrzava['id'],
            'idddv'     => 'zz',
            'maticna'   => 'ZZ123',
            'zavezanec' => 'Da',
            'jeeu'      => 'Da',
            'datZav'    => '2010-02-01T00:00:00+0100',
            'datnZav'   => '2017-02-01T00:00:00+0100',
            'zamejstvo' => FALSE,
        ];
        $this->objPopa = $popa          = $I->successfullyCreate($this->popaUrl, $data);

//        codecept_debug($popa);
        $I->assertNotEmpty($popa['id']);
        $I->assertEquals('ZZ12', $popa['sifra']);
    }

    /**
     *  napolnimo vsaj en zapis
     *
     * @depends createOseba
     * @depends createPopa
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'popa'       => null,
            'oseba'      => $this->objOseba['id'],
            'naziv'      => 'zz',
            'nazivDva'   => 'zz',
            'ulica'      => 'zz',
            'ulicaDva'   => 'zz',
            'posta'      => 'zz',
            'postaNaziv' => 'zz',
            'pokrajina'  => 'zz',
            'drzava'     => $this->objDrzava['id'],
            'jeeu'       => FALSE,
            'privzeti'   => true,
        ];
        $this->obj = $pnaslov   = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals('zz', $pnaslov['nazivDva']);
        $I->assertNotEmpty($pnaslov['id']);

        //kreiramo še enega
        $data    = [
            'popa'       => $this->objPopa,
            'naziv'      => 'ww',
            'nazivDva'   => 'ww',
            'ulica'      => 'ww',
            'ulicaDva'   => 'ww',
            'posta'      => 'ww',
            'postaNaziv' => 'ww',
            'pokrajina'  => 'ww',
            'drzava'     => $this->objDrzava['id'],
            'jeeu'       => true,
            'privzeti'   => true,
        ];
        $pnaslov = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($pnaslov['id']);
        $I->assertEquals('ww', $pnaslov['nazivDva']);
    }

    /**
     * preberi vse naslove od osebe
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoOsebi(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?oseba=" . $this->objOseba['id'];
        
        $resp    = $I->successfullyGetList($listUrl, []);
//        codecept_debug($resp);
        $list    = $resp['data'];
//        codecept_debug($list);

        $I->assertEquals(1, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
        $I->assertEquals("zz", $list[0]['ulica']);
    }

    /**
     * preberi vse naslove od poslovnega partnerja
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoPopa(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?popa=" . $this->objPopa['id'];
        codecept_debug($listUrl);
        
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];
        
        $I->assertEquals(1, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
        $I->assertEquals("ww", $list[0]['ulica']);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getList(ApiTester $I)         
    {
        $listUrl = $this->restUrl . "/vse";
        codecept_debug($listUrl);
        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];
        
        $I->assertNotEmpty($list);
        $I->assertEquals(2, $resp['state']['totalRecords']);
        $I->assertEquals("ww", $list[0]['naziv']);      //sortirano je po nazivu
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $pnaslov          = $this->obj;
        $pnaslov['naziv'] = 'tralala';

        $pnaslov = $I->successfullyUpdate($this->restUrl, $pnaslov['id'], $pnaslov);

        $I->assertEquals('tralala', $pnaslov['naziv']);
    }

    /**
     * Preberi zapis in preveri vsa polja
     * 
     * @param ApiTester $I
     */
    public function read(ApiTester $I)
    {
        $pnaslov = $I->successfullyGet($this->restUrl, $this->obj['id']);

        $I->assertEquals(null, $pnaslov['popa']);
        $I->assertEquals($this->objOseba['id'], $pnaslov['oseba']);
        $I->assertEquals('tralala', $pnaslov['naziv']);
        $I->assertEquals('zz', $pnaslov['nazivDva']);
        $I->assertEquals('zz', $pnaslov['ulica']);
        $I->assertEquals('zz', $pnaslov['ulicaDva']);
        $I->assertEquals('zz', $pnaslov['posta']);
        $I->assertEquals('zz', $pnaslov['postaNaziv']);
        $I->assertEquals('zz', $pnaslov['pokrajina']);
        $I->assertEquals($this->objDrzava['id'], $pnaslov['drzava'], "ni prava država");
        $I->assertEquals(false, $pnaslov['jeeu']);
        $I->assertEquals(true, $pnaslov['privzeti']);
    }

    /**
     *  probamo kreirati PostniNaslov brez osebe in poslovnega partnerja, kar mora validator preprečiti
     *
     * @param ApiTester $I
     */
    public function createNaslovBrezPopaInOsebe(ApiTester $I)
    {
        $data = [
//            'popa'  => null,
//            'oseba' => null,
            'naziv' => 'xx',
        ];
        $resp = $I->failToCreate($this->restUrl, $data);

        $I->assertNotEmpty($resp);
        // testiramo na enako številko napake kot je v validaciji
        $I->assertEquals(1000304, $resp[0]['code']);
    }

    /**
     * zbriše PostniNaslov
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function delete(ApiTester $I)
    {
        $pnaslov = $I->successfullyDelete($this->restUrl, $this->obj['id']);

        $I->failToGet($this->restUrl, $this->obj['id']);
    }

}
