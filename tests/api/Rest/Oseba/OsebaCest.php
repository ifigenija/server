<?php

namespace Rest\Oseba;

use ApiTester;

/**
 *      metode, ki jo podpira API
 *       - create
 *      - getlist
 *       - update
 *      - get - kontrola vseh polj te entitete
 *       - delete
 *      validate metodo za entiteto
 *      relacije z drugimi entitetami
 *      - kontaktnaOseba     O2M      
 *          . get (id, list)
 *      - naslovi        O2M (morda začasno ne deluje zaradi boolean? 
 *      - telefonske     O2M 
 *      - trrji          O2M 
 *      - pogodbe        O2M 
 * 
 *      - alternacije    O2M 
 *      - zaposlitve    O2M 
 *      getlist različne variante relacij
 *      - vse
 *      - default
 * 
 * 
 */
class OsebaCest
{

    private $restUrl              = '/rest/oseba';
    private $relationPopaUrl      = '/rest/user/popa/';
    private $trrUrl               = '/rest/trr';
    private $naslUrl              = '/rest/postninaslov';
    private $telUrl               = '/rest/telefonska';
    private $drzavaUrl            = '/rest/drzava';
    private $popaUrl              = '/rest/popa';
    private $kontaktnaOsebaUrl    = '/rest/kontaktnaoseba';
    private $userUrl              = '/rest/user';
    private $alternacijaUrl       = '/rest/alternacija';
    private $sodelovanjeUrl       = '/rest/sodelovanje';
    private $zaposlitevUrl        = '/rest/zaposlitev';
    private $id;
    private $obj;
    private $obj2;
    private $objpostni;
    private $objpostni2;
    private $objpostni3;
    private $objtrr;
    private $objtel;
    private $lookDrzava;
    private $objPopa1;
    private $objPopa2;
    private $objKontaktna1;
    private $objKontaktna2;
    private $lookPopa1;
    private $lookPopa2;
    private $objUser;
    private $lookUser;
    private $trr;
    private $postni;
    private $tel;
    private $tel2;
    private $telefonskaUrl        = '/rest/telefonska';
    private $pogodbaUrl           = '/rest/pogodba';
    private $objTelefonska1;
    private $objTelefonska2;
    private $objTrr1;
    private $objTrr2;
    private $objPogodba1;
    private $objPogodba2;
    private $objAlternacija1;
    private $objAlternacija2;
    private $objZaposlitev1;
    private $objZaposlitev2;
    private $lookFunkcija;
    private $lookAlternacija1;
    private $lookAlternacija2;
    private $lookAlternacija3;
    private $lookAlternacija4;
    private $lookAlternacija5;
    private $lookAlternacija6;
    private $lookupAlternacijaUrl = '/lookup/alternacija';

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
    public function lookupPopa(ApiTester $I)
    {
        $this->lookPopa1 = $ent             = $I->lookupEntity("popa", "0988", false);
        $I->assertNotEmpty($ent);

        $this->lookPopa2 = $ent             = $I->lookupEntity("popa", "0988", false);
        $I->assertNotEmpty($ent);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupUser(ApiTester $I)
    {
        $this->lookUser = $ent            = $I->lookupEntity("user", "tatjana@ifigenija.si", false);
        $I->assertNotEmpty($ent);
    }

    /**
     * @param ApiTester $I
     */
    public function lookupFunkcijo(ApiTester $I)
    {
        $this->lookFunkcija = $look               = $I->lookupEntity("funkcija", "Tezej", false);
        $I->assertNotEmpty($look);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupDrzava(ApiTester $I)
    {
        $this->lookDrzava = $ent              = $I->lookupEntity("drzava", "AD", false);
        $I->assertNotEmpty($ent);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupAlternacija(ApiTester $I)
    {
        $resp                   = $I->successfullyGetList($this->lookupAlternacijaUrl . '?ident=0001', []);
        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->assertTrue(array_key_exists('data', $resp), "ima data");
        $I->assertTrue(array_key_exists('label', $resp['data'][0]), "ima labelo");
        $I->assertTrue(array_key_exists('totalRecords', $resp['state']), "ima total records");
        $I->assertEquals(1, $resp['state']['totalRecords'], "total records");
        $this->lookAlternacija1 = $resp['data'][0];

        $resp                   = $I->successfullyGetList($this->lookupAlternacijaUrl . '?ident=0002', []);
        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->assertTrue(array_key_exists('data', $resp), "ima data");
        $I->assertTrue(array_key_exists('label', $resp['data'][0]), "ima labelo");
        $I->assertTrue(array_key_exists('totalRecords', $resp['state']), "ima total records");
        $I->assertEquals(1, $resp['state']['totalRecords'], "total records");
        $this->lookAlternacija2 = $resp['data'][0];

        $resp                   = $I->successfullyGetList($this->lookupAlternacijaUrl . '?ident=0006', []);
        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->assertTrue(array_key_exists('data', $resp), "ima data");
        $I->assertTrue(array_key_exists('label', $resp['data'][0]), "ima labelo");
        $I->assertTrue(array_key_exists('totalRecords', $resp['state']), "ima total records");
        $I->assertEquals(1, $resp['state']['totalRecords'], "total records");
        $this->lookAlternacija3 = $resp['data'][0];

        $resp                   = $I->successfullyGetList($this->lookupAlternacijaUrl . '?ident=0003', []);
        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->assertTrue(array_key_exists('data', $resp), "ima data");
        $I->assertTrue(array_key_exists('label', $resp['data'][0]), "ima labelo");
        $I->assertTrue(array_key_exists('totalRecords', $resp['state']), "ima total records");
        $I->assertEquals(1, $resp['state']['totalRecords'], "total records");
        $this->lookAlternacija4 = $resp['data'][0];

        $resp                   = $I->successfullyGetList($this->lookupAlternacijaUrl . '?ident=0005', []);
        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->assertTrue(array_key_exists('data', $resp), "ima data");
        $I->assertTrue(array_key_exists('label', $resp['data'][0]), "ima labelo");
        $I->assertTrue(array_key_exists('totalRecords', $resp['state']), "ima total records");
        $I->assertEquals(1, $resp['state']['totalRecords'], "total records");
        $this->lookAlternacija5 = $resp['data'][0];

        $resp                   = $I->successfullyGetList($this->lookupAlternacijaUrl . '?ident=0007', []);
        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->assertTrue(array_key_exists('data', $resp), "ima data");
        $I->assertTrue(array_key_exists('label', $resp['data'][0]), "ima labelo");
        $I->assertTrue(array_key_exists('totalRecords', $resp['state']), "ima total records");
        $I->assertEquals(1, $resp['state']['totalRecords'], "total records");
        $this->lookAlternacija6 = $resp['data'][0];
    }

    /**
     *  napolnimo vsaj en zapis
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data = [
            'sifra'         => 'ZZ12',
            'naziv'         => 'zz',
            'ime'           => 'zz',
            'priimek'       => 'zz',
            'funkcija'      => 'zz',
            'srednjeIme'    => 'zz',
            'psevdonim'     => 'zz',
            'email'         => 'x@xxx.xx',
            'datumRojstva'  => '1973-03-28T00:00:00+0100',
            'emso'          => 'ZZ',
            'davcna'        => 'ZZ123',
            'spol'          => 'M',
            'opombe'        => 'zz',
            'drzavljanstvo' => 'zz',
            'drzavaRojstva' => 'zz',
            'krajRojstva'   => 'zz',
            'user'          => null,
//            'user'          => $this->lookUser['id'],
        ];

        $this->obj = $oseba     = $I->successfullyCreate($this->restUrl, $data);

        $I->assertEquals('zz', $oseba['ime']);
        $I->assertNotEmpty($oseba['id']);
        $I->assertNotEmpty($oseba['sifra']);

        // kreiramo še en zapis
        $data = [
            'sifra'         => 'AA12',
            'naziv'         => 'aa',
            'ime'           => 'aa',
            'priimek'       => 'aa',
            'funkcija'      => 'aa',
            'srednjeIme'    => 'aa',
            'psevdonim'     => 'aa',
            'email'         => 'a@aaa.aa',
            'datumRojstva'  => '1975-03-28T00:00:00+0100',
            'emso'          => 'AA',
            'davcna'        => 'AA123',
            'spol'          => 'Z',
            'opombe'        => 'aa',
            'drzavljanstvo' => 'aa',
            'drzavaRojstva' => 'aa',
            'krajRojstva'   => 'aa',
            'user'          => $this->lookUser['id'],
        ];

        $this->obj2 = $oseba      = $I->successfullyCreate($this->restUrl, $data);

        $I->assertEquals('aa', $oseba['ime']);
        $I->assertNotEmpty($oseba['id']);
        $I->assertNotEmpty($oseba['sifra']);
        // kreiramo še en zapis
        $data = [
            'sifra'         => '', // prazno -naj sam zgenerira
            'naziv'         => 'bb',
            'ime'           => 'bb',
            'priimek'       => 'bb',
            'funkcija'      => 'bb',
            'srednjeIme'    => 'bb',
            'psevdonim'     => 'bb',
            'email'         => 'b@aaa.aa',
            'datumRojstva'  => '1976-03-28T00:00:00+0100',
            'emso'          => 'BB',
            'davcna'        => 'BB123',
            'spol'          => 'M',
            'opombe'        => 'bb',
            'drzavljanstvo' => 'bb',
            'drzavaRojstva' => 'bb',
            'krajRojstva'   => 'bb',
            'user'          => null,
        ];

        $oseba = $I->successfullyCreate($this->restUrl, $data);

        $I->assertEquals('bb', $oseba['ime']);
        $I->assertNotEmpty($oseba['id']);
        $I->assertNotEmpty($oseba['sifra']);    // ali je avtomatsko zgeneriral šifro?
    }

//    /**
//     * @depends create
//     */
//    public function getList(ApiTester $I)
//    {
//        $resp = $I->successfullyGetList($this->restUrl, []);
//        $list = $resp['data'];
//
//        $I->assertNotEmpty($list);
//        $this->id = array_pop($list)['id'];
//        $I->assertNotEmpty($this->id);
//    }

    /**
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
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
            "vrsta"    => "mobilna",
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
    public function dodajVecPostnihNaslovov(\ApiTester $I)
    {
        $data = [
            "oseba"      => $this->obj['id'],
            "naziv"      => "privzeti naslov",
            "ulica"      => "cmd 16",
            "posta"      => "2250",
            "postaNaziv" => "Ptuj",
            "pokrajina"  => "Štajerska",
        ];

        $resp = $I->successfullyGetList($this->drzavaUrl, ["q" => "SI"]);
        $list = $resp['data'];

        $I->assertNotEmpty($list, "prazen seznam držav");
        $drz             = array_pop($list);
        $data["drzava"]  = $drz['id'];
        $this->objpostni = $postni          = $I->successfullyCreate($this->naslUrl, $data);
        $I->assertNotEmpty($postni, "naslov ni vpisan");
        $I->assertEquals('privzeti naslov', $postni['naziv'], "naziv naslova ni isti");
        
        $data = [
            "oseba"      => $this->obj['id'],
            "naziv"      => "naslov1",
            "ulica"      => "cmd 16",
            "ulicaDva"   => "cankarjeva 16",
            "posta"      => "2250",
            "postaNaziv" => "Ptuj",
            "pokrajina"  => "Štajerska",
            "drzava"     => $this->lookDrzava['id'],
        ];

        $this->objpostni2 = $ent             = $I->successfullyCreate($this->naslUrl, $data);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['ulica'], "cmd 16");

        $data = [
            "oseba"      => $this->obj2['id'],
            "naziv"      => "naslov2",
            "ulica"      => "prešernova 32",
            "ulicaDva"   => "cankarjeva 16",
            "posta"      => "2250",
            "postaNaziv" => "Ptuj",
            "pokrajina"  => "Štajerska",
            "drzava"     => $this->lookDrzava['id'],
        ];

        $this->objpostni3 = $ent             = $I->successfullyCreate($this->naslUrl, $data);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['ulica'], "prešernova 32");
    }

    /**
     * preberem poštni naslov  
     * @depends dodajVecPostnihNaslovov
     * 
     * @param ApiTester $I
     */
    public function preberiPostniNaslov(\ApiTester $I)
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
     * @depends update
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
        $I->assertEquals('zz', $oseba['psevdonim'], "psevdonim");
        $I->assertEquals('x@xxx.xx', $oseba['email'], "email");
        $I->assertEquals('1973-03-28T00:00:00+0100', $oseba['datumRojstva']);
        $I->assertEquals('ZZ', $oseba['emso'], "napačen emšo");
        $I->assertEquals('ZZ123', $oseba['davcna'], 'napačna davčna');
        $I->assertEquals('M', $oseba['spol'], "spol ni pravilen");
        $I->assertEquals('zz', $oseba['opombe']);
        $I->assertEquals('zz', $oseba['drzavljanstvo']);
        $I->assertEquals('zz', $oseba['drzavaRojstva']);
        $I->assertEquals('zz', $oseba['krajRojstva'], "kraj rojstva");
        $I->assertEquals(null, $oseba['user'], "user");

        codecept_debug($oseba);
        $I->assertTrue(isset($oseba['kontaktneOsebe']));
        $I->assertTrue(isset($oseba['trrji']));
        $I->assertTrue(isset($oseba['telefonske']));
        $I->assertTrue(isset($oseba['naslovi']));
        $I->assertEquals(2, count($oseba['trrji']));
        $I->assertEquals(1, count($oseba['telefonske']));
        $I->assertEquals(2, count($oseba['naslovi']));
        $I->assertEquals(0, count($oseba['kontaktneOsebe']));
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
//    public function getListVse(ApiTester $I)
//    {
//        $listUrl = $this->restUrl . "/vse";
//        codecept_debug($listUrl);
//        $resp    = $I->successfullyGetList($listUrl, []);
//        $list    = $resp['data'];
//
//        $I->assertNotEmpty($list);
//        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
//        $I->assertEquals("aa", $list[0]['opombe']);      //glede na sort
//    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListDefault(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?q=a";     // na nazivu je wildcard, išče a*
        codecept_debug($listUrl);
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];

        $I->assertNotEmpty($list);
        $I->assertGreaterThanOrEqual(1, $resp['state']['totalRecords']);
        $I->assertEquals("aa", $list[0]['opombe']);
    }

    /**
     * preberi vse zapise po ulici
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoPostniNaslov(ApiTester $I)
    {
        //iskanje ulica
        $listUrl = $this->restUrl . "?naslov=" . "prešer";

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        $I->assertGreaterThanOrEqual(1, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);

        //iskanje ulicaDva
        $listUrl = $this->restUrl . "?naslov=" . "cankarj";

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
        
        //iskanje posta
        $listUrl = $this->restUrl . "?naslov=" . "2250";

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
        
        //iskanje postaNaziv
        $listUrl = $this->restUrl . "?naslov=" . "ptuj";

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
    }
    
    /**
     * preberi vse zapise po ulici
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoOseba(ApiTester $I)
    {
        //iskanje po imenu
        $listUrl = $this->restUrl . "?q=" . "tatjana";

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        $I->assertGreaterThanOrEqual(1, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
        
        //iskanje po priimek
        $listUrl = $this->restUrl . "?q=" . "kovač";

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
        
        //iskanje po email
        $listUrl = $this->restUrl . "?q=" . "jani.";

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        //iskanje po psevdonim
        $I->assertGreaterThanOrEqual(1, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
        
        $listUrl = $this->restUrl . "?q=" . "joža";

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        $I->assertGreaterThanOrEqual(1, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
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
            'naziv'         => 'bb',
            'ime'           => '',
            'priimek'       => 'bb',
            'funkcija'      => 'bb',
            'srednjeIme'    => 'bb',
            'psevdonim'     => 'bb',
            'email'         => 'b@bbb.aa',
            'datumRojstva'  => '2010-02-01T00:00:00+0100',
            'emso'          => 'BB',
            'davcna'        => 'BB123',
            'spol'          => 'M',
            'opombe'        => 'bb',
            'drzavljanstvo' => 'bb',
            'drzavaRojstva' => 'bb',
            'krajRojstva'   => 'bb',
        ];

        // test validacije - oseba mora imeti ime
        $resp = $I->failToCreate($this->restUrl, $data);
        $I->assertNotEmpty($resp);
        // testiramo na enako številko napake kot je v validaciji
//        $I->assertEquals(1000301, $resp[0]['code']);


        $data = [
            'naziv'         => 'cc',
            'ime'           => 'cc',
            'priimek'       => '',
            'funkcija'      => 'cc',
            'srednjeIme'    => 'cc',
            'psevdonim'     => 'cc',
            'email'         => 'c@bbb.aa',
            'datumRojstva'  => '2011-02-28T00:00:00+0100',
            'emso'          => 'CC',
            'davcna'        => 'CC123',
            'spol'          => 'M',
            'opombe'        => 'cc',
            'drzavljanstvo' => 'cc',
            'drzavaRojstva' => 'cc',
            'krajRojstva'   => 'cc',
        ];
        // test validacije - oseba mora imeti priimek
        $resp = $I->failToCreate($this->restUrl, $data);
        $I->assertNotEmpty($resp);
//        $I->assertEquals(1000302, $resp[0]['code']);
    }

    /**
     * kreiramo vsaj en zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function createVecTelefonskih(ApiTester $I)
    {
        $data                 = [
            'vrsta'    => 'domaca',
            'stevilka' => '567',
            'privzeta' => true,
            'popa'     => null,
            'oseba'    => $this->obj2['id'],
        ];
        $this->objTelefonska1 = $ent                  = $I->successfullyCreate($this->telefonskaUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // še en zapis
        $data                 = [
            'vrsta'    => 'fiksna',
            'stevilka' => '012',
            'privzeta' => true,
            'popa'     => null,
            'oseba'    => $this->obj2['id'],
        ];
        $this->objTelefonska2 = $ent                  = $I->successfullyCreate($this->telefonskaUrl, $data);
        $I->assertNotEmpty($ent['id']);
    }

    /**
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function createVecKontaktnihOseb(ApiTester $I)
    {
        $data                = [
            'status'   => 'AK',
            'funkcija' => 'zz',
            'opis'     => 'zz',
            'popa'     => $this->lookPopa1['id'],
            'oseba'    => $this->obj2['id'],
        ];
        $I->assertTrue(TRUE);
        $this->objKontaktna1 = $ent                 = $I->successfullyCreate($this->kontaktnaOsebaUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // še en zapis
        $data                = [
            'status'   => 'AK',
            'funkcija' => 'bb',
            'opis'     => 'bb',
            'popa'     => $this->lookPopa2['id'],
            'oseba'    => $this->obj2['id'],
        ];
        $this->objKontaktna2 = $ent                 = $I->successfullyCreate($this->kontaktnaOsebaUrl, $data);
        $I->assertNotEmpty($ent['id']);
    }

    /**
     *  napolnimo vsaj en zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function createVecTrrjev(ApiTester $I)
    {
        $data          = [
            'stevilka' => 'WW123',
            'swift'    => 'WW123',
            'bic'      => 'WW123',
            'banka'    => 'WW123',
            'popa'     => null,
            'oseba'    => $this->obj2['id'],
        ];
        $this->objTrr1 = $trr           = $I->successfullyCreate($this->trrUrl, $data);
        $I->assertNotEmpty($trr['id']);


        //kreiramo še en zapis
        $data          = [
            'stevilka' => 'A1',
            'swift'    => 'A1',
            'bic'      => 'A1',
            'banka'    => 'A1',
            'popa'     => null,
            'oseba'    => $this->obj2['id'],
        ];
        $this->objTrr2 = $trr           = $I->successfullyCreate($this->trrUrl, $data);
        $I->assertNotEmpty($trr['id']);
        $I->assertEquals('A1', $trr['banka']);
    }

    /**
     *  kreiramo pogodbo
     * 
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function createVecPogodb(ApiTester $I)
    {
        $data              = [
            'sifra'             => 'ZZ123',
            'alternacija'       => $this->lookAlternacija1['id'],
            'vrednostVaj'       => 33.33,
            'vrednostPredstave' => 44.44,
            'vrednostUre'       => 22.22,
            'aktivna'           => false,
            'opis'              => 'zz',
            'popa'              => null,
            'oseba'             => $this->obj2['id'],
            'trr'               => $this->objTrr1['id'],
        ];
        $this->objPogodba1 = $ent               = $I->successfullyCreate($this->pogodbaUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // kreiramo še en zapis
        $data              = [
            'sifra'             => 'WW4',
            'alternacija'       => $this->lookAlternacija1['id'],
            'vrednostVaj'       => 33.33,
            'vrednostPredstave' => 44.44,
            'vrednostUre'       => 22.22,
            'aktivna'           => false,
            'opis'              => 'ww',
            'popa'              => null,
            'oseba'             => $this->obj2['id'],
            'trr'               => $this->objTrr1['id'],
        ];
        $this->objPogodba2 = $ent               = $I->successfullyCreate($this->pogodbaUrl, $data);
        $I->assertNotEmpty($ent['id']);
    }

    /**
     * 
     * @depends create
     * @depends lookupFunkcijo
     * 
     * @param ApiTester $I
     */
    public function createVecAlternacij(ApiTester $I)
    {
        $data                  = [
            'zaposlen'     => true,
            'funkcija'     => $this->lookFunkcija['id'],
            'sodelovanje'  => NULL,
            'oseba'        => $this->obj2['id'],
            'koprodukcija' => null,
            'pogodba'      => NULL,
        ];
        $this->objAlternacija1 = $ent                   = $I->successfullyCreate($this->alternacijaUrl, $data);
        $I->assertNotEmpty($ent['id']);

        $data                  = [
            'zaposlen'     => true,
            'funkcija'     => $this->lookFunkcija['id'],
            'sodelovanje'  => NULL,
            'oseba'        => $this->obj2['id'],
            'koprodukcija' => null,
            'pogodba'      => NULL,
        ];
        $this->objAlternacija2 = $ent                   = $I->successfullyCreate($this->alternacijaUrl, $data);
        $I->assertNotEmpty($ent['id']);
    }

    /**
     *  kreiramo zapis
     * 
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function createVecZaposlitev(ApiTester $I)
    {
        $data                 = [
            'status'              => 'A',
            'zacetek'             => '2010-02-01T00:00:00+0100',
            'konec'               => '2010-02-01T00:00:00+0100',
            'tip'                 => 1,
            'delovnaObveza'       => 2,
            'malica'              => 'zz',
            'izmenskoDelo'        => true,
            'individualnaPogodba' => true,
            'jeZaposlenVdrugemJz' => TRUE,
            'jeNastopajoci'       => TRUE,
            'delovnoMesto'       => "režiser",
            'oseba'               => $this->obj2['id'],
        ];
        $this->objZaposlitev1 = $ent                  = $I->successfullyCreate($this->zaposlitevUrl, $data);
        $I->assertNotEmpty($ent['id']);

        $data                 = [
            'status'              => 'A',
            'zacetek'             => '2012-02-01T00:00:00+0100',
            'konec'               => '2012-02-01T00:00:00+0100',
            'tip'                 => 3,
            'delovnaObveza'       => 4,
            'malica'              => 'dd',
            'izmenskoDelo'        => true,
            'individualnaPogodba' => true,
            'jeZaposlenVdrugemJz' => TRUE,
            'jeNastopajoci'       => TRUE,
            'delovnoMesto'       => "režiser",
            'oseba'               => $this->obj2['id'],
        ];
        $this->objZaposlitev2 = $ent                  = $I->successfullyCreate($this->zaposlitevUrl, $data);
        $I->assertNotEmpty($ent['id']);
    }

    /**
     * preberemo relacije
     * 
     * @depends createVecTelefonskih
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeSTelefonskimi(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "telefonske", "");
        $I->assertEquals(2, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "telefonske", $this->objTelefonska1['id']);
        $I->assertEquals(1, count($resp));
    }

    /**
     * preberemo relacije
     * 
     * @depends createVecTrrjev
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeSTrrji(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "trrji", "");
        $I->assertEquals(2, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "trrji", $this->objTrr1['id']);
        $I->assertEquals(1, count($resp));
    }

    /**
     * preberemo relacije
     * 
     * @depends createVecPogodb
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeSPogodbami(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "pogodbe", "");
        $I->assertEquals(2, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "pogodbe", $this->objPogodba1['id']);
        $I->assertEquals(1, count($resp));
    }

    /**
     * preberemo relacije
     * 
     * @depends createVecAlternacij
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeZAlternacijami(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "alternacije", "");
        $I->assertEquals(2, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "alternacije", $this->objAlternacija1['id']);
        $I->assertEquals(1, count($resp));
    }

    /**
     * preberemo relacije
     * 
     * @depends createVecZaposlitev
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeZZaposlitvami(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "zaposlitve", "");
        $I->assertEquals(2, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "zaposlitve", $this->objZaposlitev1['id']);
        $I->assertEquals(1, count($resp));
    }

    /**
     * preberemo relacije
     * 
     * @depends createVecKontaktnihOseb
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeSKontaktnimiOsebami(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "kontaktneOsebe", "");
        $I->assertEquals(2, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "kontaktneOsebe", $this->objKontaktna1['id']);
        $I->assertEquals(1, count($resp));
    }

    /**
     * @depends dodajVecPostnihNaslovov
     */
    public function deletePostniNaslov(ApiTester $I)
    {
        $I->successfullyDelete($this->naslUrl, $this->objpostni['id']);
        $I->failToDelete($this->naslUrl, $this->objpostni['id']);
        
        $I->successfullyDelete($this->naslUrl, $this->objpostni2['id']);
        $I->failToDelete($this->naslUrl, $this->objpostni2['id']);
    }

    /**
     * @depends create
     * @depends deletePostniNaslov
     */
    public function delete(ApiTester $I)
    {
        $oseba = $I->successfullyDelete($this->restUrl, $this->obj['id']);

        $I->failToGet($this->restUrl, $this->obj['id']);
    }

}
