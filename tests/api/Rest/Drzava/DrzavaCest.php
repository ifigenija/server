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
class DrzavaCest
{

    private $restUrl = '/rest/drzava';
    private $id      = '00000000-0000-0000-0000-000000000000';
    private $obj;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     * get meta
     * 
     * @param ApiTester $I
     */
    public function getMeta(\ApiTester $I)
    {
        $controller = "drzava";
        $view = "";
        $expected = "";
        $I->testFormMeta('drzava', '');
        
    }

    public function getList(ApiTester $I)
    {
        $list     = $I->successfullyGetList($this->restUrl, []);
        $I->assertNotEmpty($list['data']);
        $this->id = array_pop($list['data'])['id'];
    }

    // tests
    public function create(ApiTester $I)
    {
        $data      = [
            'sifra'     => 'XX',
            'sifraDolg' => 'xx',
            'isoNum'    => 'xx',
            'isoNaziv'  => 'xx',
            'naziv'     => 'xx',
        ];
        $drz       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals('xx', $data['sifraDolg']);
        $I->assertNotEmpty($drz['id']);
        $this->obj = $drz;
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $drz          = $this->obj;
        $drz['naziv'] = 'tralala';

        $drz = $I->successfullyUpdate($this->restUrl, $drz['id'], $drz);

        $I->assertEquals('tralala', $drz['naziv']);
    }

    /**
     * 
     * @depends update
     * @param ApiTester $I
     */
    public function read(ApiTester $I)
    {
        $drz = $I->successfullyGet($this->restUrl, $this->obj['id']);

        $I->assertEquals('tralala', $drz['naziv']);
    }

    /**
     * 
     * @depends create 
     * @param ApiTester $I
     */
    public function delete(ApiTester $I)
    {
        $drz = $I->successfullyDelete($this->restUrl, $this->obj['id']);

        $I->failToGet($this->restUrl, $this->obj['id']);
    }

}
