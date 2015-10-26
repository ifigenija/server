<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\TerminStoritve;

use ApiTester;

/**
 * testiram update m2m relacije
 * 
 * @author rado
 */
class M2MUpdateCest
{

    private $restUrl              = '/rest/terminstoritve';
    private $alternacijaUrl       = '/rest/alternacija';
    private $lookupAlternacijaUrl = '/lookup/alternacija';
    private $obj1;
    private $obj2Teh;
    private $obj3dez;
    private $obj4gost;
    private $lookAlternacija1;
    private $lookAlternacija2Teh;
    private $roleUrl              = '/rest/role';
    private $rpcRoleUrl           = '/rpc/aaa/role';
    private $rpcUserUrl           = '/rpc/aaa/user';

    public function _before(ApiTester $I)
    {
        
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     * @param ApiTester $I
     */
    public function createVloge(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
        $data = [
            'name'        => 'TERMINVSE',
            'description' => 'Testna vloga za urejanje vsega v terminu storitve',
        ];
        $role = $I->successfullyCreate($this->roleUrl, $data);

        $I->assertEquals('TERMINVSE', $role['name']);
        $I->assertNotEmpty($role['id']);
    }

    /**
     * Doda dovoljenja vlogam
     * 
     * @depends createVloge
     * @param ApiTester $I
     */
    public function grantPermissioneVlogam(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
        $res = $I->successfullyCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "TERMINVSE",
            'permname' => 'TerminStoritve-write',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        $res = $I->successfullyCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "TERMINVSE",
            'permname' => 'TerminStoritve-vse',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);
        
        /**
         * še enkrat z probam dodati isti permission
         */
        $res = $I->successfullyCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "TERMINVSE",
            'permname' => 'TerminStoritve-vse',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);
    }


}
