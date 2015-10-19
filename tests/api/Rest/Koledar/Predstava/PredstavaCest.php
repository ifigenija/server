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
    private $obj1;
    private $obj2;
    private $objDogodek;
    private $objUprizoritev;
    private $lookUprizoritev1;
    private $lookUprizoritev2;
    private $lookUprizoritev3;
    private $objGostovanje;
    private $objDrzava;
    private $lookProstor1;
    private $lookProstor2;
    private $lookProstor3;

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
    public function lookupProstor(ApiTester $I)
    {
        $this->lookProstor1 = $look               = $I->lookupEntity("prostor", "0001", false);
        $I->assertGuid($look['id']);

        $this->lookProstor2 = $look               = $I->lookupEntity("prostor", "0002", false);
        $I->assertGuid($look['id']);

        $this->lookProstor3 = $look               = $I->lookupEntity("prostor", "0003", false);
        $I->assertGuid($look['id']);
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
        $zacetek    = '2014-05-07T20:00:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $data       = [
            'zaporedna'    => 6,
            'zaporednaSez' => 3,
            'porocilo'     => "zz",
            'uprizoritev'  => $this->lookUprizoritev1['id'],
            'title'        => "Predstava $zacetek",
            'status'       => '200s',
            'zacetek'      => $zacetek,
            'konec'        => '2014-05-07T23:00:00+0200',
            'prostor'      => $this->lookProstor1['id'],
//            'gostovanje'  => $this->objGostovanje['id'],
//            'dogodek'     => NULL,
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);
        codecept_debug($data);
        $I->assertEquals($ent['zaporedna'], $data['zaporedna']);
        $I->assertEquals($ent['zacetek'], $data['zacetek']);
        $I->assertEquals($ent['konec'], $data['konec']);

        /**
         * preveri dogodek
         */
        $this->objDogodek = $dogodek          = $I->successfullyGet($this->dogodekUrl, $ent['dogodek']['id']);

        codecept_debug($dogodek);
        $I->assertGuid($dogodek['id']);
        $I->assertEquals($dogodek['zacetek'], $data['zacetek'], "začetek");
        $I->assertEquals($dogodek['konec'], $data['konec'], "konec");

        // kreiramo še en zapis
        $zacetek    = '2014-05-08T20:00:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $data       = [
            'zaporedna'    => 2,
            'zaporednaSez' => 2,
            'porocilo'     => "aa",
            'uprizoritev'  => $this->lookUprizoritev1['id'],
            'title'        => "Predstava $zacetek",
            'status'       => '300s',
            'zacetek'      => $zacetek,
            'konec'        => '2014-05-08T23:00:00+0200',
            'prostor'      => null, // če je gostovanje ne rabimo prostora
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
    }

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
        $ent             = $this->obj1;
        $ent['porocilo'] = 'uu';

        $this->obj1 = $entR       = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['porocilo'], $ent['porocilo']);
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

        codecept_debug($ent);
        $zacetek = '2014-05-07T20:00:00+0200';
        $I->assertGuid($ent['id']);
        $I->assertEquals($ent['dogodek']['id'], $this->objDogodek['id']);
        $I->assertEquals($ent['zaporedna'], 6 );
        $I->assertEquals($ent['zaporednaSez'], 3 );
        $I->assertEquals($ent['porocilo'], 'uu');
        $I->assertEquals($ent['uprizoritev'], $this->lookUprizoritev1['id']);
        $I->assertEquals($ent['title'], "Predstava $zacetek");
        $I->assertEquals($ent['status'], '200s');
        $I->assertEquals($ent['zacetek'], $zacetek);
        $I->assertEquals($ent['konec'],  '2014-05-07T23:00:00+0200');
        $I->assertEquals($ent['prostor'], $this->lookProstor1['id']);
    }

  /**
     * brisanje zapisa
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $I->successfullyDelete($this->restUrl, $this->obj1['id']);
        $I->failToGet($this->restUrl, $this->obj1['id']);
        /**
         * ali je hkrati brisal tudi dogodek
         */
        $I->failToGet($this->dogodekUrl, $this->obj1['dogodek']['id']);
    }

}
