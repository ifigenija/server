<?php

namespace Rest\Trr;

use ApiTester;

/**
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto
 * relacije z drugimi entitetami
 * getlist različne variante relacij
 * 
 * 
 */
class TrrCest
{

    private $restUrl   = '/rest/trr';
    private $osebaUrl  = '/rest/oseba';
    private $popaUrl   = '/rest/popa';
    private $drzavaUrl = '/rest/drzava';
    private $id        = '00000000-0000-0000-0000-000000000000';
    private $obj;
    private $obj2;
    private $obj3;
    private $obj4;
    private $objOseba;
    private $objPopa;
    private $objDrzava;
    private $lookOseba;
    private $lookPopa;

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
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'stevilka' => 'ZZ123',
            'swift'    => 'ZZ123',
            'bic'      => 'ZZ123',
            'banka'    => 'ZZ123',
            'popa'     => null,
            'oseba'    => $this->lookOseba['id'],
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals('ZZ123', $ent['banka']);
        $I->assertNotEmpty($ent['id']);

        //kreiramo še en zapis
        $data       = [
            'stevilka' => 'WW123',
            'swift'    => 'WW123',
            'bic'      => 'WW123',
            'banka'    => 'WW123',
            'popa'     => $this->lookPopa['id'],
            'oseba'    => null,
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals('WW123', $ent['banka']);


        //kreiramo še en zapis
        $data = [
            'stevilka' => 'A1',
            'swift'    => 'A1',
            'bic'      => 'A1',
            'banka'    => 'A1',
            'popa'     => $this->lookPopa['id'],
            'oseba'    => null, 
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals('A1', $ent['banka']);


        /**
         * še preverjanja avtorizacij, posebnih dovoljenj
         */
        $dataOs = [
            'oseba'    => $this->lookOseba['id'],
            'stevilka' => 'Trr osebe',
            'swift'    => 'Trr osebe',
            'bic'      => 'Trr osebe',
            'banka'    => 'Trr osebe',
            'popa'     => null,
        ];
        $dataPo = [
            'popa'     => $this->lookPopa['id'],
            'stevilka' => 'Trr popa',
            'swift'    => 'Trr popa',
            'bic'      => 'Trr popa',
            'banka'    => 'Trr popa',
            'oseba'    => null,
        ];

        /*
         * uporabnik brez Trr-write dovoljenja
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
         * za trr od popa ima pravice
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
        $list = $resp['data'];
        codecept_debug($list);

        $I->assertEquals(2, $resp['state']['totalRecords']);
//        $I->assertEquals("ZZ123", $list[0]['banka']);


        /**
         * še preverjanja avtorizacij, posebnih dovoljenj
         */
        /*
         * uporabnik brez Trr-read dovoljenja
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
        $I->assertEquals(1001620, $resp[0]['code']);

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

        $resp   = $I->successfullyGetList($listUrl, []);
        $list   = $resp['data'];
        codecept_debug($list);
        $totRec = $resp['state']['totalRecords'];
        $I->assertEquals(3, $resp['state']['totalRecords']);
        $I->assertEquals("A1", $list[0]['stevilka']);
        $I->assertEquals("WW123", $list[$totRec - 1]['stevilka']);


        /**
         * še preverjanja avtorizacij, posebnih dovoljenj
         */
        /*
         * uporabnik brez Trr-read dovoljenja
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
//        $listUrl = $this->restUrl."/vse";
//        codecept_debug($listUrl);
//        $resp    = $I->successfullyGetList($listUrl, []);
//        $list    = $resp['data'];
//
//        $I->assertNotEmpty($list);
//        $I->assertEquals(3, $resp['state']['totalRecords']);
//        $I->assertEquals("A1", $list[0]['stevilka']);      //glede na sort
//    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent          = $this->obj;
        codecept_debug($ent);
        $ent['banka'] = 'TRA123';
        codecept_debug($ent);

        $ent = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals('TRA123', $ent['banka']);


        /**
         * še preverjanja avtorizacij, posebnih dovoljenj
         */
        $entOs          = $this->obj4;
        $entOs['banka'] = 'ZA ose';
        codecept_debug($entOs);
        $I->assertNotNull($entOs['oseba']);

        $entPo          = $this->obj3;
        $entPo['banka'] = 'ZA popa';
        $I->assertNull($entPo['oseba']);


        /*
         * uporabnik brez Trr-write dovoljenja
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
         * za trr od popa ima pravice
         */
        $ent  = $I->successfullyUpdate($this->restUrl, $entPo['id'], $entPo);

        /*
         * uporabnik z OsebniPodatki-write dovoljenjem
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vihra, \IfiTest\AuthPage::$vihraPass);
        $ent = $I->successfullyUpdate($this->restUrl, $entOs['id'], $entOs);

    }

    /**
     * @depends update
     */
    public function read(ApiTester $I)
    {
        $ent = $I->successfullyGet($this->restUrl, $this->obj['id']);

        $I->assertEquals($ent['stevilka'], 'ZZ123');
        $I->assertEquals($ent['swift'], 'ZZ123');
        $I->assertEquals($ent['bic'], 'ZZ123');
        $I->assertEquals($ent['popa'], NULL);
        $I->assertEquals($ent['oseba'], $this->lookOseba['id']);
        $I->assertEquals('TRA123', $ent['banka']);

        // preberemo še en zapis
        $ent = $I->successfullyGet($this->restUrl, $this->obj2['id']);

        $I->assertEquals($ent['stevilka'], 'WW123');
        $I->assertEquals($ent['swift'], 'WW123');
        $I->assertEquals($ent['bic'], 'WW123');
        $I->assertEquals($ent['banka'], 'WW123');
        $I->assertEquals($ent['popa'], $this->lookPopa['id']);
        $I->assertEquals($ent['oseba'], null);


        /**
         * še preverjanja avtorizacij, posebnih dovoljenj
         */
        $entOs = $this->obj4;
        $I->assertNotNull($entOs['oseba']);

        $entPo = $this->obj3;
        $I->assertNull($entPo['oseba']);

        /*
         * uporabnik brez Trr-read dovoljenja
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
         * za trr od popa ima pravice
         */
        $ent  = $I->successfullyGet($this->restUrl, $entPo['id']);

        /*
         * uporabnik z OsebniPodatki-read dovoljenjem
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$cene, \IfiTest\AuthPage::$cenePass);
        $ent = $I->successfullyGet($this->restUrl, $entOs['id']);
    }

    /**
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $ent = $I->successfullyDelete($this->restUrl, $this->obj['id']);

        $I->failToGet($this->restUrl, $this->obj['id']);


        /**
         * še preverjanja avtorizacij, posebnih dovoljenj
         */
        $entOs = $this->obj4;
        $I->assertNotNull($entOs['oseba']);

        $entPo = $this->obj3;
        $I->assertNull($entPo['oseba']);


        /*
         * uporabnik brez Trr-write dovoljenja
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
         * za trr od popa ima pravice
         */
        $ent  = $I->successfullyDelete($this->restUrl, $entPo['id']);

        /*
         * uporabnik z OsebniPodatki-write dovoljenjem
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vihra, \IfiTest\AuthPage::$vihraPass);
        $ent = $I->successfullyDelete($this->restUrl, $entOs['id']);
    }

    /**
     * kreiramo trr, test validacije
     * 
     * @param ApiTester $I
     */
    public function createTrrBrezOsebeAliPopa(ApiTester $I)
    {

        $data = [
            'stevilka' => 'YY',
            'swift'    => 'YY',
            'bic'      => 'YY',
            'banka'    => 'yy',
            'popa'     => NULL,
            'oseba'    => NULL,
        ];
        // test validacije - obstajati mora ali oseba ali popa
        $resp = $I->failToCreate($this->restUrl, $data);
        $I->assertNotEmpty($resp);
        // testiramo na enako številko napake kot je v validaciji
        $I->assertEquals(1000200, $resp[0]['code']);
    }

    /**
     * test ali deluje lookup
     * 
     * @param ApiTester $I
     */
    public function lookup(ApiTester $I)
    {
        $ent = $I->successfullyGet($this->restUrl, $this->obj2['id']);

        $look1 = $I->lookupEntity("trr", $ent['stevilka'], false);
        codecept_debug($look1);
        $I->assertNotEmpty($look1);
    }

}
