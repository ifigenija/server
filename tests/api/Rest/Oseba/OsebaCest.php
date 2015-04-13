<?php

namespace Rest\Drzava;

use ApiTester;

/**
 * - list 
 * - create
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

    public function getList(ApiTester $I)
    {
        $list     = $I->successfullyGetList($this->restUrl, []);
        $I->assertNotEmpty($list);
        $this->id = array_pop($list)['id'];
    }

    // tests
    public function create(ApiTester $I)
    {
        $data      = [
            'naziv'         => 'XX',
            'ime'           => 'XX',
            'priimek'       => 'XX',
            'pesvdonim'     => 'XX',
            'funkcija'      => 'XX',
            'email'         => 'XX',
            'datumRojstva'  => 'XX',
            'emso'          => 'XX',
            'davcna'        => 'XX',
            'spol'          => 'XX',
            'opombe'        => 'XX',
            'drzavljanstvo' => 'XX',
            'drzavaRojstva' => 'XX',
            'krajRojstva'   => 'XX',
        ];
        $this->obj = $oseba       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals('xx', $oseba['opombe']);
        $I->assertNotEmpty($oseba['id']);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $oseba           = $this->obj;
        $oseba['opombe'] = 'tralala';

        $oseba = $I->successfullyUpdate($this->restUrl, $oseba['id'], $oseba);

        $I->assertEquals('tralala', $oseba['opombe']);
    }

    // tests
    public function read(ApiTester $I)
    {
        $oseba = $I->successfullyGet($this->restUrl, $this->obj['id']);

        $I->assertEquals('tralala', $oseba['opombe']);
    }

    // tests
    public function delete(ApiTester $I)
    {
        $oseba = $I->successfullyDelete($this->restUrl, $this->obj['id']);

        $I->failToGet($this->restUrl, $this->obj['id']);
    }

}
