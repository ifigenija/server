<?php

namespace Rest\Telefonska;

use ApiTester;

/**
 * - create
 * - list 
 * - update
 * - delete 
 * - read 
 * 
 */
class TelefonskaCest
{

    private $restUrl = '/rest/telefonska';
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
            'vrsta'    => 'zz',
            'stevilka' => 'zz',
            'privzeta' => 'zz',
        ];
        $this->obj = $tel       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals('zz', $tel['privzeta']);
        $I->assertNotEmpty($tel['id']);
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
        $tel          = $this->obj;
        $tel['privzeta'] = 'tralala';

        $tel = $I->successfullyUpdate($this->restUrl, $tel['id'], $tel);

        $I->assertEquals('tralala', $tel['privzeta']);
    }

    /**
     * @depends create
     */
    public function read(ApiTester $I)
    {
        $tel = $I->successfullyGet($this->restUrl, $this->obj['id']);

        $I->assertEquals('tralala', $tel['privzeta']);
    }

    /**
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $tel = $I->successfullyDelete($this->restUrl, $this->obj['id']);

        $I->failToGet($this->restUrl, $this->obj['id']);
    }

}
