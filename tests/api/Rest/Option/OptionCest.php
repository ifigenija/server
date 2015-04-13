<?php

namespace Rest\Option;

use ApiTester;

/**
 * - list 
 * - create
 * - update
 * - delete 
 * - read 
 * 
 */
class OptionCest
{

    private $restUrl = '/rest/option';
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
            'sifra' => 'xx',
            'naziv' => 'xx',
        ];
        $this->obj = $option     = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals('xx', $option['name']);
        $I->assertNotEmpty($option['id']);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $option          = $this->obj;
        $option['naziv'] = 'tralala';

        $option = $I->successfullyUpdate($this->restUrl, $option['id'], $option);

        $I->assertEquals('tralala', $option['name']);
    }

    // tests
    public function read(ApiTester $I)
    {
        $option = $I->successfullyGet($this->restUrl, $this->obj['id']);

        $I->assertEquals('tralala', $option['name']);
    }

    // tests
    public function delete(ApiTester $I)
    {
        $option = $I->successfullyDelete($this->restUrl, $this->obj['id']);

        $I->failToGet($this->restUrl, $this->obj['id']);
    }

}
