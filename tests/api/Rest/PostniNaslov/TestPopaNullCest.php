<?php

namespace Rest\PostniNaslov;

use ApiTester;

/**
 * zaradi hjitrejšega testiranja
 * popa=null pri create
 */
class PostniNaslovCest
{

    private $restUrl   = '/rest/postninaslov';
    private $osebaUrl  = '/rest/oseba';
    private $popaUrl   = '/rest/popa';
    private $drzavaUrl = '/rest/drzava';
    private $obj;
    private $objOseba;
    private $objPopa;
    private $objDrzava;

    public function _before(ApiTester $I)
    {

        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);

        set_time_limit(0);
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_TIMEOUT, 500); // 500 seconds
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, false);
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     *  Ustvari osebo
     * 
     * @param ApiTester $I
     */
    public function createOseba(ApiTester $I)
    {
        $data = [
            'naziv'         => 'zz',
            'ime'           => 'zz',
            'priimek'       => 'zz',
            'funkcija'      => 'zz',
            'srednjeIme'    => 'zz',
            'psevdonim'     => 'zz',
            'email'         => 'x@xxx.xx',
            'datumRojstva'  => '1973-28-03T04:30:00',
            'emso'          => 'ZZ',
            'davcna'        => 'ZZ123',
            'spol'          => 'M',
            'opombe'        => 'zz',
            'drzavljanstvo' => 'zz',
            'drzavaRojstva' => 'zz',
            'krajRojstva'   => 'zz',
            'user'          => null,
        ];

        $this->objOseba = $oseba          = $I->successfullyCreate($this->osebaUrl, $data);

        $I->assertEquals('zz', $oseba['ime']);
        $I->assertNotEmpty($oseba['id']);
    }

    /**
     *  napolnimo vsaj en zapis
     *
     * @depends createOseba
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'popa'       => null, //$$  ker je hidden, ne sme biti vključen
            'oseba'      => $this->objOseba['id'], //$$ zakajo to deluje, čeprav je hidden?
            'naziv'      => 'zz',
            'nazivDva'   => 'zz',
            'ulica'      => 'zz',
            'ulicaDva'   => 'zz',
            'posta'      => 'zz',
            'postaNaziv' => 'zz',
            'pokrajina'  => 'zz',
            'drzava'     => null,
            'jeeu'       => false,
            'privzeti'   => true,
        ];
        $this->obj = $pnaslov   = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals('zz', $pnaslov['nazivDva']);
        $I->assertNotEmpty($pnaslov['id']);
    }

}
