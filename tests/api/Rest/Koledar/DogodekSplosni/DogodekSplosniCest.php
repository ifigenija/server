<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\Koledar\DogodekSplosni;

use ApiTester;

/**
 * Description of DogodekSplosniCest
 *
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto je ni
 *      relacije z drugimi entitetami
 *      - dogodek
 *      getlist različne variante relacij
 *      - vse
 *      - default
 * 
 * @author rado
 */
class DogodekSplosniCest
{

    private $restUrl    = '/rest/dogodekSplosni';
    private $dogodekUrl = '/rest/dogodek';
    private $obj;
    private $objDogodek;
    private $objVaja;

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
            'dogodek' => null, // zaenkrat prazno, relacijo vzpostavimo pri kreiranju dogodka
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['dogodek'], $this->objDogodek['id']);

        // kreiramo še en zapis
        $data = [
            'dogodek' => null, // zaenkrat prazno, relacijo vzpostavimo pri kreiranju dogodka
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['dogodek'], $this->objDogodek['id']);
    }


    /**
     * @depends create
     * @param ApiTester $I
     */
    public function createDogodek(ApiTester $I)
    {
        $data             = [
            'planiranZacetek' => '2011-02-01T00:00:00+0100',
            'zacetek'         => '2012-02-01T00:00:00+0100',
            'konec'           => '2013-02-01T00:00:00+0100',
            'status'          => "100",
            'razred'          => "400",
            'termin'          => null,
            'ime'             => null,
            'predstava'       => null,
            'zasedenost'      => null,
            'gostovanje'      => null,
            'splosni'    => $this->obj['id'],
            'prostor'         => null,
            'sezona'          => null,
        ];
        $this->objDogodek = $ent              = $I->successfullyCreate($this->dogodekUrl, $data);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['status'], "100");
    }

    /**
     * preberi vse zapise od dogodek
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getList(ApiTester $I)
    {
        $listUrl = $this->restUrl;

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];
        codecept_debug($resp);

        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
//        $I->assertEquals("xx", $list[0]['status']);      // odvisno od sortiranja
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
//        $I->assertEquals(2, $resp['state']['totalRecords']);
////        $I->assertEquals("zz", $list[0]['status']);      //glede na sort
//    }

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

        $I->assertGuid($ent['id']);
        $I->assertEquals($ent['dogodek']['id'], $this->objDogodek['id']);
    }

    /**
     * brisanje zapisa
     * 
     * @depends create
     */
    public function deleteDogodek(ApiTester $I)
    {
        $I->successfullyDelete($this->dogodekUrl, $this->objDogodek['id']);
        $I->failToGet($this->dogodekUrl, $this->objDogodek['id']);
    }

    /**
     * brisanje zapisa
     * 
     * @depends deleteDogodek
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $I->successfullyDelete($this->restUrl, $this->obj['id']);
        $I->failToGet($this->restUrl, $this->obj['id']);
    }

}
