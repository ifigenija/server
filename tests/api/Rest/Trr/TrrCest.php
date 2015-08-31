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
        $this->obj = $trr       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals('ZZ123', $trr['banka']);
        $I->assertNotEmpty($trr['id']);

        //kreiramo še en zapis
        $data          = [
            'stevilka' => 'WW123',
            'swift'    => 'WW123',
            'bic'      => 'WW123',
            'banka'    => 'WW123',
            'popa'     => $this->lookPopa['id'],
            'oseba'    => null,
        ];
        $this->obj2 = $trr           = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($trr['id']);
        $I->assertEquals('WW123', $trr['banka']);


        //kreiramo še en zapis
        $data = [
            'stevilka' => 'A1',
            'swift'    => 'A1',
            'bic'      => 'A1',
            'banka'    => 'A1',
            'popa'     => $this->lookPopa['id'],
            'oseba'    => null, //$$ začasno izključim
        ];
        $trr  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($trr['id']);
        $I->assertEquals('A1', $trr['banka']);
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
        codecept_debug($resp);

        $I->assertEquals(1, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
        $I->assertEquals("ZZ123", $list[0]['banka']);
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

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        $I->assertEquals(2, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
        $I->assertEquals("A1", $list[0]['stevilka']);
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
        $trr          = $this->obj;
        codecept_debug($trr);
        $trr['banka'] = 'TRA123';
        codecept_debug($trr);

        $trr = $I->successfullyUpdate($this->restUrl, $trr['id'], $trr);

        $I->assertEquals('TRA123', $trr['banka']);
    }

    /**
     * @depends update
     */
    public function read(ApiTester $I)
    {
        $trr = $I->successfullyGet($this->restUrl, $this->obj['id']);

        $I->assertEquals($trr['stevilka'], 'ZZ123');
        $I->assertEquals($trr['swift'], 'ZZ123');
        $I->assertEquals($trr['bic'], 'ZZ123');
        $I->assertEquals($trr['popa'], NULL);
        $I->assertEquals($trr['oseba'], $this->lookOseba['id']);
        $I->assertEquals('TRA123', $trr['banka']);

        // preberemo še en zapis
        $trr = $I->successfullyGet($this->restUrl, $this->obj2['id']);

        $I->assertEquals($trr['stevilka'], 'WW123');
        $I->assertEquals($trr['swift'], 'WW123');
        $I->assertEquals($trr['bic'], 'WW123');
        $I->assertEquals($trr['banka'], 'WW123');
        $I->assertEquals($trr['popa'], $this->lookPopa['id']);
        $I->assertEquals($trr['oseba'], null);
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
    
       /**
     * test ali deluje lookup
        * 
     * @param ApiTester $I
     */
    public function lookup(ApiTester $I)
    {
        $ent = $I->successfullyGet($this->restUrl, $this->obj2['id']);
        
        $look1             = $I->lookupEntity("trr", $ent['stevilka'], false);
        codecept_debug($look1);
        $I->assertNotEmpty($look1);
    }

    

}
