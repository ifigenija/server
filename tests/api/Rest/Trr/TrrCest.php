<?php

namespace Rest\Trr;

use ApiTester;

/**
 * Priprava ostalih entitet
 *      - create oseba
 * 
 *      - create
 *      - list 
 *      - update
 *      - read 
 *      - delete
 *      - validacija 
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
     * @depends getListDrzava
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

    // napolnimo vsaj en zapis
    public function create(ApiTester $I)
    {
        $data      = [
            'stevilka' => 'ZZ123',
            'swift'    => 'ZZ123',
            'bic'      => 'ZZ123',
            'banka'    => 'ZZ123',
            'popa'     => NULL,
            'oseba'    => $this->objOseba['id'],
        ];
        $this->obj = $trr       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals('ZZ123', $trr['banka']);
        $I->assertNotEmpty($trr['id']);

        //kreiramo še en zapis
        $data = [
            'stevilka' => 'WW123',
            'swift'    => 'WW123',
            'bic'      => 'WW123',
            'banka'    => 'WW123',
            'popa'     => $this->objPopa,
            'oseba'    => null,
        ];
        $trr  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($trr['id']);
        $I->assertEquals('WW123', $trr['banka']);
    }

    /**
     * preberi vse naslove od osebe
     * 
     * @depends create
     * @depends createOseba
     * @param ApiTester $I
     */
    public function getListPoOsebi(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?oseba=" . $this->objOseba['id'];

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];
        codecept_debug($resp);

        $I->assertEquals(1, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
        $I->assertEquals("ZZ123", $list[0]['banka']);
    }

    /**
     * preberi vse naslove od poslovnega partnerja
     * 
     * @depends create
     * @depends createPopa
     * @param ApiTester $I
     */
    public function getListPoPopa(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?popa=" . $this->objPopa['id'];

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        $I->assertEquals(1, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
        $I->assertEquals("WW123", $list[0]['banka']);
    }

    /**
     * @depends create
     */
    public function getList(ApiTester $I)
    {
        $resp = $I->successfullyGetList($this->restUrl, []);
        $list = $resp['data'];

        $I->assertNotEmpty($list);
        $this->id = array_pop($list)['id'];
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $trr          = $this->obj;
        $trr['banka'] = 'TRA123';

        $trr = $I->successfullyUpdate($this->restUrl, $trr['id'], $trr);

        $I->assertEquals('TRA123', $trr['banka']);
    }

    /**
     * @depends create
     */
    public function readTrr(ApiTester $I)
    {
        $trr = $I->successfullyGet($this->restUrl, $this->obj['id']);

        $I->assertEquals($trr['stevilka'], 'ZZ123');
        $I->assertEquals($trr['swift'], 'ZZ123');
        $I->assertEquals($trr['bic'], 'ZZ123');
        $I->assertEquals($trr['popa'], NULL);
        $I->assertEquals($trr['oseba'], $this->objOseba['id']);

        $I->assertEquals('TRA123', $trr['banka']);
    }

    /**
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $trr = $I->successfullyDelete($this->restUrl, $this->obj['id']);

        $I->failToGet($this->restUrl, $this->obj['id']);
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

}
