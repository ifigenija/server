<?php

/*
 *  Licenca GPLv3
 */

namespace Lookup;

use ApiTester;

/**
 * Description of LookupCest
 *
 * lookup nekaterih entitet, kjer je implementiran lookup
 * 
 * @author rado
 */
class LookupCest
{

    private $lookupDrzavaUrl        = '/lookup/drzava';
    private $lookupProdukcijskaHisa = '/lookup/produkcijskahisa';

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupDrzava(ApiTester $I)
    {
        $resp = $I->successfullyGetList($this->lookupDrzavaUrl, []);
        $I->assertNotEmpty($resp);
        $I->assertTrue(array_key_exists('data', $resp), "ima data");
        $I->assertTrue(array_key_exists('label', $resp['data'][0]), "ima labelo");
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupDrzavaQ(ApiTester $I)
    {

        $resp = $I->successfullyGetList($this->lookupDrzavaUrl . "?q=otoki", []);
        $I->assertNotEmpty($resp);
        $I->assertTrue(array_key_exists('data', $resp), "ima data");
        $I->assertTrue(array_key_exists('label', $resp['data'][0]), "ima labelo");
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupDrzavaFilter(ApiTester $I)
    {

        $resp = $I->successfullyGetList($this->lookupDrzavaUrl . '?filter[naziv]=Danska', []);
        $I->assertNotEmpty($resp);
        $I->assertTrue(array_key_exists('data', $resp), "ima data");
        $I->assertTrue(array_key_exists('label', $resp['data'][0]), "ima labelo");
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupDrzavaSifra(ApiTester $I)
    {

        $resp = $I->successfullyGetList($this->lookupDrzavaUrl . '?ident=SI', []);
        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->assertTrue(array_key_exists('data', $resp), "ima data");
        $I->assertTrue(array_key_exists('label', $resp['data'][0]), "ima labelo");
        $I->assertTrue(array_key_exists('totalRecords', $resp['state']), "ima total records");
        $I->assertEquals(1, $resp['state']['totalRecords'], "total records");
    }

}
