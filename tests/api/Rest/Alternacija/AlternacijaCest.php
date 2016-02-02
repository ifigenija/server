<?php

namespace Rest\Alternacija;

use ApiTester;

/**
 * Description of AlternacijaCest
 * 
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto - je ni
 *      relacije z drugimi entitetami
 *      - funkcija
 *      - zaposlitev (zaposlitev)
 *      - oseba
 *      - pogodba
 * - storitve O2M $$
 *      getlist različne variante relacij
 *      - vse
 *      - funkcija
 *      - uprizoritev
 *
 * @author rado
 */
class AlternacijaCest
{

    private $restUrl                = '/rest/alternacija';
    private $osebaUrl               = '/rest/oseba';
    private $funkcijaUrl            = '/rest/funkcija';
    private $uprizoritevUrl         = '/rest/uprizoritev';
    private $zaposlitevUrl          = '/rest/zaposlitev';
    private $produkcijskaHisaUrl    = '/rest/produkcijskahisa';
    private $koprodukcijaUrl        = '/rest/produkcijadelitev';
    private $pogodbaUrl             = '/rest/pogodba';
    private $dogodekUrl             = '/rest/dogodek';
    private $terminStoritveUrl      = '/rest/terminstoritve';
    private $obj1;
    private $obj2;
    private $obj3;
    private $obj4;
    private $obj5teh;
    private $objOseba;
    private $lookOseba1;
    private $lookOseba2;
    private $objFunkcija;
    private $lookFunkcija1Ig;
    private $lookFunkcija2Te;
    private $lookFunkcija3;
    private $objUprizoritev;
    private $lookUprizoritev1;
    private $lookUprizoritev2;
    private $objZaposlitev;
    private $lookProdukcijskaHisa;
    private $objProdukcijskaHisa;
    private $objKoprodukcija1;
    private $objKoprodukcija2;
    private $objPogodba;
    private $objTerminStoritve1;
    private $objTerminStoritve2;
    private $objDogodek;
    private $lookupProdukcijskaHisa = '/lookup/produkcijskahisa';

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     * @param ApiTester $I
     */
    public function lookupFunkcijo(ApiTester $I)
    {
        $this->lookFunkcija1Ig = $look                  = $I->lookupEntity("funkcija", "Tezej", false);
        codecept_debug($look);
        $I->assertGuid($look['id']);
        $ent                   = $I->successfullyGet($this->funkcijaUrl, $look['id']);
        $I->assertEquals('igralec', $ent['podrocje']);

        $this->lookFunkcija2Te = $look                  = $I->lookupEntity("funkcija", "Tehnični vodja", false);
        codecept_debug($look);
        $I->assertGuid($look['id']);
        $ent                   = $I->successfullyGet($this->funkcijaUrl, $look['id']);
        $I->assertEquals('tehnik', $ent['podrocje']);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupOsebo(ApiTester $I)
    {
        $this->lookOseba1 = $ent              = $I->lookupEntity("oseba", "0006", false);
        $I->assertNotEmpty($ent);
        $this->lookOseba2 = $ent              = $I->lookupEntity("oseba", "0003", false);
        $I->assertNotEmpty($ent);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupUprizoritev(ApiTester $I)
    {
        $this->lookUprizoritev1 = $look                   = $I->lookupEntity("uprizoritev", "0001", false);
        $I->assertNotEmpty($look);

        $this->lookUprizoritev2 = $look                   = $I->lookupEntity("uprizoritev", "0002", false);
        $I->assertNotEmpty($look);
    }

    /**
     *  kreiramo zapis
     * 
     * @depends lookupOsebo
     * 
     * @param ApiTester $I
     */
    public function createZaposlitev(ApiTester $I)
    {
        $data                = [
            'status'              => 'A',
            'zacetek'             => '2010-02-01T00:00:00+0100',
            'konec'               => '2010-02-01T00:00:00+0100',
            'tip'                 => 1,
            'delovnaObveza'       => 2,
            'malica'              => 'zz',
            'delovnoMesto'        => 'XXX',
            'izmenskoDelo'        => true,
            'individualnaPogodba' => true,
            'jeZaposlenVdrugemJz' => TRUE,
            'jeNastopajoci'       => TRUE,
            'oseba'               => $this->lookOseba1['id'],
        ];
        $this->objZaposlitev = $ent                 = $I->successfullyCreate($this->zaposlitevUrl, $data);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['status'], 'A');
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupProdukcijskaHisa(ApiTester $I)
    {

        $resp                       = $I->successfullyGetList($this->lookupProdukcijskaHisa, []);
        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->assertTrue(array_key_exists('data', $resp), "ima data");
        $this->lookProdukcijskaHisa = $resp['data'][0];
//        $I->assertTrue(array_key_exists('label', $resp['data'][0]), "ima labelo");
//        $I->assertTrue(array_key_exists('totalRecords', $resp['state']), "ima total records");
        $I->assertGreaterThanOrEqual(1, $resp['state']['totalRecords'], "total records");
    }

    /**
     *  kreiramo zapis
     * 
     * @depends lookupOsebo
     * @depends lookupFunkcijo
     * @depends createZaposlitev
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data       = [
            'zaposlen'   => false, // v validaciji postavimo na true, če je zaposlitev
            'zacetek'    => '2010-02-01T00:00:00+0100',
            'konec'      => '2020-02-01T00:00:00+0100',
            'opomba'     => 'zz',
            'sort'       => 1,
            'privzeti'   => true,
            'funkcija'   => $this->lookFunkcija1Ig['id'],
            'zaposlitev' => $this->objZaposlitev['id'],
            'oseba'      => $this->lookOseba1['id'],
            'pogodba'    => null,
            'pomembna'   => TRUE,
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['opomba'], 'zz');

        // kreiram še en zapis
        $data       = [
            'sifra'      => '9090', // za sort
            'zaposlen'   => false, // se lahko povozi v validaciji
            'zacetek'    => '2011-02-01T00:00:00+0100',
            'konec'      => '2021-02-01T00:00:00+0100',
            'opomba'     => 'aa',
            'sort'       => 2,
            'privzeti'   => true,
            'funkcija'   => $this->lookFunkcija1Ig['id'],
            'zaposlitev' => null,
            'oseba'      => $this->lookOseba1['id'],
            'pogodba'    => null,
            'pomembna'   => FALSE,
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['opomba'], 'aa');
        $I->assertEquals($ent['funkcija']['tipFunkcije.podrocje'], 'igralec');

        /*
         *  kreiram še en zapis
         */
        $data       = [
            'funkcija'   => $this->lookFunkcija1Ig['id'],
            'zaposlen'   => false,
            'zacetek'    => '2023-03-01T00:00:00+0100',
            'konec'      => '2024-03-01T00:00:00+0100',
            'opomba'     => 'ddd',
            'sort'       => 6,
            'privzeti'   => true,
            'zaposlitev' => $this->objZaposlitev['id'],
            'oseba'      => $this->lookOseba1['id'],
            'pogodba'    => null,
            'imaPogodbo' => false,
            'pomembna'   => TRUE,
        ];
        $this->obj3 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        codecept_debug($ent);
        $I->assertGuid($ent['id']);



        /*
         *  kreiram še en zapis
         *  s področjem funkcije tehnik
         */
        $data          = [
            'zaposlen'   => false,
            'zacetek'    => '2013-02-01T00:00:00+0100',
            'konec'      => '2024-02-01T00:00:00+0100',
            'opomba'     => 'bb',
            'sort'       => 3,
            'privzeti'   => TRUE,
            'funkcija'   => $this->lookFunkcija2Te['id'],
            'zaposlitev' => $this->objZaposlitev['id'],
            'oseba'      => $this->lookOseba1['id'],
            'pogodba'    => null,
            'imaPogodbo' => false,
            'pomembna'   => FALSE,
        ];
        $this->obj5teh = $ent           = $I->successfullyCreate($this->restUrl, $data);
        codecept_debug($ent);
        $I->assertGuid($ent['id']);
        $I->assertEquals($ent['opomba'], 'bb');
        $I->assertEquals($ent['funkcija']['tipFunkcije.podrocje'], 'tehnik');

        /*
         *  kreiram še en zapis
         *   z isto funkcijo kot obj3
         */
        $data       = [
            'funkcija'   => $this->lookFunkcija1Ig['id'],
            'zaposlen'   => false,
            'zacetek'    => '2023-05-01T00:00:00+0100',
            'konec'      => '2024-05-01T00:00:00+0100',
            'opomba'     => 'eee',
            'sort'       => 6,
            'privzeti'   => false,
            'zaposlitev' => $this->objZaposlitev['id'],
            'oseba'      => $this->lookOseba1['id'],
            'pogodba'    => null,
            'imaPogodbo' => false,
            'pomembna'   => false,
        ];
        $this->obj4 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        codecept_debug($ent);
        $I->assertGuid($ent['id']);
    }

    /**
     * preberi vse zapise po določeni funkciji
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoFunkciji(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?funkcija=" . $this->lookFunkcija1Ig['id'];

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];
        codecept_debug($resp);

        $I->assertGreaterThanOrEqual(3, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
//        $I->assertEquals("xx", $list[0]['status']);      // odvisno od sortiranja
    }

    /**
     * preberi vse zapise po določeni uprizoritvi
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoUprizoritvi(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?uprizoritev=" . $this->lookUprizoritev2['id'];
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];
        codecept_debug($list);

        $totalRecords = $resp['state']['totalRecords'];
        $I->assertGreaterThanOrEqual(9, $totalRecords, "po uprizoritvi");
        $I->assertEquals("0001", $list[0]['sifra']);      // odvisno od sortiranja
        $I->assertEquals("9090", $list[$totalRecords - 1]['sifra']);      // odvisno od sortiranja


        /**
         *  še po uprizoritvi, ki nima alternacij
         */
        $listUrl = $this->restUrl . "?uprizoritev=" . $this->lookUprizoritev1['id'];
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];
        codecept_debug($resp);

        $I->assertEquals(0, $resp['state']['totalRecords']);
//        $I->assertNotEmpty($list);
//        $I->assertEquals("xx", $list[0]['status']);      // odvisno od sortiranja
    }

    /**
     * preberi aktivne alternacije funkcij, ki se planirajo, po določeni uprizoritvi
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListPlanirane(ApiTester $I)
    {
        /*
         * 1. datum
         */
        $resp      = $I->successfullyGetList($this->restUrl . "/planirane?uprizoritev=" . $this->lookUprizoritev2['id']
                . "&datum=2015-01-01", []);
        $list      = $resp['data'];
        codecept_debug($list);
        $funIdentA = array_column(array_column($list, "funkcija"), "ident");
        codecept_debug($funIdentA);
        $I->assertContains("Avtor", $funIdentA);
        $I->assertNotContains("Razsvetljava", $funIdentA);
        $I->assertContains("Inšpicient", $funIdentA);
        $I->assertNotContains("Režija", $funIdentA);

        /*
         * 2. datum
         */
        $resp      = $I->successfullyGetList($this->restUrl . "/planirane?uprizoritev=" . $this->lookUprizoritev2['id']
                . "&datum=2016-01-01", []);
        $list      = $resp['data'];
        codecept_debug($list);
        $funIdentA = array_column(array_column($list, "funkcija"), "ident");
        codecept_debug($funIdentA);
        $I->assertContains("Avtor", $funIdentA);
        $I->assertContains("Razsvetljava", $funIdentA);
        $I->assertContains("Inšpicient", $funIdentA);
        $I->assertContains("Režija", $funIdentA);

        /*
         * 3. datum
         */
        $resp      = $I->successfullyGetList($this->restUrl . "/planirane?uprizoritev=" . $this->lookUprizoritev2['id']
                . "&datum=2016-01-20", []);
        $list      = $resp['data'];
        codecept_debug($list);
        $funIdentA = array_column(array_column($list, "funkcija"), "ident");
        codecept_debug($funIdentA);
        $I->assertContains("Avtor", $funIdentA);
        $I->assertNotContains("Razsvetljava", $funIdentA);
        $I->assertNotContains("Inšpicient", $funIdentA);
        $I->assertContains("Režija", $funIdentA);

        /*
         * brez datuma
         */
        $resp      = $I->successfullyGetList($this->restUrl . "/planirane?uprizoritev=" . $this->lookUprizoritev2['id'], []);
        $list      = $resp['data'];
        codecept_debug($list);
        $funIdentA = array_column(array_column($list, "funkcija"), "ident");
        codecept_debug($funIdentA);
        $funPodrA  = array_column(array_column($list, "funkcija"), "tipFunkcije.podrocje");
        codecept_debug($funPodrA);
        $I->assertContains("Avtor", $funIdentA);
        $I->assertContains("Razsvetljava", $funIdentA);
        $I->assertContains("Inšpicient", $funIdentA);
        $I->assertContains("Režija", $funIdentA);

        $I->assertContains("inspicient", $funPodrA);
        $I->assertContains("tehnik", $funPodrA);
        $I->assertContains("umetnik", $funPodrA);
        $I->assertContains("igralec", $funPodrA);

        /*
         * po področju
         */
        $resp      = $I->successfullyGetList($this->restUrl . "/planirane?uprizoritev=" . $this->lookUprizoritev2['id']
                . "&podrocje[]=inspicient&podrocje[]=tehnik", []);
        $list      = $resp['data'];
        codecept_debug($list);
        $funIdentA = array_column(array_column($list, "funkcija"), "ident");
        codecept_debug($funIdentA);
        $funPodrA  = array_column(array_column($list, "funkcija"), "tipFunkcije.podrocje");
        codecept_debug($funPodrA);
        $I->assertNotContains("Avtor", $funIdentA);
        $I->assertContains("Razsvetljava", $funIdentA);
        $I->assertContains("Inšpicient", $funIdentA);
        $I->assertNotContains("Režija", $funIdentA);

        $I->assertContains("inspicient", $funPodrA);
        $I->assertContains("tehnik", $funPodrA);
        $I->assertNotContains("umetnik", $funPodrA);
        $I->assertNotContains("igralec", $funPodrA);
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent           = $I->successfullyGet($this->restUrl, $this->obj1['id']);
        $ent['opomba'] = 'uu';

        $this->obj1 = $entR       = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        codecept_debug($entR);
        $I->assertEquals($entR['opomba'], 'uu');


        /**
         * še preverjanja avtorizacij, posebnih dovoljenj
         */
        $entTeh = $this->obj5teh;
        $I->assertEquals('tehnik', $entTeh['funkcija']['tipFunkcije.podrocje']);
        $entIg  = $this->obj2;                            //netehnik
        $I->assertNotEquals('tehnik', $entIg['funkcija']['tipFunkcije.podrocje']);


        /*
         * uporabnik brez Funkcija-vse dovoljenja
         * ne tehnika ne sme spreminjati
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vinko, \IfiTest\AuthPage::$vinkoPass);
        $resp = $I->failToUpdate($this->restUrl, $entIg['id'], $entIg);
        codecept_debug($resp);
        $I->assertEquals(1000101, $resp[0]['code']);
        /**
         * tehnika lahko spremeni
         */
        $resp = $I->successfullyUpdate($this->restUrl, $entTeh['id'], $entTeh);
        codecept_debug($resp);

        /*
         * uporabnik s Funkcija-vse dovoljenjem
         * ne tehnika  sme spreminjati
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vihra, \IfiTest\AuthPage::$vihraPass);
        $resp = $I->successfullyUpdate($this->restUrl, $entIg['id'], $entIg);
        codecept_debug($resp);
        /**
         * tehnika lahko spremeni
         */
        $resp = $I->successfullyUpdate($this->restUrl, $entTeh['id'], $entTeh);
        codecept_debug($resp);
    }

    /**
     * spremenim zapis - s kratko obliko datuma (cone niso pomembne)
     * 
     * @depends update
     * @param ApiTester $I
     */
    public function updateSKratkimDatumom(ApiTester $I)
    {
        $data = $I->successfullyGet($this->restUrl, $this->obj4['id']);

        $data['zacetek'] = '2023-05-02';
        $data['konec']   = '2024-05-02';

        $this->obj4 = $ent        = $I->successfullyUpdate($this->restUrl, $data['id'], $data);
        codecept_debug($ent);
        $I->assertEquals(substr($ent['zacetek'], 0, 10), $data['zacetek']);
        $I->assertEquals(substr($ent['konec'], 0, 10), $data['konec']);
    }

    /**
     * Preberem zapis in preverim vsa polja
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function read(\ApiTester $I)
    {
        $ent = $I->successfullyGet($this->restUrl, $this->obj1['id']);

        $I->assertGuid($ent['id']);
        $I->assertNotEmpty($ent['sifra']);
        $I->assertEquals($ent['zacetek'], '2010-02-01T00:00:00+0100');
        $I->assertEquals($ent['konec'], '2020-02-01T00:00:00+0100');
        $I->assertEquals($ent['opomba'], 'uu');
        $I->assertEquals($ent['sort'], 1);
        $I->assertEquals($ent['privzeti'], FALSE, "privzeti");      //vmes se je spremenilo
        $I->assertEquals($ent['funkcija']['id'], $this->lookFunkcija1Ig['id']);
        $I->assertEquals($ent['zaposlitev'], $this->objZaposlitev['id'], "zaposlitev");
        $I->assertEquals($ent['zaposlen'], true);               // v validaciji se bi moralo postaviti na true, če je zaposlitev
        $I->assertEquals($ent['oseba']['id'], $this->lookOseba1['id'], "oseba");
        $I->assertEquals($ent['pogodba'], $this->objPogodba['id']);
        $I->assertEquals($ent['imaPogodbo'], false);
        $I->assertEquals($ent['pomembna'], true, "pomembna");
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updateBrezZaposlitve(ApiTester $I)
    {
        $ent               = $I->successfullyGet($this->restUrl, $this->obj1['id']);
        $ent['zaposlitev'] = null;

        $this->obj1 = $entR       = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        codecept_debug($entR);
        $I->assertEquals($entR['zaposlitev'], null);
    }

    /**
     * brisanje zapisa
     * 
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $I->successfullyDelete($this->restUrl, $this->obj1['id']);
        $I->failToGet($this->restUrl, $this->obj1['id']);
    }

    /**
     * najde nek dogodek
     * 
     * @param ApiTester $I
     */
    public function getListDogodkov(ApiTester $I)
    {
//        $resp             = $I->successfullyGetList($this->dogodekUrl . "/vse", []);
        $resp             = $I->successfullyGetList($this->dogodekUrl . "?zacetek=1900-01-01&konec=2900-06-15", []);
        $list             = $resp['data'];
        $I->assertNotEmpty($list);
        $this->objDogodek = $drzava           = array_pop($list);
        $I->assertNotEmpty($drzava);
    }

    /**
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function odstranimZaposlitev(\ApiTester $I)
    {
        $ent               = $I->successfullyGet($this->restUrl, $this->obj5teh['id']);
        $I->assertEquals($ent['zaposlitev'], $this->objZaposlitev['id'], "zaposlitev");
        $I->assertEquals($ent['zaposlen'], true);               // v validaciji se bi moralo postaviti na true, če je zaposlitev
        // odstranimo zaposlitev
        $ent['zaposlitev'] = null;
        $ent               = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertEquals($ent['zaposlitev'], null, "zaposlitev");
        $I->assertEquals($ent['zaposlen'], false);

        // preverimo zaposlitev po Get
        $ent = $I->successfullyGet($this->restUrl, $ent['id']);
        $I->assertEquals($ent['zaposlitev'], null, "zaposlitev");
        $I->assertEquals($ent['zaposlen'], false);
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updateZaValidacijoDatumov(ApiTester $I)
    {
        $ent = $I->successfullyGet($this->restUrl, $this->obj5teh['id']);

        // enaka datuma
        $ent['zacetek'] = '2016-02-01T00:00:00+0100';
        $ent['konec']   = '2016-02-01T00:00:00+0100';
        $ent            = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        // prazen konec
        $ent['konec'] = '';
        $ent          = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        //  konec pred začetkom
        $ent['konec'] = '2016-01-31T00:00:00+0100';
        $resp         = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertEquals(1000337, $resp[0]['code']);

        // prazen začetek
        $ent['zacetek'] = '';
        $ent['konec']   = '2016-02-01T00:00:00+0100';
        $ent            = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
    }

    /**
     *  kreiramo zapis
     * 
     * @depends lookupOsebo
     * @depends lookupFunkcijo
     * @depends createZaposlitev
     * 
     * @param ApiTester $I
     */
    public function createNastaviPomembna(ApiTester $I)
    {
        // kreiramo enega brez polja 'pomembna'
        $data = [
//            'pomembna'   => TRUE,     // nalašč brez parametra pomembna
            'zaposlen'   => false, // v validaciji postavimo na true, če je zaposlitev
            'zacetek'    => '2010-02-01T00:00:00+0100',
            'konec'      => '2020-02-01T00:00:00+0100',
            'opomba'     => 'pomembna?',
            'sort'       => 1,
            'privzeti'   => true,
            'funkcija'   => $this->lookFunkcija1Ig['id'],
            'zaposlitev' => $this->objZaposlitev['id'],
            'oseba'      => $this->lookOseba1['id'],
            'pogodba'    => null,
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
        $I->assertFalse($ent['pomembna'], 'default za pomembna');

        // še enkrat preverimo z get za vsak slučaj
        $ent = $I->successfullyGet($this->restUrl, $ent['id']);
        $I->assertFalse($ent['pomembna'], 'po read:default za pomembna');


        // kreiramo enega z nastavljenim poljem 'pomembna'
        $data = [
            'pomembna'   => True, // nalašč brez parametra pomembna
            'zaposlen'   => false, // v validaciji postavimo na true, če je zaposlitev
            'zacetek'    => '2010-02-01T00:00:00+0100',
            'konec'      => '2020-02-01T00:00:00+0100',
            'opomba'     => 'pomembna je false?',
            'sort'       => 1,
            'privzeti'   => true,
            'funkcija'   => $this->lookFunkcija1Ig['id'],
            'zaposlitev' => $this->objZaposlitev['id'],
            'oseba'      => $this->lookOseba1['id'],
            'pogodba'    => null,
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
        $I->assertTrue($ent['pomembna'], 'default za pomembna');

        // še enkrat preverimo z get za vsak slučaj
        $ent = $I->successfullyGet($this->restUrl, $ent['id']);
        $I->assertTrue($ent['pomembna'], 'po read:default za pomembna');
    }

    /**
     * Preverja validacijo.
     * Če je pri eni alternaciji Privzeto nastavljeno na true, 
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updateAzurirajPrivzeto(ApiTester $I)
    {
        // nastavimo enega na true
        $ent             = $this->obj3;
        $ent['privzeti'] = TRUE;
        $this->obj2      = $ent             = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        codecept_debug($ent);
        $I->assertTrue($ent['privzeti']);
        $funkcijaIdPrv   = $ent['funkcija']['id'];


        // nastavimo drugega na true -> prejšnji bi se moral postaviti na false
        $ent             = $this->obj4;
        $ent['privzeti'] = TRUE;
        $ent             = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $ent             = $I->successfullyGet($this->restUrl, $ent['id']);
        codecept_debug($ent);
        $I->assertTrue($ent['privzeti']);

        /**
         * ali sta alternaciji v isti funkciji
         */
        $I->assertEquals($funkcijaIdPrv, $ent['funkcija']['id']);

        /*
         *  ali se je prejšnji postavil na false?
         */
        $ent = $I->successfullyGet($this->restUrl, $this->obj2['id']);
        codecept_debug($ent);
        $I->assertFalse($ent['privzeti'], 'privzeti prestavljen na false?');
    }

    /**
     * brisanje zapisa , ki ima nastavljeno privzeti
     * 
     * @depends updateAzurirajPrivzeto
     */
    public function deletePrivzetega(ApiTester $I)
    {
        $ent = $I->successfullyGet($this->restUrl, $this->obj5teh['id']);
        $I->assertTrue($ent['privzeti']);

        $I->successfullyDelete($this->restUrl, $ent['id']);
        $I->failToGet($this->restUrl, $ent['id']);
    }

    /**
     *  kreiramo zapis
     * 
     * @depends lookupOsebo
     * @depends lookupFunkcijo
     * @depends createZaposlitev
     * 
     * @param ApiTester $I
     */
    public function createPrenesiZaposlitev(ApiTester $I)
    {
        /**
         * kreiramo eno brez polja zaposlitve 
         */
        $data = [
            'zacetek'  => '2010-02-01T00:00:00+0100',
            'konec'    => '2020-02-01T00:00:00+0100',
            'opomba'   => 'gg',
            'sort'     => 11,
            'privzeti' => true,
            'funkcija' => $this->lookFunkcija1Ig['id'],
            'oseba'    => $this->lookOseba2['id'],
            'pomembna' => TRUE,
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);

        /**
         * preberemo, če je napolnil zaposlitev
         */
        $ent = $I->successfullyGet($this->restUrl, $ent['id']);

        $I->assertGuid($ent['id']);
        codecept_debug($ent);
        $I->assertNotEmpty($ent['zaposlitev'], "zaposlitev");
        $I->assertEquals($ent['zaposlen'], true);               // v validaciji se bi moralo postaviti na true, če je zaposlitev
    }

}
