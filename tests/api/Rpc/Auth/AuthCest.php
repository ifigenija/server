<?php

namespace Rpc\Auth;

use ApiTester;

/**
 * 
 * 
 * Pokličem checkLogin
 * Se avtentitcoram preko RPC klica  
 * 
 * Preverim, če se je seja vzpostavilia 
 */
class AuthCest
{

    private $rpcUrl = '/rpc/aaa/auth';

    /**
     * Preveri ali je uporabnik prijavljen. 
     * V tem scenariju mora vrniti []
     * 
     * @param ApiTester $I 
     */
    public function checkLogin(ApiTester $I)
    {
        $res = $I->successfullyCallRpc($this->rpcUrl, 'checkLogin', []);
        $I->assertEmpty($res);
    }

    /**
     * Klic  login metode. 
     * Klic mora biti uspešen, vrniti mora podatke o uporabniku in 
     * session mora biti vzpostavljen. 
     */
    public function login(ApiTester $I)
    {
        $res = $I->successfullyCallRpc($this->rpcUrl, 'login', [
            'username' => \IfiTest\AuthPage::$admin,
            'password' => \IfiTest\AuthPage::$adminPass,
        ]);

        $I->assertEquals(\IfiTest\AuthPage::$admin, $res['username'], 'preveri vrnjeno uporabniško ime');
        $sess = $I->grabCookie('PHPSESSID');
        $I->assertNotEmpty($sess, 'session cookie sprejet');
    }

   
}
