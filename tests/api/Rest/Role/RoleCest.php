<?php

namespace Rest\Role;

use ApiTester;

/**
 * 
 * metode, ki jo podpira API
 *      -create
 *  -getlist
 *      -update
 *      -get - kontrola vseh polj te entitete
 *      -delete
 *  -validate metodo za entiteto  -> ni validacije za testiranje
 * relacije z drugimi entitetami
 *      - role grant; dodam 2 permission-a
 *      - preberem rolo in preverim, če ima 2 permission-e 
 *      - role revoke; odstranim 2 permission-a
 *  - relacijo z userjem bomo testirali pri userju 
 * 
 */
class RoleCest
{

    private $restUrl       = '/rest/role';
    private $userUrl       = '/rest/user';
    private $permissionUrl = '/rest/permission';
    private $rpcUrl        = '/rpc/aaa/role';
    private $id;
    private $obj;
    private $objRole2;
    private $objPermission1;
    private $objPermission2;
    private $objUser1;
    private $objUser2;
    private $lookUser1;
    private $lookUser2;
    private $role;
    private $perm;
    private $sess;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     * kreiramo rolo 
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'name'        => 'TEST4VLOGA',
            'description' => 'Testna vloga za Cest testiranje',
//            'builtIn'     => false,     //$$ rb NotEmpty validator ne dovoli false
        ];
        $this->obj = $role      = $I->successfullyCreate($this->restUrl, $data);

        $I->assertEquals('TEST4VLOGA', $role['name']);
        $I->assertEquals('Testna vloga za Cest testiranje', $role['description']);
        $I->assertNotEmpty($role['id']);

        // kreiramo še en zapis
        $data           = [
            'name'        => 'TEST5VLOGA',
            'description' => 'Testna vlogica za Cest testiranje',
//            'builtIn'     => false,     //$$ rb NotEmpty validator ne dovoli false
        ];
        $this->objRole2 = $role           = $I->successfullyCreate($this->restUrl, $data);

        $I->assertEquals('TEST5VLOGA', $role['name']);
        $I->assertNotEmpty($role['id']);
    }

    
    
    /**
     * 
     * @param ApiTester $I
     */
    public function lookupUser(ApiTester $I)
    {
        $this->lookUser1 = $ent            = $I->lookupEntity("user", "tatjana@ifigenija.si", false);
        $I->assertNotEmpty($ent);
        
        $this->lookUser2 = $ent            = $I->lookupEntity("user", "joze@ifigenija.si", false);
        $I->assertNotEmpty($ent);
    }

    
    /**
     *  napolnimo vsaj en zapis
     * 
     * @param ApiTester $I
     */
//    public function createUserja(ApiTester $I)
//    {
//        $data           = [
//            'email'              => 'test2@ifigenija.si',
//            'name'               => 'Testni uporabnik za Cest testiranje',
//            'password'           => 'zzzzzzzzzzzzzzzzzzz',
//            'enabled'            => true,
//            'expires'            => '2017-02-01T00:00:00+0100',
//            'defaultRoute'       => 'zz',
//            'defaultRouteParams' => 'zz',
//        ];
//        $this->objUser1 = $user           = $I->successfullyCreate($this->userUrl, $data);
//        $I->assertEquals('test2@ifigenija.si', $user['email']);
//        $I->assertNotEmpty($user['id']);
//
//        // kreiramo še en zapis
//        $data           = [
//            'email'              => 'test6@ifigenija.si',
//            'name'               => 'Testni uporabnik za Cest testiranje',
//            'password'           => 'asdfew',
//            'enabled'            => true,
//            'expires'            => '2018-02-01T00:00:00+0100',
//            'defaultRoute'       => 'aa',
//            'defaultRouteParams' => 'aa',
//        ];
//        $this->objUser2 = $user           = $I->successfullyCreate($this->userUrl, $data);
//        $I->assertEquals('test6@ifigenija.si', $user['email']);
//        $I->assertNotEmpty($user['id']);
//    }

        /**
     * @param ApiTester $I
     */
    public function getListPermission(ApiTester $I)
    {
        $resp            = $I->successfullyGetList($this->permissionUrl, []);
        $list            = $resp['data'];
        $I->assertNotEmpty($list);
        
        $this->objPermission1 = $drzava          = array_pop($list);
        $I->assertNotEmpty($drzava);

        $this->objPermission2 = $drzava          = array_pop($list);
        $I->assertNotEmpty($drzava);
    }

    
    
    /**
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updateRole(ApiTester $I)
    {
        $role                = $this->obj;
        $role['description'] = 'spremenjeno';
        $role['name']        = 'TEST4S';

        $this->obj = $role      = $I->successfullyUpdate($this->restUrl, $role['id'], $role);

        $I->assertEquals('TEST4S', $role['name']);
        $I->assertEquals('spremenjeno', $role['description']);
    }

    /**
     * Doda dve dovoljenji vlogi
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function roleGrantDvaPermissiona(ApiTester $I)
    {
        $role = $this->obj;
        $res  = $I->successfullyCallRpc($this->rpcUrl, 'grant', [
            'rolename' => $role['name'],
            'permname' => 'Drzava-read',
        ]);

        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        // dodamo še 2. dovoljenje
        $res = $I->successfullyCallRpc($this->rpcUrl, 'grant', [
            'rolename' => $role['name'],
            'permname' => 'Drzava-write',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        // še enkrat probamo dodati isto dovoljenje 
        $res = $I->successfullyCallRpc($this->rpcUrl, 'grant', [
            'rolename' => $role['name'],
            'permname' => 'Drzava-write',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);
    }

    /**
     * Preverim, ali ima vloga 2 dovoljenji
     * 
     * @param ApiTester $I
     * @depends create
     * @depends roleGrantDvaPermissiona
     */
    public function preberiRolo(\ApiTester $I)
    {
        $role = $I->successfullyGet($this->restUrl, $this->obj['id']);
        $I->assertNotEmpty($role);

        $I->assertEquals('TEST4S', $role['name']);
        $I->assertEquals('spremenjeno', $role['description']);

        $I->assertTrue(isset($role['permissions']));
        $I->assertTrue(isset($role['users']));
        $I->assertEquals(2, count($role['permissions']));
        $I->assertEquals(0, count($role['users']));
    }

    /**
     * Roli odvzamemo dve dovoljenji
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function userRevokeDvaPermissiona(ApiTester $I)
    {

        $role = $this->obj;
        $res  = $I->successfullyCallRpc($this->rpcUrl, 'revoke', [
            'rolename' => $role['name'],
            'permname' => 'Drzava-read',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        // še 2. permission
        $res = $I->successfullyCallRpc($this->rpcUrl, 'revoke', [
            'rolename' => $role['name'],
            'permname' => 'Drzava-write',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        // probamo ponovno revoke-ati permission
        $res = $I->successfullyCallRpc($this->rpcUrl, 'revoke', [
            'rolename' => $role['name'],
            'permname' => 'Drzava-write',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);
    }

    /**
     * Preverim, ali ima vloga odvzeti obe dovoljenji
     * 
     * @depends userRevokeDvaPermissiona
     * @param ApiTester $I
     */
    public function preberiRoloSteviloPermissionov(\ApiTester $I)
    {
        $role = $I->successfullyGet($this->restUrl, $this->obj['id']);
        $I->assertNotEmpty($role);

        $I->assertTrue(isset($role['permissions']));
        $I->assertEquals(0, count($role['permissions']));
    }

    /**
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $role = $I->successfullyDelete($this->restUrl, $this->obj['id']);
        $I->failToGet($this->restUrl, $this->obj['id']);
    }

    /**
     * kreiramo relacijo
     * @depends create
     * @depends getListPermission
     * 
     * @param ApiTester $I
     */
    public function ustvariRelacijoSPermissionom(ApiTester $I)
    {
        $resp = $I->successfullyUpdate($this->restUrl, $this->objRole2['id'] . "/permissions/" . $this->objPermission1['id'], []);

        // ustvarimo še eno relacijo z 2. permissionom
        $resp = $I->successfullyUpdate($this->restUrl, $this->objRole2['id'] . "/permissions/" . $this->objPermission2['id'], []);
    }

    /**
     * preberemo relacij
     * @depends ustvariRelacijoSPermissionom
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeSPermissioni(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->objRole2['id'], "permissions", "");
        $I->assertEquals(2, count($resp));

        // get po popa id  
        $resp = $I->successfullyGetRelation($this->restUrl, $this->objRole2['id'], "permissions", $this->objPermission1['id']);
        $I->assertEquals(1, count($resp));
    }

    /**
     * brisanje relacij
     * @depends ustvariRelacijoSPermissionom
     * 
     * @param ApiTester $I
     */
    public function deleteRelacijoSPermissioni(ApiTester $I)
    {
        $resp = $I->successfullyDeleteRelation($this->restUrl, $this->objRole2['id'], "permissions", $this->objPermission1['id']);

        $resp = $I->failToGetRelation($this->restUrl, $this->objRole2['id'], "permissions", $this->objPermission1['id']);
    }
    /**
     * kreiramo relacijo
     * @depends create
     * @depends lookupUser
     * 
     * @param ApiTester $I
     */
    public function ustvariRelacijoZUserjem(ApiTester $I)
    {
        $resp = $I->successfullyUpdate($this->restUrl, $this->objRole2['id'] . "/users/" . $this->lookUser1['id'], []);

        // ustvarimo še eno relacijo z 2. userjem
        $resp = $I->successfullyUpdate($this->restUrl, $this->objRole2['id'] . "/users/" . $this->lookUser2['id'], []);
    }

    /**
     * preberemo relacij
     * @depends ustvariRelacijoZUserjem
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeZUserji(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->objRole2['id'], "users", "");
        $I->assertEquals(2, count($resp));

        // get po popa id  
        $resp = $I->successfullyGetRelation($this->restUrl, $this->objRole2['id'], "users", $this->lookUser1['id']);
        $I->assertEquals(1, count($resp));
    }

    /**
     * brisanje relacij
     * @depends ustvariRelacijoZUserjem
     * 
     * @param ApiTester $I
     */
    public function deleteRelacijoZUserjem(ApiTester $I)
    {
        $resp = $I->successfullyDeleteRelation($this->restUrl, $this->objRole2['id'], "users", $this->lookUser1['id']);

        $resp = $I->failToGetRelation($this->restUrl, $this->objRole2['id'], "users", $this->lookUser1['id']);
    }

}
