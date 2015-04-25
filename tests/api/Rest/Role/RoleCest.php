<?php

namespace Rest\Role;

use ApiTester;

/**
 *      - ustvarim rolo,
 *      - preberem rolo
 *      - posodobim rolo 
 *      - role grant; dodam 2 permission-a
 *      - preberem rolo in preverim, če ima 2 permission-e 
 *      - role revoke; odstranim 2 permission-a
 * - brišem rolo
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
        ];
        $this->obj = $role      = $I->successfullyCreate($this->restUrl, $data);

        $I->assertEquals('TEST4VLOGA', $role['name']);
        $I->assertEquals('Testna vloga za Cest testiranje', $role['description']);
        $I->assertNotEmpty($role['id']);
    }

    /**
     * Preberem rolo
     * 
     * @param ApiTester $I
     * @depends create
     */
    public function preberiRolo(\ApiTester $I)
    {
        $role = $I->successfullyGet($this->restUrl, $this->obj['id']);
        $I->assertNotEmpty($role);
        $I->assertEquals('TEST4VLOGA', $role['name']);
        $I->assertEquals('Testna vloga za Cest testiranje', $role['description']);
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
    public function preberiRoloSteviloPermissionov(\ApiTester $I)
    {
        $role = $I->successfullyGet($this->restUrl, $this->obj['id']);
        $I->assertNotEmpty($role);

        $I->assertTrue(isset($role['permissions']), "dovoljenj ni");
        $I->assertEquals(2, count($role['permissions']));
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
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $role = $I->successfullyDelete($this->restUrl, $this->obj['id']);
        $I->failToGet($this->restUrl, $this->obj['id']);
    }

}
