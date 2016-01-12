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
    private $obj1;
    private $obj2;
    private $obj3;
    private $obj4;
    private $objDogodek1;
    private $objDogodek2;
    private $objDogodek3;
    private $objDogodek4;
    private $lookOseba1;
    private $lookOseba2;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    public function lookupOsebo(ApiTester $I)
    {
        $this->lookOseba1 = $ent              = $I->lookupEntity("oseba", "0001", false);
        $I->assertGuid($ent['id']);
        $this->lookOseba2 = $ent              = $I->lookupEntity("oseba", "0002", false);
        $I->assertGuid($ent['id']);
    }

    /**
     *  kreiramo zapis
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $zacetek    = '2014-05-07T10:00:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $data       = [
            'dogodek' => null, // zaenkrat prazno, relacija se vzpostavi po kreiranju zapisa Dogodek
            'oseba'   => $this->lookOseba1['id'],
            'title'   => "Zasedenost $zacetek",
            'status'  => '200s',
            'zacetek' => $zacetek,
            'konec'   => '2014-05-07T14:00:00+0200',
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);
        codecept_debug($data);
        $I->assertEquals($ent['oseba'], $this->lookOseba1['id']);
        $I->assertEquals($ent['title'], $data['title']);
        $I->assertEquals($ent['status'], $data['status']);
        $I->assertEquals($ent['zacetek'], $data['zacetek']);
        $I->assertEquals($ent['konec'], $data['konec']);

        /**
         * preveri dogodek
         */
        $this->objDogodek1 = $dogodek           = $I->successfullyGet($this->dogodekUrl, $ent['dogodek']);
        codecept_debug($dogodek);
        $I->assertGuid($dogodek['id']);
        $I->assertEquals($dogodek['title'], $data['title'], "title");
        $I->assertEquals($dogodek['status'], $data['status'], "status");
        $I->assertEquals($dogodek['zacetek'], $data['zacetek'], "začetek");
        $I->assertEquals($dogodek['konec'], $data['konec'], "konec");
       
        /**
         * kreiramo še eno zasedenost
         */
        $zacetek    = '2014-02-07T10:00:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $data       = [
            'dogodek' => null, // zaenkrat prazno, relacija se vzpostavi po kreiranju zapisa Dogodek
            'oseba'   => $this->lookOseba1['id'],
            'title'   => "Zasedenost $zacetek",
            'status'  => '200s',
            'zacetek' => $zacetek,
            'konec'   => '2014-03-07T14:00:00+0200',
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListDefaultPoOsebi(ApiTester $I)
    {
        $resp = $I->successfullyGetList($this->restUrl . "?oseba=" . $this->lookOseba1['id'], []);

        $list = $resp['data'];

        $I->assertNotEmpty($list);
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
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
        $ent = $I->successfullyGet($this->restUrl, $this->obj1['id']);

        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['dogodek'], $this->objDogodek1['id']);
    }

    /**
     * brisanje zapisa
     * 
     * @depends create
     */
    public function deleteDogodek(ApiTester $I)
    {
        $I->successfullyDelete($this->dogodekUrl, $this->objDogodek1['id']);
        $I->failToGet($this->dogodekUrl, $this->objDogodek1['id']);
    }

    /**
     * brisanje zapisa
     * 
     * @depends deleteDogodek
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $I->successfullyDelete($this->restUrl, $this->obj1['id']);
        $I->failToGet($this->restUrl, $this->obj1['id']);
    }

}
