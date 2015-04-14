<?php

namespace Rest\Option;

use ApiTester;

/**
 * - create
 * - list 
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

    // napolnimo vsaj en zapis
    public function create(ApiTester $I)
    {
        $data      = [
            'name'          => 'zz',
            'type'          => 'zz',
            'defaultValue'  => 'zz',
            'perUser'       => 'zz',
            'readOnly'      => 'zz',
            'public'        => 'zz',
            'role'          => 'zz',
            'description'   => 'zz',
        ];
        $this->obj = $opcija       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals('zz', $opcija['name']);
        $I->assertNotEmpty($opcija['id']);
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
        $opcija          = $this->obj;
        $opcija['name'] = 'tralala';

        $opcija = $I->successfullyUpdate($this->restUrl, $opcija['id'], $opcija);

        $I->assertEquals('tralala', $opcija['name']);
    }

    /**
     * @depends create
     */
    public function read(ApiTester $I)
    {
        $opcija = $I->successfullyGet($this->restUrl, $this->obj['id']);

        $I->assertEquals('tralala', $opcija['name']);
    }

    /**
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $opcija = $I->successfullyDelete($this->restUrl, $this->obj['id']);

        $I->failToGet($this->restUrl, $this->obj['id']);
    }

}
