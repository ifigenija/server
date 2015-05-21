<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\Rekvizit;

use ApiTester;

/**
 * Description of RekvizitCest
 *
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto -> je prazna
 *      relacije z drugimi entitetami
 *      - rekviziterstvo O2M 
 *      getlist različne variante relacij
 *      - vse
 *      - default
 * 
 * @author rado
 */
class RekvizitCest
{

    private $restUrl           = '/rest/rekvizit';
    private $rekviziterstvoUrl = '/rest/rekviziterstvo';
    private $obj;
    private $obj2;
    private $objRekviziterstvo1;
    private $objRekviziterstvo2;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     *  napolnimo vsaj en zapis
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'ime'   => 'zz',
            'vrsta' => 'zz',
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals($ent['ime'], 'zz');
        $I->assertNotEmpty($ent['id']);

        // kreiramo še en zapis
        $data = [
            'ime'   => 'aa',
            'vrsta' => 'aa',
        ];
        $this->obj2 = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals($ent['ime'], 'aa');
        $I->assertNotEmpty($ent['id']);
    }

    /**
     *  napolnimo vsaj en zapis
     * 
     * @param ApiTester $I
     */
    public function createRekviziterstva(ApiTester $I)
    {
        $data                     = [
            'namenUporabe'   => true,
            'opisPostavitve' => 'zz',
            'rekvizit'       => $this->obj2['id'],
            'uprizoritev'    => null,
        ];
        $this->objRekviziterstvo1 = $ent                      = $I->successfullyCreate($this->rekviziterstvoUrl, $data);
        $I->assertNotEmpty($ent['id']);

//        // kreiramo še en zapis
        $data                     = [
            'namenUporabe'   => true,
            'opisPostavitve' => 'aa',
            'rekvizit'       => $this->obj2['id'],
            'uprizoritev'    => null,
        ];
        $this->objRekviziterstvo2 = $ent                      = $I->successfullyCreate($this->rekviziterstvoUrl, $data);
        $I->assertNotEmpty($ent['id']);
    }

    /**
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getList(ApiTester $I)
    {
        $resp = $I->successfullyGetList($this->restUrl, []);
        $list = $resp['data'];

        $I->assertNotEmpty($list);
        $this->id = array_pop($list)['id'];
        $I->assertNotEmpty($this->id);
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent        = $this->obj;
        $ent['ime'] = 'xx';

        $ent = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($ent['ime'], 'xx');
    }

    /**
     * Preberem zapis
     * 
     * @param ApiTester $I
     * @depends create
     */
    public function read(\ApiTester $I)
    {
        $ent = $I->successfullyGet($this->restUrl, $this->obj['id']);

        $I->assertEquals($ent['ime'], 'xx');
        $I->assertEquals($ent['vrsta'], 'zz');
    }

    /**
     * preberi vse zapise od uprizoritve
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListDefault(ApiTester $I)
    {
        $listUrl = $this->restUrl;

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];
        codecept_debug($resp);

        $I->assertEquals(2, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
        $I->assertEquals("aa", $list[0]['ime']);      //  odvisno od sortiranja
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
        $I->assertEquals(2, $resp['state']['totalRecords']);
        $I->assertEquals("aa", $list[0]['ime']);      //  odvisno od sortiranja
    }

    /**
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
     * @depends createRekviziterstva
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeZRekviziterstvi(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "rekviziterstva", "");
        $I->assertEquals(2, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "rekviziterstva", $this->objRekviziterstvo1['id']);
        $I->assertEquals(1, count($resp));
    }

    
}
