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
 * relacije z drugimi entitetami
 *  - rekviziterstvo $$ 2M 
 *      getlist različne variante relacij
 *      - vse
 *      - default
 * 
 * @author rado
 */
class RekvizitCest
{

    private $restUrl = '/rest/rekvizit';
    private $obj;

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
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals($ent['ime'], 'aa');
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

}
