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

    private $restUrl = '/rest/role';
    private $rpcUrl  = '/rpc/aaa/role';
    private $id;
    private $obj;
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
    }

    /**
     * 
     * @depends create
     * @param ApiTester $I
     */
//    public function getList(ApiTester $I)  //$$ rb - zaenkrat javi napako pri getPaginator 
//    {
//        $resp = $I->successfullyGetList($this->restUrl, []);
//        $list = $resp['data'];
//
//        $I->assertNotEmpty($list);
//        $this->id = array_pop($list)['id'];
//        $I->assertNotEmpty($this->id);
////        codecept_debug($this);
//    }

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

}
