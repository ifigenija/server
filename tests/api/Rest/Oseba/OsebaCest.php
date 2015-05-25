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
 *      - popa           
 *          . update 
 *          . get (id, list)
 *          . delete   
 * - naslovi        $$ 2M (morda začasno ne deluje zaradi boolean? 
 *      - telefonske     O2M 
 *      - trrji          O2M 
 *      - pogodbe        O2M 
 * 
 *      - alternacije    O2M 
 *      - sodelovanja    O2M 
 *      getlist različne variante relacij
 *      - vse
 *      - default
 * 
 * 
 */
class OsebaCest
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
    private $zaposlitevUrl  = '/rest/zaposlitev';
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
     * najde državo
     * 
     * @param ApiTester $I
     */
    public function getListDrzava(ApiTester $I)
    {
        $resp            = $I->successfullyGetList($this->drzavaUrl, []);
        $list            = $resp['data'];
        $I->assertNotEmpty($list);
        $this->objDrzava = $drzava          = array_pop($list);
        $I->assertNotEmpty($drzava);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function createPopa(ApiTester $I)
    {
        $data           = [
            'sifra'     => 'ZZ12',
            'tipkli'    => '3', // $$ rb ko bodo opcije porihtane
            'stakli'    => 'AK', // $$ rb ko bodo opcije porihtane
            'naziv'     => 'zz',
            'naziv1'    => 'zz',
            'panoga'    => 'zz',
            'email'     => 'z@zzz.zz',
            'url'       => 'zz',
            'opomba'    => 'zz',
            'drzava'    => $this->objDrzava['id'],
            'idddv'     => 'zz',
            'maticna'   => 'ZZ123',
            'zavezanec' => 'Da',
            'jeeu'      => 'Da',
            'datZav'    => '2010-02-01T00:00:00+0100',
            'datnZav'   => '2017-02-01T00:00:00+0100',
            'zamejstvo' => FALSE,
        ];
        $this->objPopa1 = $popa           = $I->successfullyCreate($this->popaUrl, $data);
        $I->assertNotEmpty($popa['id']);
        $I->assertEquals('ZZ12', $popa['sifra']);

        //kreiramo še en zapis
        $data           = [
            'sifra'     => 'AA12',
            'tipkli'    => '3', // $$ rb ko bodo opcije porihtane
            'stakli'    => 'AK', // $$ rb ko bodo opcije porihtane
            'naziv'     => 'aa',
            'naziv1'    => 'aa',
            'panoga'    => 'aa',
            'email'     => 'a@zzz.zz',
            'url'       => 'aa',
            'opomba'    => 'aa',
            'drzava'    => $this->objDrzava['id'],
            'idddv'     => 'aa',
            'maticna'   => 'AA123',
            'zavezanec' => 'Da',
            'jeeu'      => 'Da',
            'datZav'    => '2011-02-01T00:00:00+0100',
            'datnZav'   => '2012-02-01T00:00:00+0100',
            'zamejstvo' => TRUE,
        ];
        $this->objPopa2 = $popa           = $I->successfullyCreate($this->popaUrl, $data);
        $I->assertNotEmpty($popa['id']);
        $I->assertEquals('AA12', $popa['sifra']);
    }

    /**
     *  napolnimo vsaj en zapis
     * 
     * @param ApiTester $I
     */
    public function createUserja(ApiTester $I)
    {
        $data          = [
            'email'              => 'test2@ifigenija.si',
            'name'               => 'Testni uporabnik za Cest testiranje',
            'password'           => 'zzzzzzzzzzzzzzzzzzz',
            'enabled'            => true,
            'expires'            => '2017-02-01T00:00:00+0100',
            'defaultRoute'       => 'zz',
            'defaultRouteParams' => 'zz',
        ];
        $this->objUser = $user          = $I->successfullyCreate($this->userUrl, $data);
        $I->assertEquals('test2@ifigenija.si', $user['email']);
        $I->assertNotEmpty($user['id']);
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
            'user'          => $this->objUser['id'],
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
            'spol'          => 'M',
            'opombe'        => 'aa',
            'drzavljanstvo' => 'aa',
            'drzavaRojstva' => 'aa',
            'krajRojstva'   => 'aa',
            'user'          => null,
        ];

        $this->obj2 = $oseba      = $I->successfullyCreate($this->restUrl, $data);

        $I->assertEquals('aa', $oseba['ime']);
        $I->assertNotEmpty($oseba['id']);
        $I->assertNotEmpty($oseba['sifra']);
        // kreiramo še en zapis
        $data = [
            'sifra'         => '',      // prazno -naj sam zgenerira
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

        $oseba      = $I->successfullyCreate($this->restUrl, $data);

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
            "vrsta"    => "mobilna", //$$ rb - to je začasno, dokler se ne popravijo form-> setData... nastavljanje filtrov iz configa (v .yml)
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
//        $I->assertEquals('M', $oseba['spol'],"spol ni pravilen");   //$$ rb validator pri create-u javi napako
        $I->assertEquals('zz', $oseba['opombe']);
        $I->assertEquals('zz', $oseba['drzavljanstvo']);
        $I->assertEquals('zz', $oseba['drzavaRojstva']);
        $I->assertEquals('zz', $oseba['krajRojstva']);

        codecept_debug($oseba);
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
     * @param ApiTester $I
     */
    public function getListVse(ApiTester $I)
    {
        $listUrl = $this->restUrl . "/vse";
        codecept_debug($listUrl);
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];

        $I->assertNotEmpty($list);
        $I->assertEquals(2, $resp['state']['totalRecords']);
        $I->assertEquals("aa", $list[0]['opombe']);      //glede na sort
    }

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
        $I->assertEquals(1, $resp['state']['totalRecords']);
        $I->assertEquals("aa", $list[0]['opombe']);
    }

    /**
     * kreiramo relacijo
     * @depends create
     * @depends createPopa
     * 
     * @param ApiTester $I
     */
    public function ustvariRelacijoSPopa(ApiTester $I)
    {
        // put       http://ifigenija.local:8080/rest/oseba/00090000-555a-d470-54e1-a0ac34f09cb7/popa/00080000-555a-d470-0ed7-2ef2d2de4d03?XDEBUG_SESSION_START=netbeans-xdebug
        $resp = $I->successfullyUpdate($this->restUrl, $this->obj2['id'] . "/popa/" . $this->objPopa1['id'], []);
        codecept_debug($resp);

        // ustvarimo še eno relacijo z 2. popa
        $resp = $I->successfullyUpdate($this->restUrl, $this->obj2['id'] . "/popa/" . $this->objPopa2['id'], []);
        codecept_debug($resp);
    }

    /**
     * preberemo relacij
     * @depends ustvariRelacijoSPopa
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeSPopa(ApiTester $I)
    {
        // GET   http://ifigenija.local:8080/rest/oseba/00090000-555b-0689-36e7-f9a8471d5932/popa?XDEBUG_SESSION_START=netbeans-xdebug
        // get list
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "popa", "");
        $I->assertEquals(2, count($resp));

        // get po popa id  
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "popa", $this->objPopa1['id']);
        $I->assertEquals(1, count($resp));
    }

    /**
     * brisanje relacij
     * @depends ustvariRelacijoSPopa
     * 
     * @param ApiTester $I
     */
    public function deleteRelacijoSPopa(ApiTester $I)
    {
        // primer:
        // DELETE   http://ifigenija.local:8080/rest/oseba/00090000-555b-31ed-d438-f3f46c26b59e/popa/00080000-555b-31ed-7683-d4cdd224d2b5?XDEBUG_SESSION_START=netbeans-xdebug
        $resp = $I->successfullyDeleteRelation($this->restUrl, $this->obj2['id'], "popa", $this->objPopa1['id']);

        $resp = $I->failToGetRelation($this->restUrl, $this->obj2['id'], "popa", $this->objPopa1['id']);
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
        $I->assertEquals(1000301, $resp[0]['code']);


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
        $I->assertEquals(1000302, $resp[0]['code']);
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
        $I->assertTrue(TRUE);
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
            'vrednostVaje'      => 33.33,
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
            'vrednostVaje'      => 33.33,
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
     * 
     * @param ApiTester $I
     */
    public function createVecAlternacij(ApiTester $I)
    {
        $data                  = [
            'zaposlen'     => true,
            'funkcija'     => null,
            'sodelovanje'  => NULL,
            'oseba'        => $this->obj2['id'],
            'koprodukcija' => null,
            'pogodba'      => NULL,
        ];
        $this->objAlternacija1 = $ent                   = $I->successfullyCreate($this->alternacijaUrl, $data);
        $I->assertNotEmpty($ent['id']);

        $data                  = [
            'zaposlen'     => true,
            'funkcija'     => null,
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
        $data                = [
            'status'              => 'zz',
            'zacetek'             => '2010-02-01T00:00:00+0100',
            'konec'               => '2010-02-01T00:00:00+0100',
            'tip'                 => 1,
            'delovnaObveza'       => 2,
            'malica'              => 'zz',
            'izmenskoDelo'        => true,
            'individualnaPogodba' => true,
            'jeZaposlenVdrugemJz' => TRUE,
            'jeNastopajoci'       => TRUE,
            'oseba'               => $this->obj2['id'],
        ];
        $this->objSodelovanje1 = $ent                 = $I->successfullyCreate($this->zaposlitevUrl, $data);
        $I->assertNotEmpty($ent['id']);
        
        $data                = [
            'status'              => 'aa',
            'zacetek'             => '2012-02-01T00:00:00+0100',
            'konec'               => '2013-02-01T00:00:00+0100',
            'tip'                 => 3,
            'delovnaObveza'       => 4,
            'malica'              => 'aa',
            'izmenskoDelo'        => true,
            'individualnaPogodba' => true,
            'jeZaposlenVdrugemJz' => TRUE,
            'jeNastopajoci'       => TRUE,
            'oseba'               => $this->obj2['id'],
        ];
        $this->objSodelovanje2 = $ent                 = $I->successfullyCreate($this->zaposlitevUrl, $data);
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
    public function preberiRelacijeSSodelovanji(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "sodelovanja", "");
        $I->assertEquals(2, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "sodelovanja", $this->objSodelovanje1['id']);
        $I->assertEquals(1, count($resp));
    }

}
