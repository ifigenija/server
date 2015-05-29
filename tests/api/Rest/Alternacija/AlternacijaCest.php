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
 *      - sodelovanje (zaposlitev)
 *      - oseba
 *      - koprodukcija
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

    private $restUrl             = '/rest/alternacija';
    private $osebaUrl            = '/rest/oseba';
    private $funkcijaUrl         = '/rest/funkcija';
    private $uprizoritevUrl      = '/rest/uprizoritev';
    private $zaposlitevUrl       = '/rest/zaposlitev';
    private $produkcijskaHisaUrl = '/rest/produkcijskahisa';
    private $koprodukcijaUrl     = '/rest/produkcijadelitev';
    private $pogodbaUrl          = '/rest/pogodba';
    private $dogodekUrl          = '/rest/dogodek';
    private $terminStoritveUrl   = '/rest/terminstoritve';
    private $obj;
    private $obj2;
    private $objOseba;
    private $lookOseba;
    private $objFunkcija;
    private $lookFunkcija;
    private $objUprizoritev;
    private $lookUprizoritev;
    private $objZaposlitev;
    private $objProdukcijskaHisa;
    private $objKoprodukcija;
    private $objPogodba;
    private $objTerminStoritve1;
    private $objTerminStoritve2;
    private $objDogodek;

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
            'oseba'               => null,
        ];
        $this->objZaposlitev = $ent                 = $I->successfullyCreate($this->zaposlitevUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['status'], 'zz');
    }

    /**
     *  kreiramo zapis
     * 
     * @param ApiTester $I
     */
    public function createProdukcijskaHisa(ApiTester $I)
    {
        $data                      = [
            'status' => 'zz',
            'popa'   => null,
        ];
        $this->objProdukcijskaHisa = $ent                       = $I->successfullyCreate($this->produkcijskaHisaUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['status'], 'zz');
    }

    /**
     *  kreiramo zapis
     * 
     * @depends createProdukcijskaHisa
     * @depends lookupUprizoritev
     * 
     * @param ApiTester $I
     */
    public function createKoprodukcijo(ApiTester $I)
    {
        $data                  = [
            'odstotekFinanciranja' => 1.23,
            'nasStrosek'           => true,
            'uprizoritev'          => $this->lookUprizoritev['id'],
            'koproducent'          => $this->objProdukcijskaHisa['id'],
        ];
        $this->objKoprodukcija = $ent                   = $I->successfullyCreate($this->koprodukcijaUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
    }

    /**
     *  kreiramo pogodbo
     * 
     * @param ApiTester $I
     */
    public function createPogodbo(ApiTester $I)
    {
        $data             = [
            'sifra'             => 'ZZ123',
            'vrednostVaje'      => 33.33,
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
     * @depends createKoprodukcijo
     * @depends createPogodbo
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'zaposlen'     => true,
            'zacetek'      => '2010-02-01T00:00:00+0100',
            'konec'        => '2020-02-01T00:00:00+0100',
            'opomba'       => 'zz',
            'sort'         => 1,
            'privzeti'     => true,
            'aktivna'      => true,
            'funkcija'     => $this->lookFunkcija['id'],
            'sodelovanje'  => $this->objZaposlitev['id'],
            'oseba'        => $this->lookOseba['id'],
            'koprodukcija' => $this->objKoprodukcija['id'],
            'pogodba'      => $this->objPogodba['id'],
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['zaposlen'], true);

        // kreiram še en zapis
        $data       = [
            'zaposlen'     => true,
            'zacetek'      => '2011-02-01T00:00:00+0100',
            'konec'        => '2021-02-01T00:00:00+0100',
            'opomba'       => 'aa',
            'sort'         => 2,
            'privzeti'     => true,
            'aktivna'      => true,
            'funkcija'     => $this->lookFunkcija['id'],
            'sodelovanje'  => null,
            'oseba'        => $this->lookOseba['id'],
            'koprodukcija' => $this->objKoprodukcija['id'],
            'pogodba'      => null,
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['zaposlen'], true);
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
//        $I->assertEquals("xx", $list[0]['status']);      // $$ odvisno od sortiranja
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
        $ent             = $this->obj;
        $ent['zaposlen'] = false;

        $this->obj = $entR      = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['zaposlen'], FALSE);
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
        $I->assertEquals($ent['zaposlen'], false);
        $I->assertEquals($ent['zacetek'], '2010-02-01T00:00:00+0100');
        $I->assertEquals($ent['konec'], '2020-02-01T00:00:00+0100');
        $I->assertEquals($ent['opomba'], 'zz');
        $I->assertEquals($ent['sort'], 1);
        $I->assertEquals($ent['privzeti'], true);
        $I->assertEquals($ent['aktivna'], true);
        $I->assertEquals($ent['funkcija'], $this->lookFunkcija['id']);
        $I->assertEquals($ent['sodelovanje'], $this->objZaposlitev['id'], "zaposlitev");
        $I->assertEquals($ent['oseba']['id'], $this->lookOseba['id'], "oseba");
        $I->assertEquals($ent['koprodukcija'], $this->objKoprodukcija['id'], "napačna koprodukcija");
        $I->assertEquals($ent['pogodba'], $this->objPogodba['id']);
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
            'dogodek'         => $this->objDogodek['id'], //$$ ga še ni
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
}
