<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\Koledar\Zasedenost;

use ApiTester;

/**
 * Description of ZasedenostCest
 *
 *       metode, ki jo podpira API
 *       - create
 *       - getlist
 *       - update
 *       - get - kontrola vseh polj te entitete
 *       - delete
 *      validate metodo za entiteto - je nie
 *      relacije z drugimi entitetami
 *      - dogodek
 *      getlist različne variante relacij
 *      - vse
 * 
 * @author rado
 */
class ZasedenostCest
{

    private $restUrl    = '/rest/zasedenost';
    private $dogodekUrl = '/rest/dogodek';
    private $obj;
    private $objDogodek;
    private $lookOseba;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    public function lookupOsebo(ApiTester $I)
    {
        $this->lookOseba = $ent             = $I->lookupEntity("oseba", "0001", false);
        $I->assertNotEmpty($ent);
    }

    /**
     *  kreiramo zapis
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'dogodek' => null, // zaenkrat prazno, relacija se vzpostavi po kreiranju zapisa Dogodek
            'oseba' => $this->lookOseba['id']
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['oseba'], $this->lookOseba['id']);
    }

    /**
     * dogodek kreiramo, ko zapis zasedenost obstaja, ker je Dogodek lastnik relacije
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function createDogodek(ApiTester $I)
    {
        $data             = [
            'planiranZacetek' => '2011-02-01T00:00:00+0100',
            'zacetek'         => '2012-02-01T00:00:00+0100',
            'konec'           => '2013-02-01T00:00:00+0100',
            'status'          => "100s",
            'razred'          => "500s",
            'termin'          => null,
            'ime'             => null,
            'predstava'       => null,
            'zasedenost'      => $this->obj['id'],
            'gostovanje'      => null,
            'dogodekIzven'    => null,
            'prostor'         => null,
            'sezona'          => null,
        ];
        $this->objDogodek = $ent              = $I->successfullyCreate($this->dogodekUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['status'], "100s");
    }

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
        $I->assertGreaterThanOrEqual(1, $resp['state']['totalRecords']);
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
        $I->assertEquals($ent['dogodek'], $this->objDogodek['id']);
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
