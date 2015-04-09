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
            'sifra'     => 'XX',
            'sifraDolg' => 'xx',
            'isoNum'    => 'xx',
            'isoNaziv'  => 'xx',
            'naziv'     => 'xx',
            'opomba'    => 'xx',
        ];
        $this->obj = $drz       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals('xx', $drz['opomba']);
        $I->assertNotEmpty($drz['id']);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $drz           = $this->obj;
        $drz['opomba'] = 'tralala';

        $drz = $I->successfullyUpdate($this->restUrl, $drz['id'], $drz);

        $I->assertEquals('tralala', $drz['opomba']);
    }

    // tests
    public function read(ApiTester $I)
    {
        $drz = $I->successfullyGet($this->restUrl, $this->obj['id']);

        $I->assertEquals('tralala', $drz['opomba']);
    }

    // tests
    public function delete(ApiTester $I)
    {
        $drz = $I->successfullyDelete($this->restUrl, $this->obj['id']);

        $I->failToGet($this->restUrl, $this->obj['id']);
    }

}
