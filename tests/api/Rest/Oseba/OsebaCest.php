<?php

namespace Rest\Oseba;

use ApiTester;

/**
 *      - ustvarim osebo,
 *      - preberem (vse) osebo (e)
 *      - posodobim osebo 
 *      - dodam 2 trr 
 *      - dodam telefonsko številko
 *      - dodam poštni naslov  
 * - preberem poštni naslov
 *      - preberem ustvarjeno osebo in preverim, da ima trr-je, 
 *   poštni naslovi n telefonske številke 
 * - brišem osebo in se morajo pčistiti poštni naslov, 
 *   trrji in telefonske številke, ker je orphan removal = true
 * 
 */
class OsebaCest
{

    private $restUrl = '/rest/oseba';
    private $trrUrl  = '/rest/trr';
    private $naslUrl = '/rest/postninaslov';
    private $telUrl  = '/rest/telefonska';
    private $id;
    private $obj;
    private $trr;
    private $postni;
    private $postniG;
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
        $data      = [
            'naziv'         => 'zz',
            'ime'           => 'zz',
            'priimek'       => 'zz',
            'pesvdonim'     => 'zz',
            'funkcija'      => 'zz',
            'email'         => 'x@xxx.xx',
            'datumRojstva'  => 'zz',
            'emso'          => 'zz',
            'davcna'        => 'zz',
            'spol'          => 'Z',
            'opombe'        => 'zz',
            'drzavljanstvo' => 'zz',
            'drzavaRojstva' => 'zz',
            'datumRojstva'  => '1973-28-03T04:30:00',
            'krajRojstva'   => 'zz',
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
        $list     = $I->successfullyGetList($this->restUrl, []);
        $I->assertNotEmpty($list);
        $this->id = array_pop($list)['id'];
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

        $trr = $I->successfullyCreate($this->trrUrl, $data);
        $I->assertEquals('NLB', $trr['banka']);

        $I->assertEquals($trr['oseba'], $this->obj['id'], "oseba je");
        $I->assertEmpty($trr['popa'], "popa mora biti null");

        $data['stevilka'] = "44444444";
        $data['banka']    = "NKBM";
        $trr              = $this->trr        = $I->successfullyCreate($this->trrUrl, $data);

        $I->assertEquals('44444444', $trr['stevilka'], "stevilka  drugi trr");
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
//            "vrsta" => "mobilna",         
            "vrsta"    => "Mobilni", //$$ rb - to je začasno, dokler se ne popravijo form-> setData... nastavljanje filtrov iz configa (v .yml)
            "privzeta" => false
        ];

        $tel = $I->successfullyCreate($this->telUrl, $data);
        $I->assertNotEmpty($tel);
    }

    /**
     * Preberem  telefonsko številko 
     * @param ApiTester $I
     * @depends dodajTelefonskoStevilko
     */
    public function preberiTelefonskoStevilko(\ApiTester $I)
    {
        $list = $I->successfullyGetList($this->telUrl, []);
        $I->assertNotEmpty($list);
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
        //    "oseba"     => $this->obj['id'],
            "oseba"     => $this->obj['id'],
            "naziv"     => "privzeti naslov",
            "ulica"     => "cmd 16",
            "posta"     => "2250 Ptuj",
            "pokrajina" => "Štajerska",
        ];

        $list           = $I->successfullyGetList('/rest/drzava', ["q" => "SI"]);
        $I->assertNotEmpty($list, "prazen seznam držav");
        $drz            = array_pop($list);
        $data["drzava"] = $drz['id'];
        $postni         = $I->successfullyCreate($this->naslUrl, $data);
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
        $list = $I->successfullyGetList($this->naslUrl, []);
        $I->assertNotEmpty($list);
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
     */
    public function read(ApiTester $I)
    {
        $oseba = $I->successfullyGet($this->restUrl, $this->obj['id']);

        $I->assertNotEmpty($oseba, "osebe ni");
        $I->assertEquals('tralala', $oseba['ime']);
        $I->assertTrue(isset($oseba['trrji']));
        $I->assertTrue(isset($oseba['datumRojstva']));
        $I->assertTrue(isset($oseba['telefonske']));
        $I->assertTrue(isset($oseba['naslovi']), "naslova ni");
        $I->assertEquals(2, count($oseba['trrji']));
        $I->assertEquals(1, count($oseba['telefonske']));
    }

    /**
     * @depends create
     * @depends read
     */
    public function delete(ApiTester $I)
    {
        $oseba = $I->successfullyDelete($this->restUrl, $this->obj['id']);

        $I->failToGet($this->restUrl, $this->obj['id']);
    }

}
