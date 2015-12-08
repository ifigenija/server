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
    private $obj1;
    private $obj2;
    private $obj3;
    private $obj4;
    private $objOseba;
    private $lookOseba;
    private $objPopa;
    private $lookPopa;
    private $objDrzava;

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
    public function lookupOsebo(ApiTester $I)
    {
        $this->lookOseba = $ent             = $I->lookupEntity("oseba", "0006", false);
        $I->assertNotEmpty($ent);
    }

    /**
     *  Ustvari osebo
     * 
     * @param ApiTester $I
     */
//    public function createOseba(ApiTester $I)
//    {
//        $data = [
//            'naziv'         => 'zz',
//            'ime'           => 'zz',
//            'priimek'       => 'zz',
//            'funkcija'      => 'zz',
//            'srednjeIme'    => 'zz',
//            'psevdonim'     => 'zz',
//            'email'         => 'x@xxx.xx',
//            'datumRojstva'  => '1973-28-03T04:30:00',
//            'emso'          => 'ZZ',
//            'davcna'        => 'ZZ123',
//            'spol'          => 'M',
//            'opombe'        => 'zz',
//            'drzavljanstvo' => 'zz',
//            'drzavaRojstva' => 'zz',
//            'krajRojstva'   => 'zz',
//            'user'          => null,
//        ];
//
//        $this->objOseba = $oseba          = $I->successfullyCreate($this->osebaUrl, $data);
//
//        $I->assertEquals('zz', $oseba['ime']);
//        $I->assertNotEmpty($oseba['id']);
//    }

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
     * 
     * @param ApiTester $I
     */
    public function lookupPopa(ApiTester $I)
    {
        $this->lookPopa = $ent            = $I->lookupEntity("popa", "0988", false);
        $I->assertNotEmpty($ent);
    }

    /**
     *  napolnimo vsaj en zapis
     *
     * @depends lookupOsebo
     * @depends lookupPopa
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data       = [
            'popa'       => null,
            'oseba'      => $this->lookOseba['id'],
            'naziv'      => 'zz',
            'ulica'      => 'zz',
            'ulicaDva'   => 'zz',
            'posta'      => 'zz',
            'postaNaziv' => 'zz',
            'pokrajina'  => 'zz',
            'drzava'     => $this->objDrzava['id'],
            'jeeu'       => false,
            'privzeti'   => true,
        ];
        $this->obj1 = $pnaslov    = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals('zz', $pnaslov['naziv']);
        $I->assertNotEmpty($pnaslov['id']);

        //kreiramo jih še nekaj za sort
        $data    = [
            'popa'       => $this->lookPopa['id'],
            'oseba'      => null,
            'naziv'      => 'ww',
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

        $data    = [
            'naziv'      => 'aa',
            'popa'       => $this->lookPopa['id'],
            'oseba'      => null,
            'ulica'      => 'aa',
            'ulicaDva'   => 'aa',
            'posta'      => 'aa',
            'postaNaziv' => 'aa',
            'pokrajina'  => 'aa',
            'drzava'     => $this->objDrzava['id'],
            'jeeu'       => true,
            'privzeti'   => true,
        ];
        $pnaslov = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($pnaslov['id']);

        /**
         * še preverjanja avtorizacij, posebnih dovoljenj
         */
        $dataOs = [
            'oseba'      => $this->lookOseba['id'],
            'popa'       => null,
            'naziv'      => 'nas ose',
            'ulica'      => 'nas ose',
            'ulicaDva'   => 'nas ose',
            'posta'      => 'nas ose',
            'postaNaziv' => 'nas ose',
            'pokrajina'  => 'nas ose',
            'drzava'     => $this->objDrzava['id'],
            'jeeu'       => false,
            'privzeti'   => true,
        ];
        $dataPo = [
            'popa'       => $this->lookPopa['id'],
            'oseba'      => null,
            'naziv'      => 'nas popa',
            'ulica'      => 'nas popa',
            'ulicaDva'   => 'nas popa',
            'posta'      => 'nas popa',
            'postaNaziv' => 'nas popa',
            'pokrajina'  => 'nas popa',
            'drzava'     => $this->objDrzava['id'],
            'jeeu'       => false,
            'privzeti'   => true,
        ];

        /*
         * uporabnik brez PostniNaslov-write dovoljenja
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$rudi, \IfiTest\AuthPage::$rudiPass);
        $resp = $I->failToCreate($this->restUrl, $dataOs);
        codecept_debug($resp);
        $I->assertEquals(1000008, $resp[0]['code']);

        /*
         * uporabnik brez OsebniPodatki-write dovoljenja
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vinko, \IfiTest\AuthPage::$vinkoPass);
        $resp       = $I->failToCreate($this->restUrl, $dataOs);
        codecept_debug($resp);
        $I->assertEquals(1000009, $resp[0]['code']);
        /**
         * za naslov od popa ima pravice
         */
        $this->obj3 = $ent        = $I->successfullyCreate($this->restUrl, $dataPo);

        /*
         * uporabnik z OsebniPodatki-write dovoljenjem
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vihra, \IfiTest\AuthPage::$vihraPass);
        $this->obj4 = $ent        = $I->successfullyCreate($this->restUrl, $dataOs);
    }

    /**
     * preberi vse naslove od osebe
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoOsebi(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?oseba=" . $this->lookOseba['id'];

        $resp = $I->successfullyGetList($listUrl, []);
//        codecept_debug($resp);
        $list = $resp['data'];
//        codecept_debug($list);

        $I->assertEquals(2, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
//        $I->assertEquals("zz", $list[0]['ulica']);


        /**
         * še preverjanja avtorizacij, posebnih dovoljenj
         */
        /*
         * uporabnik brez PostniNaslov-read dovoljenja
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$breznik, \IfiTest\AuthPage::$breznikPass);
        $resp = $I->failToGetList($listUrl, []);
        codecept_debug($resp);
        $I->assertEquals(1000012, $resp[0]['code']);

        /*
         * uporabnik brez OsebniPodatki-read dovoljenja
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$rudi, \IfiTest\AuthPage::$rudiPass);
        $resp = $I->failToGetList($listUrl, []);
        codecept_debug($resp);
        $I->assertEquals(1001640, $resp[0]['code']);

        /*
         * uporabnik z OsebniPodatki-read dovoljenjem
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$cene, \IfiTest\AuthPage::$cenePass);
        $resp = $I->successfullyGetList($listUrl, []);
    }

    /**
     * preberi vse naslove od poslovnega partnerja
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoPopa(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?popa=" . $this->lookPopa['id'];
        codecept_debug($listUrl);

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        $totRec = $resp['state']['totalRecords'];
        codecept_debug($list);
        $I->assertGreaterThanOrEqual(3, $totRec);
        $I->assertEquals("aa", $list[0]['naziv']);
        $I->assertEquals("ww", $list[$totRec - 1]['naziv']);


        /**
         * še preverjanja avtorizacij, posebnih dovoljenj
         */
        /*
         * uporabnik brez PostniNaslov-read dovoljenja
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$breznik, \IfiTest\AuthPage::$breznikPass);
        $resp = $I->failToGetList($listUrl, []);
        codecept_debug($resp);
        $I->assertEquals(1000012, $resp[0]['code']);

        /*
         * uporabnik brez OsebniPodatki-read dovoljenja
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$rudi, \IfiTest\AuthPage::$rudiPass);
        $resp = $I->successfullyGetList($listUrl, []);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
//    public function getListVse(ApiTester $I)
//    {
//        $listUrl = $this->restUrl . "/vse";
//        codecept_debug($listUrl);
//        $resp    = $I->successfullyGetList($listUrl, []);
//        $list    = $resp['data'];
//
//        $I->assertNotEmpty($list);
//        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
////        $I->assertEquals("ww", $list[0]['naziv']);      //sortirano je po nazivu
//    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent          = $this->obj1;
        $ent['naziv'] = 'tralala';
        codecept_debug($ent);

        $ent = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals('tralala', $ent['naziv']);


        /**
         * še preverjanja avtorizacij, posebnih dovoljenj
         */
        $entOs          = $this->obj4;
        $entOs['naziv'] = 'ZA ose';
        codecept_debug($entOs);
        $I->assertNotNull($entOs['oseba']);

        $entPo          = $this->obj3;
        $entOs['naziv'] = 'ZA popa';
        $I->assertNull($entPo['oseba']);

        /*
         * uporabnik brez PostniNaslov-write dovoljenja
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$rudi, \IfiTest\AuthPage::$rudiPass);
        $resp = $I->failToUpdate($this->restUrl, $entOs['id'], $entOs);
        codecept_debug($resp);
        $I->assertEquals(1000101, $resp[0]['code']);

        /*
         * uporabnik brez OsebniPodatki-write dovoljenja
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vinko, \IfiTest\AuthPage::$vinkoPass);
        $resp = $I->failToUpdate($this->restUrl, $entOs['id'], $entOs);
        codecept_debug($resp);
        $I->assertEquals(1000101, $resp[0]['code']);
        /**
         * za naslov od popa ima pravice
         */
        $ent  = $I->successfullyUpdate($this->restUrl, $entPo['id'], $entPo);

        /*
         * uporabnik z OsebniPodatki-write dovoljenjem
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vihra, \IfiTest\AuthPage::$vihraPass);
        $ent = $I->successfullyUpdate($this->restUrl, $entOs['id'], $entOs);
    }

    /**
     * Preberi zapis in preveri vsa polja
     * 
     * @depends update
     * @param ApiTester $I
     */
    public function read(ApiTester $I)
    {
        $ent = $I->successfullyGet($this->restUrl, $this->obj1['id']);

        $I->assertEquals($ent['popa'], null);
        $I->assertEquals($ent['oseba'], $this->lookOseba['id']);
        $I->assertEquals($ent['naziv'], 'tralala');
        $I->assertEquals($ent['ulica'], 'zz');
        $I->assertEquals($ent['ulicaDva'], 'zz');
        $I->assertEquals($ent['posta'], 'zz');
        $I->assertEquals($ent['postaNaziv'], 'zz');
        $I->assertEquals($ent['pokrajina'], 'zz', "pokrajina");
        codecept_debug($ent);
        $I->assertEquals($ent['drzava']['id'], $this->objDrzava['id']);   // na državi je narejena hidracija
        $I->assertEquals($ent['jeeu'], FALSE);
        $I->assertEquals($ent['privzeti'], true);


        /**
         * še preverjanja avtorizacij, posebnih dovoljenj
         */
        $entOs = $this->obj4;
        $I->assertNotNull($entOs['oseba']);

        $entPo = $this->obj3;
        $I->assertNull($entPo['oseba']);

        /*
         * uporabnik brez PostniNaslov-read dovoljenja
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$breznik, \IfiTest\AuthPage::$breznikPass);
        $resp = $I->failToGet($this->restUrl, $entOs['id']);
        codecept_debug($resp);
        $I->assertEquals(100099, $resp[0][0]['code']);

        /*
         * uporabnik brez OsebniPodatki-read dovoljenja
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$rudi, \IfiTest\AuthPage::$rudiPass);
        $resp = $I->failToGet($this->restUrl, $entOs['id']);
        codecept_debug($resp);
        $I->assertEquals(100099, $resp[0][0]['code']);
        /**
         * za naslov od popa ima pravice
         */
        $ent  = $I->successfullyGet($this->restUrl, $entPo['id']);

        /*
         * uporabnik z OsebniPodatki-read dovoljenjem
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$cene, \IfiTest\AuthPage::$cenePass);
        $ent = $I->successfullyGet($this->restUrl, $entOs['id']);
    }

    /**
     *  probamo kreirati PostniNaslov brez osebe in poslovnega partnerja, kar mora validator preprečiti
     *
     * @param ApiTester $I
     */
    public function createNaslovBrezPopaInOsebe(ApiTester $I)
    {
        $data = [
            'popa'  => null,
            'oseba' => null,
            'naziv' => 'xx',
            'jeeu'  => true,
        ];
        $resp = $I->failToCreate($this->restUrl, $data);

        $I->assertNotEmpty($resp);
        // testiramo na enako številko napake kot je v validaciji
//        $I->assertEquals(1000304, $resp[0]['code']);
    }

    /**
     *  kreirati naslov z jeeu null
     *
     * @param ApiTester $I
     */
    public function createNaslovBrezJeeu(ApiTester $I)
    {
        $data = [
            'popa'       => null,
            'oseba'      => $this->lookOseba['id'],
            'naziv'      => 'jeee',
            'posta'      => 'aa',
            'postaNaziv' => 'aa',
            'ulica'      => 'aa',
            'jeeu'       => FALSE,
            'privzeti'   => true,
        ];
        $resp = $I->successfullyCreate($this->restUrl, $data);

        $I->assertNotEmpty($resp);

        $data = [
            'posta'      => 'aa',
            'postaNaziv' => 'aa',
            'ulica'      => 'aa',
            'popa'       => null,
            'oseba'      => $this->lookOseba['id'],
            'naziv'      => 'jeee null',
            'jeeu'       => null,
            'privzeti'   => true,
        ];
        $resp = $I->successfullyCreate($this->restUrl, $data);

        $I->assertNotEmpty($resp);
        codecept_debug($resp);
    }

    /**
     * zbriše PostniNaslov
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function delete(ApiTester $I)
    {
        $pnaslov = $I->successfullyDelete($this->restUrl, $this->obj1['id']);

        $I->failToGet($this->restUrl, $this->obj1['id']);


        /**
         * še preverjanja avtorizacij, posebnih dovoljenj
         */
        $entOs = $this->obj4;
        $I->assertNotNull($entOs['oseba']);

        $entPo = $this->obj3;
        $I->assertNull($entPo['oseba']);

        /*
         * uporabnik brez PostniNaslov-write dovoljenja
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$rudi, \IfiTest\AuthPage::$rudiPass);
        $resp = $I->failToDelete($this->restUrl, $entOs['id']);
        codecept_debug($resp);
        $I->assertEquals(100201, $resp[0]['code']);

        /*
         * uporabnik brez OsebniPodatki-write dovoljenja
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vinko, \IfiTest\AuthPage::$vinkoPass);
        $resp = $I->failToDelete($this->restUrl, $entOs['id']);
        codecept_debug($resp);
        $I->assertEquals(100201, $resp[0]['code']);
        /**
         * za naslov od popa ima pravice
         */
        $ent  = $I->successfullyDelete($this->restUrl, $entPo['id']);

        /*
         * uporabnik z OsebniPodatki-write dovoljenjem
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vihra, \IfiTest\AuthPage::$vihraPass);
        $ent = $I->successfullyDelete($this->restUrl, $entOs['id']);
    }

}
