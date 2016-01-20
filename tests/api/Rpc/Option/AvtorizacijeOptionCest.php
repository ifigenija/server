<?php

namespace Rpc\Option;

use ApiTester;

/**
 * test avtorizacij
 */
class AvtorizacijeOptionCest
{

    private $rpcUrl     = '/rpc/app/options';
    private $roleUrl    = '/rest/role';
    private $rpcRoleUrl = '/rpc/aaa/role';
    private $rpcUserUrl = '/rpc/aaa/user';

    /**
     * @param ApiTester $I
     */
    public function createVloge(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
        $data = [
            'name'        => 'GO',
            'description' => 'Testna vloga za rpc klic getOption',
        ];
        $role = $I->successfullyCreate($this->roleUrl, $data);
        $I->assertEquals('GO', $role['name']);
        $I->assertNotEmpty($role['id']);

        $data = [
            'name'        => 'SUO',
            'description' => 'Testna vloga za rpc klic setUserOption',
        ];
        $role = $I->successfullyCreate($this->roleUrl, $data);

        $I->assertEquals('SUO', $role['name']);
        $I->assertNotEmpty($role['id']);

        $data = [
            'name'        => 'SGO',
            'description' => 'Testna vloga za rpc klic setGlobalOption',
        ];
        $role = $I->successfullyCreate($this->roleUrl, $data);
        $I->assertEquals('SGO', $role['name']);
        $I->assertNotEmpty($role['id']);

        $data = [
            'name'        => 'SGOBWG',
            'description' => 'Testna vloga podobno kot vloga SGO brez OptionValue-writeGlobal dovoljenja',
        ];
        $role = $I->successfullyCreate($this->roleUrl, $data);
        $I->assertEquals('SGOBWG', $role['name']);
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

        //1. vlogi read read
        $res = $I->successfullyCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "GO",
            'permname' => 'Option-read',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        $res = $I->successfullyCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "GO",
            'permname' => 'OptionValue-read',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        //2. vlogi read write
        $res = $I->successfullyCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "SUO",
            'permname' => 'Option-read',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        $res = $I->successfullyCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "SUO",
            'permname' => 'OptionValue-write',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);


        //2. vlogi write write
        $res = $I->successfullyCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "SGO",
            'permname' => 'Option-write',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        $res = $I->successfullyCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "SGO",
            'permname' => 'OptionValue-write',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);
        $res = $I->successfullyCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "SGO",
            'permname' => 'OptionValue-writeGlobal',
        ]);
        $I->assertTrue($res);

        //3. vlogi write write brez writeGlobal
        $res = $I->successfullyCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "SGOBWG",
            'permname' => 'Option-write',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        $res = $I->successfullyCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "SGOBWG",
            'permname' => 'OptionValue-write',
        ]);
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
            'rolename' => 'GO',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        $res = $I->successfullyCallRpc($this->rpcUserUrl, 'grant', [
            'username' => \IfiTest\AuthPage::$irena,
            'rolename' => 'SUO',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        $res = $I->successfullyCallRpc($this->rpcUserUrl, 'grant', [
            'username' => \IfiTest\AuthPage::$tatjana,
            'rolename' => 'SGO',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        $res = $I->successfullyCallRpc($this->rpcUserUrl, 'grant', [
            'username' => \IfiTest\AuthPage::$aaron,
            'rolename' => 'SGOBWG',
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
     *  -  getOptions  defaultValue 
     * 
     * @param ApiTester $I 
     */
    public function klicMetodZAnonymous(ApiTester $I)
    {

        //  pričakujemo enako, kot smo nastavili v fixture-ju
        $pricakovano = array("privzeta trojka");

        $resp = $I->failCallRpc($this->rpcUrl, 'getOptions', ["name" => "test3.readonly"]);
        $I->assertNotEmpty($resp);
        $I->assertEquals(420002, $resp['code'], "ni dovoljenja");


        $resp = $I->failCallRpc($this->rpcUrl, 'setUserOption', ["name"  => "test1.barva.ozadja",
            "value" => "nova userjeva vrednost A"]);
        $I->assertNotEmpty($resp);
        $I->assertEquals(420002, $resp['code'], "ni dovoljenja");

        $resp = $I->failCallRpc($this->rpcUrl, 'setGlobalOption', ["name"  => "test1.barva.ozadja",
            "value" => "nova globalna vrednost A"]);
        $I->assertNotEmpty($resp);
        $I->assertEquals(420002, $resp['code'], "ni dovoljenja");
    }

    /**
     *  -  getOptions  defaultValue 
     * 
     * @param ApiTester $I 
     */
    public function klicMetodZAdmin(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);

        //  pričakujemo enako, kot smo nastavili v fixture-ju
        $pricakovano = array("privzeta trojka");

        $opt = $I->successfullyCallRpc($this->rpcUrl, 'getOptions', ["name" => "test3.readonly"]);
        $I->assertNotEmpty($opt);
        $I->assertEquals($pricakovano, $opt);
        $I->seeResponseIsJson();

        $odg = $I->successfullyCallRpc($this->rpcUrl, 'setUserOption', ["name"  => "test1.barva.ozadja",
            "value" => "nova userjeva vrednost A"]);
        $I->assertNotEmpty($odg);
        $I->assertTrue($odg);

        $odg = $I->successfullyCallRpc($this->rpcUrl, 'setGlobalOption', ["name"  => "test1.barva.ozadja",
            "value" => "nova globalna vrednost A"]);
        $I->assertNotEmpty($odg);
        $I->assertTrue($odg);
    }

    /**
     *  -  getOptions  defaultValue 
     * 
     * @param ApiTester $I 
     */
    public function klicMetodZIfiAll(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$ali, \IfiTest\AuthPage::$aliPass);

        //  pričakujemo enako, kot smo nastavili v fixture-ju
        $pricakovano = array("privzeta trojka");

        $opt = $I->successfullyCallRpc($this->rpcUrl, 'getOptions', ["name" => "test3.readonly"]);
        $I->assertNotEmpty($opt);
        $I->assertEquals($pricakovano, $opt);
        $I->seeResponseIsJson();

        $odg = $I->successfullyCallRpc($this->rpcUrl, 'setGlobalOption', ["name"  => "test1.barva.ozadja",
            "value" => "nova globalna vrednost IA"]);
        $I->assertNotEmpty($odg);
        $I->assertTrue($odg);

        $odg = $I->successfullyCallRpc($this->rpcUrl, 'setUserOption', ["name"  => "test1.barva.ozadja",
            "value" => "nova userjeva vrednost IA"]);
        $I->assertNotEmpty($odg);
        $I->assertTrue($odg);
    }

    /**
     * 
     * @param ApiTester $I 
     */
    public function klicMetodZIfiReadall(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$berta, \IfiTest\AuthPage::$bertaPass);

        //  pričakujemo enako, kot smo nastavili v fixture-ju
        $pricakovano = array("privzeta trojka");

        $opt = $I->successfullyCallRpc($this->rpcUrl, 'getOptions', ["name" => "test3.readonly"]);
        $I->assertNotEmpty($opt);
        $I->assertEquals($pricakovano, $opt);
        $I->seeResponseIsJson();

        $resp = $I->failCallRpc($this->rpcUrl, 'setGlobalOption', ["name"  => "test1.barva.ozadja",
            "value" => "nova globalna vrednost A"]);
        $I->assertNotEmpty($resp);
        $I->assertEquals(420002, $resp['code'], "ni dovoljenja");

        $resp = $I->failCallRpc($this->rpcUrl, 'setUserOption', ["name"  => "test1.barva.ozadja",
            "value" => "nova userjeva vrednost A"]);
        $I->assertNotEmpty($resp);
        $I->assertEquals(420002, $resp['code'], "ni dovoljenja");
    }

    /**
     * 
     * @param ApiTester $I 
     */
    public function klicMetodZReadReadUserjem(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$tona, \IfiTest\AuthPage::$tonaPass);

        //  pričakujemo enako, kot smo nastavili v fixture-ju
        $pricakovano = array("privzeta trojka");

        $opt = $I->successfullyCallRpc($this->rpcUrl, 'getOptions', ["name" => "test3.readonly"]);
        $I->assertNotEmpty($opt);
        $I->assertEquals($pricakovano, $opt);
        $I->seeResponseIsJson();

        $resp = $I->failCallRpc($this->rpcUrl, 'setGlobalOption', ["name"  => "test1.barva.ozadja",
            "value" => "nova globalna vrednost A"]);
        $I->assertNotEmpty($resp);
        $I->assertEquals(420002, $resp['code'], "ni dovoljenja");

        $resp = $I->failCallRpc($this->rpcUrl, 'setUserOption', ["name"  => "test1.barva.ozadja",
            "value" => "nova userjeva vrednost A"]);
        $I->assertNotEmpty($resp);
        $I->assertEquals(420002, $resp['code'], "ni dovoljenja");
    }

    /**
     * 
     * @param ApiTester $I 
     */
    public function klicMetodZReadWriteUserjem(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$irena, \IfiTest\AuthPage::$irenaPass);

        //  pričakujemo enako, kot smo nastavili v fixture-ju
        $pricakovano = array("privzeta trojka");
        $resp        = $I->failCallRpc($this->rpcUrl, 'getOptions', ["name" => "test3.readonly"]);
        $I->assertNotEmpty($resp);
        $I->assertEquals(420002, $resp['code'], "ni dovoljenja");

        $odg = $I->successfullyCallRpc($this->rpcUrl, 'setUserOption', ["name"  => "test1.barva.ozadja",
            "value" => "nova userjeva vrednost A"]);
        $I->assertNotEmpty($odg);
        $I->assertTrue($odg);


        $resp = $I->failCallRpc($this->rpcUrl, 'setGlobalOption', ["name"  => "test1.barva.ozadja",
            "value" => "nova globalna vrednost A"]);
        $I->assertNotEmpty($resp);
        $I->assertEquals(420002, $resp['code'], "ni dovoljenja");
    }

    /**
     * 
     * @param ApiTester $I 
     */
    public function klicMetodZWriteWriteUserjem(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$tatjana, \IfiTest\AuthPage::$tatjanaPass);

        $resp = $I->failCallRpc($this->rpcUrl, 'getOptions', ["name" => "test3.readonly"]);
        codecept_debug($resp);
        $I->assertEquals(420002, $resp['code'], "ni dovoljenja");

        $resp = $I->failCallRpc($this->rpcUrl, 'setUserOption', ["name"  => "test1.barva.ozadja",
            "value" => "nova userjeva vrednost A"]);
        codecept_debug($resp);
        $I->assertEquals(420002, $resp['code'], "ni dovoljenja");

        $resp = $I->successfullyCallRpc($this->rpcUrl, 'setGlobalOption', ["name"  => "test1.barva.ozadja",
            "value" => "nova globalna vrednost ww"]);
        codecept_debug($resp);
        $I->assertTrue($resp);

        /*
         * brez writeGlobal dovoljenja ne bi smel uspeti
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$aaron, \IfiTest\AuthPage::$aaronPass);
        $resp = $I->failCallRpc($this->rpcUrl, 'setGlobalOption', ["name"  => "test1.barva.ozadja",
            "value" => "nova globalna vrednost ww brez writeGlobal"]);
        codecept_debug($resp);
        $I->assertEquals(420002, $resp['code'], "ni dovoljenja");
        $I->assertContains("OptionValue-writeGlobal", $resp['message']);
    }

}
