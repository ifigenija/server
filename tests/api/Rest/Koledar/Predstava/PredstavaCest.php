<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\Predstava;

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
    private $lookUprizoritev;
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
    public function createDrzavo(ApiTester $I)
    {
        $data            = [
            'sifra'     => 'XX',
            'sifraDolg' => 'xx',
            'isoNum'    => 'xx',
            'isoNaziv'  => 'xx',
            'naziv'     => 'xx',
        ];
        $this->objDrzava = $ent             = $I->successfullyCreate($this->drzavaUrl, $data);
        $I->assertNotEmpty($ent['id']);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupUprizoritev(ApiTester $I)
    {
        $this->lookUprizoritev = $look                  = $I->lookupEntity("uprizoritev", "0001", false);
        $I->assertNotEmpty($look);
    }

    /**
     *  kreiramo zapis
     * 
     * @param ApiTester $I
     */
//    public function createUprizoritev(ApiTester $I)
//    {
//        $data                 = [
//            'faza'             => 'arhiv',
//            'naslov'           => 'zz',
//            'podnaslov'        => 'zz',
//            'delovniNaslov'    => 'zz',
//            'datumPremiere'    => '2010-02-01T00:00:00+0100',
//            'stOdmorov'        => 1,
//            'avtor'            => 'zz',
//            'trajanje'         => 2,
//            'opis'             => 'zz',
//            'arhIdent'         => 'zz',
//            'arhOpomba'        => 'zz',
//            'datumZakljucka'   => '2019-02-01T00:00:00+0100',
//            'sloAvtor'         => true,
//            'kratkiNaslov'     => 'zz',
//            'besedilo'         => null,
//            'zvrstUprizoritve' => null,
//            'zvrstSurs'        => null,
//        ];
//        $this->objUprizoritev = $ent                  = $I->successfullyCreate($this->uprizoritevUrl, $data);
//        $I->assertNotEmpty($ent['id']);
//        codecept_debug($ent);
//        $I->assertEquals($ent['opis'], 'zz');
//    }

    /**
     * 
     * @param ApiTester $I
     */
    public function createGostovanje(ApiTester $I)
    {
        $data                = [
            'vrsta'   => 'zz',
            'dogodek' => null,
            'drzava'  => $this->objDrzava['id'],
        ];
        $this->objGostovanje = $ent                 = $I->successfullyCreate($this->gostovanjeUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['vrsta'], 'zz');
    }



    /**
     *  kreiramo zapis
     * 
     * @depends lookupUprizoritev
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'dogodek'     => NULL,
            'uprizoritev' => $this->lookUprizoritev['id'],
            'gostovanje'  => $this->objGostovanje['id'],
            
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['uprizoritev'], $this->lookUprizoritev['id']);

        // kreiramo še en zapis
        $data = [
            'dogodek'     => NULL,
            'uprizoritev' => $this->lookUprizoritev['id'],
            'gostovanje'  => NULL,
           
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['uprizoritev'], $this->lookUprizoritev['id']);
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
            'status'          => "100",
            'razred'          => '100',
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
        $I->assertEquals($ent['status'], "100");
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
    public function getListDefault(ApiTester $I)
    {
        $listUrl = $this->restUrl;
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
        $I->assertEquals($ent['dogodek'], $this->objDogodek['id']);
        $I->assertEquals($ent['uprizoritev'], $this->lookUprizoritev['id']);
        $I->assertEquals($ent['gostovanje'], $this->objGostovanje['id']);
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
