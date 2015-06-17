<?php

namespace Rpc\Alternacija;

use ApiTester;

/**
 * testiranje avtorizacije pri RPC metodah
 */
class AvtorizacijaAlternacijaCest
{

    private $rpcUrl               = '/rpc/produkcija/alternacija';
    private $lookupAlternacijaUrl = '/lookup/alternacija';
    private $lookAlternacija1;
    private $lookAlternacija2;
    private $roleUrl              = '/rest/role';
    private $rpcRoleUrl           = '/rpc/aaa/role';
    private $rpcUserUrl           = '/rpc/aaa/user';

    /**
     * @param ApiTester $I
     */
    public function createVloge(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
        $data = [
            'name'        => 'NOVAPOGODBA',
            'description' => 'Testna vloga za rpc klic nova pogodba',
        ];
        $role = $I->successfullyCreate($this->roleUrl, $data);
        $I->assertEquals('NOVAPOGODBA', $role['name']);
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

        //1. vlogi read
        $res = $I->successfullyCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "NOVAPOGODBA",
            'permname' => 'Pogodba-write',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        $res = $I->successfullyCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "NOVAPOGODBA",
            'permname' => 'Alternacija-write',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);
    }

    /**
     * @depends grantPermissioneVlogam
     * @param ApiTester $I
     */
    public function grantRoleUporabnikom(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);

        $res = $I->successfullyCallRpc($this->rpcUserUrl, 'grant', [
            'username' => \IfiTest\AuthPage::$tona,
            'rolename' => 'NOVAPOGODBA',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);


        // ima ifi-all vlogo
        $res = $I->successfullyCallRpc($this->rpcUserUrl, 'grant', [
            'username' => \IfiTest\AuthPage::$ali,
            'rolename' => 'ifi-all',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        //še ifi-readall
        $res = $I->successfullyCallRpc($this->rpcUserUrl, 'grant', [
            'username' => \IfiTest\AuthPage::$berta,
            'rolename' => 'ifi-readall',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupAlternacija(ApiTester $I)
    {
        // alternacija brez pogodbe
        $resp                   = $I->successfullyGetList($this->lookupAlternacijaUrl . '?ident=0002', []);
        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->assertTrue(array_key_exists('data', $resp), "ima data");
        $I->assertTrue(array_key_exists('label', $resp['data'][0]), "ima labelo");
        $I->assertTrue(array_key_exists('totalRecords', $resp['state']), "ima total records");
        $I->assertEquals(1, $resp['state']['totalRecords'], "total records");
        $this->lookAlternacija1 = $resp['data'][0];

        // še ena alternacija brez pogodbe
        $resp                   = $I->successfullyGetList($this->lookupAlternacijaUrl . '?ident=0004', []);
        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->assertTrue(array_key_exists('data', $resp), "ima data");
        $I->assertTrue(array_key_exists('label', $resp['data'][0]), "ima labelo");
        $I->assertTrue(array_key_exists('totalRecords', $resp['state']), "ima total records");
        $I->assertEquals(1, $resp['state']['totalRecords'], "total records");
        $this->lookAlternacija2 = $resp['data'][0];
    }

    /**
     * klic rpc akcije 
     * 
     * @depends lookupAlternacija
     * @param ApiTester $I 
     */
    public function novaPogodbaAnonymous(ApiTester $I)
    {

        $resp = $I->failCallRpc($this->rpcUrl, 'novaPogodba', ["alternacijaId" => $this->lookAlternacija1['id']]);
        $I->assertNotEmpty($resp);
        $I->assertEquals(420002, $resp['code'], "ni dovoljenja");
//        codecept_debug($resp);
    }

    /**
     * klic rpc akcije 
     * 
     * @depends novaPogodbaAnonymous
     * @param ApiTester $I 
     */
    public function novaPogodbaZNavadnimUserjem(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$irena, \IfiTest\AuthPage::$irenaPass);

        $resp = $I->failCallRpc($this->rpcUrl, 'novaPogodba', ["alternacijaId" => $this->lookAlternacija1['id']]);
        $I->assertNotEmpty($resp);
        $I->assertEquals(420002, $resp['code'], "ni dovoljenja");
    }

    /**
     * klic rpc akcije 
     * 
     * @depends novaPogodbaZNavadnimUserjem
     * @param ApiTester $I 
     */
    public function novaPogodbaZIfiReadall(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$berta, \IfiTest\AuthPage::$bertaPass);

        $resp = $I->failCallRpc($this->rpcUrl, 'novaPogodba', ["alternacijaId" => $this->lookAlternacija1['id']]);
        $I->assertNotEmpty($resp);
        $I->assertEquals(420002, $resp['code'], "ni dovoljenja");
    }

    /**
     * klic rpc akcije 
     * 
     * @depends lookupAlternacija
     * @param ApiTester $I 
     */
    public function novaPogodbaZUstreznoVlogo(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$tona, \IfiTest\AuthPage::$tonaPass);

        $resp = $I->successfullyCallRpc($this->rpcUrl, 'novaPogodba', ["alternacijaId" => $this->lookAlternacija1['id']]);
        $I->assertNotEmpty($resp);
        $I->assertEquals(36,strlen($resp),"dolžina guid");
        $I->assertEquals(8,stripos($resp,"-"),"prvi '-' v  guid");
    }

    /**
     * klic rpc akcije 
     * 
     * @depends novaPogodbaZIfiReadall
     * @param ApiTester $I 
     */
    public function novaPogodbaZIfiAll(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$ali, \IfiTest\AuthPage::$aliPass);

        $resp = $I->successfullyCallRpc($this->rpcUrl, 'novaPogodba', ["alternacijaId" => $this->lookAlternacija2['id']]);
        $I->assertNotEmpty($resp);
        $I->assertEquals(36,strlen($resp),"dolžina guid");
        $I->assertEquals(8,stripos($resp,"-"),"prvi '-' v  guid");
    }

}
