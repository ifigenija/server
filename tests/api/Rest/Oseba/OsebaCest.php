<?php

namespace Rest\Oseba;

use ApiTester;

/**
 *      - ustvarim osebo,
 *      - preberem (vse) osebo (e)
 *      - posodobim osebo 
 *      - dodam 2 trr 
 *      - preberem 1 trr
 *      - dodam telefonsko številko
 *      - preberem telefonsko številko
 *      - dodam poštni naslov  
 *      - preberem poštni naslov
 *  - popa
 *  - user
 *  - alternacije
 *  - pogodbe
 *  - sodelovanja
 *      - preberem ustvarjeno osebo in preverim, da ima trr-je ipd. z vseh relacij
 * - brišem osebo in se morajo pčistiti poštni naslov, 
 *   trrji in telefonske številke, ker je orphan removal = true
 * - validacija
 */
class OsebaCest
{

    private $restUrl   = '/rest/oseba';
    private $trrUrl    = '/rest/trr';
    private $naslUrl   = '/rest/postninaslov';
    private $telUrl    = '/rest/telefonska';
    private $drzavaUrl = '/rest/drzava';
    private $id;
    private $obj;
    private $objpostni;
    private $objtrr;
    private $objtel;
    private $trr;
    private $postni;
    private $tel;
    private $tel2;

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

        $this->obj = $oseba     = $I->successfullyCreate($this->restUrl, $data);

        $I->assertEquals('zz', $oseba['ime']);
        $I->assertNotEmpty($oseba['id']);
    }

    /**
     * @depends create
     */
    public function getList(ApiTester $I)
    {
        $resp = $I->successfullyGetList($this->restUrl, []);
        $list = $resp['data'];

        $I->assertNotEmpty($list);
        $this->id = array_pop($list)['id'];
        $I->assertNotEmpty($this->id);
    }

    /**
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updateOseba(ApiTester $I)
    {
        $oseba        = $this->obj;
        $oseba['ime'] = 'tralala';

        $oseba = $I->successfullyUpdate($this->restUrl, $oseba['id'], $oseba);

        $I->assertEquals('tralala', $oseba['ime']);
    }

    /**
     * Dodam dva računa 
     * 
     * @depends  create
     * @param ApiTester $I
     */
    public function dodajDvaTrr(\ApiTester $I)
    {

        $data = [
            'oseba'    => $this->obj['id'],
            "banka"    => "NLB",
            "stevilka" => "123456677",
            "swift"    => "sdfsdf",
            "bic"      => "xxxx"
        ];

        $this->objtrr = $trr          = $I->successfullyCreate($this->trrUrl, $data);
        $I->assertEquals('NLB', $trr['banka']);

        $I->assertEquals($trr['oseba'], $this->obj['id'], "osebe ni");
        $I->assertEmpty($trr['popa'], "popa mora biti null");

        $data['stevilka'] = "44444444";
        $data['banka']    = "NKBM";
        $trr              = $this->trr        = $I->successfullyCreate($this->trrUrl, $data);

        $I->assertEquals('44444444', $trr['stevilka'], "stevilka  drugi trr");
    }

    /**
     * Preberem prvi kreirani TRR
     * @param ApiTester $I
     * @depends dodajDvaTrr
     */
    public function preberiTrr(\ApiTester $I)
    {
        $trr = $I->successfullyGet($this->trrUrl, $this->objtrr['id']);
        $I->assertNotEmpty($trr);
        $I->assertTrue(isset($trr['banka']));
        $I->assertEquals("NLB", $trr['banka']);
    }

    /**
     * Dodam telefonsko številko 
     * @param ApiTester $I
     * @depends create
     */
    public function dodajTelefonskoStevilko(\ApiTester $I)
    {
        $data = [
            "oseba"    => $this->obj['id'],
            "stevilka" => "7777-122123",
            "vrsta"    => "Mobilni", //$$ rb - to je začasno, dokler se ne popravijo form-> setData... nastavljanje filtrov iz configa (v .yml)
            "privzeta" => false,
        ];

        $this->objtel = $tel          = $I->successfullyCreate($this->telUrl, $data);
        $I->assertNotEmpty($tel);
    }

    /**
     * Preberem  telefonsko številko
     *  
     * @param ApiTester $I
     * @depends dodajTelefonskoStevilko
     */
    public function preberiTelefonskoStevilko(\ApiTester $I)
    {
        $tel = $I->successfullyGet($this->telUrl, $this->objtel['id']);
        $I->assertNotEmpty($tel);
        $I->assertTrue(isset($tel['stevilka']));
        $I->assertEquals("7777-122123", $tel['stevilka']);
    }

    /**
     * Dodam poštni naslov na osebo 
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function dodajPostniNaslov(\ApiTester $I)
    {
        $data = [
            "oseba"     => $this->obj['id'],
            "naziv"     => "privzeti naslov",
            "ulica"     => "cmd 16",
            "posta"     => "2250 Ptuj",
            "pokrajina" => "Štajerska",
        ];

        $resp = $I->successfullyGetList($this->drzavaUrl, ["q" => "SI"]);
        $list = $resp['data'];

        $I->assertNotEmpty($list, "prazen seznam držav");
        $drz             = array_pop($list);
        $data["drzava"]  = $drz['id'];
        $this->objpostni = $postni          = $I->successfullyCreate($this->naslUrl, $data);
        $I->assertNotEmpty($postni, "naslov ni vpisan");   // $$ rb naslova ne doda pri ($form->isValid())
        $I->assertEquals('privzeti naslov', $postni['naziv'], "naziv naslova ni isti");
    }

    /**
     * preberem poštni naslov  
     * @depends dodajPostniNaslov
     * 
     * @param ApiTester $I
     */
    public function preberiPostniNaslov(\ApiTester $I)                  //$$ rb ne deluje, nedokončano
    {
        $postni = $I->successfullyGet($this->naslUrl, $this->objpostni['id']);
        $I->assertNotEmpty($postni);
        $I->assertTrue(isset($postni['pokrajina']));
        $I->assertEquals("Štajerska", $postni['pokrajina']);
    }

    /**
     * Preberem osebo in preverim, če ima vse dodane trr-je,
     * telefonske številke in poštne naslove 
     * 
     * @depends create
     * @depends updateOseba
     * @depends dodajDvaTrr
     * @depends dodajTelefonskoStevilko
     * @depends dodajPostniNaslov
     * @param ApiTester $I
     */
    public function read(ApiTester $I)
    {
        $oseba = $I->successfullyGet($this->restUrl, $this->obj['id']);

        $I->assertNotEmpty($oseba, "osebe ni");

        // preverim vsa vidna polja
        $I->assertEquals('zz', $oseba['naziv']);
        $I->assertEquals('tralala', $oseba['ime']);
        $I->assertEquals('zz', $oseba['priimek']);
        $I->assertEquals('zz', $oseba['funkcija']);
        $I->assertEquals('zz', $oseba['srednjeIme']);
        $I->assertEquals('zz', $oseba['psevdonim']);
        $I->assertEquals('x@xxx.xx', $oseba['email']);
        $I->assertEquals('1973-28-03T04:30:00', $oseba['datumRojstva']);
        $I->assertEquals('ZZ', $oseba['emso'], "napačen emšo");
        $I->assertEquals('ZZ123', $oseba['davcna'], 'napačna davčna');
//        $I->assertEquals('M', $oseba['spol'],"spol ni pravilen");   //$$ rb validator pri create-u javi napako
        $I->assertEquals('zz', $oseba['opombe']);
        $I->assertEquals('zz', $oseba['drzavljanstvo']);
        $I->assertEquals('zz', $oseba['drzavaRojstva']);
        $I->assertEquals('zz', $oseba['krajRojstva']);

        $I->assertEquals(null, $oseba['user']);
        $I->assertTrue(isset($oseba['alternacije']));
        $I->assertTrue(isset($oseba['pogodbe']));
        $I->assertTrue(isset($oseba['sodelovanja']));
        $I->assertTrue(isset($oseba['popa']));
        $I->assertTrue(isset($oseba['trrji']));
        $I->assertTrue(isset($oseba['datumRojstva']));
        $I->assertTrue(isset($oseba['telefonske']));
        $I->assertEquals(2, count($oseba['trrji']));
        $I->assertEquals(1, count($oseba['telefonske']));
        $I->assertEquals(1, count($oseba['naslovi']));
        $I->assertEquals(0, count($oseba['alternacije']));
        $I->assertEquals(0, count($oseba['pogodbe']));
        $I->assertEquals(0, count($oseba['sodelovanja']));
        $I->assertEquals(0, count($oseba['popa']));
    }

    /**
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $oseba = $I->successfullyDelete($this->restUrl, $this->obj['id']);

        $I->failToGet($this->restUrl, $this->obj['id']);
    }

    /**
     * kreiramo osebo, test validacije
     * 
     * @param ApiTester $I
     */
    public function createOseboBrezImena(ApiTester $I)
    {
//                  $this->expect($this->ime, "Ime je obvezen podatek", 1000301);
//                  $this->expect($this->priimek, "Priimek je obvezen podatek", 1000302);
        $data = [
            'ime'     => '',
            'priimek' => 'xx',
        ];
        // test validacije - oseba mora imeti ime
        $resp = $I->failToCreate($this->restUrl, $data);
        $I->assertNotEmpty($resp);
        // testiramo na enako številko napake kot je v validaciji
        $I->assertEquals(1000301, $resp[0]['code']);
    }

}
