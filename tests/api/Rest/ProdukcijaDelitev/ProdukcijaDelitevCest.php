<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\ProdukcijaDelitev;

use ApiTester;

/**
 * Description of ProdukcijaDelitevCest
 * 
 *      Polnjenje drugih entitet:
 *      - uprizoritev  
 *      - koproducent 
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto - je ni
 *      relacije z drugimi entitetami
 *      - alternacije O2M     
 *      - koproducent 
 *      getlist različne variante relacij
 *      - vse
 *      - default
 * @author rado
 */
class ProdukcijaDelitevCest
{

    private $restUrl             = '/rest/produkcijadelitev';
    private $produkcijskaHisaUrl = '/rest/produkcijskahisa';
    private $popaUrl             = '/rest/popa';
    private $alternacijaUrl      = '/rest/alternacija';
    private $drzavaUrl           = '/rest/drzava';
    private $uprizoritevUrl      = '/rest/uprizoritev';
    private $osebaUrl            = '/rest/oseba';
    private $obj;
    private $objProdukcijaDelitev2;
    private $objUprizoritev;
    private $objDrzava;
    private $objPopa;
    private $objProdukcijskaHisa;
    private $lookProdukcijskaHisa;
    private $objAlternacija1;
    private $objAlternacija2;
    private $objOseba;
    private $koprodukcijaUrl     = '/rest/produkcijadelitev';
    private $objKoprodukcija;
    private $lookUprizoritev;
    private $lookupProdukcijskaHisa = '/lookup/produkcijskahisa';

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
     * kreiram popa
     *  
     * @param ApiTester $I
     */
//    public function createPopa(ApiTester $I)
//    {
//        $data          = [
//            'sifra'  => 'X12',
//            'naziv'  => 'zz',
////            'naziv1'    => 'zz',
////            'panoga'    => 'zz',
////            'email'     => 'z@zzz.zz',
////            'url'       => 'zz',
////            'opomba'    => 'zz',
//            'drzava' => $this->objDrzava['id'],
////            'idddv'     => 'zz',
////            'maticna'   => 'ZZ123',
////            'zavezanec' => 'Da',
////            'jeeu'      => 'Da',
////            'datZav'    => '2010-02-01T00:00:00+0100',
////            'datnZav'   => '2017-02-01T00:00:00+0100',
////            'zamejstvo' => FALSE,
//        ];
//        $this->objPopa = $popa          = $I->successfullyCreate($this->popaUrl, $data);
//
//        $I->assertNotEmpty($popa['id']);
//    }

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
        $I->assertGreaterThanOrEqual(1, $resp['state']['totalRecords'], "total records");
        $this->lookProdukcijskaHisa = $resp['data'][0];
    }

    
    
    /**
     *  kreiramo zapis
     * 
     * @depends createPopa
     * 
     * @param ApiTester $I
     */
//    public function createProdukcijskaHisa(ApiTester $I)
//    {
//        $data                      = [
//            'status' => 'zz',
//            'popa'   => $this->objPopa['id'],
//        ];
//        $this->objProdukcijskaHisa = $ent                       = $I->successfullyCreate($this->produkcijskaHisaUrl, $data);
//        $I->assertNotEmpty($ent['id']);
//        $I->assertEquals($ent['status'], 'zz');
//    }

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
     *  kreiramo zapis uprizoritev
     * 
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
//            'besedilo'         => null,
//            'zvrstUprizoritve' => null,
//            'zvrstSurs'        => null,
//        ];
//        $this->objUprizoritev = $ent                  = $I->successfullyCreate($this->uprizoritevUrl, $data);
//        $I->assertNotEmpty($ent['id']);
//        codecept_debug($ent);
//        $I->assertEquals($ent['opis'], 'zz');
//    }

    /**
     *  kreiramo zapis
     * 
     * @depends lookupProdukcijskaHisa
     * @depends lookupUprizoritev
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'odstotekFinanciranja' => 40,
            'nasStrosek'           => TRUE,
            'lastnaSredstva'       => 6.78,
            'zaproseno'            => 15.12,
            'drugiJavni'           => 16.78,
            'avtorskih'            => 2.34,
            'tantieme'             => 5.67,
            'skupniStrosek'        => 34.56,
            'zaprosenProcent'      => 55.5,
            'uprizoritev'          => $this->lookUprizoritev['id'],
            'koproducent'          => $this->lookProdukcijskaHisa['id'],
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertTrue($ent['nasStrosek']);

        // kreiram še en zapis
        $data                        = [
            'odstotekFinanciranja' => 7.90,
            'nasStrosek'           => false,
            'uprizoritev'          => $this->lookUprizoritev['id'],
            'koproducent'          => $this->lookProdukcijskaHisa['id'],
        ];
        $this->objProdukcijaDelitev2 = $ent                         = $I->successfullyCreate($this->restUrl, $data);
        $I->assertFalse($ent['nasStrosek']);
        codecept_debug($ent);
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

        $I->assertEquals(2, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
//        $I->assertEquals("xx", $list[0]['status']);      // odvisno od sortiranja
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getList(ApiTester $I)
    {
        $listUrl = $this->restUrl . "/vse";
        codecept_debug($listUrl);
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];

        $I->assertNotEmpty($list);
        $I->assertEquals(2, $resp['state']['totalRecords']);
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
        $ent                         = $this->obj;
        $ent['odstotekFinanciranja'] = 70;

        $this->obj = $entR      = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['odstotekFinanciranja'], 70);
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
        $I->assertEquals($ent['odstotekFinanciranja'], 70);
        $I->assertEquals($ent['nasStrosek'], TRUE);
        $I->assertEquals($ent['lastnaSredstva'], 6.78);
        $I->assertEquals($ent['zaproseno'], 15.12);
        $I->assertEquals($ent['drugiJavni'], 16.78);
        $I->assertEquals($ent['avtorskih'], 2.34);
        $I->assertEquals($ent['tantieme'], 5.67);
        $I->assertEquals($ent['skupniStrosek'], 34.56);
        $I->assertEquals($ent['zaprosenProcent'], 55.5);
        $I->assertEquals($ent['uprizoritev'], $this->lookUprizoritev['id']);
        $I->assertEquals($ent['koproducent'], $this->lookProdukcijskaHisa['id']);
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

//    /**
//     * preberemo relacije
//     * 
//     * @depends createVecAlternacij
//     * 
//     * @param ApiTester $I
//     */
//    public function preberiRelacijeZAlternacijami(ApiTester $I)
//    {
//        $resp = $I->successfullyGetRelation($this->restUrl, $this->objProdukcijaDelitev2['id'], "alternacije", "");
//        $I->assertEquals(2, count($resp));
//
//        $resp = $I->successfullyGetRelation($this->restUrl, $this->objProdukcijaDelitev2['id'], "alternacije", $this->objAlternacija1['id']);
//        $I->assertEquals(1, count($resp));
//    }
}
