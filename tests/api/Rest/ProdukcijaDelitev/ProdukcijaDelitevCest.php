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
    private $objUprizoritev;
    private $objDrzava;
    private $objPopa;
    private $objProdukcijskaHisa;
    private $lookProdukcijskaHisa1;
    private $objAlternacija1;
    private $objAlternacija2;
    private $objOseba;
    private $objKoprodukcija;
    private $lookUprizoritev;
    private $lookupProdukcijskaHisa = '/lookup/produkcijskahisa';
    private $programPremieraUrl     = '/rest/programpremiera';
    private $objProgramPremiera1;
    private $objProgramPremiera2;

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

        $resp                        = $I->successfullyGetList($this->lookupProdukcijskaHisa, []);
        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->assertTrue(array_key_exists('data', $resp), "ima data");
        $I->assertGreaterThanOrEqual(1, $resp['state']['totalRecords'], "total records");
        $this->lookProdukcijskaHisa1 = $resp['data'][0];
        $this->lookProdukcijskaHisa2 = $resp['data'][1];
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
            'delez'           => 3500,
            'zaprosenProcent' => 50,
            'zaproseno'       => 50,
            'enotaPrograma'   => $this->objProgramPremiera1['id'],
            'koproducent'     => $this->lookProdukcijskaHisa1['id'],
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
//        codecept_debug($ent);
        $I->assertEquals($ent['delez'], 3500);

        // kreiram še en zapis
        $data       = [
//            'odstotekFinanciranja' => 20,
            'delez'           => 3500,
            'zaprosenProcent' => 50,
            'zaproseno'       => 100,
            'enotaPrograma'   => $this->objProgramPremiera2['id'],
            'koproducent'     => $this->lookProdukcijskaHisa1['id'],
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
//        codecept_debug($ent);
        $I->assertEquals($ent['delez'], 3500);
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
        $I->assertEquals($ent['delez'], 3500.00);
        $I->assertEquals($ent['odstotekFinanciranja'], 70); //$$ odvisno od  celotne vrednosti
        $I->assertEquals($ent['zaprosenProcent'], 50);
        $I->assertEquals($ent['zaproseno'], 1750.00);    //$$ odvisno od  celotne vrednosti
        $I->assertEquals($ent['enotaPrograma'], $this->objProgramPremiera1['id']);
        $I->assertEquals($ent['koproducent'], $this->lookProdukcijskaHisa1['id']);
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
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updateZNapacnimiOdstotki(ApiTester $I)
    {
        $data                    = $this->obj2;
        $data['zaprosenProcent'] = 100.01;
        $resp                    = $I->failToUpdate($this->restUrl, $data['id'], $data);
        $I->assertEquals(1000413, $resp[0]['code']);

        $data['zaprosenProcent'] = -0.01;
        $resp                    = $I->failToUpdate($this->restUrl, $data['id'], $data);
        $I->assertEquals(1000413, $resp[0]['code']);

        // naslednji odstotki so ok, ker se prej zaokrožijo:
        $data['zaprosenProcent'] = -0.0009;
        $resp                    = $I->successfullyUpdate($this->restUrl, $data['id'], $data);

        $data['zaprosenProcent'] = 100.0001;
        $resp                    = $I->successfullyUpdate($this->restUrl, $data['id'], $data);
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

        $data = $this->obj2;

        $resp = $I->failToCreate($this->restUrl, $data);
        codecept_debug($resp);
        $I->assertEquals($resp[0]['code'], 1000411);
    }

}
