<?php

namespace Rest\PostniNaslov;

use ApiTester;

/**
 * - create
 * - list 
 * - update
 * - delete 
 * - read 
 * 
 */
class PostniNaslovCest
{

    private $restUrl = '/rest/postninaslov';
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
     *  napolnimo vsaj en zapis
     *
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'sifra' => 'zz',
            'naziv' => 'zz',
        ];
        $this->obj = $pnaslov   = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals('zz', $pnaslov['naziv']);
        $I->assertNotEmpty($pnaslov['id']);
    }

    /**
     * @depends create
     * @param ApiTester $I
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
        $pnaslov          = $this->obj;
        $pnaslov['naziv'] = 'tralala';

        $pnaslov = $I->successfullyUpdate($this->restUrl, $pnaslov['id'], $pnaslov);

        $I->assertEquals('tralala', $pnaslov['naziv']);
    }

    // tests
    public function read(ApiTester $I)
    {
        $pnaslov = $I->successfullyGet($this->restUrl, $this->obj['id']);
        $I->assertEquals('tralala', $pnaslov['naziv']);
    }

    // tests
    public function delete(ApiTester $I)
    {
        $pnaslov = $I->successfullyDelete($this->restUrl, $this->obj['id']);

        $I->failToGet($this->restUrl, $this->obj['id']);
    }

}
