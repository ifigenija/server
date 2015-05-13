<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\Predstava;

use ApiTester;

/**
 * Description of PredstavaCest
 *
 * metode, ki jo podpira API
 * - create
 * - getlist
 * - update
 * - get - kontrola vseh polj te entitete
 * - delete
 * validate metodo za entiteto
 * relacije z drugimi entitetami
 * getlist različne variante relacij
 * 
 * @author rado
 */
class PredstavaCest
{

    private $restUrl = '/rest/predstava';
    private $dogodekUrl = '/rest/dogodek';
    private $obj;
    private $objDogodek;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     *  kreiramo zapis
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'dogodek'     => NULL,
            'uprizoritev' => NULL,
            'gostovanje'  => NULL,
            'gostujoca'   => NULL,
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['gostujoca'], null);

        // kreiramo še en zapis
    }

    /**
     * preberi vse zapise od osebe
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoDogodku(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?dogodek=" . $this->objDogodek['id'];

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];
        codecept_debug($resp);

        $I->assertEquals(2, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
//        $I->assertEquals("xx", $list[0]['status']);      // $$ odvisno od sortiranja
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
        $I->assertTrue(true, "ni polja za update");  //$$ rb verjetno update-a sploh ni možnega
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
        $I->assertEquals($ent['dogodek'     ], null);
        $I->assertEquals($ent['uprizoritev' ], null);
        $I->assertEquals($ent['gostovanje'  ], null);
        $I->assertEquals($ent['gostujoca'   ], null);
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

}
