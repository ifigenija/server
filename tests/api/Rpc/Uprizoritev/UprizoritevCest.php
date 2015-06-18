<?php

namespace Rpc\Uprizoritev;

use ApiTester;

/**
 * Testiranje metod UprizoritevService-a
 * - novaMaticnaKoprodukcija
 * negativni testi
 * - neveljaven id uprizoritve
 * - koprodukcija že obstaja
 * - itd.
 */
class UprizoritevCest
{

    private $rpcUrl               = '/rpc/produkcija/uprizoritev';
    private $lookupUprizoritevUrl = '/lookup/uprizoritev';
    private $lookUprizoritev1;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupUprizoritev(ApiTester $I)
    {
        // uprizoritev brez koprodukcije
        $resp                   = $I->successfullyGetList($this->lookupUprizoritevUrl . '?ident=0001', []);
        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->assertTrue(array_key_exists('data', $resp), "ima data");
        $I->assertTrue(array_key_exists('label', $resp['data'][0]), "ima labelo");
        $I->assertTrue(array_key_exists('totalRecords', $resp['state']), "ima total records");
        $I->assertEquals(1, $resp['state']['totalRecords'], "total records");
        $this->lookUprizoritev1 = $resp['data'][0];
    }

    /**
     * 
     * @param ApiTester $I 
     */
    public function novaMaticnaKoprodukcija(ApiTester $I)
    {
        // pričakujemo kreiranje nove produkcijske delitve za lastno gledališče
        $resp = $I->successfullyCallRpc($this->rpcUrl, 'novaMaticnaKoprodukcija', ["uprizoritevId" => $this->lookUprizoritev1['id']]);
        $I->assertNotEmpty($resp);
        $I->seeResponseIsJson();
        $I->assertEquals(36, strlen($resp), "dolžina guid");
        $I->assertEquals(8, stripos($resp, "-"), "prvi '-' v  guid");
    }

    public function ponovnoNovaMaticnaKoprodukcija(ApiTester $I)
    {

        // pričakujemo napako, ker delitev že obstaja
        $resp = $I->failCallRpc($this->rpcUrl, 'novaMaticnaKoprodukcija', ["uprizoritevId" => $this->lookUprizoritev1['id']]);
        $I->assertNotEmpty($resp);
        $I->assertEquals(1000932, $resp['code'], "produkcijska delitev že obstaja");
    }

    public function novaMaticnaKoprodukcijaBrezUprizoritve(ApiTester $I)
    {

        // pričakujemo napako, ker delitev že obstaja
        $resp = $I->failCallRpc($this->rpcUrl, 'novaMaticnaKoprodukcija', ["uprizoritevId" => "neobstojeca"]);
        $I->assertNotEmpty($resp);
//        $I->assertEquals(1000932, $resp['code'], "produkcijska delitev že obstaja");
    }

}