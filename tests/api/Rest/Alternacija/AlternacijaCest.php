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
    private $obj;
    private $obj2;
    private $obj3;
    private $objOseba;
    private $lookOseba;
    private $objFunkcija;
    private $lookFunkcija;
    private $objUprizoritev;
    private $lookUprizoritev;
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
     * najde nek dogodek
     * 
     * @param ApiTester $I
     */
    public function getListDogodkov(ApiTester $I)
    {
        $resp             = $I->successfullyGetList($this->dogodekUrl . "/vse", []);
        $list             = $resp['data'];
        $I->assertNotEmpty($list);
        $this->objDogodek = $drzava           = array_pop($list);
        $I->assertNotEmpty($drzava);
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
    public function lookupOsebo(ApiTester $I)
    {
        $this->lookOseba = $ent             = $I->lookupEntity("oseba", "0006", false);
        $I->assertNotEmpty($ent);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupUprizoritev(ApiTester $I)
    {
        $this->lookUprizoritev = $look                  = $I->lookupEntity("uprizoritev", "0001", false);
        $I->assertNotEmpty($look);
    }

    /**
     *  kreiramo  osebo
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
//        $this->objOseba = $oseba          = $I->successfullyCreate($this->osebaUrl, $data);
//
//        $I->assertEquals('zz', $oseba['ime']);
//        $I->assertNotEmpty($oseba['id']);
//    }

    /**
     * 
     * @param ApiTester $I
     */
//    public function createUprizoritev(ApiTester $I)
//    {
//        $data                 = [
//            'faza'             => 'predprodukcija-ideja',
//            'naslov'           => 'zz',
//            'podnaslov'        => 'zz',
//            'delovniNaslov'    => 'zz',
//            'datumPremiere'    => '2010-02-01T00:00:00+0100',
//            'stOdmorov'        => 1,
//            'avtor'            => 'zz',
//            'gostujoca'        => true,
//            'trajanje'         => 2,
//            'opis'             => 'zz',
//            'arhIdent'         => 'zz',
//            'arhOpomba'        => 'zz',
//            'datumZakljucka'   => '2019-02-01T00:00:00+0100',
//            'sloAvtor'         => true,
//            'kratkiNaslov'     => 'zz',
////            'besedilo'         => $this->objBesedilo['id'],
//            'besedilo'         => NULL,
//            'zvrstUprizoritve' => null,
//            'zvrstSurs'        => null,
//        ];
//        $this->objUprizoritev = $ent                  = $I->successfullyCreate($this->uprizoritevUrl, $data);
//        $I->assertNotEmpty($ent['id']);
//        codecept_debug($ent);
//        $I->assertEquals($ent['opis'], 'zz');
//    }

    /**
     *  napolnimo vsaj en zapis
     * 
     * @param ApiTester $I
     */
//    public function createFunkcijo(ApiTester $I)
//    {
//        $data              = [
//            'podrocje'    => 'igralec',
//            'naziv'       => 'zz',
//            'velikost'    => 'mala',
//            'pomembna'    => true,
//            'sort'        => 2,
//            'sePlanira' => true,
//            'dovoliPrekrivanje' => false,
//            'uprizoritev' => $this->objUprizoritev['id'],
//            'privzeti'    => null,
//            'tipFunkcije' => null,
//        ];
//        $this->objFunkcija = $ent               = $I->successfullyCreate($this->funkcijaUrl, $data);
//        $I->assertEquals($ent['naziv'], 'zz');
//        $I->assertNotEmpty($ent['id']);
//    }

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
            'izmenskoDelo'        => true,
            'individualnaPogodba' => true,
            'jeZaposlenVdrugemJz' => TRUE,
            'jeNastopajoci'       => TRUE,
            'oseba'               => $this->lookOseba['id'],
        ];
        $this->objZaposlitev = $ent                 = $I->successfullyCreate($this->zaposlitevUrl, $data);
        $I->assertNotEmpty($ent['id']);
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
     * @param ApiTester $I
     */
//    public function createProdukcijskaHisa(ApiTester $I)
//    {
//        $data                      = [
//            'status' => 'zz',
//            'popa'   => null,
//        ];
//        $this->objProdukcijskaHisa = $ent                       = $I->successfullyCreate($this->produkcijskaHisaUrl, $data);
//        $I->assertNotEmpty($ent['id']);
//        $I->assertEquals($ent['status'], 'zz');
//    }

    /**
     *  kreiramo zapis
     * 
     * @depends lookupProdukcijskaHisa
     * @depends lookupUprizoritev
     * 
     * @param ApiTester $I
     */
//    public function createKoprodukcijo(ApiTester $I)
//    {
//        $data                   = [
//            'odstotekFinanciranja' => 1.23,
//            'nasStrosek'           => true,
//            'uprizoritev'          => $this->lookUprizoritev['id'],
//            'koproducent'          => $this->lookProdukcijskaHisa['id'],
//        ];
//        $this->objKoprodukcija1 = $ent                    = $I->successfullyCreate($this->koprodukcijaUrl, $data);
//        $I->assertNotEmpty($ent['id']);
//        codecept_debug($ent);
//
//        // kreiram še en zapis brez koproducenta  - ne moremo, ker ne dovoli - Value is required
////        $data                   = [
////            'odstotekFinanciranja' => 4.56,
////            'nasStrosek'           => true,
////            'uprizoritev'          => $this->lookUprizoritev['id'],
////            'koproducent'          => null, // da lahko potem validacijo testiramo
////        ];
////        $this->objKoprodukcija2 = $ent                    = $I->successfullyCreate($this->koprodukcijaUrl, $data);
////        $I->assertNotEmpty($ent['id']);
////        codecept_debug($ent);
//    }

    /**
     *  kreiramo pogodbo
     * 
     * @param ApiTester $I
     */
    public function createPogodbo(ApiTester $I)
    {
        $data             = [
            'sifra'             => 'ZZ123',
            'vrednostVaj'      => 33.33,
            'vrednostPredstave' => 44.44,
            'vrednostUre'       => 22.22,
            'aktivna'           => false,
            'opis'              => 'zz',
            'oseba'             => $this->lookOseba['id'],
            'popa'              => null,
            'trr'               => null,
        ];
        $this->objPogodba = $ent              = $I->successfullyCreate($this->pogodbaUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['sifra'], 'ZZ123');
    }

    /**
     *  kreiramo zapis
     * 
     * @depends lookupOsebo
     * @depends lookupFunkcijo
     * @depends createZaposlitev
     * @depends createPogodbo
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'zaposlen'     => false, // v validaciji postavimo na true, če je zaposlitev
            'zacetek'      => '2010-02-01T00:00:00+0100',
            'konec'        => '2020-02-01T00:00:00+0100',
            'opomba'       => 'zz',
            'sort'         => 1,
            'privzeti'     => true,
            'aktivna'      => true,
            'funkcija'     => $this->lookFunkcija['id'],
            'zaposlitev'   => $this->objZaposlitev['id'],
            'oseba'        => $this->lookOseba['id'],
            'pogodba'      => $this->objPogodba['id'],
            'imaPogodbo'   => TRUE,
            'pomembna'   => TRUE,
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['opomba'], 'zz');

        // kreiram še en zapis
        $data       = [
            'zaposlen'     => false, // se lahko povozi v validaciji
            'zacetek'      => '2011-02-01T00:00:00+0100',
            'konec'        => '2021-02-01T00:00:00+0100',
            'opomba'       => 'aa',
            'sort'         => 2,
            'privzeti'     => true,
            'aktivna'      => true,
            'funkcija'     => $this->lookFunkcija['id'],
            'zaposlitev'   => null,
            'oseba'        => $this->lookOseba['id'],
            'pogodba'      => null,
            'imaPogodbo'   => TRUE,
            'pomembna'   => FALSE,
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['opomba'], 'aa');

        // kreiram še en zapis
        $data       = [
            'zaposlen'     => false,
            'zacetek'      => '2013-02-01T00:00:00+0100',
            'konec'        => '2024-02-01T00:00:00+0100',
            'opomba'       => 'bb',
            'sort'         => 3,
            'privzeti'     => true,
            'aktivna'      => true,
            'funkcija'     => $this->lookFunkcija['id'],
            'zaposlitev'   => null,
            'oseba'        => $this->lookOseba['id'],
            'pogodba'      => null,
            'imaPogodbo'   => false,
            'pomembna'   => FALSE,
        ];
        $this->obj3 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['opomba'], 'bb');
    }

    /**
     * preberi vse zapise od osebe
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoFunkciji(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?funkcija=" . $this->lookFunkcija['id'];

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];
        codecept_debug($resp);

        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
//        $I->assertEquals("xx", $list[0]['status']);      // odvisno od sortiranja
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListVse(ApiTester $I)
    {
        $listUrl = $this->restUrl . "/vse";             // $$ rb to je nehalo delovati - ne vem zakaj
        codecept_debug($listUrl);
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];
        codecept_debug($list);


        $I->assertNotEmpty($list);
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
//        $I->assertEquals("zz", $list[0]['status']);      //glede na sort
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent           = $this->obj;
        $ent['opomba'] = 'uu';

        $this->obj = $entR      = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['opomba'], 'uu');
    }

    /**
     * Preberem zapis in preverim vsa polja
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function read(\ApiTester $I)
    {
        $ent = $I->successfullyGet($this->restUrl, $this->obj['id']);

        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['zacetek'], '2010-02-01T00:00:00+0100');
        $I->assertEquals($ent['konec'], '2020-02-01T00:00:00+0100');
        $I->assertEquals($ent['opomba'], 'uu');
        $I->assertEquals($ent['sort'], 1);
        $I->assertEquals($ent['privzeti'], true);
        $I->assertEquals($ent['aktivna'], true);
        $I->assertEquals($ent['funkcija'], $this->lookFunkcija['id']);
        $I->assertEquals($ent['zaposlitev'], $this->objZaposlitev['id'], "zaposlitev");
        $I->assertEquals($ent['zaposlen'], true);               // v validaciji se bi moralo postaviti na true, če je zaposlitev
        $I->assertEquals($ent['oseba']['id'], $this->lookOseba['id'], "oseba");
        $I->assertEquals($ent['pogodba'], $this->objPogodba['id']);
        $I->assertEquals($ent['imaPogodbo'], true);
        $I->assertEquals($ent['pomembna'], true,"pomembna");
    }

    /**
     * brisanje zapisa
     * 
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $I->successfullyDelete($this->restUrl, $this->obj['id']);
        $I->failToGet($this->restUrl, $this->obj['id']);
    }

    /**
     * kreiramo vsaj en zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function createVecTerminovStoritev(ApiTester $I)
    {
        $data                     = [
            'planiranZacetek' => '2011-02-01T00:00:00+0100',
            'planiranKonec'   => '2012-02-01T00:00:00+0100',
            'zacetek'         => '2013-02-01T00:00:00+0100',
            'konec'           => '2014-02-01T00:00:00+0100',
            'planiranoTraja'  => 1.23,
            'dogodek'         => $this->objDogodek['id'], 
            'alternacija'     => $this->obj2['id'],
            'oseba'           => $this->lookOseba['id'],
        ];
        $this->objTerminStoritve1 = $ent                      = $I->successfullyCreate($this->terminStoritveUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['planiranoTraja'], 1.23);


// še en zapis
        $data                     = [
            'planiranZacetek' => '2013-02-01T00:00:00+0100',
            'planiranKonec'   => '2014-02-01T00:00:00+0100',
            'zacetek'         => NULL,
            'konec'           => NULL,
            'planiranoTraja'  => 6.32,
            'dogodek'         => $this->objDogodek['id'],
            'alternacija'     => $this->obj2['id'],
            'oseba'           => $this->lookOseba['id'],
        ];
        $this->objTerminStoritve1 = $ent                      = $I->successfullyCreate($this->terminStoritveUrl, $data);
        $I->assertNotEmpty($ent['id']);
    }

    /**
     * preberemo relacije
     * 
     * @depends createVecTerminovStoritev
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeSTerminiStoritev(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "storitve", "");
//        codecept_debug($resp);
        $I->assertEquals(2, count($resp));

        // get po oseba id  
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "storitve", $this->objTerminStoritve1['id']);
        $I->assertEquals(1, count($resp));
    }

    //$$ še relacije vec t.s.

    /**
     * spremenim zapis - dodam pogodbo
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updateZDodajPogodbo(ApiTester $I)
    {
        $ent  = $this->obj3;
        codecept_debug($ent);
        $ent['pogodba'] = $this->objPogodba['id'];
        $entR = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['pogodba'], $this->objPogodba['id']);
        $I->assertEquals($entR['imaPogodbo'], true);   // nastavi  v validaciji
    }

}
