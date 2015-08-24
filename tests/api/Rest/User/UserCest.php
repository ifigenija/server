<?php

namespace Rest\User;

use ApiTester;

/**
 * metode, ki jo podpira API
 *      -create
 *  -getlist
 *      -update
 *      -get - kontrola vseh polj te entitete
 *      -delete
 * 
 *  -validate metodo za entiteto  -> ni validacije za testiranje
 * relacije z drugimi entitetami
 *      - user grant; dodam 2 roli
 *      - preberem userja in preverim, če ima  role
 *      - user revoke; odstranim 2 roli
 * - preberem userja in preverim, če nima več rol
 */
class UserCest
{

    private $restUrl = '/rest/user';
    private $roleUrl = '/rest/role';
    private $rpcUrl  = '/rpc/aaa/user';
    private $id;
    private $obj;
    private $objUser2;
    private $objRole1;
    private $objRole2;
    private $user;
    private $role;
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
    public function createRolo(ApiTester $I)
    {
        $data      = [
            'name'        => 'TEST4VLOGA',
            'description' => 'Testna vloga za Cest testiranje',
//            'builtIn'     => false,     //$$ rb NotEmpty validator ne dovoli false
        ];
        $this->objRole1 = $role      = $I->successfullyCreate($this->roleUrl, $data);

        $I->assertEquals('TEST4VLOGA', $role['name']);
        $I->assertEquals('Testna vloga za Cest testiranje', $role['description']);
        $I->assertNotEmpty($role['id']);

        // kreiramo še 1 zapis
        $data      = [
            'name'        => 'TEST5VLOGA',
            'description' => 'Testna vlogica za Cest testiranje',
//            'builtIn'     => false,     //$$ rb NotEmpty validator ne dovoli false
        ];
        $this->objRole2 = $role      = $I->successfullyCreate($this->roleUrl, $data);

        $I->assertNotEmpty($role['id']);
        $I->assertEquals('TEST5VLOGA', $role['name']);
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
            'password'           => 'abc123ASDF',
            'enabled'            => true,
            'expires'            => '2017-02-01T00:00:00+0100',
            'defaultRoute'       => 'zz',
            'defaultRouteParams' => 'zz',
        ];
        $this->obj = $user      = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals('test2@ifigenija.si', $user['email']);
        $I->assertNotEmpty($user['id']);

        // kreiramo še en zapis
        $data      = [
            'email'              => 'test6@ifigenija.si',
            'name'               => 'Testni uporabnik za Cest testiranje',
            'password'           => 'weiiw3948593845ASDFASEDF',
            'enabled'            => true,
            'expires'            => '2018-02-01T00:00:00+0100',
            'defaultRoute'       => 'aa',
            'defaultRouteParams' => 'aa',
        ];
        $this->objUser2 = $user      = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals('test6@ifigenija.si', $user['email']);
        $I->assertNotEmpty($user['id']);
    }

    /**
     * 
     * @depends create
     * @param ApiTester $I
     */
//    public function getList(ApiTester $I)   //$$ rb - zaenkrat javi napako pri getPaginator 
//    {
//        $resp = $I->successfullyGetList($this->restUrl, []);
//        $list = $resp['data'];
//
//        $I->assertNotEmpty($list);
//        $this->id = array_pop($list)['id'];
//        $I->assertNotEmpty($this->id);
//    }

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
//        $I->assertTrue(isset($user['password']));     //password ne dovolimo prebrati
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
            'rolename' => 'ifi-readall',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        // še enkrat probamo dodati isto rolo 
        $res = $I->successfullyCallRpc($this->rpcUrl, 'grant', [
            'username' => $user['email'],
            'rolename' => 'ifi-readall',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);
    }

    /**
     * Preverim, ali ima user 2 roli
     * 
     * @param ApiTester $I
     * @depends create
     * @depends userGrantDveRoli
     */
    public function preberiUserjaSteviloRol(\ApiTester $I)
    {
        $user = $I->successfullyGet($this->restUrl, $this->obj['id']);
        $I->assertNotEmpty($user);

        $I->assertTrue(isset($user['roles']), "rol ni");
        $I->assertEquals(2, count($user['roles']));
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
        $res = $I->successfullyCallRpc($this->rpcUrl, 'revoke', [
            'username' => $user['email'],
            'rolename' => 'ifi-readall',
        ]);

        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        // probamo ponovno revoke-ati rolo
        $res = $I->successfullyCallRpc($this->rpcUrl, 'revoke', [
            'username' => $user['email'],
            'rolename' => 'ifi-readall',
        ]);

        $I->assertNotEmpty($res);
        $I->assertTrue($res);
    }

        /**
     * Preverim, ali ima user nima več rol
     * 
     * @param ApiTester $I
     * @depends userRevokeDveRoli
     */
    public function preberiUserjaAliNimaRol(\ApiTester $I)
    {
        $user = $I->successfullyGet($this->restUrl, $this->obj['id']);
        $I->assertNotEmpty($user);

        $I->assertTrue(isset($user['roles']));
        $I->assertEquals(0, count($user['roles']));
    }

        /**
     * kreiramo relacijo
     * @depends create
     * @depends createRolo
     * 
     * @param ApiTester $I
     */
    public function ustvariRelacijoZRolo(ApiTester $I)
    {
        $resp = $I->successfullyUpdate($this->restUrl, $this->objUser2['id'] . "/roles/" . $this->objRole1['id'], []);

        // ustvarimo še eno relacijo z 2. rolo
        $resp = $I->successfullyUpdate($this->restUrl, $this->objUser2['id'] . "/roles/" . $this->objRole2['id'], []);
    }

    /**
     * preberemo relacij
     * @depends ustvariRelacijoZRolo
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeZRolami(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->objUser2['id'], "roles", "");
        $I->assertEquals(2, count($resp));

        // get po popa id  
        $resp = $I->successfullyGetRelation($this->restUrl, $this->objUser2['id'], "roles", $this->objRole1['id']);
        $I->assertEquals(1, count($resp));
    }

    /**
     * brisanje relacij
     * @depends ustvariRelacijoZRolo
     * 
     * @param ApiTester $I
     */
    public function deleteRelacijoZRolo(ApiTester $I)
    {
        // primer:
        // DELETE   http://ifigenija.local:8080/rest/oseba/00090000-555b-31ed-d438-f3f46c26b59e/popa/00080000-555b-31ed-7683-d4cdd224d2b5?XDEBUG_SESSION_START=netbeans-xdebug
        $resp = $I->successfullyDeleteRelation($this->restUrl, $this->objUser2['id'], "roles", $this->objRole1['id']);

        $resp = $I->failToGetRelation($this->restUrl, $this->objUser2['id'], "roles", $this->objRole1['id']);
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
