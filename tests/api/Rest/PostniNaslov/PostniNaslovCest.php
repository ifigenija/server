<?php

namespace Rest\PostniNaslov;

use ApiTester;

/**
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto
 *      relacije z drugimi entitetami
 *      - oseba
 *      - popa
 *      - drzava
 *      getlist različne variante relacij
 *      - vse
 *      - oseba/popa
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
        $data = [
            'naziv'         => 'zz',
            'ime'           => 'zz',
            'priimek'       => 'zz',
            'funkcija'      => 'zz',
            'srednjeIme'    => 'zz',
            'psevdonim'     => 'zz',
            'email'         => 'x@xxx.xx',
            'datumRojstva'  => '1973-28-03T04:30:00',
            'emso'          => 'ZZ',
            'davcna'        => 'ZZ123',
            'spol'          => 'M',
            'opombe'        => 'zz',
            'drzavljanstvo' => 'zz',
            'drzavaRojstva' => 'zz',
            'krajRojstva'   => 'zz',
            'user'          => null,
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
            'jeeu'       => false,
            'privzeti'   => true,
        ];
        $this->obj = $pnaslov   = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals('zz', $pnaslov['nazivDva']);
        $I->assertNotEmpty($pnaslov['id']);

        //kreiramo še enega
        $data    = [
            'popa'       => $this->objPopa['id'],
            'oseba'      => null,                 
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

        $resp = $I->successfullyGetList($listUrl, []);
//        codecept_debug($resp);
        $list = $resp['data'];
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

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        $I->assertEquals(1, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
        $I->assertEquals("ww", $list[0]['ulica']);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListVse(ApiTester $I)
    {
        $listUrl = $this->restUrl . "/vse";
        codecept_debug($listUrl);
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];

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
        $ent          = $this->obj;
        $ent['naziv'] = 'tralala';
        codecept_debug($ent);

        $ent = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals('tralala', $ent['naziv']);
    }

    /**
     * Preberi zapis in preveri vsa polja
     * 
     * @depends update
     * @param ApiTester $I
     */
    public function read(ApiTester $I)
    {
        $ent = $I->successfullyGet($this->restUrl, $this->obj['id']);

        $I->assertEquals($ent['popa'], null);
        $I->assertEquals($ent['oseba'], $this->objOseba['id']);
        $I->assertEquals($ent['naziv'], 'tralala');
        $I->assertEquals($ent['nazivDva'], 'zz');
        $I->assertEquals($ent['ulica'], 'zz');
        $I->assertEquals($ent['ulicaDva'], 'zz');
        $I->assertEquals($ent['posta'], 'zz');
        $I->assertEquals($ent['postaNaziv'], 'zz');
        $I->assertEquals($ent['pokrajina'], 'zz', "pokrajina");
        codecept_debug($ent);
        $I->assertEquals($ent['drzava']['id'], $this->objDrzava['id']);   // na državi je narejena hidracija
        $I->assertEquals($ent['jeeu'], FALSE);
        $I->assertEquals($ent['privzeti'], true);
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
