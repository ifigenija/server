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
    private $objFunkcija2;
    private $objOseba;
    private $lookOseba;
    private $objAlternacija;
    private $objAlternacija1;
    private $objAlternacija2;
    private $objUprizoritev;
    private $objBesedilo;
    private $objTipFunkcije;
    private $lookTipFunkcije;
    
    private $lookUprizoritev;


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
        $this->lookUprizoritev = $look                  = $I->lookupEntity("uprizoritev", "0001", false);
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
        $this->lookTipFunkcije = $ent             = $I->lookupEntity("tipfunkcije", "Režiser", false);
        $I->assertNotEmpty($ent);
    }
        /**
     * 
     * @param ApiTester $I
     */
    public function lookupOsebo(ApiTester $I)
    {
        $this->lookOseba= $ent             = $I->lookupEntity("oseba", "0006", false);
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
            'podrocje'          => 'igralec',
            'vodjaEkipe'     => FALSE,
            'naziv'             => 'zz',
            'komentar'             => 'zz',
            'velikost'          => 'velika',
            'pomembna'          => true,
            'sort'              => 2,
            'sePlanira'         => true,
            'dovoliPrekrivanje' => false,
            'uprizoritev'       => $this->lookUprizoritev['id'],
            'privzeti'          => $this->objAlternacija['id'], //$$ to ne deluje izgleda - jemlje kot null?
            'tipFunkcije'       => $this->lookTipFunkcije['id'],
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals($ent['naziv'], 'zz');
        $I->assertNotEmpty($ent['id']);

        // kreiramo še en zapis
        $data               = [
            'podrocje'          => 'tehnik',
            'vodjaEkipe'     => FALSE,
            'naziv'             => 'aa',
            'komentar'             => 'aa',
            'velikost'          => 'mala',
            'pomembna'          => false,
            'sort'              => 4,
            'sePlanira'         => true,
            'dovoliPrekrivanje' => false,
            'uprizoritev'       => $this->lookUprizoritev['id'],
            'privzeti'          => null,
            'tipFunkcije'       => $this->lookTipFunkcije['id'],
        ];
        $this->objFunkcija2 = $ent                = $I->successfullyCreate($this->restUrl, $data);
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
            'funkcija'     => $this->objFunkcija2['id'],
            'sodelovanje'  => NULL,
            'oseba'        => $this->lookOseba['id'],
            'koprodukcija' => NULL,
            'pogodba'      => NULL,
        ];
        $this->objAlternacija1 = $ent                   = $I->successfullyCreate($this->alternacijaUrl, $data);
        $I->assertNotEmpty($ent['id']);

        $data                  = [
            'zaposlen'     => true,
            'funkcija'     => $this->objFunkcija2['id'],
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
    public function getListVse(ApiTester $I)
    {
        $listUrl = $this->restUrl . "/vse";
        codecept_debug($listUrl);
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];

        $I->assertNotEmpty($list);
        $this->id = array_pop($list)['id'];
        $I->assertNotEmpty($this->id);
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
//        $I->assertEquals("aa", $list[0]['naziv']);      //glede na sort
    }

    /**
     * preberi vse zapise od uprizoritve
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoUprizoritvi(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?uprizoritev=" . $this->lookUprizoritev['id'];

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];
        codecept_debug($resp);

//        $I->assertEquals(2, $resp['state']['totalRecords']);
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
//        $I->assertEquals("zz", $list[0]['naziv']);      // odvisno od sortiranja
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
        $I->assertEquals($ent['podrocje'], 'igralec');
        $I->assertEquals($ent['vodjaEkipe'], FALSE);
        $I->assertEquals($ent['naziv'], 'zz');
        $I->assertEquals($ent['komentar'], 'zz');
        $I->assertEquals($ent['velikost'], 'mala', "velikost funkcije");
        $I->assertEquals($ent['pomembna'], true);
        $I->assertEquals($ent['sort'], 2);
        $I->assertEquals($ent['uprizoritev'], $this->lookUprizoritev['id']);
        $I->assertEquals($ent['privzeti'], $this->objAlternacija['id'], "privzeti");
        $I->assertEquals($ent['tipFunkcije'], $this->lookTipFunkcije['id'], "tip funkcije");

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
        $resp = $I->successfullyGetRelation($this->restUrl, $this->objFunkcija2['id'], "alternacije", "");
        $I->assertEquals(2, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->objFunkcija2['id'], "alternacije", $this->objAlternacija1['id']);
        $I->assertEquals(1, count($resp));
    }

}
