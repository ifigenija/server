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
 */
class AvtorizacijeCest
{

    private $roleUrl    = '/rest/role';
    private $userUrl    = '/rest/user';
    private $osebaUrl   = '/rest/oseba';
    private $rpcRoleUrl = '/rpc/aaa/role';
    private $rpcUserUrl = '/rpc/aaa/user';
    private $objOseba1;
    private $objOseba2;
    private $objOseba3Prot;
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
    public function createVloge(ApiTester $I)
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
            'permname' => 'Oseba-vse',
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
        
        $res = $I->successfullyCallRpc($this->rpcUserUrl, 'grant', [
            'username' => \IfiTest\AuthPage::$test4,
            'rolename' => 'TEST4RWVSE',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);
    }

    /**
     * Ustvari podatke - tri osebe
     * 
     * @param ApiTester $I
     */
    public function createOsebe(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);

        $data            = [
            'naziv'   => 'xx',
            'ime'     => 'xx',
            'priimek' => 'xx',
            'email'   => 'x@xxx.xx',
        ];
        $this->objOseba1 = $oseba           = $I->successfullyCreate($this->osebaUrl, $data);
        $I->assertEquals('xx', $oseba['ime']);
        $I->assertNotEmpty($oseba['id']);

        // 2. oseba:
        $data            = [
            'naziv'   => 'yy',
            'ime'     => 'yy',
            'priimek' => 'yy',
            'email'   => 'y@yyy.yy',
        ];
        $this->objOseba2 = $oseba           = $I->successfullyCreate($this->osebaUrl, $data);
        $I->assertEquals('yy', $oseba['ime']);
        $I->assertNotEmpty($oseba['id']);

        // 3. oseba: z assert zaščitena
        $data                = [
            'naziv'   => 'zz',
            'ime'     => 'zz',
            'priimek' => 'write protected12345',
            'email'   => 'zz@yyy.yy',
        ];
        $this->objOseba3Prot = $oseba               = $I->successfullyCreate($this->osebaUrl, $data);
        $I->assertEquals('zz', $oseba['ime']);
        $I->assertNotEmpty($oseba['id']);
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
        $oseba = $I->successfullyGet($this->osebaUrl, $this->objOseba1['id']);
        $I->assertNotEmpty($oseba);
        $I->assertEquals($this->objOseba1['priimek'], $oseba['priimek']);

        //update
        $oseba        = $this->objOseba1;
        $oseba['ime'] = 'tralala';
        $I->failToUpdate($this->osebaUrl, $oseba['id'], $oseba); //$$ rb ne deluje - ERROR
        //delete
        $I->failToDelete($this->osebaUrl, $this->objOseba1['id']);        //$$ rb ERROR
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
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$test2, \IfiTest\AuthPage::$test2Pass);

        //get 
        $I->failToGet($this->osebaUrl, $this->objOseba1['id']);

        //update
        $oseba        = $this->objOseba1;
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
        $oseba = $I->successfullyGet($this->osebaUrl, $this->objOseba1['id']);
        $I->assertNotEmpty($oseba);
        $I->assertEquals($this->objOseba1['priimek'], $oseba['priimek']);

        //update
        $oseba        = $this->objOseba1;
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
        //delete
        $oseba = $this->objOseba2;
        $I->successfullyDelete($this->osebaUrl, $oseba['id']);
        $I->failToGet($this->osebaUrl, $oseba['id']);
        //delete neobstoječega bi moral sicer pasti, a brez napake
        $I->failToDelete($this->osebaUrl, $oseba['id']);



        // oseba, ki je z assert zaščitena (v AssertOseba) ne bi smel dovoliti spremeniti niti brisati niti kreirati
        //update
        $oseba        = $this->objOseba3Prot;
        $oseba['ime'] = 'ciracara';

        $I->failToUpdate($this->osebaUrl, $oseba['id'], $oseba);

        //delete
        $I->failToDelete($this->osebaUrl, $oseba['id']);

        // write
        $data = [
            'naziv'   => 'stiri',
            'ime'     => 'stiri',
            'priimek' => 'write protected12345', //to assert ne dovoli!
            'email'   => 'stiri@zzz.zz',
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
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$test4, \IfiTest\AuthPage::$test4Pass);
        // oseba, ki je z assert zaščitena 
        //update
        $oseba        = $this->objOseba3Prot;
        $oseba['ime'] = 'cirkocarko';

        // dostop uspe zaradi posebnega dovoljenja "Oseba-vse"
        $I->successfullyUpdate($this->osebaUrl, $oseba['id'], $oseba);
        $I->assertEquals($oseba['ime'], 'cirkocarko');
    }

   
}
