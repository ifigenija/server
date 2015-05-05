<?php

namespace Rest\Telefonska;

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
class TelefonskaCest
{

    private $restUrl  = '/rest/telefonska';
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

    /**
     * kreiramo telefonsko
     * 
     * @depends createOsebo
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'vrsta'    => 'Mobilni', //$$ rb - popraviti opcije, kasneje M namesto mobilni
            'stevilka' => '12-34',
            'privzeta' => true,
            'oseba'    => $this->objOseba['id'],
        ];
        $this->obj = $tel       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals($tel['stevilka'], '12-34');
        $I->assertNotEmpty($tel['id']);
    }

    /**
     * @depends create
     */
    public function getList(ApiTester $I)
    {
        $resp     = $I->successfullyGetList($this->restUrl, []);
        $list     = $resp['data'];
        $I->assertNotEmpty($list);
        $this->id = array_pop($list)['id'];
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $tel             = $this->obj;
        $tel['stevilka'] = '772-222';

        $tel = $I->successfullyUpdate($this->restUrl, $tel['id'], $tel);
        $I->assertEquals($tel['stevilka'], '772-222');
    }

    /**
     * prebere telefonsko in preveri vsa polja
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function readTelefonsko(ApiTester $I)
    {
        $tel = $I->successfullyGet($this->restUrl, $this->obj['id']);

        $I->assertEquals($tel['vrsta'], 'Mobilni');
        $I->assertEquals($tel['stevilka'], '772-222');
        $I->assertEquals($tel['privzeta'], true);
        $I->assertEquals($tel['oseba'], $this->objOseba['id']);
        $I->assertEquals($tel['popa'], null);
    }

    /**
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $tel = $I->successfullyDelete($this->restUrl, $this->obj['id']);

        $I->failToGet($this->restUrl, $this->obj['id']);
    }

    /**
     * kreiramo telefonsko, test validacije
     * 
     * @param ApiTester $I
     */
    public function createTelefonskeBrezOsebeAliPopa(ApiTester $I)
    {

        $data = [
            'vrsta'    => 'Mobilni', //$$ rb - popraviti opcije, kasneje M namesto mobilni
            'stevilka' => '12-34',
            'privzeta' => true,
        ];
        // test validacije - obstajati mora ali oseba ali popa
        $resp = $I->failToCreate($this->restUrl, $data);
        $I->assertNotEmpty($resp);
        // testiramo na enako številko napake kot je v validaciji
        $I->assertEquals(1000460, $resp[0]['code']);
    }

}
