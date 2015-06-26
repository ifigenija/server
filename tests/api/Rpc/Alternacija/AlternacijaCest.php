<?php

namespace Rpc\Alternacija;

use ApiTester;

/**
 * Testiranje metod AlternacijaService-a
 *      - novaPogodba
 *      negativni testi
 *      - neveljaven id alternacije
 *      - pogodba že obstaja
 * - itd
 *      idempotentnost -je ni
 */
class AlternacijaCest
{

    private $rpcUrl               = '/rpc/produkcija/alternacija';
    private $lookupAlternacijaUrl = '/lookup/alternacija';
    private $lookAlternacija1;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupAlternacija(ApiTester $I)
    {
        // alternacija brez pogodbe
        $resp                   = $I->successfullyGetList($this->lookupAlternacijaUrl . '?ident=0003', []);
        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->assertTrue(array_key_exists('data', $resp), "ima data");
        $I->assertTrue(array_key_exists('label', $resp['data'][0]), "ima labelo");
        $I->assertTrue(array_key_exists('totalRecords', $resp['state']), "ima total records");
        $I->assertEquals(1, $resp['state']['totalRecords'], "total records");
        $this->lookAlternacija1 = $resp['data'][0];
    }

    /**
     *  -  getAlternacijas  defaultValue 
     * 
     * @param ApiTester $I 
     */
    public function novaPogodba(ApiTester $I)
    {
        // pričakujemo kreiranje nove pogodbe
        $resp = $I->successfullyCallRpc($this->rpcUrl, 'novaPogodba', ["alternacijaId" => $this->lookAlternacija1['id']]);
        $I->assertNotEmpty($resp);
        $I->seeResponseIsJson();
        $I->assertEquals(36, strlen($resp), "dolžina guid");
        $I->assertEquals(8, stripos($resp, "-"), "prvi '-' v  guid");
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function ponovnoNovaPogodba(ApiTester $I)
    {

        // pričakujemo napako, ker pogodba že obstaja
        $resp = $I->failCallRpc($this->rpcUrl, 'novaPogodba', ["alternacijaId" => $this->lookAlternacija1['id']]);
        $I->assertNotEmpty($resp);
        $I->assertEquals(1000922, $resp['code'], "pogodba že obstaja");
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function novaPogodbaCudenIdAlternacije(ApiTester $I)
    {

        // pričakujemo napako, ker pogodba že obstaja
        $resp = $I->failCallRpc($this->rpcUrl, 'novaPogodba', ["alternacijaId" => "neobstoječe"]);
        $I->assertNotEmpty($resp);
//        $I->assertEquals(1000922, $resp['code'], "pogodba že obstaja");
    }

}
