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
     * kreiramo rolo 
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $I->assertEquals('test2@ifigenija.si', $user['email']);
        $I->assertNotEmpty($user['id']);
    }
}
