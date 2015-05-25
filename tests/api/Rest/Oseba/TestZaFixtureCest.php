<?php

namespace Rest\Oseba;

use ApiTester;

/**
 */
class TestZaFixtureCest
{

    private $restUrl         = '/rest/oseba';
    private $relationPopaUrl = '/rest/user/popa/';
    private $trrUrl          = '/rest/trr';
    private $naslUrl         = '/rest/postninaslov';
    private $telUrl          = '/rest/telefonska';
    private $drzavaUrl       = '/rest/drzava';
    private $popaUrl         = '/rest/popa';
    private $userUrl         = '/rest/user';
    private $alternacijaUrl  = '/rest/alternacija';
    private $sodelovanjeUrl  = '/rest/sodelovanje';
    private $zaposlitevUrl   = '/rest/zaposlitev';
    private $id;
    private $obj;
    private $obj2;
    private $objpostni;
    private $objtrr;
    private $objtel;
    private $objDrzava;
    private $objPopa1;
    private $objPopa2;
    private $objUser;
    private $trr;
    private $postni;
    private $tel;
    private $tel2;
    private $telefonskaUrl   = '/rest/telefonska';
    private $pogodbaUrl      = '/rest/pogodba';
    private $objTelefonska1;
    private $objTelefonska2;
    private $objTrr1;
    private $objTrr2;
    private $objPogodba1;
    private $objPogodba2;
    private $objAlternacija1;
    private $objAlternacija2;
    private $objSodelovanje1;
    private $objSodelovanje2;
    private $objZaposlitev1;
    private $objZaposlitev2;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
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
        $data = [
            'naziv'         => 'g.',
            'ime'           => 'Janez',
            'priimek'       => 'Novak',
            'funkcija'      => 'a',
            'srednjeIme'    => 'Peter',
            'psevdonim'     => 'Jani',
            'email'         => 'jani.novak@xxx.xx',
            'datumRojstva'  => '1958-01-06T00:00:00+0100',
            'emso'          => '0601958000000',
            'davcna'        => '123456789',
            'spol'          => 'M',
            'opombe'        => 'Jani Janez',
            'drzavljanstvo' => 'Slovenija',
            'drzavaRojstva' => 'Slovenija',
            'krajRojstva'   => 'Ljubljana',
            'user'          => null,
        ];
        $oseba = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($oseba['id']);
   
        // kreiramo še en zapis
        $data = [
            'naziv'         => 'dr.',
            'ime'           => 'Anton',
            'priimek'       => 'Horvat',
            'funkcija'      => 'b',
            'srednjeIme'    => '',
            'psevdonim'     => '',
            'email'         => 'anton.horvat@xxx.xx',
            'datumRojstva'  => '1968-02-12T00:00:00+0100',
            'emso'          => '1202968111111',
            'davcna'        => '234567890',
            'spol'          => 'M',
            'opombe'        => '',
            'drzavljanstvo' => 'Slovenija',
            'drzavaRojstva' => 'Slovenija',
            'krajRojstva'   => 'Maribor',
            'user'          => null,
        ];
        $oseba = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($oseba['id']);
   
        // kreiramo še en zapis
        $data = [
            'naziv'         => '',
            'ime'           => 'Ivan',
            'priimek'       => 'Kovačič',
            'funkcija'      => 'c',
            'srednjeIme'    => '',
            'psevdonim'     => '',
            'email'         => 'ivan.kovacic@xxx.xx',
            'datumRojstva'  => '1975-03-26T00:00:00+0100',
            'emso'          => '2603976222222',
            'davcna'        => '345678901',
            'spol'          => 'M',
            'opombe'        => '',
            'drzavljanstvo' => 'Slovenija',
            'drzavaRojstva' => 'Slovenija',
            'krajRojstva'   => 'Celje',
            'user'          => null,
        ];
        $oseba = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($oseba['id']);
   
        // kreiramo še en zapis
        $data = [
            'naziv'         => 'prof.',
            'ime'           => 'Jožef',
            'priimek'       => 'Krajnc',
            'funkcija'      => 'd',
            'srednjeIme'    => '',
            'psevdonim'     => 'Joža',
            'email'         => 'jozef.krajnc@xxx.xx',
            'datumRojstva'  => '1971-04-30T00:00:00+0100',
            'emso'          => '3004971333333',
            'davcna'        => '456789012',
            'spol'          => 'M',
            'opombe'        => '',
            'drzavljanstvo' => 'Slovenija',
            'drzavaRojstva' => 'Slovenija',
            'krajRojstva'   => 'Kranj',
            'user'          => null,
        ];
        $oseba = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($oseba['id']);
   
        // kreiramo še en zapis
        $data = [
            'naziv'         => '',
            'ime'           => 'Marko',
            'priimek'       => 'Zupančič',
            'funkcija'      => 'e',
            'srednjeIme'    => '',
            'psevdonim'     => '',
            'email'         => 'marko.zupancic@xxx.xx',
            'datumRojstva'  => '1984-05-07T00:00:00+0100',
            'emso'          => '0705984444444',
            'davcna'        => '567890123',
            'spol'          => 'M',
            'opombe'        => '',
            'drzavljanstvo' => 'Slovenija',
            'drzavaRojstva' => 'Slovenija',
            'krajRojstva'   => 'Koper',
            'user'          => null,
        ];
        $oseba = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($oseba['id']);
   
        // kreiramo še en zapis
        $data = [
            'naziv'         => 'ga.',
            'ime'           => 'Marija',
            'priimek'       => 'Kovač',
            'funkcija'      => 'f',
            'srednjeIme'    => '',
            'psevdonim'     => '',
            'email'         => 'marija.kovac@xxx.xx',
            'datumRojstva'  => '1962-06-19T00:00:00+0100',
            'emso'          => '1906962444444',
            'davcna'        => '678901234',
            'spol'          => 'Z',
            'opombe'        => '',
            'drzavljanstvo' => 'Slovenija',
            'drzavaRojstva' => 'Slovenija',
            'krajRojstva'   => 'Murska Sobota',
            'user'          => null,
        ];
        $oseba = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($oseba['id']);
   
        // kreiramo še en zapis
        $data = [
            'naziv'         => 'ga.',
            'ime'           => 'Ana',
            'priimek'       => 'Potočnik',
            'funkcija'      => 'g',
            'srednjeIme'    => '',
            'psevdonim'     => '',
            'email'         => 'ana.potocnik@xxx.xx',
            'datumRojstva'  => '1975-07-24T00:00:00+0100',
            'emso'          => '2407975555555',
            'davcna'        => '789012345',
            'spol'          => 'Z',
            'opombe'        => '',
            'drzavljanstvo' => 'Slovenija',
            'drzavaRojstva' => 'Slovenija',
            'krajRojstva'   => 'Novo Mesto',
            'user'          => null,
        ];
        $oseba = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($oseba['id']);
   
        // kreiramo še en zapis
        $data = [
            'naziv'         => 'ga.',
            'ime'           => 'Maja',
            'priimek'       => 'Mlakar',
            'funkcija'      => 'h',
            'srednjeIme'    => '',
            'psevdonim'     => '',
            'email'         => 'maja.mlakar@xxx.xx',
            'datumRojstva'  => '1986-08-02T00:00:00+0100',
            'emso'          => '0208986666666',
            'davcna'        => '890123456',
            'spol'          => 'Z',
            'opombe'        => '',
            'drzavljanstvo' => 'Slovenija',
            'drzavaRojstva' => 'Slovenija',
            'krajRojstva'   => 'Nova Gorica',
            'user'          => null,
        ];
        $oseba = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($oseba['id']);
   
        // kreiramo še en zapis
        $data = [
            'naziv'         => '',
            'ime'           => 'Irena',
            'priimek'       => 'Kos',
            'funkcija'      => 'i',
            'srednjeIme'    => '',
            'psevdonim'     => '',
            'email'         => 'irena.kos@xxx.xx',
            'datumRojstva'  => '1967-09-14T00:00:00+0100',
            'emso'          => '1409967777777',
            'davcna'        => '901234567',
            'spol'          => 'Z',
            'opombe'        => '',
            'drzavljanstvo' => 'Slovenija',
            'drzavaRojstva' => 'Slovenija',
            'krajRojstva'   => 'Ptuj',
            'user'          => null,
        ];
        $oseba = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($oseba['id']);
   
        // kreiramo še en zapis
        $data = [
            'naziv'         => '',
            'ime'           => 'Mojca',
            'priimek'       => 'Vidmar',
            'funkcija'      => 'J',
            'srednjeIme'    => '',
            'psevdonim'     => '',
            'email'         => 'mojca.vidmar@xxx.xx',
            'datumRojstva'  => '1967-09-14T00:00:00+0100',
            'emso'          => '1409967777777',
            'davcna'        => '901234567',
            'spol'          => 'Z',
            'opombe'        => '',
            'drzavljanstvo' => 'Slovenija',
            'drzavaRojstva' => 'Slovenija',
            'krajRojstva'   => 'Ptuj',
            'user'          => null,
        ];
        $oseba = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($oseba['id']);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListVse(ApiTester $I)
    {
        $listUrl = $this->restUrl . "/vse";
        codecept_debug($listUrl);
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];
        codecept_debug($list);
        
        $I->assertNotEmpty($list);
        $I->assertGreaterThanOrEqual( 10, $resp['state']['totalRecords'], "total records");
    }

}
