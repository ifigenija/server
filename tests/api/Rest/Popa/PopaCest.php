<?php

namespace Rest\Popa;

use ApiTester;

/**
 * - create
 * - list 
 * - update
 * - delete 
 * - read 
 * 
 */
class PopaCest
{

    private $restUrl = '/rest/popa';
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
//            'sifra'    => 'zz',
//            'tipkli'    => 'zz', 
//            'stakli'    => 'zz', 
//            'naziv'    => 'zz',
//            'naziv1'    => 'zz',
            'panoga'    => 'zz', 
//            'email'    => 'zz', 
//            'url'    => 'zz', 
//            'opomba'    => 'zz', 
//            'idddv'    => 'zz', 
//            'maticna'    => 'zz', 
//            'zavezanec'    => 'zz', 
//            'jeeu'    => 'zz', 
//            'datZav'    => 'zz',            
//            'datnZav'    => 'zz', 
//            'zamejstvo'    => 'zz', 
            ];
        $this->obj = $popa       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals('zz', $popa['panoga']);
        $I->assertNotEmpty($popa['id']);
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
        $popa          = $this->obj;
        $popa['panoga'] = 'tralala';

        $popa = $I->successfullyUpdate($this->restUrl, $popa['id'], $popa);

        $I->assertEquals('tralala', $popa['panoga']);
    }

    /**
     * @depends create
     */
    public function read(ApiTester $I)
    {
        $popa = $I->successfullyGet($this->restUrl, $this->obj['id']);

        $I->assertEquals('tralala', $popa['panoga']);
    }

    /**
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $popa = $I->successfullyDelete($this->restUrl, $this->obj['id']);

        $I->failToGet($this->restUrl, $this->obj['id']);
    }

}
