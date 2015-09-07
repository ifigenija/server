<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\DrugiVir;

use ApiTester;

/**
 * Description of DrugiVirCest
 * 
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 * validate metodo za entiteto
 *      relacije z drugimi entitetami (to many relacije) - jih ni
 *          - pri many to many relacijah testiraj : update, get (list+id), delete
 *          - pri one to many relacijah testiraj : get (list+id)
 *      getlist različne variante relacij
 *      - vse
 *      - default
 * 
 * @author rado
 */
class DrugiVirCest
{

    private $restUrl            = '/rest/drugivir';
    private $obj1;
    private $obj2;
    private $programPremieraUrl = '/rest/programpremiera';
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
     * najde enoto programa
     * 
     * @param ApiTester $I
     */
    public function getListProgramPremiera(ApiTester $I)
    {
        $resp                      = $I->successfullyGetList($this->programPremieraUrl, []);
        $list                      = $resp['data'];
        $I->assertNotEmpty($list);
        $this->objProgramPremiera1 = $drzava                    = array_pop($list);
        $I->assertNotEmpty($drzava);
        $this->objProgramPremiera2 = $drzava                    = array_pop($list);
        $I->assertNotEmpty($drzava);
    }

    /**
     *  kreiramo zapis
     * 
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data       = [
            'znesek'        => 1.23,
            'opis'          => "zz",
            'enotaPrograma' => $this->objProgramPremiera1['id'],
            'mednarodni'    => FALSE,
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['opis'], 'zz');

        // kreiramo še en zapis
        $data       = [
            'znesek'        => 2.34,
            'opis'          => "aa",
            'enotaPrograma' => $this->objProgramPremiera1['id'],
            'mednarodni'    => true,
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['opis'], 'aa');
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent           = $this->obj1;
        $ent['znesek'] = 3.33;

        $this->obj1 = $entR       = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['znesek'], 3.33);
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

        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['znesek'], 3.33);
        $I->assertEquals($ent['opis'], "zz");
        $I->assertEquals($ent['enotaPrograma'], $this->objProgramPremiera1['id']);
        $I->assertEquals($ent['mednarodni'], FALSE);
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
//
//        $I->assertNotEmpty($list);
//        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
//    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListDefault(ApiTester $I)
    {
        $listUrl = $this->restUrl;
        codecept_debug($listUrl);
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];

        $I->assertNotEmpty($list);
        $totRec = $resp['state']['totalRecords'];
        $I->assertGreaterThanOrEqual(2, $totRec);
        $I->assertEquals("aa", $list[0]['opis']);
        $I->assertEquals("zz", $list[$totRec - 1]['opis']);
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
     * test validacije
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updateZNegativnimZneskom(ApiTester $I)
    {
//    $this->expect($this->znesek>0, "Znesek mora biti pozitivno število", 1000480);
        $ent           = $this->obj2;
        $ent['znesek'] = -100;

        $resp = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertNotEmpty($resp);
        // testiramo na enako številko napake kot je v validaciji
        $I->assertEquals(1000480, $resp[0]['code'], "negativni znesek");
    }

}
