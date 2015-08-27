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
     * V tem scenariju mora vrniti [], če še ni prijavljen
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
     * 
     * @param ApiTester $I
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

        /**
         * sprobamo, ali nismo več prijavljeni s starim
         */
        $res = $I->successfullyCallRpc($this->rpcUrl, 'checkLogin', []);
        $I->assertEmpty($res, "ali prijavljeni s starim?");
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function spremeniGesloNapacnoStaro(ApiTester $I)
    {
        /**
         * najprej prijava
         */
        $resp = $I->successfullyCallRpc($this->rpcUrl, 'login', [
            'username' => \IfiTest\AuthPage::$vesna,
            'password' => \IfiTest\AuthPage::$vesnaPass,
        ]);
        $I->assertEquals(\IfiTest\AuthPage::$vesna, $resp['username'], 'preveri vrnjeno uporabniško ime');

        /**
         * sprobamo, ali smo če prijavljeni s starim
         */
        $res = $I->successfullyCallRpc($this->rpcUrl, 'checkLogin', []);
        $I->assertNotEmpty($res);

        /**
         * sprememba gesla -napačno staro
         */
        $newPassword = '1234abcd.';
        $resp        = $I->failCallRpc($this->rpcUrl, 'changePassword', [
            'oldPassword' => 'napacnoG1!',
            'newPassword' => $newPassword,
        ]);
        codecept_debug($resp);
        $I->assertEquals(1000994, $resp['code'], "Napačno staro geslo");

        /**
         * sprobamo, ali smo če prijavljeni s starim
         */
        $res = $I->successfullyCallRpc($this->rpcUrl, 'checkLogin', []);
        $I->assertNotEmpty($res);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function spremeniGesloNeprijavljen(ApiTester $I)
    {
        $resp = $I->failCallRpc($this->rpcUrl, 'login', [
            'username' => 'neobstojec',
            'password' => "neobstojeceGeslo1234.",
        ]);

        /**
         * sprobamo, ali smo če nismo več prijavljeni s starim
         */
        $res = $I->successfullyCallRpc($this->rpcUrl, 'checkLogin', []);
        $I->assertEmpty($res);

        $resp = $I->failCallRpc($this->rpcUrl, 'changePassword', [
            'oldPassword' => 'nekaj',
            'newPassword' => 'nekajB',
        ]);
        codecept_debug($resp);
        $I->assertEquals(1000995, $resp['code'], "Neprijavljen uporabnik");
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function spremeniGesloPrekratkoNovo(ApiTester $I)
    {
        /**
         * najprej prijava
         */
        $resp = $I->successfullyCallRpc($this->rpcUrl, 'login', [
            'username' => \IfiTest\AuthPage::$vesna,
            'password' => \IfiTest\AuthPage::$vesnaPass,
        ]);
        $I->assertEquals(\IfiTest\AuthPage::$vesna, $resp['username'], 'preveri vrnjeno uporabniško ime');

        /**
         * sprememba gesla -napačno staro
         */
        $resp = $I->failCallRpc($this->rpcUrl, 'changePassword', [
            'oldPassword' => \IfiTest\AuthPage::$vesnaPass,
            'newPassword' => 'kratko',
        ]);
        codecept_debug($resp);
        $I->assertEquals(1000473, $resp['code'], "prekratko geslo");

        /**
         * sprobamo, ali smo če prijavljeni s starim
         */
        $res = $I->successfullyCallRpc($this->rpcUrl, 'checkLogin', []);
        $I->assertNotEmpty($res);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function spremeniGesloIstoNovo(ApiTester $I)
    {
        /**
         * najprej prijava
         */
        $resp = $I->successfullyCallRpc($this->rpcUrl, 'login', [
            'username' => \IfiTest\AuthPage::$vesna,
            'password' => \IfiTest\AuthPage::$vesnaPass,
        ]);
        $I->assertEquals(\IfiTest\AuthPage::$vesna, $resp['username'], 'preveri vrnjeno uporabniško ime');

        /**
         * sprememba gesla
         */
        $newPassword = '1234abcd.';
        $resp        = $I->failCallRpc($this->rpcUrl, 'changePassword', [
            'oldPassword' => \IfiTest\AuthPage::$vesnaPass,
            'newPassword' => \IfiTest\AuthPage::$vesnaPass, //isto kot staro
        ]);
        codecept_debug($resp);
        $I->assertEquals(1000993, $resp['code'], "Novo geslo enako staremu");
    }

    
    
    /**
     * 
     * @param ApiTester $I
     */
    public function spremeniGeslo(ApiTester $I)
    {
        /**
         * najprej prijava
         */
        $resp = $I->successfullyCallRpc($this->rpcUrl, 'login', [
            'username' => \IfiTest\AuthPage::$vesna,
            'password' => \IfiTest\AuthPage::$vesnaPass,
        ]);
        $I->assertEquals(\IfiTest\AuthPage::$vesna, $resp['username'], 'preveri vrnjeno uporabniško ime');

        /**
         * sprememba gesla
         */
        $newPassword = '1234abcd.';
        $resp        = $I->successfullyCallRpc($this->rpcUrl, 'changePassword', [
            'oldPassword' => \IfiTest\AuthPage::$vesnaPass,
            'newPassword' => $newPassword,
        ]);
        $I->assertTrue($resp, "geslo uspešno zamenjano");

        /**
         * sprobamo, ali novo geslo prime
         */
        $resp = $I->successfullyCallRpc($this->rpcUrl, 'login', [
            'username' => \IfiTest\AuthPage::$vesna,
            'password' => $newPassword,
        ]);
        $I->assertEquals(\IfiTest\AuthPage::$vesna, $resp['username']);
        codecept_debug($resp);
        
        /**
         * vrni geslo nazaj zaradi ostalih testov
         */
        $newPassword = '1234abcd.';
        $resp        = $I->successfullyCallRpc($this->rpcUrl, 'changePassword', [
            'oldPassword' => $newPassword,
            'newPassword' => \IfiTest\AuthPage::$vesnaPass, //vrnemo nazaj
        ]);
        $I->assertTrue($resp,"geslo vrnjeno");
        
    }


}
