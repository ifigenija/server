<?php

namespace Rest\Role;

use ApiTester;

/**
 *  Polnjenje podatkov
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
 *  Preverjanje dostopov
 *      - sprobam dostop do entitete Oseba z read dostopom (get, getlist) z vsemi 3 uporaniki
 *      - sprobam dostop do entitete Oseba z write dostopom (vpisati, popraviti, zbrisati) z vsemi 3 uporaniki
 *      - sprobam dostop do neke druge entitete, do katere nimam dostopa
 * - sprobam dostopati do enega polja oz. zaščititi določeno polje  (t.j. sprobati assertion-e)
 * - kreirati view in dostopati do view-a     ($$ rb - testirati takrat, ko se bo naredil novi kontroler npr.  /user/id/role/id z delete, put http metodo
 *  Brisanja niso ni potrebna, ker vsak test štarta z inicialnim stanjem podadtkovne baze 
 *  Komentarji pri funkcijah
 *      - komentar
 *      - depends
 *      - parametri
 * 
 * 
 */
class AvtorizacijeCest
{

    private $permUrl    = '/rest/permission';
    private $roleUrl    = '/rest/role';
    private $userUrl    = '/rest/user';
    private $osebaUrl   = '/rest/oseba';
    private $rpcRoleUrl = '/rpc/aaa/role';
    private $rpcUserUrl = '/rpc/aaa/user';
    private $objRole1;
    private $objRole2;
    private $objPermission1;
    private $objPermission2;
    private $objPermission3;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     * kreiramo 3 role 
     * 
     * @param ApiTester $I
     */
    public function createVloge(ApiTester $I)
    {
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

        // 4. vloga
        $data = [
            'name'        => 'TEST4RWVSE',
            'description' => 'Testna vloga',
        ];
        $role = $I->successfullyCreate($this->roleUrl, $data);

        $I->assertEquals('TEST4RWVSE', $role['name']);
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

        // 2. vlogi Option-read
        $res = $I->successfullyCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "TEST2W",
            'permname' => 'Option-read',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        // 2. vlogi OptionValue-read
        $res = $I->successfullyCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "TEST2W",
            'permname' => 'OptionValue-read',
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

        // 3. vlogi Option-read
        $res = $I->successfullyCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "TEST3RW",
            'permname' => 'Option-read',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        // 3. vlogi OptionValue-read
        $res = $I->successfullyCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "TEST3RW",
            'permname' => 'OptionValue-read',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);


        // 4. vlogi read + write
        $res = $I->successfullyCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "TEST4RWVSE",
            'permname' => 'Oseba-read',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        $res = $I->successfullyCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "TEST4RWVSE",
            'permname' => 'Oseba-write',
        ]);
        $I->assertNotEmpty($res);

        $I->assertTrue($res);
        $res = $I->successfullyCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "TEST4RWVSE",
            'permname' => 'OsebniPodatki-write',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        // 4. vlogi Option-read
        $res = $I->successfullyCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "TEST4RWVSE",
            'permname' => 'Option-read',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        // 4. vlogi OptionValue-read
        $res = $I->successfullyCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "TEST4RWVSE",
            'permname' => 'OptionValue-read',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);
    }

    /**
     * Ustvari  3 uporabnike
     * 
     * @param ApiTester $I
     */
    public function createUserje(ApiTester $I)
    {
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

        $data = [
            'email'    => \IfiTest\AuthPage::$test4,
            'name'     => 'Testni uporabnik za Cest testiranje',
            'password' => \IfiTest\AuthPage::$test4Pass,
            'enabled'  => true,
        ];
        $user = $I->successfullyCreate($this->userUrl, $data);
        $I->assertEquals(\IfiTest\AuthPage::$test4, $user['email']);
        $I->assertNotEmpty($user['id']);
    }

    /**
     * Doda 3 vloge 3 uporabnikom
     * 
     * @depends createUserje
     * @param ApiTester $I
     */
    public function grantRoleUporabnikom(ApiTester $I)
    {
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

        $res = $I->successfullyCallRpc($this->rpcUserUrl, 'grant', [
            'username' => \IfiTest\AuthPage::$test4,
            'rolename' => 'TEST4RWVSE',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupOsebo(ApiTester $I)
    {
        $this->lookOseba1 = $ent              = $I->lookupEntity("oseba", "0001", false);
        $I->assertNotEmpty($ent);

        $this->lookOseba2 = $ent              = $I->lookupEntity("oseba", "0005", false);
        $I->assertNotEmpty($ent);

        $this->lookOseba3Prot = $ent                  = $I->lookupEntity("oseba", "0011", false);
        $I->assertNotEmpty($ent);
    }

    /**
     * Sproba getList dostop z Read uporabnikom
     * 
     * @depends createUserje
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
     * @depends createUserje
     * @param ApiTester $I
     */
    public function dostopiZReadUserjem(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$test1, \IfiTest\AuthPage::$test1Pass);

        //get 
        $oseba = $I->successfullyGet($this->osebaUrl, $this->lookOseba1['id']);
        $I->assertNotEmpty($oseba);
        $I->assertEquals($this->lookOseba1['priimek'], $oseba['priimek']);

        //update
        $oseba        = $this->lookOseba1;
        $oseba['ime'] = 'tralala';
        $I->failToUpdate($this->osebaUrl, $oseba['id'], $oseba); //$$ rb ne deluje - ERROR
        //delete
        $I->failToDelete($this->osebaUrl, $this->lookOseba1['id']);        //$$ rb ERROR
        //write
        $data         = [
            'naziv'    => 'zz',
            'ime'      => 'zz',
            'priimek'  => 'zz',
            'email'    => 'z@zzz.zz',
            'funkcija' => 'aa',
        ];
        $I->failToCreate($this->osebaUrl, $data); //$$ rb ne deluje
    }

    /**
     * Sprobam getlist dostope z write uporabnikom
     * 
     * @depends createUserje
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
     * @depends createUserje
     * @param ApiTester $I
     */
    public function dostopiZWriteUserjem(ApiTester $I)
    {
        $oseba = $I->successfullyGet($this->osebaUrl, $this->lookOseba1['id']);

        $I->amHttpAuthenticated(\IfiTest\AuthPage::$test2, \IfiTest\AuthPage::$test2Pass);
        //get 
        $I->failToGet($this->osebaUrl, $oseba['id']);

        //update
        $oseba['ime'] = 'dve tralala';

        $oseba = $I->successfullyUpdate($this->osebaUrl, $oseba['id'], $oseba);
        $I->assertEquals('dve tralala', $oseba['ime']);

        //write
        $data  = [
            'naziv'    => 'dve',
            'ime'      => 'dve',
            'priimek'  => 'dve',
            'email'    => 'dve@zzz.zz',
            'spol'     => 'M',
            'funkcija' => 'aa',
        ];
        $oseba = $I->successfullyCreate($this->osebaUrl, $data);

        //delete
        $I->successfullyDelete($this->osebaUrl, $oseba['id']);
        $I->failToGet($this->osebaUrl, $oseba['id']);
    }

    /**
     * Getlist dostop z Read Write uporabnikom
     * 
     * @depends createUserje
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
     * @depends createUserje
     * @param ApiTester $I
     */
    public function dostopiZRwUserjem(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$test3, \IfiTest\AuthPage::$test3Pass);

        //get 
        $oseba = $I->successfullyGet($this->osebaUrl, $this->lookOseba1['id']);
        $I->assertNotEmpty($oseba);
        $I->assertEquals($this->lookOseba1['priimek'], $oseba['priimek']);

        //update
        $oseba['ime'] = 'tri';

        $oseba = $I->successfullyUpdate($this->osebaUrl, $oseba['id'], $oseba);
        $I->assertEquals('tri', $oseba['ime']);

        //write
        $data  = [
            'naziv'    => 'tri',
            'ime'      => 'tri',
            'priimek'  => 'tri',
            'email'    => 'tri@zzz.zz',
            'spol'     => 'M',
            'funkcija' => 'aa',
        ];
        $oseba = $I->successfullyCreate($this->osebaUrl, $data);

        //delete
        $I->successfullyDelete($this->osebaUrl, $oseba['id']);
        $I->failToGet($this->osebaUrl, $oseba['id']);
    }

    /**
     * assert dostop z Read Write uporabnikom
     * 
     * @depends createUserje
     * @param ApiTester $I
     */
    public function assertDostopZRwUserjem(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$test3, \IfiTest\AuthPage::$test3Pass);


        // oseba, ki ni z assert zašitena - brisanje bi moralo uspeti
        $look = $this->lookOseba2;
        //delete
        $I->successfullyDelete($this->osebaUrl, $look['id']);


        $resp = $I->failToGet($this->osebaUrl, $look['id']);
        codecept_debug($resp);
        $I->assertEquals("100098", $resp[0][0]['code']);

        //delete neobstoječega bi moral sicer pasti, a brez napake
        $resp = $I->failToDelete($this->osebaUrl, $look['id']);



        // oseba, ki je z assert zaščitena (v AssertOseba) ne bi smel dovoliti spremeniti niti brisati niti kreirati
        //update

        $look         = $this->lookOseba3Prot;
        $oseba        = $I->successfullyGet($this->osebaUrl, $look['id']);
        $oseba['ime'] = 'ciracara';

        $I->failToUpdate($this->osebaUrl, $oseba['id'], $oseba);

        //delete
        $I->failToDelete($this->osebaUrl, $oseba['id']);

        // write
        $data = [
            'naziv'    => 'stiri',
            'ime'      => 'stiri',
            'priimek'  => 'write protected12345', //to assert ne dovoli!
            'email'    => 'stiri@zzz.zz',
            'funkcija' => 'aa',
        ];
        $I->failToCreate($this->osebaUrl, $data);  //$$ rb verjetno bo potrebno spremeniti v restcontrollerju, ker konteksta še ni ?
    }

    /**
     * Preverimo, ali je userju z dodatnim specialnim dovoljenjem omogočen dostop
     * 
     * @param ApiTester $I
     */
    public function assertPoVsebiniNaUserja(ApiTester $I)
    {
        $data = $I->successfullyGet($this->osebaUrl, $this->lookOseba3Prot['id']);

        $I->amHttpAuthenticated(\IfiTest\AuthPage::$test4, \IfiTest\AuthPage::$test4Pass);
        // oseba, ki je z assert zaščitena 
        //update
        codecept_debug($data);
        $data['ime'] = 'cirkocarko';

        // dostop uspe zaradi posebnega dovoljenja "OsebniPodatki-write"
        $I->successfullyUpdate($this->osebaUrl, $data['id'], $data);
        $I->assertEquals($data['ime'], 'cirkocarko');
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupRole(ApiTester $I)
    {
        /**
         * poiščemo built in vloge
         */
        $look           = $I->lookupEntity("role", "Oseba-read", false);
        $this->objRole1 = $ent            = $I->successfullyGet($this->roleUrl, $look['id']);
        codecept_debug($ent);
//        $I->assertEquals($ent['builtIn'], true); // $$ zaenkrat ne vrača tega podatka
    }

    /**
     * update ne sme uspeti za built in vloge
     * 
     * @depends lookupRole
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent  = $this->objRole1;
        $resp = $I->failToUpdate($this->roleUrl, $ent['id'], $ent);
        $I->assertEquals(1001500, $resp[0]['code']);
    }

    /**
     * brisanje ne sme uspeti za builtin vloge
     * 
     * @depends lookupRole
     * @param ApiTester $I
     * 
     * @param ApiTester $I
     */
    public function delete(ApiTester $I)
    {
        $resp = $I->failToDelete($this->roleUrl, $this->objRole1['id']);
        $I->assertEquals(1001501, $resp[0]['code']);
    }

    /**
     * kreiranje dovoljenja
     * 
     * @param ApiTester $I
     */
    public function createPermission(ApiTester $I)
    {
        /**
         * uporabnik brez dovoljenj
         * ne more kreirati vloge
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$breznik, \IfiTest\AuthPage::$breznikPass);
        $data = [
            'description' => 'breznikov',
            'name'        => 'TEST breznikov',
        ];
        $resp = $I->failToCreate($this->roleUrl, $data);
        $I->assertEquals(1000008, $resp[0]['code']);
    }

    /**
     * built in vlogam ne sme pustiti dodajanja dovoljenj
     * 
     * @param ApiTester $I
     */
    public function grantPermissionBuiltInVlogi(ApiTester $I)
    {
        /*
         * built in vloga
         */
        $resp = $I->failCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => $this->objRole1['name'],
            'permname' => 'OptionValue-read',
        ]);
        $I->assertEquals(1000910, $resp['code']);
    }

    /**
     * built in vlogam ne sme pustiti odvzemanja dovoljenj
     * 
     * @param ApiTester $I
     */
    public function revokePermissionaBuiltInVlogi(ApiTester $I)
    {
        /*
         * built in vloga
         */
        $resp = $I->failCallRpc($this->rpcRoleUrl, 'revoke', [
            'rolename' => $this->objRole1['name'],
            'permname' => 'OptionValue-read',
        ]);
        $I->assertEquals(1000913, $resp['code']);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupPermission(ApiTester $I)
    {
        $look                 = $I->lookupEntity("permission", "Trr-read", false);
        $this->objPermission1 = $ent                  = $I->successfullyGet($this->permUrl, $look['id']);

        $look                 = $I->lookupEntity("permission", "Trr-write", false);
        $this->objPermission2 = $ent                  = $I->successfullyGet($this->permUrl, $look['id']);
    }

    /**
     * dodajanje dovoljenja vgrajeni vlogi ne sme biti dovoljeno 
     * 
     * @param ApiTester $I
     */
    public function ustvariRelacijoVgrajeneSPermissionom(ApiTester $I)
    {
        $resp = $I->failToUpdate($this->roleUrl, $this->objRole1['id'] . "/permissions/" . $this->objPermission1['id'], []);
        $I->assertEquals(1001500, $resp[0]['code']);
    }

    /**
     * brisanje dovoljenja vgrajeni vlogi ne sme biti dovoljeno 
     * 
     * @param ApiTester $I
     */
    public function brisiRelacijaVgrajeneSPermissionom(ApiTester $I)
    {
        $resp = $I->failToUpdate($this->roleUrl, $this->objRole1['id'] . "/permissions/" . $this->objPermission1['id'], []);
        $I->assertEquals(1001500, $resp[0]['code']);
    }

}
