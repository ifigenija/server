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
    private $osebniUrl            = '/rest/oseba/osebni';
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
    private $zasedenostUrl        = '/rest/zasedenost';
    private $dogodekUrl           = '/rest/dogodek';
    private $id;
    private $obj1;
    private $obj2;
    private $obj3;
    private $obj4;
    private $objpostni;
    private $objpostni2;
    private $objpostni3;
    private $objtrr;
    private $objtel;
    private $lookDrzava;
    private $lookDrzavaId;
    private $objPopa1;
    private $objPopa2;
    private $objKontaktna1;
    private $objKontaktna2;
    private $lookPopa1;
    private $lookPopa2;
    private $objUser;
    private $lookUser1;
    private $lookUser2;
    private $lookUser3;
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
    public function lookupDrzavo(ApiTester $I)
    {
        $this->lookDrzavaId = $look               = $I->lookupEntity("drzava", "SI");
        $I->assertNotEmpty($look);
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
        $this->lookUser1 = $ent             = $I->lookupEntity("user", "tatjana@ifigenija.si", false);
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
            'sifra'      => 'ZZ12',
            'naziv'      => 'zz',
            'ime'        => 'zz',
            'priimek'    => 'zz',
            'funkcija'   => 'zz',
            'srednjeIme' => 'zz',
            'psevdonim'  => 'zz',
            'spol'       => 'M',
            'user'       => null,
//            'user'          => $this->lookUser['id'],
        ];

        $this->obj1 = $oseba      = $I->successfullyCreate($this->restUrl, $data);
//        $I->assertEquals($oseba['datumRojstva'], '1973-03-28T00:00:00+0100');
        $I->assertEquals('zz', $oseba['ime']);
        $I->assertGuid($oseba['id']);
        $I->assertNotEmpty($oseba['sifra']);

// kreiramo še en zapis
        $data = [
            'sifra'         => 'AA12',
            'naziv'         => 'aahhh',
            'priimek'       => 'aa', // ta bo prvi po sortu
            'ime'           => 'Samir',
            'funkcija'      => 'aa',
            'srednjeIme'    => 'aa',
            'psevdonim'     => 'aa',
            'email'         => 'a@aaa.aa',
            'twitter'       => '@aa',
            'skype'         => 'aaaaaa',
            'fb'            => 'fb.com/aa',
//            'datumRojstva'  => '1975-03-28T00:00:00+0100',
            'emso'          => 'AA',
            'davcna'        => 'AA123',
            'spol'          => 'Z',
            'opombe'        => 'aa',
            'drzavljanstvo' => 'aa',
            'drzavaRojstva' => 'aa',
            'krajRojstva'   => 'aa',
            'user'          => $this->lookUser1['id'],
        ];

        $this->obj2 = $oseba      = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($oseba['id']);
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
            'twitter'       => '@bb',
            'skype'         => 'bbbbbb',
            'fb'            => 'fb.com/bb',
//            'datumRojstva'  => '1976-03-28T00:00:00+0100',
            'emso'          => 'BB',
            'davcna'        => 'BB123',
            'spol'          => 'M',
            'opombe'        => 'bb',
            'drzavljanstvo' => 'bb',
            'drzavaRojstva' => 'bb',
            'krajRojstva'   => 'bb',
            'user'          => null,
        ];

        $this->obj3 = $oseba      = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($oseba['id']);

// še nekaj creatov zaradi testiranja sortiranja
        $data  = [
            'priimek'       => '`cc',
            'ime'           => 'Cene',
            'sifra'         => '', // prazno -naj sam zgenerira
            'naziv'         => 'cc',
            'funkcija'      => 'cc',
            'srednjeIme'    => 'cc',
            'psevdonim'     => 'cc',
            'email'         => 'c@aaa.aa',
//            'datumRojstva'  => '1976-03-28T00:00:00+0100',
            'emso'          => 'CC',
            'davcna'        => 'cc123',
            'spol'          => 'M',
            'opombe'        => 'CC',
            'drzavljanstvo' => 'CC',
            'drzavaRojstva' => 'CC',
            'krajRojstva'   => 'CC',
            'user'          => null,
        ];
        $oseba = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($oseba['id']);

// še nekaj creatov zaradi testiranja sortiranja
        $data  = [
            'priimek'       => 'cchhh',
            'ime'           => 'Žare',
            'sifra'         => '', // prazno -naj sam zgenerira
            'naziv'         => 'cchhh',
            'funkcija'      => 'cc',
            'srednjeIme'    => 'cc',
            'psevdonim'     => 'cc',
            'email'         => 'c@aaa.aa',
//            'datumRojstva'  => '1976-03-28T00:00:00+0100',
            'emso'          => 'CC',
            'davcna'        => 'cc123',
            'spol'          => 'M',
            'opombe'        => 'CC',
            'drzavljanstvo' => 'CC',
            'drzavaRojstva' => 'CC',
            'krajRojstva'   => 'CC',
            'user'          => null,
        ];
        $oseba = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($oseba['id']);

        $data  = [
            'ime'           => 'aana', // ta bo prvi, če sortira po imenu
            'priimek'       => 'ff',
            'sifra'         => '',
            'naziv'         => 'dd',
            'funkcija'      => 'dd',
            'srednjeIme'    => 'dd',
            'psevdonim'     => 'dd',
            'email'         => 'c@aaa.aa',
//            'datumRojstva'  => '1976-03-28T00:00:00+0100',
            'emso'          => 'DD',
            'davcna'        => 'dd123',
            'spol'          => 'M',
            'opombe'        => 'DD',
            'drzavljanstvo' => 'DD',
            'drzavaRojstva' => 'DD',
            'krajRojstva'   => 'DD',
            'user'          => null,
        ];
        $oseba = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($oseba['id']);


        $data  = [
            'priimek'       => 'Žumer',
            'ime'           => 'ee',
            'sifra'         => '', // prazno -naj sam zgenerira
            'naziv'         => 'ee',
            'funkcija'      => 'ee',
            'srednjeIme'    => 'ee',
            'psevdonim'     => 'ee',
            'email'         => 'e@aaa.aa',
//            'datumRojstva'  => '1976-03-28T00:00:00+0100',
            'emso'          => 'EE',
            'davcna'        => 'ee123',
            'spol'          => 'M',
            'opombe'        => 'EE',
            'drzavljanstvo' => 'EE',
            'drzavaRojstva' => 'EE',
            'krajRojstva'   => 'EE',
            'user'          => null,
        ];
        $oseba = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($oseba['id']);

        $data  = [
            'priimek'       => 'žumer', // bi moral biti sortiran zadnji 
            'ime'           => 'ee',
            'sifra'         => '', // prazno -naj sam zgenerira
            'naziv'         => 'ee',
            'funkcija'      => 'ee',
            'srednjeIme'    => 'ee',
            'psevdonim'     => 'ee',
            'email'         => 'e@aaa.aa',
//            'datumRojstva'  => '1976-03-28T00:00:00+0100',
            'emso'          => 'EE',
            'davcna'        => 'ee123',
            'spol'          => 'M',
            'opombe'        => 'EE',
            'drzavljanstvo' => 'EE',
            'drzavaRojstva' => 'EE',
            'krajRojstva'   => 'EE',
            'user'          => null,
        ];
        $oseba = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($oseba['id']);

        $data  = [
            'priimek'       => 'Šam',
            'ime'           => 'Korko',
            'sifra'         => '', // prazno -naj sam zgenerira
            'naziv'         => 'ee',
            'funkcija'      => 'ee',
            'srednjeIme'    => 'ee',
            'psevdonim'     => 'ee',
            'email'         => 'e@aaa.aa',
//            'datumRojstva'  => '1976-03-28T00:00:00+0100',
            'emso'          => 'EE',
            'davcna'        => 'ee123',
            'spol'          => 'M',
            'opombe'        => 'EE',
            'drzavljanstvo' => 'EE',
            'drzavaRojstva' => 'EE',
            'krajRojstva'   => 'EE',
            'user'          => null,
        ];
        $oseba = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($oseba['id']);

        $data  = [
            'priimek'       => 'Sam',
            'ime'           => 'Korko',
            'sifra'         => '', // prazno -naj sam zgenerira
            'naziv'         => 'ee',
            'funkcija'      => 'ee',
            'srednjeIme'    => 'ee',
            'psevdonim'     => 'ee',
            'email'         => 'e@aaa.aa',
//            'datumRojstva'  => '1976-03-28T00:00:00+0100',
            'emso'          => 'EE',
            'davcna'        => 'ee123',
            'spol'          => 'M',
            'opombe'        => 'EE',
            'drzavljanstvo' => 'EE',
            'drzavaRojstva' => 'EE',
            'krajRojstva'   => 'EE',
            'user'          => null,
        ];
        $oseba = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($oseba['id']);
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
     *  create po formi osebni
     * 
     * @param ApiTester $I
     */
    public function createOsebni(ApiTester $I)
    {
        $data = [
            'sifra'         => 'hh',
            'naziv'         => 'hh',
            'priimek'       => 'hh',
            'funkcija'      => 'hh',
            'srednjeIme'    => 'hh',
            'psevdonim'     => 'hh',
            'email'         => 'h@xxx.xx',
            'twitter'       => '@hh',
            'skype'         => 'hh',
            'fb'            => 'fb.com/hh',
//            'datumRojstva'  => '1973-03-28T00:00:00+0100',
            'emso'          => 'hh',
            'davcna'        => 'ZZ123',
            'spol'          => 'M',
            'opombe'        => 'hh',
            'drzavljanstvo' => 'hh',
            'drzavaRojstva' => 'hh',
            'krajRojstva'   => 'hh',
            'user'          => null,
        ];

        $resp = $I->failToCreate($this->osebniUrl, $data);
        codecept_debug($resp);
        $I->assertEquals(1000022, $resp[0]['code'], 'ali api disablean');
    }

    /**
     *      delete po formi osebni
     * 
     * @param ApiTester $I
     */
    public function deleteOsebni(ApiTester $I)
    {
        $resp = $I->failToDelete($this->osebniUrl, $this->obj1['id']);
        codecept_debug($resp);
        $I->assertEquals(1000022, $resp[0]['code'], 'ali api disablean');
    }

    /**
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $oseba        = $this->obj1;
        $oseba['ime'] = 'tralala';

        $oseba = $I->successfullyUpdate($this->restUrl, $oseba['id'], $oseba);

        $I->assertEquals('tralala', $oseba['ime']);
    }

    /**
     * update po formi osebni
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updateOsebni(ApiTester $I)
    {
        $data['id']            = $this->obj1['id'];
        $data['datumRojstva']  = '1977-06-28T00:00:00+0100';
        $data['emso']          = 'HH';
        $data['davcna']        = 'HH123';
        $data['drzavljanstvo'] = 'hh';
        $data['drzavaRojstva'] = 'hh';
        $data['krajRojstva']   = 'hh';
        $data['email']         = 'x@xxx.xx';
        $data['twitter']       = '@xx';
        $data['skype']         = 'xxxxxx';
        $data['fb']            = 'fb.com/xx';
        $data['opombe']        = 'zz';

        $ent = $I->successfullyUpdate($this->osebniUrl, $data['id'], $data);

        $I->assertEquals($ent['id'], $data['id']);
        $I->assertEquals($ent['datumRojstva'], $data['datumRojstva']);
        $I->assertEquals($ent['emso'], $data['emso']);
        $I->assertEquals($ent['davcna'], $data['davcna']);
        $I->assertEquals($ent['drzavljanstvo'], $data['drzavljanstvo']);
        $I->assertEquals($ent['drzavaRojstva'], $data['drzavaRojstva']);
        $I->assertEquals($ent['krajRojstva'], $data['krajRojstva']);


        /*
         * uporabnik brez Oseba-write in OsebniPodatki-write dovoljenja
         * kontrolira le OsebniPodatki-write
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$breznik, \IfiTest\AuthPage::$breznikPass);
        $resp = $I->failToUpdate($this->osebniUrl, $data['id'], $data);
        codecept_debug($resp);
        $I->assertEquals(1000101, $resp[0]['code']);

        /*
         * uporabnik brez OsebniPodatki-write dovoljenja
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vinko, \IfiTest\AuthPage::$vinkoPass);
        $resp = $I->failToUpdate($this->osebniUrl, $data['id'], $data);
        codecept_debug($resp);
        $I->assertEquals(1000101, $resp[0]['code']);

        /*
         * uporabnik z OsebniPodatki-write dovoljenjem
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vihra, \IfiTest\AuthPage::$vihraPass);
        $I->successfullyUpdate($this->osebniUrl, $data['id'], $data);
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
            'oseba'    => $this->obj1['id'],
            "banka"    => "NLB",
            "stevilka" => "123456677",
            "swift"    => "sdfsdf",
            "bic"      => "xxxx"
        ];

        $this->objtrr = $trr          = $I->successfullyCreate($this->trrUrl, $data);
        $I->assertEquals('NLB', $trr['banka']);

        $I->assertEquals($trr['oseba'], $this->obj1['id'], "osebe ni");
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
            "oseba"    => $this->obj1['id'],
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
        codecept_debug($this->lookDrzavaId);
        $data = [
            "oseba"      => $this->obj1['id'],
            "naziv"      => "privzeti naslov",
            "ulica"      => "cmd",
            "posta"      => "2250",
            "postaNaziv" => "Ptuj",
            "pokrajina"  => "Štajerska",
            "drzava"     => $this->lookDrzavaId,
        ];

        $I->assertTrue(true, "začasno");
        $this->objpostni = $ent             = $I->successfullyCreate($this->naslUrl, $data);
        codecept_debug($ent);
        $I->assertGuid($ent['id']);

        $data = [
            "oseba"      => $this->obj1['id'],
            "naziv"      => "naslov1",
            "ulica"      => "cmd 16",
            "ulicaDva"   => "cankarjeva 16",
            "posta"      => "2250",
            "postaNaziv" => "Ptuj",
            "pokrajina"  => "Štajerska",
            "drzava"     => $this->lookDrzavaId,
        ];

        $this->objpostni2 = $ent              = $I->successfullyCreate($this->naslUrl, $data);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);

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

        $this->objpostni3 = $ent              = $I->successfullyCreate($this->naslUrl, $data);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);
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
        $this->obj1 = $oseba      = $I->successfullyGet($this->restUrl, $this->obj1['id'], false);
        codecept_debug($oseba);

        $I->assertGuid($oseba['id'], "osebe ni");

        /*
         *  preverim vsa vidna polja
         */
        $I->assertEquals('zz', $oseba['naziv']);
        $I->assertEquals('tralala', $oseba['ime']);
        $I->assertEquals('zz', $oseba['priimek']);
        $I->assertEquals('zz', $oseba['funkcija']);
        $I->assertEquals('zz', $oseba['srednjeIme']);
        $I->assertEquals('M', $oseba['spol'], "spol ni pravilen");
        $I->assertEquals('zz', $oseba['psevdonim'], "psevdonim");

        $I->assertTrue(isset($oseba['kontaktneOsebe']));
        $I->assertEquals(0, count($oseba['kontaktneOsebe']));

        /**
         * osebnih podatkov ne sme biti vidnih 
         */
        $I->assertFalse(array_key_exists('twitter', $oseba), 'twitter osebni podatek');
        $I->assertFalse(array_key_exists('skype', $oseba), 'skype osebni podatek');
        $I->assertFalse(array_key_exists('fb', $oseba), 'fb osebni podatek');
        $I->assertFalse(array_key_exists('opombe', $oseba), 'opombe osebni podatek');
        $I->assertFalse(array_key_exists('telefonske', $oseba), 'telefonske osebni podatek');
        $I->assertFalse(array_key_exists('naslovi', $oseba), 'naslovi osebni podatek');
        $I->assertFalse(array_key_exists('telefonske', $oseba), 'telefonske osebni podatek');
        $I->assertFalse(array_key_exists('naslovi', $oseba), 'naslovi osebni podatek');
        $I->assertFalse(array_key_exists('email', $oseba), 'email osebni podatek');
        $I->assertFalse(array_key_exists('datumRojstva', $oseba), 'datumRojstva osebni podatek');
        $I->assertFalse(array_key_exists('emso', $oseba), 'emso osebni podatek');
        $I->assertFalse(array_key_exists('davcna', $oseba), 'davcna osebni podatek');
        $I->assertFalse(array_key_exists('drzavljanstvo', $oseba), 'drzavljanstvo osebni podatek');
        $I->assertFalse(array_key_exists('drzavaRojstva', $oseba), 'drzavaRojstva osebni podatek');
        $I->assertFalse(array_key_exists('krajRojstva', $oseba), 'krajRojstva osebni podatek');
        $I->assertFalse(array_key_exists('trrji', $oseba), 'trrji osebni podatek');
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookup(ApiTester $I)
    {
        $ent  = $this->obj1;
        $look = $I->lookupEntity("oseba", $ent['sifra'], false);
        codecept_debug($look);

        $I->assertEquals($ent['id'], $look['id']);
        $I->assertEquals($ent['priimek'], $look['priimek']);
        $I->assertEquals($ent['ime'], $look['ime']);
        $I->assertEquals($ent['psevdonim'], $look['psevdonim']);

        /**
         * osebnih podatkov ne sme biti vidnih 
         */
        $I->assertFalse(array_key_exists('twitter', $look), 'twitter osebni podatek');
        $I->assertFalse(array_key_exists('skype', $look), 'skype osebni podatek');
        $I->assertFalse(array_key_exists('fb', $look), 'fb osebni podatek');
        $I->assertFalse(array_key_exists('opombe', $look), 'opombe osebni podatek');
        $I->assertFalse(array_key_exists('telefonske', $look), 'telefonske osebni podatek');
        $I->assertFalse(array_key_exists('naslovi', $look), 'naslovi osebni podatek');
        $I->assertFalse(array_key_exists('telefonske', $look), 'telefonske osebni podatek');
        $I->assertFalse(array_key_exists('naslovi', $look), 'naslovi osebni podatek');
        $I->assertFalse(array_key_exists('email', $look), 'email osebni podatek');
        $I->assertFalse(array_key_exists('datumRojstva', $look), 'datumRojstva osebni podatek');
        $I->assertFalse(array_key_exists('emso', $look), 'emso osebni podatek');
        $I->assertFalse(array_key_exists('davcna', $look), 'davcna osebni podatek');
        $I->assertFalse(array_key_exists('drzavljanstvo', $look), 'drzavljanstvo osebni podatek');
        $I->assertFalse(array_key_exists('drzavaRojstva', $look), 'drzavaRojstva osebni podatek');
        $I->assertFalse(array_key_exists('krajRojstva', $look), 'krajRojstva osebni podatek');
        $I->assertFalse(array_key_exists('trrji', $look), 'trrji osebni podatek');
    }

    /**
     * Preberem osebo po formi osebni
     * 
     * @depends updateOsebni
     * @param ApiTester $I
     */
    public function readOsebni(ApiTester $I)
    {
        $ent = $I->successfullyGet($this->osebniUrl, $this->obj1['id']);
        codecept_debug($ent);

        $I->assertGuid($ent['id'], "osebe ni");

// preverim vsa vidna polja
        /**
         * najprej osebni podatki
         */
        $I->assertEquals('x@xxx.xx', $ent['email'], "email");
        $I->assertEquals($ent['datumRojstva'], '1977-06-28T00:00:00+0100');
        $I->assertEquals($ent['emso'], 'HH');
        $I->assertEquals($ent['davcna'], 'HH123');
        $I->assertEquals($ent['drzavljanstvo'], 'hh');
        $I->assertEquals($ent['drzavaRojstva'], 'hh');
        $I->assertEquals($ent['krajRojstva'], 'hh');
        $I->assertEquals($ent['twitter'], '@xx');
        $I->assertEquals($ent['skype'], 'xxxxxx');
        $I->assertEquals($ent['fb'], 'fb.com/xx');
        $I->assertEquals('zz', $ent['opombe']);

        $I->assertTrue(isset($ent['trrji']));
        $I->assertEquals(2, count($ent['trrji']));
        $I->assertTrue(isset($ent['telefonske']));
        $I->assertTrue(isset($ent['naslovi']));
        $I->assertEquals(1, count($ent['telefonske']));
        $I->assertEquals(2, count($ent['naslovi']));

        /**
         * ostale podatke
         */
        $I->assertEquals('zz', $ent['naziv']);
        $I->assertEquals('tralala', $ent['ime']);
        $I->assertEquals('zz', $ent['priimek']);
        $I->assertEquals('zz', $ent['funkcija']);
        $I->assertEquals('zz', $ent['srednjeIme']);
        $I->assertEquals('zz', $ent['psevdonim'], "psevdonim");
        $I->assertEquals('M', $ent['spol'], "spol ni pravilen");


        $I->assertTrue(isset($ent['kontaktneOsebe']), 'isset kontaktneOsebe');
        $I->assertEquals(0, count($ent['kontaktneOsebe']));

        /*
         * uporabnik brez Oseba-read in OsebniPodatki-read dovoljenja
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$breznik, \IfiTest\AuthPage::$breznikPass);
        $resp = $I->failToGet($this->osebniUrl, $this->obj1['id']);
        codecept_debug($resp);
        $I->assertEquals(100099, $resp[0][0]['code']);

        /*
         * uporabnik brez OsebniPodatki-read dovoljenja
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$rudi, \IfiTest\AuthPage::$rudiPass);
        $resp = $I->failToGet($this->osebniUrl, $this->obj1['id']);
        codecept_debug($resp);
        $I->assertEquals(100099, $resp[0][0]['code']);

        /*
         * uporabnik z OsebniPodatki-read dovoljenjem
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$cene, \IfiTest\AuthPage::$cenePass);
        $ent = $I->successfullyGet($this->osebniUrl, $this->obj1['id']);
    }

    /**
     * lista po vseh, tudi osebnih podatkih
     * 
     * @depends createOsebni
     * @param ApiTester $I
     */
    public function getListOsebni(ApiTester $I)
    {
        /*
         * uporabnik z OsebniPodatki-read dovoljenjem
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$cene, \IfiTest\AuthPage::$cenePass);

        $listUrl = $this->osebniUrl . "?q=cch";     // na priimku je wildcard, išče cch*
        codecept_debug($listUrl);
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];
        codecept_debug($list);
        $I->assertNotEmpty($list);
        $I->assertEquals(1, $resp['state']['totalRecords']);

        /**
         * osebnih podatki so tu vidni 
         */
        $I->assertTrue(array_key_exists('datumRojstva', $list[0]), 'datumRojstva osebni podatek');
        $I->assertTrue(array_key_exists('emso', $list[0]), 'emso osebni podatek');
        $I->assertTrue(array_key_exists('davcna', $list[0]), 'davcna osebni podatek');
        $I->assertTrue(array_key_exists('drzavljanstvo', $list[0]), 'drzavljanstvo osebni podatek');
        $I->assertTrue(array_key_exists('drzavaRojstva', $list[0]), 'drzavaRojstva osebni podatek');
        $I->assertTrue(array_key_exists('krajRojstva', $list[0]), 'krajRojstva osebni podatek');
        $I->assertTrue(array_key_exists('trrji', $list[0]), 'trrji osebni podatek');


        /*
         * uporabnik brez Oseba-read dovoljenja
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$breznik, \IfiTest\AuthPage::$breznikPass);
        $resp = $I->failToGetList($listUrl, []);
        codecept_debug($resp);
        $I->assertEquals(1000012, $resp[0]['code']);

        /*
         * uporabnik brez OsebniPodatki-read dovoljenja
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$rudi, \IfiTest\AuthPage::$rudiPass);
        $resp = $I->failToGetList($listUrl, []);
        codecept_debug($resp);
        $I->assertEquals(1001600, $resp[0]['code']);

        /*
         * uporabnik z OsebniPodatki-read dovoljenjem
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$cene, \IfiTest\AuthPage::$cenePass);
        $resp = $I->successfullyGetList($listUrl, []);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListDefault(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?q=cch";     // na priimku je wildcard, išče cch*
        codecept_debug($listUrl);
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];
        codecept_debug($list);
        $I->assertNotEmpty($list);
        $I->assertEquals(1, $resp['state']['totalRecords']);

        /**
         * osebnih podatkov ne sme biti vidnih 
         */
        $I->assertFalse(array_key_exists('datumRojstva', $list[0]), 'datumRojstva osebni podatek');
        $I->assertFalse(array_key_exists('emso', $list[0]), 'emso osebni podatek');
        $I->assertFalse(array_key_exists('davcna', $list[0]), 'davcna osebni podatek');
        $I->assertFalse(array_key_exists('drzavljanstvo', $list[0]), 'drzavljanstvo osebni podatek');
        $I->assertFalse(array_key_exists('drzavaRojstva', $list[0]), 'drzavaRojstva osebni podatek');
        $I->assertFalse(array_key_exists('krajRojstva', $list[0]), 'krajRojstva osebni podatek');
        $I->assertFalse(array_key_exists('trrji', $list[0]), 'trrji osebni podatek');

        /**
         * list brez filtra , default sort
         */
        $listUrl      = $this->restUrl;
        codecept_debug($listUrl);
        $resp         = $I->successfullyGetList($listUrl, []);
        $list         = $resp['data'];
        $I->assertNotEmpty($list);
        codecept_debug($list);
        $totalRecords = $resp['state']['totalRecords'];
        $I->assertGreaterThanOrEqual(6, $totalRecords);
        $I->assertEquals("aa", $list[0]['priimek']); // prvo sortno polje je priimek
//        $I->assertEquals("Žumer", $list[$totalRecords - 1]['priimek']);
// list brez filtra , sort po imenu padajoče
        $listUrl      = $this->restUrl . "?sort_by=ime&order=DESC";
        codecept_debug($listUrl);
        $resp         = $I->successfullyGetList($listUrl, []);
        $list         = $resp['data'];
        $I->assertNotEmpty($list);
        codecept_debug($list);
        $totalRecords = $resp['state']['totalRecords'];
        $I->assertGreaterThanOrEqual(6, $totalRecords);
        $I->assertEquals("Žare", $list[0]['ime']);     // drugi sortno polje je ime
//        $I->assertEquals("aana", $list[$totalRecords - 1]['ime']);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
//    public function getListPoKraju(ApiTester $I)
//    {
//        $listUrl = $this->restUrl . "?kraj=Lenar";
//        $resp    = $I->successfullyGetList($listUrl, []);
//        $list    = $resp['data'];
//        codecept_debug($list);
//        
//        $I->assertNotEmpty($list);
//        $I->assertEquals(2, $resp['state']['totalRecords']);
//
//        $listUrl = $this->restUrl . "?kraj=Marib";
//        $resp    = $I->successfullyGetList($listUrl, []);
//        $list    = $resp['data'];
//
//        $I->assertNotEmpty($list);
//        $I->assertEquals(1, $resp['state']['totalRecords']);
//    }

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

//  oseba ima lahko  ime prazno
        $resp = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($resp);


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


        /*
         * kreiramo še en zapis
         */
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
            'zacetek'           => '2012-02-01T00:00:00+0100',
            'procentOdInkasa'   => 5.1,
            'jeProcentOdInkasa' => true,
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
            'zacetek'           => '2012-02-01T00:00:00+0100',
            'procentOdInkasa'   => 5.1,
            'jeProcentOdInkasa' => true,
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
            'delovnoMesto'        => "režiser",
            'oseba'               => $this->obj2['id'],
        ];
        $this->objZaposlitev1 = $ent                  = $I->successfullyCreate($this->zaposlitevUrl, $data);
        $I->assertNotEmpty($ent['id']);

        $data                 = [
            'status'              => 'N',
            'zacetek'             => '2012-02-01T00:00:00+0100',
            'konec'               => '2012-02-01T00:00:00+0100',
            'tip'                 => 3,
            'delovnaObveza'       => 4,
            'malica'              => 'dd',
            'izmenskoDelo'        => true,
            'individualnaPogodba' => true,
            'jeZaposlenVdrugemJz' => TRUE,
            'jeNastopajoci'       => TRUE,
            'delovnoMesto'        => "režiser",
            'oseba'               => $this->obj2['id'],
        ];
        $this->objZaposlitev2 = $ent                  = $I->successfullyCreate($this->zaposlitevUrl, $data);
        $I->assertNotEmpty($ent['id']);
    }

    /**
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function createVecZasedenosti(ApiTester $I)
    {
        $zacetek              = '2014-05-07T10:00:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $data                 = [
            'dogodek' => null, // zaenkrat prazno, relacija se vzpostavi po kreiranju zapisa Dogodek
            'oseba'   => $this->obj3['id'],
            'title'   => "Zasedenost $zacetek",
            'status'  => '200s',
            'zacetek' => $zacetek,
            'konec'   => '2014-05-07T14:00:00+0200',
        ];
        $this->objZasedenost1 = $ent                  = $I->successfullyCreate($this->zasedenostUrl, $data);
        $I->assertGuid($ent['id']);

        $zacetek              = '2014-06-07T10:00:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $data                 = [
            'dogodek' => null, // zaenkrat prazno, relacija se vzpostavi po kreiranju zapisa Dogodek
            'oseba'   => $this->obj2['id'],
            'title'   => "Zasedenost $zacetek",
            'status'  => '200s',
            'zacetek' => $zacetek,
            'konec'   => '2014-06-07T14:00:00+0200',
        ];
        $this->objZasedenost2 = $ent                  = $I->successfullyCreate($this->zasedenostUrl, $data);
        $I->assertGuid($ent['id']);

        $zacetek              = '2014-08-07T10:00:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $data                 = [
            'dogodek' => null, // zaenkrat prazno, relacija se vzpostavi po kreiranju zapisa Dogodek
            'oseba'   => $this->obj2['id'],
            'title'   => "Zasedenost $zacetek",
            'status'  => '200s',
            'zacetek' => $zacetek,
            'konec'   => '2014-08-07T14:00:00+0200',
        ];
        $this->objZasedenost3 = $ent                  = $I->successfullyCreate($this->zasedenostUrl, $data);
        $I->assertGuid($ent['id']);
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


        /**
         * test avtorizacij oz. posebnih dovoljenj
         */
        /*
         * uporabnik brez Oseba-read dovoljenja
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$breznik, \IfiTest\AuthPage::$breznikPass);
        $resp = $I->failToGetRelation($this->restUrl, $this->obj2['id'], "telefonske", "");
        codecept_debug($resp);
        $I->assertEquals(100699, $resp[0][0]['code']);

        /*
         * uporabnik brez Telefonska-read dovoljenja
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$dana, \IfiTest\AuthPage::$danaPass);
        $resp = $I->failToGetRelation($this->restUrl, $this->obj2['id'], "telefonske", "");
        codecept_debug($resp);
        $I->assertEquals(100696, $resp[0][0]['code']);

        /*
         * uporabnik brez OsebniPodatki-read dovoljenja
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$rudi, \IfiTest\AuthPage::$rudiPass);
        $resp = $I->failToGetRelation($this->restUrl, $this->obj2['id'], "telefonske", "");
        codecept_debug($resp);
        $I->assertEquals(100696, $resp[0][0]['code']);

        /*
         * uporabnik z OsebniPodatki-read dovoljenjem
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$cene, \IfiTest\AuthPage::$cenePass);
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "telefonske", "");
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
        codecept_debug($resp);
        $I->assertEquals(2, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "trrji", $this->objTrr1['id']);
        codecept_debug($resp);
        $I->assertEquals(1, count($resp));

        /**
         * test avtorizacij oz. posebnih dovoljenj
         */
        /*
         * uporabnik brez Oseba-read dovoljenja
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$breznik, \IfiTest\AuthPage::$breznikPass);
        $resp = $I->failToGetRelation($this->restUrl, $this->obj2['id'], "trrji", "");
        codecept_debug($resp);
        $I->assertEquals(100699, $resp[0][0]['code']);

        /*
         * uporabnik brez Trr-read dovoljenja
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$dana, \IfiTest\AuthPage::$danaPass);
        $resp = $I->failToGetRelation($this->restUrl, $this->obj2['id'], "trrji", "");
        codecept_debug($resp);
        $I->assertEquals(100696, $resp[0][0]['code']);

        /*
         * uporabnik brez OsebniPodatki-read dovoljenja
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$rudi, \IfiTest\AuthPage::$rudiPass);
        $resp = $I->failToGetRelation($this->restUrl, $this->obj2['id'], "trrji", "");
        codecept_debug($resp);
        $I->assertEquals(100696, $resp[0][0]['code']);

        /*
         * uporabnik z OsebniPodatki-read dovoljenjem
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$cene, \IfiTest\AuthPage::$cenePass);
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "trrji", "");
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

        /**
         * test avtorizacij oz. posebnih dovoljenj
         */
        /*
         * uporabnik brez Oseba-read dovoljenja
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$breznik, \IfiTest\AuthPage::$breznikPass);
        $resp = $I->failToGetRelation($this->restUrl, $this->obj2['id'], "pogodbe", "");
        codecept_debug($resp);
        $I->assertEquals(100699, $resp[0][0]['code']);

        /*
         * uporabnik brez Pogodba-read dovoljenja
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$dana, \IfiTest\AuthPage::$danaPass);
        $resp = $I->failToGetRelation($this->restUrl, $this->obj2['id'], "pogodbe", "");
        codecept_debug($resp);
        $I->assertEquals(100696, $resp[0][0]['code']);

        /*
         * uporabnik brez OsebniPodatki-read dovoljenja
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$rudi, \IfiTest\AuthPage::$rudiPass);
        $resp = $I->failToGetRelation($this->restUrl, $this->obj2['id'], "pogodbe", "");
        codecept_debug($resp);
        $I->assertEquals(100696, $resp[0][0]['code']);

        /*
         * uporabnik z OsebniPodatki-read dovoljenjem
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$cene, \IfiTest\AuthPage::$cenePass);
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "pogodbe", "");
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


        /*
         * uporabnik brez Oseba-read dovoljenja
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$breznik, \IfiTest\AuthPage::$breznikPass);
        $resp = $I->failToGetRelation($this->restUrl, $this->obj2['id'], "zaposlitve", "");
        codecept_debug($resp);
        $I->assertEquals(100699, $resp[0][0]['code']);

        /*
         * uporabnik brez OsebniPodatki-read dovoljenja
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$rudi, \IfiTest\AuthPage::$rudiPass);
        $resp = $I->failToGetRelation($this->restUrl, $this->obj2['id'], "zaposlitve", "");
        codecept_debug($resp);
        $I->assertEquals(100696, $resp[0][0]['code']);

        /*
         * uporabnik z OsebniPodatki-read dovoljenjem
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$cene, \IfiTest\AuthPage::$cenePass);
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "zaposlitve", "");
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
     * preberemo relacije
     * 
     * @depends createVecZasedenosti
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeZZasedenostmi(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "zasedenosti", "");
        $I->assertEquals(2, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "zasedenosti", $this->objZasedenost2['id']);
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
        $oseba = $I->successfullyDelete($this->restUrl, $this->obj1['id']);

        $I->failToGet($this->restUrl, $this->obj1['id']);
    }

}
