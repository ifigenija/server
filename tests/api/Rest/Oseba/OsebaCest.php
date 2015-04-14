<?php

namespace Rest\Oseba;

use ApiTester;

/**
 * - create
 * - list 
 * - update
 * - delete 
 * - read 
 * 
 */
class OsebaCest
{

    private $restUrl = '/rest/oseba';
    private $id      = '00000000-0000-0000-0000-000000000000';
    private $obj;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    // napolnimo vsaj en zapis
    public function create(ApiTester $I)
    {
        $data      = [
            'naziv'    => 'zz',
            'ime'    => 'zz',
            'priimek'    => 'zz',
            'pesvdonim'    => 'zz',
            'funkcija'    => 'zz',
            'email'    => 'x@xxx.xx',
            'datumRojstva'    => 'zz',
            'emso'    => 'zz',
            'davcna'    => 'zz',
            'spol'    => 'z',
            'opombe'    => 'zz',
            'drzavljanstvo'    => 'zz',
            'drzavaRojstva'    => 'zz',
            'krajRojstva'    => 'zz',
        ];
        $this->obj = $oseba       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals('zz', $oseba['ime']);
        $I->assertNotEmpty($oseba['id']);
    }

    /**
     * @depends create
     */
    public function getList(ApiTester $I)
    {
        $list     = $I->successfullyGetList($this->restUrl, []);
        $I->assertNotEmpty($list);
        $this->id = array_pop($list)['id'];
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $oseba          = $this->obj;
        $oseba['ime'] = 'tralala';

        $oseba = $I->successfullyUpdate($this->restUrl, $oseba['id'], $oseba);

        $I->assertEquals('tralala', $oseba['ime']);
    }

    /**
     * @depends create
     */
    public function read(ApiTester $I)
    {
        $oseba = $I->successfullyGet($this->restUrl, $this->obj['id']);

        $I->assertEquals('tralala', $oseba['ime']);
    }

    /**
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $oseba = $I->successfullyDelete($this->restUrl, $this->obj['id']);

        $I->failToGet($this->restUrl, $this->obj['id']);
    }

}
