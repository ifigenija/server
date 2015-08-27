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
            'username' => \IfiTest\AuthPage::$vesna,
            'password' => \IfiTest\AuthPage::$vesnaPass,
        ]);

        $I->assertEquals(\IfiTest\AuthPage::$vesna, $res['username'], 'preveri vrnjeno uporabniško ime');
        $sess = $I->grabCookie('PHPSESSID');
        $I->assertNotEmpty($sess, 'session cookie sprejet');
    }

    /**
     */
    public function loginZNapacnimGeslom(ApiTester $I)
    {
        $resp = $I->failCallRpc($this->rpcUrl, 'login', [
            'username' => \IfiTest\AuthPage::$vesna,
            'password' => "neobstojeceGeslo1234.",
        ]);
        codecept_debug($resp);
        $I->assertEquals(1000998, $resp['code'], 'Vpis ni uspel');
       
        
        $resp = $I->failCallRpc($this->rpcUrl, 'login', [
            'username' => 'neobstojec',
            'password' => "neobstojeceGeslo1234.",
        ]);
        codecept_debug($resp);
        $I->assertEquals(1000998, $resp['code'], 'Vpis ni uspel');
    }

}
