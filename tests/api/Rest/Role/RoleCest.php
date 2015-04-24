<?php

namespace Rest\Role;

use ApiTester;


/**
 *      - ustvarim rolo,
 *      - preberem rolo
 *      - posodobim rolo 
 *      - preberem rolo in podrobno preverim polja
 *      - role grant; dodam 2 permission-a
 *      - preberem rolo in preverim, če ima permission-e
 *      - role revoke; odstranim 2 permission-a
 *      - brišem rolo
 */
class RoleCest
{

    private $restUrl = '/rest/user';
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
     *  napolnimo vsaj en zapis
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'email'              => 'test2@ifigenija.si',
            'name'               => 'Testni uporabnik za Cest testiranje',
            'password'           => 'zzzzzzzzzzzzzzzzzzz',
            'enabled'            => true,
            'expires'            => '2017-02-01T00:00:00+0100',
            'defaultRoute'       => 'zz',
            'defaultRouteParams' => 'zz',
        ];
        $this->obj = $user      = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals('test2@ifigenija.si', $user['email']);
        $I->assertNotEmpty($user['id']);
    }

    /**
     * Preberem userja
     * 
     * @param ApiTester $I
     * @depends create
     */
    public function preberiUserja(\ApiTester $I)
    {
        $user = $I->successfullyGet($this->restUrl, $this->obj['id']);
        $I->assertNotEmpty($user);
        $I->assertTrue(isset($user['email']));
        $I->assertEquals("test2@ifigenija.si", $user['email']);
    }

    /**
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updateUser(ApiTester $I)
    {
        $user                 = $this->obj;
        $user['defaultRoute'] = 'yy';

        $user = $I->successfullyUpdate($this->restUrl, $user['id'], $user);

        $I->assertEquals('yy', $user['defaultRoute']);
    }

    /**
     * Preberem userja in preverim vsa polja
     * 
     * @param ApiTester $I
     * @depends create
     */
    public function preberiUserjaPodrobno(\ApiTester $I)
    {
        $user = $I->successfullyGet($this->restUrl, $this->obj['id']);
        $I->assertNotEmpty($user);
        $I->assertTrue(isset($user['email']), "email-a ni");
        $I->assertTrue(isset($user['name']));
        $I->assertTrue(isset($user['password']));
        $I->assertTrue(isset($user['enabled']), "enabled polja ni");
        $I->assertTrue(isset($user['expires']));
        $I->assertTrue(isset($user['defaultRoute']));
        $I->assertTrue(isset($user['defaultRouteParams']));

        $I->assertEquals("test2@ifigenija.si", $user['email']);
        $I->assertEquals("Testni uporabnik za Cest testiranje", $user['name']);
        $I->assertEquals(true, $user['enabled']);
        $I->assertEquals("2017-02-01T00:00:00+0100", $user['expires'], "expires ni isti");
        $I->assertEquals("yy", $user['defaultRoute'], "defaultRoute ni ista");
        $I->assertEquals("zz", $user['defaultRouteParams'], "defaultRouteParams ni isto");
    }

    /**
     * Doda dve roli userju
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function userGrantDveRoli(ApiTester $I)
    {
        $user = $this->obj;
        $res  = $I->successfullyCallRpc($this->rpcUrl, 'grant', [
            'username' => $user['email'],
            'rolename' => 'ifi-all',
        ]);

        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        // dodamo še 2. rolo
        $res = $I->successfullyCallRpc($this->rpcUrl, 'grant', [
            'username' => $user['email'],
            'rolename' => 'beri-vse',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        // še enkrat probamo dodati isto rolo 
        $res = $I->successfullyCallRpc($this->rpcUrl, 'grant', [
            'username' => $user['email'],
            'rolename' => 'beri-vse',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);
    }

     /**
     * Userju odvzame dve roli userju
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function userRevokeDveRoli(ApiTester $I)
    {
        $user = $this->obj;
        $res  = $I->successfullyCallRpc($this->rpcUrl, 'revoke', [
            'username' => $user['email'],
            'rolename' => 'ifi-all',
        ]);

        $I->assertNotEmpty($res);
        $I->assertTrue($res);
        
        // še 2. rolo
        $res  = $I->successfullyCallRpc($this->rpcUrl, 'revoke', [
            'username' => $user['email'],
            'rolename' => 'beri-vse',
        ]);

        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        // probamo ponovno revoke-ati rolo
        $res  = $I->successfullyCallRpc($this->rpcUrl, 'revoke', [
            'username' => $user['email'],
            'rolename' => 'beri-vse',
        ]);

        $I->assertNotEmpty($res);
        $I->assertTrue($res);
    }

    
    
    /**
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $user = $I->successfullyDelete($this->restUrl, $this->obj['id']);
        $I->failToGet($this->restUrl, $this->obj['id']);
    }
}
