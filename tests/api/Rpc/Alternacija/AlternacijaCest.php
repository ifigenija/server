<?php

namespace Rpc\Alternacija;

use ApiTester;

/**
 * Testiranje metod AlternacijaService-a
 * - setPogodba
 * negativni testi
 * - neveljaven id alternacije
 * - itd
 * idempotentnost
 * - ...
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
        $resp                   = $I->successfullyGetList($this->lookupAlternacijaUrl . '?ident=0001', []);
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
        //$$ še dodatna preverjanja -npr. ali so vrednosti na 0 ipd.
        $I->seeResponseIsJson();
//        $I->assertEquals(1000403, $resp['code'], "opcije ne obstajajo" );   
    }

}
