<?php

namespace Rest\Role;

use ApiTester;

/**
 * test avtorizacij za RPC klice
 */
class AvtorizacijeRpcUserRoleCest
{

    private $roleUrl    = '/rest/role';
    private $userUrl    = '/rest/user';
    private $osebaUrl   = '/rest/oseba';
    private $rpcRoleUrl = '/rpc/aaa/role';
    private $rpcUserUrl = '/rpc/aaa/user';
    private $objOseba1;
    private $objOseba2;
    private $objOseba3Prot;
    private $lookOseba1;
    private $lookOseba2;
    private $lookOseba3Prot;
    private $oseba;

    /**
     * kreiramo 3 role 
     * 
     * @param ApiTester $I
     */
    public function createVloge(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);

        // 2. vloga
        $data = [
            'name'        => 'B',
            'description' => 'Testna vloga',
        ];
        $role = $I->successfullyCreate($this->roleUrl, $data);
        $I->assertEquals('B', $role['name']);
        $I->assertNotEmpty($role['id']);

        // 3. vloga
        $data = [
            'name'        => 'C',
            'description' => 'Testna vloga',
        ];
        $role = $I->successfullyCreate($this->roleUrl, $data);

        $I->assertEquals('C', $role['name']);
        $I->assertNotEmpty($role['id']);

        // 4. vloga
        $data = [
            'name'        => 'D',
            'description' => 'Testna vloga',
        ];
        $role = $I->successfullyCreate($this->roleUrl, $data);

        $I->assertEquals('D', $role['name']);
        $I->assertNotEmpty($role['id']);
    }

    /**
     * Doda 3 vloge 3 uporabnikom
     * 
     * @param ApiTester $I
     */
    public function grantRoleUporabnikom(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);

        $res = $I->successfullyCallRpc($this->rpcUserUrl, 'grant', [
            'username' => \IfiTest\AuthPage::$aaron,
            'rolename' => 'administrator-dostopov',
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
     * @depends createVloge
     * @param ApiTester $I 
     */
    public function klicMetodZAnonymous(ApiTester $I)
    {

        //  klic  grant perm
        $resp = $I->failCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "B",
            'permname' => 'Posta-write',
        ]);
        $I->assertNotEmpty($resp);
        $I->assertEquals(420002, $resp['code'], "ni dovoljenja");

        //  klic  revoke perm
        $resp = $I->failCallRpc($this->rpcRoleUrl, 'revoke', [
            'rolename' => "B",
            'permname' => 'Posta-write',
        ]);
        $I->assertNotEmpty($resp);
        $I->assertEquals(420002, $resp['code'], "ni dovoljenja");

        // klic grant role
        $resp = $I->failCallRpc($this->rpcUserUrl, 'grant', [
            'username' => \IfiTest\AuthPage::$irena,
            'rolename' => 'B',
        ]);
        $I->assertNotEmpty($resp);
        $I->assertEquals(420002, $resp['code'], "ni dovoljenja");

        // klic revoke role
        $resp = $I->failCallRpc($this->rpcUserUrl, 'revoke', [
            'username' => \IfiTest\AuthPage::$irena,
            'rolename' => 'B',
        ]);
        $I->assertNotEmpty($resp);
        $I->assertEquals(420002, $resp['code'], "ni dovoljenja");
    }

    /**
     *  -  getOptions  defaultValue 
     * 
     * @depends createVloge
     * @param ApiTester $I 
     */
    public function klicMetodZAdmin(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);

        //  klic  grant perm
        $resp = $I->successfullyCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "B",
            'permname' => 'Posta-write',
        ]);
        $I->assertNotEmpty($resp);
        $I->assertTrue($resp);

        //  klic  revoke perm
        $resp = $I->successfullyCallRpc($this->rpcRoleUrl, 'revoke', [
            'rolename' => "B",
            'permname' => 'Posta-write',
        ]);
        $I->assertNotEmpty($resp);
        $I->assertTrue($resp);

        // klic grant role
        $resp = $I->successfullyCallRpc($this->rpcUserUrl, 'grant', [
            'username' => \IfiTest\AuthPage::$irena,
            'rolename' => 'B',
        ]);
        $I->assertNotEmpty($resp);
        $I->assertTrue($resp);

        // klic revoke role
        $resp = $I->successfullyCallRpc($this->rpcUserUrl, 'revoke', [
            'username' => \IfiTest\AuthPage::$irena,
            'rolename' => 'B',
        ]);
        $I->assertNotEmpty($resp);
        $I->assertTrue($resp);
    }

    /**
     *  -  getOptions  defaultValue 
     * 
     * @depends createVloge
     * @param ApiTester $I 
     */
    public function klicMetodZIfiAll(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$ali, \IfiTest\AuthPage::$aliPass);

        //  klic  grant perm
        $resp = $I->successfullyCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "B",
            'permname' => 'Posta-write',
        ]);
        $I->assertNotEmpty($resp);
        $I->assertTrue($resp);

        //  klic  revoke perm
        $resp = $I->successfullyCallRpc($this->rpcRoleUrl, 'revoke', [
            'rolename' => "B",
            'permname' => 'Posta-write',
        ]);
        $I->assertNotEmpty($resp);
        $I->assertTrue($resp);

        // klic grant role
        $resp = $I->successfullyCallRpc($this->rpcUserUrl, 'grant', [
            'username' => \IfiTest\AuthPage::$irena,
            'rolename' => 'B',
        ]);
        $I->assertNotEmpty($resp);
        $I->assertTrue($resp);

        // klic revoke role
        $resp = $I->successfullyCallRpc($this->rpcUserUrl, 'revoke', [
            'username' => \IfiTest\AuthPage::$irena,
            'rolename' => 'B',
        ]);
        $I->assertNotEmpty($resp);
        $I->assertTrue($resp);
    }

    /**
     * 
     * @depends createVloge
     * @param ApiTester $I 
     */
    public function klicMetodZIfiReadall(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$berta, \IfiTest\AuthPage::$bertaPass);

        //  klic  grant perm
        $resp = $I->failCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "B",
            'permname' => 'Posta-write',
        ]);
        $I->assertNotEmpty($resp);
        $I->assertEquals(420002, $resp['code'], "ni dovoljenja");

        //  klic  revoke perm
        $resp = $I->failCallRpc($this->rpcRoleUrl, 'revoke', [
            'rolename' => "B",
            'permname' => 'Posta-write',
        ]);
        $I->assertNotEmpty($resp);
        $I->assertEquals(420002, $resp['code'], "ni dovoljenja");

        // klic grant role
        $resp = $I->failCallRpc($this->rpcUserUrl, 'grant', [
            'username' => \IfiTest\AuthPage::$irena,
            'rolename' => 'B',
        ]);
        $I->assertNotEmpty($resp);
        $I->assertEquals(420002, $resp['code'], "ni dovoljenja");

        // klic revoke role
        $resp = $I->failCallRpc($this->rpcUserUrl, 'revoke', [
            'username' => \IfiTest\AuthPage::$irena,
            'rolename' => 'B',
        ]);
        $I->assertNotEmpty($resp);
        $I->assertEquals(420002, $resp['code'], "ni dovoljenja");
    }

    /**
     * @depends grantRoleUporabnikom
     * @depends createVloge
     * @param ApiTester $I 
     */
    public function klicMetodZAaaUserjem(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$aaron, \IfiTest\AuthPage::$aaronPass);


        //  klic  grant perm
        $resp = $I->successfullyCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "B",
            'permname' => 'Posta-write',
        ]);
        $I->assertNotEmpty($resp);
        $I->assertTrue($resp);

        //  klic  revoke perm
        $resp = $I->successfullyCallRpc($this->rpcRoleUrl, 'revoke', [
            'rolename' => "B",
            'permname' => 'Posta-write',
        ]);
        $I->assertNotEmpty($resp);
        $I->assertTrue($resp);

        // klic grant role
        $resp = $I->successfullyCallRpc($this->rpcUserUrl, 'grant', [
            'username' => \IfiTest\AuthPage::$irena,
            'rolename' => 'B',
        ]);
        $I->assertNotEmpty($resp);
        $I->assertTrue($resp);

        // klic revoke role
        $resp = $I->successfullyCallRpc($this->rpcUserUrl, 'revoke', [
            'username' => \IfiTest\AuthPage::$irena,
            'rolename' => 'B',
        ]);
        $I->assertNotEmpty($resp);
        $I->assertTrue($resp);
    }

}
