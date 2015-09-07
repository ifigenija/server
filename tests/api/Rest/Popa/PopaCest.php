<?php

namespace Rest\Popa;

use ApiTester;

/**
 *      -create
 *      -getlist
 *      -update
 *      -get kontrola vseh polj te entitete
 *      -delete
 * -validate metodo za entiteto
 * -relacije z drugimi entitetami
 * 
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *  validate metodo za entiteto - zaradi nullable=false do validacije sploh ne pride
 * relacije z drugimi entitetami
 * - dogodek $$ O2O
 * - kupec $$ O2O
 *      - drzava     
 *      - osebe       2M
 *          . update 
 *          . get (id, list)
 *          . delete   
 * - naslovi    $$ 2M    
 *      - telefonske O2M     
 *      - trrji      O2M     
 *      - pogodbe    O2M 
 *  - prostori
 * getlist različne variante relacij
 */
class PopaCest
{

    private $restUrl               = '/rest/popa';
    private $drzavaUrl             = '/rest/drzava';
    private $osebaUrl              = '/rest/oseba';
    private $pnaslovUrl            = '/rest/postninaslov';
    private $trrUrl                = '/rest/trr';
    private $naslovUrl             = '/rest/naslov';
    private $telefonskaUrl         = '/rest/telefonska';
    private $pogodbaUrl            = '/rest/pogodba';
    private $kontaktnaOsebaUrl     = '/rest/kontaktnaoseba';
    private $id                    = '00000000-0000-0000-0000-000000000000';
    private $obj;
    private $obj2;
    private $objDrzava;
    private $objOseba1;
    private $objOseba2;
    private $objPnaslov1;
    private $objPnaslov2;
    private $objTelefonska1;
    private $objTelefonska2;
    private $objTrr1;
    private $objTrr2;
    private $objPogodba1;
    private $objPogodba2;
    private $strosekUprizoritveUrl = '/rest/strosekuprizoritve';
    private $objStrosekUprizoritve1;
    private $objStrosekUprizoritve2;
    private $objKontaktna1;
    private $objKontaktna2;
    private $lookOseba1;
    private $lookOseba2;
    private $lookAlternacija1;
    private $lookAlternacija2;
    private $lookAlternacija3;
    private $lookAlternacija4;
    private $lookAlternacija5;
    private $lookAlternacija6;
    private $lookupAlternacijaUrl  = '/lookup/alternacija';
    private $prostorUrl            = '/rest/prostor';
    private $objProstor1;
    private $objProstor2;
    private $objNaslov1;
    private $objNaslov2;
    private $objNaslov3;
    private $objNaslov4;
    private $lookDrzava;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     * inicializira bazo  glede na DumpFunctional.sql
     * 
     * 
     * @param ApiTester $I
     */
    public function initBaze(ApiTester $I)
    {
        $I->initDB();
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
    public function lookupOsebo(ApiTester $I)
    {
        $this->lookOseba1 = $ent              = $I->lookupEntity("oseba", "0001", false);
        $I->assertNotEmpty($ent);

        $this->lookOseba2 = $ent              = $I->lookupEntity("oseba", "0002", false);
        $I->assertNotEmpty($ent);
    }
    
    /**
     * 
     * @param ApiTester $I
     */
    public function lookupDrzava(ApiTester $I)
    {
        $this->lookDrzava = $ent              = $I->lookupEntity("drzava", "SI", false);
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
//    public function createOsebo(ApiTester $I)
//    {
//        $data = [
//            'naziv'         => 'zz',
//            'ime'           => 'zz',
//            'priimek'       => 'zz',
//            'funkcija'      => 'zz',
//            'srednjeIme'    => 'zz',
//            'psevdonim'     => 'zz',
//            'email'         => 'x@xxx.xx',
//            'datumRojstva'  => '1973-28-03T04:30:00',
//            'emso'          => 'ZZ',
//            'davcna'        => 'ZZ123',
//            'spol'          => 'M',
//            'opombe'        => 'zz',
//            'drzavljanstvo' => 'zz',
//            'drzavaRojstva' => 'zz',
//            'krajRojstva'   => 'zz',
//            'user'          => null,
//        ];
//
//        $this->objOseba1 = $oseba           = $I->successfullyCreate($this->osebaUrl, $data);
//
//        $I->assertEquals('zz', $oseba['ime']);
//        $I->assertNotEmpty($oseba['id']);
//
//        // kreiramo še en zapis
//        $data = [
//            'naziv'         => 'aa',
//            'ime'           => 'aa',
//            'priimek'       => 'aa',
//            'funkcija'      => 'aa',
//            'srednjeIme'    => 'aa',
//            'psevdonim'     => 'aa',
//            'email'         => 'a@aaa.aa',
//            'datumRojstva'  => '1975-28-03T04:30:00',
//            'emso'          => 'AA',
//            'davcna'        => 'AA123',
//            'spol'          => 'M',
//            'opombe'        => 'aa',
//            'drzavljanstvo' => 'aa',
//            'drzavaRojstva' => 'aa',
//            'krajRojstva'   => 'aa',
//            'user'          => null,
//        ];
//
//        $this->objOseba2 = $oseba           = $I->successfullyCreate($this->osebaUrl, $data);
//
//        $I->assertEquals('aa', $oseba['ime']);
//        $I->assertNotEmpty($oseba['id']);
//    }

    /**
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'sifra'     => 'ZZ12',
            'stakli'    => 'AK',
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
            'nvo'       => FALSE,
        ];
        $this->obj = $popa      = $I->successfullyCreate($this->restUrl, $data);

//        codecept_debug($popa);
        $I->assertNotEmpty($popa['id']);
        $I->assertEquals('ZZ12', $popa['sifra']);

        // kreiramo še en zapis
        $data       = [
            'sifra'     => '',
            'stakli'    => 'AK',
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
            'datnZav'   => '2018-02-01T00:00:00+0100',
            'zamejstvo' => FALSE,
            'nvo'       => FALSE,
        ];
        $this->obj2 = $popa       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($popa['id']);
        $I->assertNotEmpty($popa['sifra']);
    }

    /**
     *  napolnimo vsaj en zapis
     *
     * @depends create
     * @param ApiTester $I
     */
//    public function createPostniNaslov(ApiTester $I)
//    {
//        $data              = [
//            'popa'       => $this->obj['id'],
////            'oseba'      => null,                 //$$ ker je hidden, mora biti izključeno
//            'naziv'      => 'ww',
//            'ulica'      => 'ww',
//            'ulicaDva'   => 'ww',
//            'posta'      => 'ww',
//            'postaNaziv' => 'ww',
//            'pokrajina'  => 'ww',
//            'drzava'     => $this->objDrzava['id'],
//            'jeeu'       => FALSE,
//            'privzeti'   => true,
//        ];
//        $this->objPnaslov1 = $pnaslov           = $I->successfullyCreate($this->pnaslovUrl, $data);
//        $I->assertNotEmpty($pnaslov['id']);
//        $I->assertEquals('ww', $pnaslov['ulica']);
//
//        // kreiramo še en zapis
//        $data              = [
//            'popa'       => $this->obj['id'],
////            'oseba'      => null,                 //$$ ker je hidden, mora biti izključeno
//            'naziv'      => 'bb',
//            'ulica'      => 'bb',
//            'ulicaDva'   => 'bb',
//            'posta'      => 'bb',
//            'postaNaziv' => 'bb',
//            'pokrajina'  => 'bb',
//            'drzava'     => $this->objDrzava['id'],
//            'jeeu'       => false, //$$ rb tu še ne dela, ker je required
//            'privzeti'   => true,
//        ];
//        $this->objPnaslov2 = $pnaslov           = $I->successfullyCreate($this->pnaslovUrl, $data);
//        $I->assertNotEmpty($pnaslov['id']);
//        $I->assertEquals('bb', $pnaslov['ulica']);
//    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $popa           = $this->obj;
        $popa['panoga'] = 'tralala';

        $popa = $I->successfullyUpdate($this->restUrl, $popa['id'], $popa);

        $I->assertEquals('tralala', $popa['panoga']);
    }

    /**
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function read(ApiTester $I)
    {
        $popa = $I->successfullyGet($this->restUrl, $this->obj['id']);

        $I->assertEquals($popa['sifra'], 'ZZ12');
        $I->assertEquals($popa['stakli'], 'AK');
        $I->assertEquals($popa['naziv'], 'zz');
        $I->assertEquals($popa['naziv1'], 'zz');
        $I->assertEquals($popa['panoga'], 'tralala');
        $I->assertEquals($popa['email'], 'z@zzz.zz');
        $I->assertEquals($popa['url'], 'zz');
        $I->assertEquals($popa['opomba'], 'zz');
        $I->assertEquals($popa['drzava'], $this->objDrzava['id']);
        $I->assertEquals($popa['idddv'], 'zz');
        $I->assertEquals($popa['maticna'], 'ZZ123');
        $I->assertEquals($popa['zavezanec'], null);  // $$ rb ko jasno za checkbox
        $I->assertEquals($popa['jeeu'], null);        // $$ rb ko jasno za checkbox
        $I->assertEquals($popa['datZav'], '2010-02-01T00:00:00+0100');
        $I->assertEquals($popa['datnZav'], '2017-02-01T00:00:00+0100');
        $I->assertEquals($popa['zamejstvo'], FALSE);
        $I->assertEquals($popa['nvo'], FALSE);
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
//        codecept_debug($list);
//
//        $I->assertNotEmpty($list);
//        $I->assertTrue($resp['state']['totalRecords'] >= 2, "total records");
////        $I->assertEquals("aa", $list[0]['naziv']);      //glede na sort  
//    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListDefault(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?q=a";     // na nazivu je wildcard, išče *a*
        codecept_debug($listUrl);
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];

        $I->assertNotEmpty($list);
        $I->assertTrue($resp['state']['totalRecords'] >= 1);
//        $I->assertEquals("aa", $list[0]['naziv']);  // glede na sort 
    }

    /**
     * kreiramo relacijo
     * @depends create
     * @depends createOsebo
     * 
     * @param ApiTester $I
     */
//    public function ustvariRelacijoZOsebo(ApiTester $I)
//    {
//        $resp = $I->successfullyUpdate($this->restUrl, $this->obj['id'] . "/osebe/" . $this->objOseba1['id'], []);
////        codecept_debug($resp);
//        // ustvarimo še eno relacijo 
//        $resp = $I->successfullyUpdate($this->restUrl, $this->obj['id'] . "/osebe/" . $this->objOseba2['id'], []);
////        codecept_debug($resp);
//    }

    /**
     * preberemo relacije
     * 
     * @depends ustvariRelacijoZOsebo
     * 
     * @param ApiTester $I
     */
//    public function preberiRelacijeZOsebami(ApiTester $I)
//    {
//        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj['id'], "osebe", "");
////        codecept_debug($resp);
//        $I->assertEquals(2, count($resp));
//
//        // get po oseba id  
//        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj['id'], "osebe", $this->objOseba1['id']);
//        $I->assertEquals(1, count($resp));
//    }

    /**
     * brisanje relacij
     * @depends ustvariRelacijoZOsebo
     * 
     * @param ApiTester $I
     */
//    public function deleteRelacijoZOsebo(ApiTester $I)
//    {
//        $resp = $I->successfullyDeleteRelation($this->restUrl, $this->obj['id'], "osebe", $this->objOseba1['id']);
//
//        $resp = $I->failToGetRelation($this->restUrl, $this->obj['id'], "osebe", $this->objOseba1['id']);
//    }

    /**
     * preberemo relacije
     * 
     * @depends createPostniNaslov
     * 
     * @param ApiTester $I
     */
//    public function preberiRelacijeZNaslovi(ApiTester $I)
//    {
//        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj['id'], "naslovi", "");
////        codecept_debug($resp);
//        $I->assertEquals(2, count($resp));
//
//        // get po oseba id  
//        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj['id'], "naslovi", $this->objPnaslov1['id']);
//        $I->assertEquals(1, count($resp));
//    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function delete(ApiTester $I)
    {
        $popa = $I->successfullyDelete($this->restUrl, $this->obj['id']);

        $I->failToGet($this->restUrl, $this->obj['id']);
    }

    /**
     * kreiramo popa, test validacije  - zaenkrat izpustimo, ker do validacije zaradi nullable=false pri vseh 3 poljih sploh ne pride
     * 
     * @param ApiTester $I
     */
//    public function createKlientaBrezNaziva(ApiTester $I)
//    {
////            $this->expect($this->sifra, "Šifra je obvezen podatek", 1000310);
////        $this->expect($this->naziv, "Naziv je obvezen podatek", 1000311);
////        $this->expect($this->drzava, "Država je obvezen podatek", 1000312);
//        $data = [
//            'sifra'     => 'cc',
//            'naziv'     => '',
//            'drzava'    => $this->objDrzava['id'],
////            'drzava'    => NULL,
//        ];
//
//        // test validacije - oseba mora imeti ime
//        $resp = $I->failToCreate($this->restUrl, $data);
//        $I->assertNotEmpty($resp);
//        // testiramo na enako številko napake kot je v validaciji
//        $I->assertEquals(1000311, $resp[0]['code']);
//    }

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
            'popa'     => $this->obj2['id'],
            'oseba'    => null,
        ];
        $this->objTelefonska1 = $ent                  = $I->successfullyCreate($this->telefonskaUrl, $data);
        $I->assertTrue(TRUE);
        $I->assertNotEmpty($ent['id']);

        // še en zapis
        $data                 = [
            'vrsta'    => 'fiksna',
            'stevilka' => '012',
            'privzeta' => true,
            'popa'     => $this->obj2['id'],
            'oseba'    => null,
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
            'popa'     => $this->obj2['id'],
            'oseba'    => null,
        ];
        $this->objTrr1 = $trr           = $I->successfullyCreate($this->trrUrl, $data);
        $I->assertNotEmpty($trr['id']);


        //kreiramo še en zapis
        $data          = [
            'stevilka' => 'A1',
            'swift'    => 'A1',
            'bic'      => 'A1',
            'banka'    => 'A1',
            'popa'     => $this->obj2['id'],
            'oseba'    => null,
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
        $I->assertTrue(true, "začasno za test");
        $data              = [
            'sifra'             => 'ZZ123',
            'alternacija'       => $this->lookAlternacija1['id'],
            'vrednostVaj'       => 33.33,
            'vrednostPredstave' => 44.44,
            'vrednostUre'       => 22.22,
            'aktivna'           => false,
            'opis'              => 'zz',
            'popa'              => $this->obj2['id'],
            'oseba'             => $this->lookOseba1['id'],
            'trr'               => $this->objTrr1['id'],
        ];
        $I->assertTrue(true, "začasno za test 2");
        $I->assertNotEmpty($data);
        $this->objPogodba1 = $ent               = $I->successfullyCreate($this->pogodbaUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // kreiramo še en zapis
        $data              = [
            'sifra'             => 'WW4',
            'vrednostVaj'       => 33.33,
            'alternacija'       => $this->lookAlternacija2['id'],
            'vrednostPredstave' => 44.44,
            'vrednostUre'       => 22.22,
            'aktivna'           => false,
            'opis'              => 'ww',
            'popa'              => $this->obj2['id'],
            'oseba'             => $this->lookOseba2['id'],
            'trr'               => $this->objTrr1['id'],
        ];
        $this->objPogodba2 = $ent               = $I->successfullyCreate($this->pogodbaUrl, $data);
        $I->assertNotEmpty($ent['id']);
    }

    /**
     *  napolnimo vsaj en zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function createVecNaslovov(ApiTester $I)
    {

        $data             = [
            'popa'       => $this->obj2['id'],
            'oseba'      => null,
            'naziv'      => 'ww',
            'ulica'      => 'ww',
            'ulicaDva'   => 'ww',
            'posta'      => 'ww',
            'postaNaziv' => 'ww',
            'pokrajina'  => 'ww',
            'drzava'     => $this->objDrzava['id'],
            'jeeu'       => true,
            'privzeti'   => true,
        ];
        $this->objNaslov1 = $pnaslov          = $I->successfullyCreate($this->pnaslovUrl, $data);
        $I->assertGuid($pnaslov['id']);

        // še enega
        $data             = [
            'popa'       => $this->obj2['id'],
            'oseba'      => null,
            'naziv'      => 'gg',
            'ulica'      => 'gg',
            'ulicaDva'   => 'gg',
            'posta'      => 'gg',
            'postaNaziv' => 'gg',
            'pokrajina'  => 'gg',
            'drzava'     => $this->objDrzava['id'],
            'jeeu'       => true,
            'privzeti'   => true,
        ];
        $this->objNaslov2 = $pnaslov          = $I->successfullyCreate($this->pnaslovUrl, $data);
        $I->assertGuid($pnaslov['id']);
        
        // še enega
        $data = [
            "popa"      => $this->obj2['id'],
            "naziv"      => "naslov1",
            "ulica"      => "cmd 16",
            "ulicaDva"   => "cankarjeva 16",
            "posta"      => "2250",
            "postaNaziv" => "Ptuj",
            "pokrajina"  => "Štajerska",
            "drzava"     => $this->lookDrzava['id'],
            'oseba'      => null,
            'jeeu'       => true,
            'privzeti'   => true,
        ];

        $this->objNaslov3 = $pnaslov             = $I->successfullyCreate($this->pnaslovUrl, $data);
        $I->assertGuid($pnaslov['id']);
        
        $data = [
            "popa"      => $this->obj2['id'],
            "naziv"      => "naslov1",
            "ulica"      => "cmd 16",
            "ulicaDva"   => "cankarjeva 16",
            "posta"      => "2250",
            "postaNaziv" => "Ptuj",
            "pokrajina"  => "Štajerska",
            "drzava"     => $this->lookDrzava['id'],
            'oseba'      => null,
            'jeeu'       => true,
            'privzeti'   => true,
        ];

        $this->objNaslov4 = $pnaslov             = $I->successfullyCreate($this->pnaslovUrl, $data);
        $I->assertGuid($pnaslov['id']);
    }

    /**
     *  napolnimo vsaj en zapis
     * 
     * @depends createVecNaslovov
     * @param ApiTester $I
     */
    public function createVecProstorov(ApiTester $I)
    {
        $popa = $I->successfullyGet($this->restUrl, $this->obj2['id']);
        codecept_debug($popa);

        $data              = [
            'sifra'        => '12',
            'naziv'        => 'aa',
            'jePrizorisce' => true,
            'kapaciteta'   => 1,
            'opis'         => 'aa',
            'popa'         => $popa['id'],
            'naslov'       => $popa['naslovi'][0]['id'],
        ];
        codecept_debug($data);
        $this->objProstor1 = $ent               = $I->successfullyCreate($this->prostorUrl, $data);
        $I->assertGuid($ent['id']);

        // kreiramo še en zapis
        $data              = [
            'sifra'        => '13',
            'naziv'        => 'bb',
            'jePrizorisce' => true,
            'kapaciteta'   => 2,
            'opis'         => 'bb',
            'popa'         => $popa['id'],
            'naslov'       => $popa['naslovi'][0]['id'],
        ];
        codecept_debug($data);
        $this->objProstor2 = $ent               = $I->successfullyCreate($this->prostorUrl, $data);
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
     * @depends createVecNaslovov
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeZNaslovi(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "naslovi", "");
        $I->assertEquals(4, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "naslovi", $this->objNaslov1['id']);
        $I->assertEquals(1, count($resp));
    }

    /**
     * preberemo relacije
     * 
     * @depends createVecProstorov
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeSProstori(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "prostori", "");
        $I->assertEquals(2, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "prostori", $this->objProstor1['id']);
        $I->assertEquals(1, count($resp));
    }

    /**
     *  kreiramo zapis
     * 
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function createVecStroskov(ApiTester $I)
    {
        $data = [
            'naziv'       => 'zz',
            'vrednostDo'  => 1.23,
            'vrednostNa'  => 4.56,
            'opis'        => 'zz',
            'tipstroska'  => 'avtorprav',
            'sort'        => 1,
//            'uprizoritev' => $this->lookUprizoritev,
            'uprizoritev' => null,
            'popa'        => $this->obj2['id'],
        ];

        $this->objStrosekUprizoritve1 = $ent                          = $I->successfullyCreate($this->strosekUprizoritveUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // kreiramo še en zapis
        $data                         = [
            'naziv'       => 'popacc',
            'vrednostDo'  => 1.23,
            'vrednostNa'  => 4.56,
            'opis'        => 'zz',
            'tipstroska'  => 'avtorprav',
            'sort'        => 1,
//            'uprizoritev' => $this->lookUprizoritev,
            'uprizoritev' => null,
            'popa'        => $this->obj2['id'],
        ];
        $this->objStrosekUprizoritve2 = $ent                          = $I->successfullyCreate($this->strosekUprizoritveUrl, $data);
        $I->assertNotEmpty($ent['id']);
    }

    /**
     * preberemo relacije
     * @depends createVecStroskov
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeSStroski(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "stroski", "");
        $I->assertEquals(2, count($resp));

        // get po popa id  
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "stroski", $this->objStrosekUprizoritve1['id']);
        $I->assertEquals(1, count($resp));
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
            'popa'     => $this->obj2['id'],
            'oseba'    => $this->objOseba2['id'],
        ];
        $I->assertTrue(TRUE);
        $this->objKontaktna1 = $ent                 = $I->successfullyCreate($this->kontaktnaOsebaUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // še en zapis
        $data                = [
            'status'   => 'AK',
            'funkcija' => 'bb',
            'opis'     => 'bb',
            'popa'     => $this->obj2['id'],
            'oseba'    => $this->objOseba2['id'],
        ];
        $this->objKontaktna2 = $ent                 = $I->successfullyCreate($this->kontaktnaOsebaUrl, $data);
        $I->assertNotEmpty($ent['id']);
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

}
