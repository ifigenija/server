<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\ProdukcijaDelitev;

use ApiTester;

/**
 * Description of ProdukcijaDelitevCest
 *        metode, ki jo podpira API
 *        - create
 *        - getlist
 *        - update
 *        - get - kontrola vseh polj te entitete
 *        - delete
 * validate metodo za entiteto
 * . ko bo validate metoda
 *        relacije z drugimi entitetami (to many relacije) - jih ni
 *        - pri many to many relacijah testiraj : update, get (list+id), delete
 *        - pri one to many relacijah testiraj : get (list+id)
 *        getlist različne variante relacij
 *        - vse
 *        - default
 * 
 * @author rado
 */
class ProdukcijaDelitevCest
{

    private $restUrl                = '/rest/produkcijadelitev';
    private $produkcijskaHisaUrl    = '/rest/produkcijskahisa';
    private $popaUrl                = '/rest/popa';
    private $alternacijaUrl         = '/rest/alternacija';
    private $drzavaUrl              = '/rest/drzava';
    private $uprizoritevUrl         = '/rest/uprizoritev';
    private $osebaUrl               = '/rest/oseba';
    private $obj;
    private $obj2;
    private $obj3;
    private $objUprizoritev;
    private $objDrzava;
    private $objPopa;
    private $objProdukcijskaHisa;
    private $lookProdukcijskaHisa1;
    private $lookProdukcijskaHisa2;
    private $lookProdukcijskaHisa3;
    private $lookProdukcijskaHisa4;
    private $lookProdukcijskaHisa5;
    private $objAlternacija1;
    private $objAlternacija2;
    private $objOseba;
    private $objKoprodukcija;
    private $lookUprizoritev;
    private $lookupProdukcijskaHisa = '/lookup/produkcijskahisa';
    private $programPremieraUrl     = '/rest/programpremiera';
    private $objProgramPremiera1;
    private $objProgramPremiera2;
    private $objProgramPremiera3;

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
     * najde enoto programa
     * 
     * @param ApiTester $I
     */
    public function getListProgramPremiera(ApiTester $I)
    {
        $resp                      = $I->successfullyGetList($this->programPremieraUrl, []);
        $list                      = $resp['data'];
        $I->assertNotEmpty($list);
        $this->objProgramPremiera3 = $ent                       = array_pop($list);
        $I->assertNotEmpty($ent);
        $this->objProgramPremiera1 = $ent                       = array_pop($list);
        $I->assertNotEmpty($ent);
        $this->objProgramPremiera2 = $ent                       = array_pop($list);
        $I->assertNotEmpty($ent);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupProdukcijskaHisa(ApiTester $I)
    {

        $resp = $I->successfullyGetList($this->lookupProdukcijskaHisa, []);
        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->assertTrue(array_key_exists('data', $resp), "ima data");
        $I->assertGreaterThanOrEqual(1, $resp['state']['totalRecords'], "total records");

        $ind                         = array_search("0900", array_column($resp['data'], 'ident'));
        $this->lookProdukcijskaHisa1 = $lookPH                      = $resp['data'][$ind];
        codecept_debug($lookPH);

        $ind                         = array_search("0989", array_column($resp['data'], 'ident'));
        $this->lookProdukcijskaHisa2 = $lookPH                      = $resp['data'][$ind];
        codecept_debug($lookPH);

        $ind                         = array_search("0986", array_column($resp['data'], 'ident'));
        $this->lookProdukcijskaHisa3 = $lookPH                      = $resp['data'][$ind];
        codecept_debug($lookPH);

        $ind                         = array_search("0982", array_column($resp['data'], 'ident'));
        $this->lookProdukcijskaHisa4 = $lookPH                      = $resp['data'][$ind];
        codecept_debug($lookPH);

        $ind                         = array_search("0984", array_column($resp['data'], 'ident'));
        $this->lookProdukcijskaHisa5 = $lookPH                      = $resp['data'][$ind];
        codecept_debug($lookPH);
    }

    /**
     *  kreiramo zapis
     * 
     * @depends lookupProdukcijskaHisa
     * @depends getListProgramPremiera
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
//            'odstotekFinanciranja' => 40,
            'delez'         => 3500,
            'zaproseno'     => 50,
            'enotaPrograma' => $this->objProgramPremiera1['id'],
            'koproducent'   => $this->lookProdukcijskaHisa1['id'],
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
//        codecept_debug($ent);
        // kreiram še en zapis
        $data       = [
//            'odstotekFinanciranja' => 20,
            'delez'         => 3500,
            'zaproseno'     => 100,
            'enotaPrograma' => $this->objProgramPremiera2['id'],
            'koproducent'   => $this->lookProdukcijskaHisa1['id'],
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
//        codecept_debug($ent);
//        
        // kreiram še en zapis za nematično podjetje
        $data       = [
//            'odstotekFinanciranja' => 20,
            'delez'         => 1700,
            'zaproseno'     => 100,
            'enotaPrograma' => $this->objProgramPremiera2['id'],
            'koproducent'   => $this->lookProdukcijskaHisa2['id'],
        ];
        $this->obj3 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
//        codecept_debug($ent);
        $I->assertEquals($ent['zaproseno'], 100);
    }

    /**
     * preberi vse zapise od uprizoritve
     * 
     * @depends create
     * @param ApiTester $I
     */
//    public function getListPoEnotiPrograma(ApiTester $I)
//    {
//        //$$  še za izvesti
//
//        $listUrl = $this->restUrl . "?uprizoritev=" . $this->lookUprizoritev['id'];
//
//        $resp = $I->successfullyGetList($listUrl, []);
//        $list = $resp['data'];
//        codecept_debug($resp);
//
//        $I->assertEquals(2, $resp['state']['totalRecords']);
//        $I->assertNotEmpty($list);
////        $I->assertEquals("xx", $list[0]['status']);      // odvisno od sortiranja
//    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent              = $this->obj3;
        $ent['zaproseno'] = 22;

        $this->obj = $entR      = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['zaproseno'], 22);
    }

    /**
     * Preberem zapis in preverim vsa polja
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function read(\ApiTester $I)
    {
        $ent = $I->successfullyGet($this->restUrl, $this->obj3['id']);

        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['delez'], 1700.00);
        $I->assertEquals($ent['odstotekFinanciranja'], 15.89); //$$ odvisno od  celotne vrednosti
        $I->assertEquals($ent['zaproseno'], 22);
        $I->assertEquals($ent['enotaPrograma'], $this->objProgramPremiera2['id']);
        $I->assertEquals($ent['koproducent'], $this->lookProdukcijskaHisa2['id']);
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
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListDefault(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?enotaPrograma=" . $this->objProgramPremiera1['id'];
        codecept_debug($listUrl);
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];

        $I->assertNotEmpty($list);
        $I->assertGreaterThanOrEqual(1, $resp['state']['totalRecords']);
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updateZNapacnimiZaproseno(ApiTester $I)
    {
        $data              = $I->successfullyGet($this->restUrl, $this->obj3['id']);
        codecept_debug($data);
        $data['zaproseno'] = 1700.01;
        $resp              = $I->failToUpdate($this->restUrl, $data['id'], $data);
        $I->assertEquals(1000413, $resp[0]['code']);

        $data['zaproseno'] = -0.01;
        $resp              = $I->failToUpdate($this->restUrl, $data['id'], $data);
        $I->assertEquals(1000415, $resp[0]['code']);
    }

    /**
     *  test validate - možen le 1 delitev iste enote programa za istim koproducentom
     * 
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function createIstiKoproducent(ApiTester $I)
    {

        $data = $this->obj3;

        $resp = $I->failToCreate($this->restUrl, $data);
        codecept_debug($resp);
        $I->assertEquals($resp[0]['code'], 1000411);
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
     *  kontrola validacije - mora biti natanko 1 matični koproducent
     * 
     * @depends lookupProdukcijskaHisa
     * @depends getListProgramPremiera
     * 
     * @param ApiTester $I
     */
    public function createBrezMaticnegaJZ(ApiTester $I)
    {
//                $this->expect($stMaticnihKoproducentov == 1, "Dovoljen natanko 1 matični koproducent, jih je pa " . $stMaticnihKoproducentov, 1000414);
        $data = [
//            'odstotekFinanciranja' => 40,
            'delez'         => 5000,
            'zaproseno'     => 50,
            'enotaPrograma' => $this->objProgramPremiera3['id'],
            'koproducent'   => $this->lookProdukcijskaHisa5['id'], // ni matični JZ
        ];
        $resp = $I->failToCreate($this->restUrl, $data);
        codecept_debug($resp);
        $I->assertEquals($resp[0]['code'], 1000414);
    }

}
