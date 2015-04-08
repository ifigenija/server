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

    private $permUrl = '/rest/drzava';
    private $id      = '00000000-0000-0000-0000-000000000000';

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    public function getList(ApiTester $I)
    {
        $list     = $I->successfullyGetList($this->permUrl, []);
        $I->assertNotEmpty($list);
        $this->id = array_pop($list)['id'];
    }

    // tests
    public function create(ApiTester $I)
    {
        $data = [
            'sifra'     => 'xx',
            'sifraDolg' => 'xx',
            'isoNum'    => 'xx',
            'isoNaziv'  => 'xx',
            'naziv'     => 'xx',
            'opis'      => 'xx',
        ];
        $drz  = $I->successfullyCreate($this->permUrl, []);
        $I->assertEquals('xx', $drz['opis']);
    }
//
//    // tests
//    public function update(ApiTester $I)
//    {
//        $err   = $I->failToDelete($this->permUrl, '00000000-0000-0000-0000-000000000000');
//        $words = explode(" ", $err['message']);
//        $I->assertEquals('disabled', array_pop($words));
//    }
//
//    // tests
//    public function read(ApiTester $I)
//    {
//        $err   = $I->failToDelete($this->permUrl, '00000000-0000-0000-0000-000000000000');
//        $words = explode(" ", $err['message']);
//        $I->assertEquals('disabled', array_pop($words));
//    }
//
//    // tests
//    public function delete(ApiTester $I)
//    {
//        $err   = $I->failToCreate($this->permUrl, '00000000-0000-0000-0000-000000000000', ['name' => "xxxx"]);
//        $words = explode(" ", $err['message']);
//        $I->assertEquals('disabled', array_pop($words));
//    }

}
