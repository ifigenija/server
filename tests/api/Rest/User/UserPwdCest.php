<?php

namespace Rest\User;

use ApiTester;

/**
 *      - ustvarim userja z nekim geslom,
 *      - prijava z uporabniškim imenom in geslom 
 *      - brišem userja 
 */
class UserPwdCest
{
    private $restUrl = '/rest/user';
    private $rpcUrl  = '/rpc/aaa/auth';
    private $id;
    private $obj;
    private $user;
    private $sess;

    public function _before(ApiTester $I)
    {
        //_before metodo nalašč pustimo prazno
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
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);

        $data      = [
            'email'    => 'test3@ifigenija.si',
            'name'     => 'Testni uporabnik za testiranje gesla',
            'password' => 'abc123',
            'enabled' => true,
        ];
        $this->obj = $user      = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals('test3@ifigenija.si', $user['email']);
        $I->assertNotEmpty($user['id']);
    }

    /**
     * Preverimo, če se da prijaviti z geslom
     * 
     * Klic  login metode. 
     * Klic mora biti uspešen, vrniti mora podatke o uporabniku in 
     * session mora biti vzpostavljen. 
     * @depends create
     */
    public function login(ApiTester $I)
    {
        $res = $I->successfullyCallRpc($this->rpcUrl, 'login', [
            'username' => 'test3@ifigenija.si',
            'password' =>  'abc123',
        ]);

        $I->assertEquals('test3@ifigenija.si', $res['username'], 'preveri vrnjeno uporabniško ime');
        $sess = $I->grabCookie('PHPSESSID');
        $I->assertNotEmpty($sess, 'session cookie sprejet');
    }

    /**
     * @depends create
     * @depends login
     */
    public function delete(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);

        $user = $I->successfullyDelete($this->restUrl, $this->obj['id']);
        $I->failToGet($this->restUrl, $this->obj['id']);
    }

}
