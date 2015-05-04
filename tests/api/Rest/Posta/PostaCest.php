<?php

namespace Rest\Posta;

use ApiTester;

/**
 *      - list 
 *      - create
 *      - update
 *      - delete 
 *      - read 
 * 
 */
class PostaCest
{

    private $restUrl = '/rest/posta';
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
        $resp     = $I->successfullyGetList($this->restUrl, []);
        $list     = $resp["data"];
        $I->assertNotEmpty($list);
        $this->id = array_pop($list)['id'];
    }

    // tests
    public function create(ApiTester $I)
    {
        $data      = [
            'sifra' => 'UU',
            'naziv' => 'xx',
        ];
        $this->obj = $posta     = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals('xx', $posta['naziv']);
        $I->assertNotEmpty($posta['id']);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $posta          = $this->obj;
        $posta['naziv'] = 'tralala';

        $posta = $I->successfullyUpdate($this->restUrl, $posta['id'], $posta);

        $I->assertEquals('tralala', $posta['naziv']);
    }

    // tests
    public function read(ApiTester $I)
    {
        $posta = $I->successfullyGet($this->restUrl, $this->obj['id']);

        // preverimo vsa polja
        $I->assertEquals('tralala', $posta['naziv']);
        $I->assertEquals('UU', $posta['sifra']);
    }

    // tests
    public function delete(ApiTester $I)
    {
        $posta = $I->successfullyDelete($this->restUrl, $this->obj['id']);

        $I->failToGet($this->restUrl, $this->obj['id']);
    }

}
