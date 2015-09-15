<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\Koledar\Predstava;

use ApiTester;

/**
 * Description of PredstavaCest
 *
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto - je ni
 *      relacije z drugimi entitetami
 *      - uprizoritev
 *      - dogodek
 *      - gostovanje
 *     
 *      getlist različne variante relacij
 *      - vse
 *      - uprizoritev
 * 
 * @author rado
 */
class PredstavaCest
{

    private $restUrl        = '/rest/predstava';
    private $dogodekUrl     = '/rest/dogodek';
    private $uprizoritevUrl = '/rest/uprizoritev';
    private $gostovanjeUrl  = '/rest/gostovanje';
    private $drzavaUrl      = '/rest/drzava';
    private $obj;
    private $objDogodek;
    private $objUprizoritev;
    private $lookUprizoritev1;
    private $lookUprizoritev2;
    private $lookUprizoritev3;
    private $objGostovanje;
    private $objDrzava;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupDrzavo(ApiTester $I)
    {
        $this->objDrzava = $look            = $I->lookupEntity("drzava", "SI");
        $I->assertNotEmpty($look);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupUprizoritev(ApiTester $I)
    {
        $this->lookUprizoritev1 = $look                   = $I->lookupEntity("uprizoritev", "0001", false);
        $I->assertNotEmpty($look);
        $this->lookUprizoritev2 = $look                   = $I->lookupEntity("uprizoritev", "0002", false);
        $I->assertNotEmpty($look);
        $this->lookUprizoritev3 = $look                   = $I->lookupEntity("uprizoritev", "0003", false);
        $I->assertNotEmpty($look);
    }

    /**
     * 
     * @param ApiTester $I
     */
//    public function createGostovanje(ApiTester $I)
//    {
//        codecept_debug($this->lookUprizoritev);
//        $data                = [
//            'vrsta'   => 'zz',
//            'dogodek' => null,
//            'drzava'  => $this->objDrzava['id'],
//        ];
//        codecept_debug($data);
//        $this->objGostovanje = $ent                 = $I->successfullyCreate($this->gostovanjeUrl, $data);
//        $I->assertGuid($ent['id']);
//        codecept_debug($ent);
//        $I->assertEquals($ent['vrsta'], 'zz');
//    }

    /**
     *  kreiramo zapis
     * 
     * @depends lookupUprizoritev
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'zaporedna'   => 6,
            'dogodek'     => NULL,
            'gostovanje'  => null,
            'porocilo'  => "zz",
            'uprizoritev' => $this->lookUprizoritev1['id'],
//            'gostovanje'  => $this->objGostovanje['id'],
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['uprizoritev'], $this->lookUprizoritev1['id']);

        // kreiramo še en zapis
        $data = [
            'zaporedna'   => 2,
            'dogodek'     => NULL,
            'uprizoritev' => $this->lookUprizoritev1['id'],
            'porocilo'  => "aa",
            'gostovanje'  => NULL,
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['uprizoritev'], $this->lookUprizoritev1['id']);
    }

    /**
     *  kreiramo zapis
     * 
     * najprej mora biti generirana vaja, šele potem lahko generiramo dogodek
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function createDogodekSPredstavo(ApiTester $I)
    {
        $data             = [
            'planiranZacetek' => '2011-02-01T00:00:00+0100',
            'zacetek'         => '2012-02-01T00:00:00+0100',
            'konec'           => '2013-02-01T00:00:00+0100',
            'status'          => "100s",
            'razred'          => '100s',
            'termin'          => 'zz',
            'ime'             => 'zz',
            'predstava'       => $this->obj['id'],
            'zasedenost'      => null,
            'vaja'            => NULL,
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
     * preberi vse zapise od osebe
     * 
     * @depends create
     * @param ApiTester $I
     */
//    public function getListPoUprizoritvi(ApiTester $I)
//    {
//        $listUrl = $this->restUrl . "?uprizoritev=" . $this->lookUprizoritev['id'];
//
//        $resp = $I->successfullyGetList($listUrl, []);
//        $list = $resp['data'];
//        codecept_debug($resp);
//
//        $I->assertEquals(2, $resp['state']['totalRecords']);
//        $I->assertNotEmpty($list);
////        $I->assertEquals("xx", $list[0]['status']);      //odvisno od sortiranja
//    }
    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListDefaultPoUprizoritvi(ApiTester $I)
    {
        $resp   = $I->successfullyGetList($this->restUrl . "?uprizoritev=" . $this->lookUprizoritev1['id'], []);
        $list   = $resp['data'];
        $totRec = $resp['state']['totalRecords'];
        codecept_debug($list);
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
        $I->assertEquals(2, $list[0]['zaporedna']);      //  odvisno od sortiranja
        $I->assertEquals(6, $list[$totRec - 1]['zaporedna']);      //  odvisno od sortiranja
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
        codecept_debug($ent);
        $I->assertGuid($ent['id']);
        $I->assertEquals($ent['dogodek']['id'], $this->objDogodek['id']);
        $I->assertEquals($ent['uprizoritev'], $this->lookUprizoritev1['id']);
        $I->assertEquals($ent['gostovanje'], null);
        $I->assertEquals($ent['porocilo'], "zz");
        $I->assertEquals($ent['zaporedna'], 6);
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

        /**
     *  kreiramo zapisa predstava in dogodek
     * 
     * če je začetek naveden, se kreira zraven tudi dogodek
     * 
     * @param ApiTester $I
     */
    public function createZDogodkom(ApiTester $I)
    {
        $zacetek    = '2014-05-07T00:00:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $data       = [
            'zacetek'     => $zacetek,
            'konec'       => null, // prazno, da ga sam doda zraven
            'zaporedna'   => 6,
            'gostovanje'  => null,
            'uprizoritev' => $this->lookUprizoritev3['id'],
            'porocilo'  => "dd",
        ];
        $this->obj3 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['dogodek']['zacetek'], $zacetek);
        $I->assertEquals($ent['dogodek']['konec'], '2014-05-07T04:00:00+0200'); // začetek + 4h

        /**
         * preveri dogodek
         */
        $dogodek = $I->successfullyGet($this->dogodekUrl, $ent['dogodek']['id']);
        codecept_debug($dogodek);
        $I->assertGuid($dogodek['id']);
        $I->assertEquals($dogodek['zacetek'], $zacetek, "začetek");
        $I->assertEquals($dogodek['konec'], '2014-05-07T04:00:00+0200', "konec"); // začetek + 4h
    }
   
}
