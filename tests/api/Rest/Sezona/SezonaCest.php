<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\Sezona;

use ApiTester;

/**
 * Description of SezonaCest
 *
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto - je ni
 *      relacije z drugimi entitetami
 *      - dogodki O2M
 *      getlist različne variante relacij
 *      - vse
 * 
 * @author rado
 */
class SezonaCest
{

    private $restUrl         = '/rest/sezona';
    private $dogodekUrl      = '/rest/dogodek';
    private $vajaUrl         = '/rest/vaja';
    private $obj1;
    private $obj2;
    private $obj3;
    private $objDogodek1;
    private $objDogodek2;
    private $objVaja1;
    private $objVaja2;
    private $lookupSezonaUrl = '/lookup/sezona';
    private $lookUprizoritev1;
    private $lookUprizoritev2;

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
        $data       = [
            'sifra'   => '99',
            'ime'     => 'zz',
            'zacetek' => '2010-02-01T00:00:00+0100',
            'konec'   => '2011-01-31T00:00:00+0100',
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['ime'], $data['ime']);

        // kreiramo še en zapis
        $data       = [
            'sifra'   => '00',
            'ime'     => 'aa',
            'zacetek' => '2011-02-01T00:00:00+0100',
            'konec'   => '2012-01-31T00:00:00+0100',
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['ime'], $data['ime']);

        // kreiramo še en zapis brez šifre
        $data       = [
            'ime'     => 'bb',
            'zacetek' => '2012-02-01T00:00:00+0100',
            'konec'   => '2013-01-31T00:00:00+0100',
        ];
        $this->obj3 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        codecept_debug($ent);
        $I->assertGuid($ent['id']);
        $I->assertNotEmpty($ent['sifra']);

        // validacija prekrivanja
        $data = [
            'ime'     => 'cc',
            'zacetek' => '2011-03-01T00:00:00+0100', // se prekriva
            'konec'   => '2011-03-31T00:00:00+0100',
        ];
        $resp = $I->failToCreate($this->restUrl, $data);
        codecept_debug($resp);

        $I->assertEquals(1001340, $resp[0]['code']);
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
    }

    /**
     * @param ApiTester $I
     */
    public function getListDogodek(ApiTester $I)
    {
        $resp              = $I->successfullyGetList($this->dogodekUrl . "?zacetek=2000-01-01&konec=3000-01-01", []);
        codecept_debug($resp);
        $list              = $resp['data'];
        codecept_debug($list);
        $I->assertNotEmpty($list);
        $this->objDogodek1 = $ent               = array_pop($list);
        $I->assertNotEmpty($ent);
        $this->objDogodek2 = $ent               = array_pop($list);
        $I->assertNotEmpty($ent);
    }

    /**
     *  kreiramo zapis
     * 
     * @depends create
     * @depends getListDogodek
     * @param ApiTester $I
     */
//    public function updateDogodekSSezono(ApiTester $I)
//    {
//        $data              = $I->successfullyGet($this->dogodekUrl, $this->objDogodek1['id']);
//        $data ['sezona']   = $this->obj2['id'];
//        $this->objDogodek1 = $ent               = $I->successfullyUpdate($this->dogodekUrl, $data['id'], $data);
//        $I->assertGuid($ent['id']);
//        $ent               = $I->successfullyGet($this->dogodekUrl, $this->objDogodek1['id']);
//        codecept_debug($ent);
//
//
//        codecept_debug($this->obj2);
//        $I->assertGuid($ent['id'], "začasno $$");
//
//        /**
//         * spremenimo še en zapis
//         */
//        $data              = $I->successfullyGet($this->dogodekUrl, $this->objDogodek2['id']);
//        $data ['sezona']   = $this->obj2['id'];
//        $this->objDogodek2 = $ent               = $I->successfullyUpdate($this->dogodekUrl, $data['id'], $data);
//        $I->assertGuid($ent['id']);
//    }

    /**
     * preberemo relacije
     * 
     * depends updateDogodekSSezono
     * 
     * @param ApiTester $I
     */
//    public function preberiRelacijeZDogodki(ApiTester $I)
//    {
//        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "dogodki", "");
//        $I->assertEquals(2, count($resp));
//
//        // get po popa id  
//        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "dogodki", $this->objDogodek1['id']);
//        $I->assertEquals(1, count($resp));
//    }

    /**
     * preberi vse zapise od osebe
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListDefault(ApiTester $I)
    {
        $resp   = $I->successfullyGetList($this->restUrl, []);
        $list   = $resp['data'];
        codecept_debug($list);
        $totRec = $resp['state']['totalRecords'];
        $I->assertGreaterThanOrEqual(2, $totRec);
        $I->assertEquals("00", $list[0]['sifra']);
        $I->assertEquals("99", $list[$totRec - 1]['sifra']);
    }

    /**
     * preberi vse zapise od osebe
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoSezoni(ApiTester $I)
    {
        //iskanje sifra
        $listUrl = $this->restUrl . "?q=" . "99";

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        $I->assertEquals(1, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);

        //iskanje ime
        $listUrl = $this->restUrl . "?q=" . "zz";

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        $I->assertEquals(1, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $data        = $this->obj1;
        $data['ime'] = 'uu';

        $this->obj1 = $ent       = $I->successfullyUpdate($this->restUrl, $data['id'], $data);

        $I->assertEquals($ent['ime'], 'uu');
    }

    /**
     * validacije
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updateZaValidacije(ApiTester $I)
    {
        /*
         * datum se prekriva
         */
        $data            = $this->obj3;
        $data['zacetek'] = '2012-01-31T00:00:00+0100'; // se prekriva
        $resp            = $I->failToUpdate($this->restUrl, $data['id'], $data);
        codecept_debug($resp);
        $I->assertEquals(1001340, $resp[0]['code']);
    }

    /**
     * Preberem zapis in preverim vsa polja
     * 
     * @depends update
     * @param ApiTester $I
     */
    public function read(\ApiTester $I)
    {
        $ent = $I->successfullyGet($this->restUrl, $this->obj1['id']);

        $I->assertGuid($ent['id']);
        $I->assertEquals($ent['zacetek'], '2010-02-01T00:00:00+0100');
        $I->assertEquals($ent['konec'], '2011-01-31T00:00:00+0100');
        $I->assertNotEmpty($ent['sifra'], "šifra");
        $I->assertEquals($ent['ime'], 'uu');

        $I->assertTrue(isset($ent['dogodki']));

        $I->assertEquals(0, count($ent['dogodki']));
    }

    /**
     * test delovanja lookup-a
     * 
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function lookupSezona(ApiTester $I)
    {
        $resp = $I->successfullyGetList($this->lookupSezonaUrl, []);
        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->assertTrue(array_key_exists('data', $resp), "ima data");
        $I->assertTrue(array_key_exists('label', $resp['data'][0]), "ima labelo");
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords'], "total records");
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

}
