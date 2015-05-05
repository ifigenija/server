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

    private $restUrl  = '/rest/trr';
    private $osebaUrl = '/rest/oseba';
    private $id       = '00000000-0000-0000-0000-000000000000';
    private $obj;
    private $objOseba;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     *  napolnimo vsaj en zapis
     * 
     * @param ApiTester $I
     */
    public function createOsebo(ApiTester $I)
    {
        $data           = [
            'ime'     => 'zz',
            'priimek' => 'zz',
        ];
        $this->objOseba = $oseba          = $I->successfullyCreate($this->osebaUrl, $data);
        $I->assertEquals('zz', $oseba['ime']);
        $I->assertNotEmpty($oseba['id']);
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

        $data      = [
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
