<?php

namespace Rest\Role;

use ApiTester;

/**
 * Polnjenje podatkov
 *   Role
 *      - ustvarim rolo za read dostop
 *      - ustvarim rolo za write dostop
 *      - ustvarim rolo za read write dostop
 *   granti dovoljenj
 *      -dodam read, write in rw dovoljenje posamičnim rolam npr. Oseba-read
 *   uporabniki
 *      - ustvarim  3 uporabnike  
 *      - dodam 3 role 3 uporabnikom
 *   ostali podataki
 *      - napolniti 2 zapisa v Oseba
 * Preverjanje dostopov
 *      - sprobam dostop do entitete Oseba z read dostopom (get, getlist) z vsemi 3 uporaniki
 *      - sprobam dostop do entitete Oseba z write dostopom (vpisati, popraviti, zbrisati) z vsemi 3 uporaniki
 *      - sprobam dostop do neke druge entitete, do katere nimam dostopa
 * - sprobam dostopati do enega polja oz. zaščititi določeno polje 
 * - kreirati view in dostopati do view-a
 * Brisanja
 * - odstranim obe dovoljenji roli
 * - odstranim vlogo uporabniku
 * - zbrišem uporabnika
 * Komentarji pri funkcijah
 *      - komentar
 *      - depends
 *      - parametri
 * 
 */
class AvtorizacijeCest
{

    private $roleUrl    = '/rest/role';
    private $userUrl    = '/rest/user';
    private $osebaUrl   = '/rest/oseba';
    private $rpcRoleUrl = '/rpc/aaa/role';
    private $rpcUserUrl = '/rpc/aaa/user';
    private $objOseba;
    private $oseba;

    public function _before(ApiTester $I)
    {
        
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     * kreiramo 3 role 
     * 
     * @param ApiTester $I
     */
    public function createTriVloge(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
        $data = [
            'name'        => 'TEST1R',
            'description' => 'Testna vloga',
        ];
        $role = $I->successfullyCreate($this->roleUrl, $data);

        $I->assertEquals('TEST1R', $role['name']);
        $I->assertNotEmpty($role['id']);

        // 2. vloga
        $data = [
            'name'        => 'TEST2W',
            'description' => 'Testna vloga',
        ];
        $role = $I->successfullyCreate($this->roleUrl, $data);

        $I->assertEquals('TEST2W', $role['name']);
        $I->assertNotEmpty($role['id']);

        // 3. vloga
        $data = [
            'name'        => 'TEST3RW',
            'description' => 'Testna vloga',
        ];
        $role = $I->successfullyCreate($this->roleUrl, $data);

        $I->assertEquals('TEST3RW', $role['name']);
        $I->assertNotEmpty($role['id']);
    }

    /**
     * Doda 3 dovoljenja 3 vlogam
     * 
     * @depends createTriVloge
     * @param ApiTester $I
     */
    public function grantTriPermissioneTremVlogam(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);

        //1. vlogi read
        $res = $I->successfullyCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "TEST1R",
            'permname' => 'Oseba-read',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        // 2. vlogi write
        $res = $I->successfullyCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "TEST2W",
            'permname' => 'Oseba-write',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        // 3. vlogi read + write
        $res = $I->successfullyCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "TEST3RW",
            'permname' => 'Oseba-read',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        $res = $I->successfullyCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "TEST3RW",
            'permname' => 'Oseba-write',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);
    }

    /**
     * Ustvari  3 uporabnike
     * 
     * @param ApiTester $I
     */
    public function createTriUserje(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);

        $data = [
            'email'    => \IfiTest\AuthPage::$test1,
            'name'     => 'Testni uporabnik za Cest testiranje',
            'password' => \IfiTest\AuthPage::$test1Pass,
            'enabled'  => true,
        ];
        $user = $I->successfullyCreate($this->userUrl, $data);
        $I->assertEquals(\IfiTest\AuthPage::$test1, $user['email']);
        $I->assertNotEmpty($user['id']);

        $data = [
            'email'    => \IfiTest\AuthPage::$test2,
            'name'     => 'Testni uporabnik za Cest testiranje',
            'password' => \IfiTest\AuthPage::$test2Pass,
            'enabled'  => true,
        ];
        $user = $I->successfullyCreate($this->userUrl, $data);
        $I->assertEquals(\IfiTest\AuthPage::$test2, $user['email']);
        $I->assertNotEmpty($user['id']);

        $data = [
            'email'    => \IfiTest\AuthPage::$test3,
            'name'     => 'Testni uporabnik za Cest testiranje',
            'password' => \IfiTest\AuthPage::$test3Pass,
            'enabled'  => true,
        ];
        $user = $I->successfullyCreate($this->userUrl, $data);
        $I->assertEquals(\IfiTest\AuthPage::$test3, $user['email']);
        $I->assertNotEmpty($user['id']);
    }

    /**
     * Doda 3 vloge 3 uporabnikom
     * 
     * @depends createTriUserje
     * @param ApiTester $I
     */
    public function grantTriRoleTremUporabnikom(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);

        $res = $I->successfullyCallRpc($this->rpcUserUrl, 'grant', [
            'username' => \IfiTest\AuthPage::$test1,
            'rolename' => 'TEST1R',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        $res = $I->successfullyCallRpc($this->rpcUserUrl, 'grant', [
            'username' => \IfiTest\AuthPage::$test2,
            'rolename' => 'TEST2W',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        $res = $I->successfullyCallRpc($this->rpcUserUrl, 'grant', [
            'username' => \IfiTest\AuthPage::$test3,
            'rolename' => 'TEST3RW',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);
    }

    /**
     * Ustvari podatke - dve osebi
     * 
     * @param ApiTester $I
     */
    public function createDveOsebi(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);

        $data           = [
            'naziv'   => 'xx',
            'ime'     => 'xx',
            'priimek' => 'xx',
            'email'   => 'x@xxx.xx',
        ];
        $this->objOseba = $oseba          = $I->successfullyCreate($this->osebaUrl, $data);
        $I->assertEquals('xx', $oseba['ime']);
        $I->assertNotEmpty($oseba['id']);

        // 2. oseba:
        $data           = [
            'naziv'   => 'yy',
            'ime'     => 'yy',
            'priimek' => 'yy',
            'email'   => 'y@yyy.yy',
        ];
        $this->objOseba = $oseba          = $I->successfullyCreate($this->osebaUrl, $data);
        $I->assertEquals('yy', $oseba['ime']);
        $I->assertNotEmpty($oseba['id']);
    }

    /**
     * Sproba getList dostop z Read uporabnikom
     * 
     * @depends createTriUserje
     * @param ApiTester $I
     */
    public function getListZReadUserjem(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$test1, \IfiTest\AuthPage::$test1Pass);


        $list = $I->successfullyGetList($this->osebaUrl, []);
        $I->assertNotEmpty($list);
    }

    /**
     * sproba get, update, write, delete dostope z read uporabnikom
     * 
     * @depends createTriUserje
     * @param ApiTester $I
     */
    public function dostopiZReadUserjem(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$test1, \IfiTest\AuthPage::$test1Pass);

        //get 
        $oseba = $I->successfullyGet($this->osebaUrl, $this->objOseba['id']);
        $I->assertNotEmpty($oseba);
        $I->assertEquals($this->objOseba['priimek'], $oseba['priimek']);

        //update
        $oseba        = $this->objOseba;
        $oseba['ime'] = 'tralala';
        $I->failToUpdate($this->osebaUrl, $oseba['id'], $oseba); //$$ rb ne deluje - ERROR
        //delete
        $I->failToDelete($this->osebaUrl, $this->objOseba['id']);        //$$ rb ERROR
        //write
        $data         = [
            'naziv'   => 'zz',
            'ime'     => 'zz',
            'priimek' => 'zz',
            'email'   => 'z@zzz.zz',
        ];
        $I->failToCreate($this->osebaUrl, $data); //$$ rb ne deluje
    }

    /**
     * Sprobam getlist dostope z write uporabnikom
     * 
     * @depends createTriUserje
     * @param ApiTester $I
     */
    public function getListZWriteUserjem(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$test2, \IfiTest\AuthPage::$test2Pass);

        $I->failToGetList($this->osebaUrl, []);  //$$ rb javlja ERROR
    }

    /**
     * sproba get, update, write, delete dostope z write uporabnikom
     * 
     * @depends createTriUserje
     * @param ApiTester $I
     */
    public function dostopiZWriteUserjem(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$test2, \IfiTest\AuthPage::$test2Pass);

        //get 
        $I->failToGet($this->osebaUrl, $this->objOseba['id']);

        //update
        $oseba        = $this->objOseba;
        $oseba['ime'] = 'dve tralala';

        $oseba = $I->successfullyUpdate($this->osebaUrl, $oseba['id'], $oseba);
        $I->assertEquals('dve tralala', $oseba['ime']);

        //write
        $data  = [
            'naziv'   => 'dve',
            'ime'     => 'dve',
            'priimek' => 'dve',
            'email'   => 'dve@zzz.zz',
        ];
        $oseba = $I->successfullyCreate($this->osebaUrl, $data);

        //delete
        $I->successfullyDelete($this->osebaUrl, $oseba['id']);
        $I->failToGet($this->osebaUrl, $oseba['id']);
    }

    /**
     * Getlist dostop z Read Write uporabnikom
     * 
     * @depends createTriUserje
     * @param ApiTester $I
     */
    public function getListZRwUserjem(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$test3, \IfiTest\AuthPage::$test3Pass);

        $list = $I->successfullyGetList($this->osebaUrl, []);
        $I->assertNotEmpty($list);
    }

    /**
     * get, update, write, delete dostop z Read Write uporabnikom
     * 
     * @depends createTriUserje
     * @param ApiTester $I
     */
    public function dostopiZRwUserjem(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$test3, \IfiTest\AuthPage::$test3Pass);

        //get 
        $oseba = $I->successfullyGet($this->osebaUrl, $this->objOseba['id']);
        $I->assertNotEmpty($oseba);
        $I->assertEquals($this->objOseba['priimek'], $oseba['priimek']);

        //update
        $oseba        = $this->objOseba;
        $oseba['ime'] = 'tri';

        $oseba = $I->successfullyUpdate($this->osebaUrl, $oseba['id'], $oseba);
        $I->assertEquals('tri', $oseba['ime']);

        //write
        $data  = [
            'naziv'   => 'tri',
            'ime'     => 'tri',
            'priimek' => 'tri',
            'email'   => 'tri@zzz.zz',
        ];
        $oseba = $I->successfullyCreate($this->osebaUrl, $data);

        //delete
        $I->successfullyDelete($this->osebaUrl, $oseba['id']);
        $I->failToGet($this->osebaUrl, $oseba['id']);
    }

}
