<?php

namespace Rest\Funkcija;

use ApiTester;

/**
 * Description of FunkcijaCest

 * 
 * metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto - je ni
 *      relacije z drugimi entitetami
 *      - alternacije O2M
 *      - uprizoritev 
 *      - privzeta alternacija
 *      - tipFunkcije 
 * 
 * getlist različne variante relacij
 *      - vse
 *      - uprizoritev
 *      - podrocje
 * 
 * @author rado
 */
class FunkcijaCest
{

    private $restUrl        = '/rest/funkcija';
    private $uprizoritevUrl = '/rest/uprizoritev';
    private $besediloUrl    = '/rest/besedilo';
    private $osebaUrl       = '/rest/oseba';
    private $alternacijaUrl = '/rest/alternacija';
    private $tipFunkcijeUrl = '/rest/tipfunkcije';
    private $obj;
    private $obj2;
    private $objOseba;
    private $lookOseba;
    private $objAlternacija;
    private $objAlternacija1;
    private $objAlternacija2;
    private $objUprizoritev;
    private $objBesedilo;
    private $objTipFunkcije;
    private $lookTipFunkcije;
    private $lookUprizoritev1;
    private $lookUprizoritev2;

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
    public function lookupUprizoritev(ApiTester $I)
    {
        $this->lookUprizoritev1 = $look                   = $I->lookupEntity("uprizoritev", "0001", false);
        $I->assertNotEmpty($look);
        $this->lookUprizoritev2 = $look                   = $I->lookupEntity("uprizoritev", "0002", false);
        $I->assertNotEmpty($look);
    }

    /**
     *  kreiramo besedilo
     * 
     * @param ApiTester $I
     */
    public function createBesedilo(ApiTester $I)
    {
        $data              = [
            'naslov'          => 'zz',
            'avtor'           => 'zz',
            'podnaslov'       => 'zz',
            'jezik'           => 'zz',
            'naslovIzvirnika' => 'zz',
            'datumPrejema'    => '2010-02-01T00:00:00+0100',
            'moskeVloge'      => 1,
            'zenskeVloge'     => 2,
            'prevajalec'      => 'zz',
            'povzetekVsebine' => 'zz',
        ];
        $this->objBesedilo = $ent               = $I->successfullyCreate($this->besediloUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['naslov'], 'zz');
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
//    /**
//     *  kreiramo zapis
//     * 
//     * @depends createOsebo
//     * 
//     * @param ApiTester $I
//     */
//    public function createAlternacijo(ApiTester $I)
//    {
//        $data                 = [
//            'zaposlen'     => true,
//            'funkcija'     => NULL,
//            'sodelovanje'  => NULL,
//            'oseba'        => $this->objOseba['id'],
//            'koprodukcija' => NULL,
//            'pogodba'      => NULL,
//        ];
//        $this->objAlternacija = $ent                  = $I->successfullyCreate($this->alternacijaUrl, $data);
//        $I->assertNotEmpty($ent['id']);
//        codecept_debug($ent);
//        $I->assertEquals($ent['zaposlen'], true);
//
//        $data                  = [
//            'zaposlen'     => true,
//            'funkcija'     => NULL,
//            'sodelovanje'  => NULL,
//            'oseba'        => $this->objOseba['id'],
//            'koprodukcija' => NULL,
//            'pogodba'      => NULL,
//        ];
//        $this->objAlternacija1 = $ent                   = $I->successfullyCreate($this->alternacijaUrl, $data);
//        $I->assertNotEmpty($ent['id']);
//
//        $data                  = [
//            'zaposlen'     => true,
//            'funkcija'     => NULL,
//            'sodelovanje'  => NULL,
//            'oseba'        => $this->objOseba['id'],
//            'koprodukcija' => NULL,
//            'pogodba'      => NULL,
//        ];
//        $this->objAlternacija2 = $ent                   = $I->successfullyCreate($this->alternacijaUrl, $data);
//        $I->assertNotEmpty($ent['id']);
//        codecept_debug($ent);
//        $I->assertEquals($ent['zaposlen'], true);
//    }

    /**
     *  kreiramo zapis
     * 
     * @depends createBesedilo

     * @param ApiTester $I
     */
//    public function createUprizoritev(ApiTester $I)
//    {
//        $data                 = [
//            'faza'             => 'arhiv',
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
//            'besedilo'         => $this->objBesedilo['id'],
//            'zvrstUprizoritve' => null,
//            'zvrstSurs'        => null,
//        ];
//        $this->objUprizoritev = $ent                  = $I->successfullyCreate($this->uprizoritevUrl, $data);
//        $I->assertNotEmpty($ent['id']);
//        codecept_debug($ent);
//        $I->assertEquals($ent['opis'], 'zz');
//    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupTipFunkcije(ApiTester $I)
    {
        $this->lookTipFunkcije = $ent                   = $I->lookupEntity("tipfunkcije", "01", false);
        $I->assertNotEmpty($ent);
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
     *  kreiramo zapis
     * 
     * @param ApiTester $I
     */
//    public function createTipFunkcije(ApiTester $I)
//    {
//        $data                 = [
//            'ime'       => 'zz',
//            'opis'      => 'zz',
//            'imeZenski' => 'zz',
//            'podrocje'  => 'umetnik',
//        ];
//        $this->objTipFunkcije = $ent                  = $I->successfullyCreate($this->tipFunkcijeUrl, $data);
//        $I->assertNotEmpty($ent['id']);
//        codecept_debug($ent);
//        $I->assertEquals($ent['opis'], 'zz');
//    }

    /**
     *  napolnimo vsaj en zapis
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
//            'podrocje'          => 'igralec',     //$$ se avtomatsko v validate prenese iz tipa funkcije
            'vodjaEkipe'        => FALSE,
            'naziv'             => 'zz',
            'komentar'          => 'zz',
            'velikost'          => 'velika',
            'pomembna'          => true,
            'sort'              => 8,
            'sePlanira'         => true,
            'dovoliPrekrivanje' => false,
            'uprizoritev'       => $this->lookUprizoritev1['id'],
            'privzeti'          => $this->objAlternacija['id'], //$$ to ne deluje izgleda - jemlje kot null?
            'tipFunkcije'       => $this->lookTipFunkcije['id'],
            'maxPrekrivanj'     => 3,
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals($ent['naziv'], 'zz');
        $I->assertNotEmpty($ent['id']);

        // kreiramo še en zapis
        $data       = [
//            'podrocje'          => 'tehnik',//$$ se avtomatsko v validate prenese iz tipa funkcije
            'vodjaEkipe'        => FALSE,
            'naziv'             => 'aa',
            'komentar'          => 'aa',
            'velikost'          => 'mala',
            'pomembna'          => false,
            'sort'              => 1,
            'sePlanira'         => true,
            'dovoliPrekrivanje' => false,
            'uprizoritev'       => $this->lookUprizoritev1['id'],
            'privzeti'          => null,
            'tipFunkcije'       => $this->lookTipFunkcije['id'],
            'maxPrekrivanj'     => 4,
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals($ent['naziv'], 'aa');
        $I->assertNotEmpty($ent['id']);
    }

    /**
     *  kreiramo zapis
     * 
     * @depends lookupOsebo
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function createVecAlternacij(ApiTester $I)
    {
        $data                  = [
            'zaposlen'     => true,
            'funkcija'     => $this->obj2['id'],
            'sodelovanje'  => NULL,
            'oseba'        => $this->lookOseba['id'],
            'koprodukcija' => NULL,
            'pogodba'      => NULL,
        ];
        $this->objAlternacija1 = $ent                   = $I->successfullyCreate($this->alternacijaUrl, $data);
        $I->assertNotEmpty($ent['id']);

        $data                  = [
            'zaposlen'     => true,
            'funkcija'     => $this->obj2['id'],
            'sodelovanje'  => NULL,
            'oseba'        => $this->lookOseba['id'],
            'koprodukcija' => NULL,
            'pogodba'      => NULL,
        ];
        $this->objAlternacija2 = $ent                   = $I->successfullyCreate($this->alternacijaUrl, $data);
        $I->assertNotEmpty($ent['id']);
    }

    /**
     * 
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
//        $this->id = array_pop($list)['id'];
//        $I->assertNotEmpty($this->id);
//        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
////        $I->assertEquals("aa", $list[0]['naziv']);      //glede na sort
//    }

    /**
     * preberi vse zapise od uprizoritve
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoUprizoritvi(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?uprizoritev=" . $this->lookUprizoritev1['id'];

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];
        codecept_debug($list);

//        $I->assertEquals(2, $resp['state']['totalRecords']);
        $totRec  = $resp['state']['totalRecords'];
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
        $I->assertEquals(1, $list[0]['sort']);      // odvisno od sortiranja
        $I->assertEquals(8, $list[$totRec - 1]['sort']);      // odvisno od sortiranja
        // še po 2. uprizoritvi
        $listUrl = $this->restUrl . "?uprizoritev=" . $this->lookUprizoritev2['id'];
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];
        $I->assertNotEmpty($list);
        codecept_debug($resp);
        $I->assertGreaterThanOrEqual(8, $resp['state']['totalRecords']);
    }

    /**
     * preberi vse zapise od uprizoritve
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoUprizoritviInPodrocjih(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?uprizoritev=" . $this->lookUprizoritev2['id'] . "&podrocje[]=igralec";
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];
        codecept_debug($resp);
        $I->assertGreaterThanOrEqual(3, $resp['state']['totalRecords']);

        // test validiranja, če področje ni array
//                            $this->expect(is_array($options['podrocje']), "Parameter področje mora biti array", 1000671);
        $listUrl = $this->restUrl . "?uprizoritev=" . $this->lookUprizoritev2['id'] . "&podrocje=igralec";
        $resp    = $I->failToGetList($listUrl, []);
        $I->assertEquals(1000671, $resp[0]['code']);

//        $$ to še moram izvesti - unija večih področij
        // še po večih področjih
        $listUrl = $this->restUrl . "?uprizoritev=" . $this->lookUprizoritev2['id'] . "&podrocje[]=igralec&podrocje[]=umetnik";
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];
        codecept_debug($resp);
        $I->assertGreaterThanOrEqual(5, $resp['state']['totalRecords']);

        // še podobno po inšpicientu in tehnikuj
        $listUrl = $this->restUrl . "?uprizoritev=" . $this->lookUprizoritev2['id'] . "&podrocje[]=tehnik&podrocje[]=inspicient";
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];
        codecept_debug($resp);
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);        //$$ število je verjetno drugačno od 5
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
        $ent['velikost'] = 'mala';

        $this->obj = $entR      = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['velikost'], 'mala');
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
        codecept_debug($ent);

        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['podrocje'], $this->lookTipFunkcije['podrocje'], "področje iz tipa funkcije");
        $I->assertEquals($ent['vodjaEkipe'], FALSE);
        $I->assertEquals($ent['naziv'], 'zz');
        $I->assertEquals($ent['komentar'], 'zz');
        $I->assertEquals($ent['velikost'], 'mala', "velikost funkcije");
        $I->assertEquals($ent['pomembna'], true);
        $I->assertEquals($ent['sort'], 8);
        $I->assertEquals($ent['uprizoritev'], $this->lookUprizoritev1['id']);
        $I->assertEquals($ent['privzeti'], $this->objAlternacija['id'], "privzeti");
        $I->assertEquals($ent['tipFunkcije'], $this->lookTipFunkcije['id'], "tip funkcije");
        $I->assertEquals($ent['maxPrekrivanj'], 3, "maks prekrivanj");

        $I->assertTrue(isset($ent['alternacije']));

        $I->assertEquals(0, count($ent['alternacije']));
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
     * napolnimo vsaj en zapis
     *
     * @param ApiTester $I
     */
    public function createBrezTipafunkcije(ApiTester $I)
    {
        $data      = [
            'tipFunkcije'       => null,
            'vodjaEkipe'        => FALSE,
            'naziv'             => 'btf',
            'komentar'          => 'btf',
            'velikost'          => 'velika',
            'pomembna'          => true,
            'sort'              => 11,
            'sePlanira'         => true,
            'dovoliPrekrivanje' => false,
            'uprizoritev'       => $this->lookUprizoritev1['id'],
            'privzeti'          => $this->objAlternacija['id'], //$$ to ne deluje izgleda - jemlje kot null?
            'maxPrekrivanj'     => 34,
        ];
        $resp       = $I->failToCreate($this->restUrl, $data);
        $I->assertContains("required",$resp[0]['message'],"tip funkcije obvezen podatek");
    }

}
