<?php

namespace Rest\Trr;

use ApiTester;

/**
 * - create0 za polnjenje podatkov - improvizacija $$rb
 * - list 
 * - create
 * - update
 * - delete 
 * - read 
 * 
 */
class TrrCest
{

    private $restUrl = '/rest/trr';
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
            'stevilka' => 'zz',
            'swift'    => 'zz',
            'bic'      => 'zz',
            'banka'    => 'zz',
        ];
        $this->obj = $trr       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals('zz', $trr['banka']);
        $I->assertNotEmpty($trr['id']);
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
        $trr          = $this->obj;
        $trr['banka'] = 'tralala';

        $trr = $I->successfullyUpdate($this->restUrl, $trr['id'], $trr);

        $I->assertEquals('tralala', $trr['banka']);
    }

    /**
     * @depends create
     */
    public function read(ApiTester $I)
    {
        $trr = $I->successfullyGet($this->restUrl, $this->obj['id']);

        $I->assertEquals('tralala', $trr['banka']);
    }

    /**
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $trr = $I->successfullyDelete($this->restUrl, $this->obj['id']);

        $I->failToGet($this->restUrl, $this->obj['id']);
    }

}
