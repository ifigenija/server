<?php

namespace Rest\Drzava;

use ApiTester;

/**
 * metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto - je ni
 *      relacije z drugimi entitetami - nih ni
 *      getlist različne variante relacij
 *      - vse
 *      - default
 * 
 */
class DrzavaCest
{

    private $restUrl = '/rest/drzava';
    private $id      = '00000000-0000-0000-0000-000000000000';
    private $obj;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     * inicializira bazo  glede na DumpFunctional.sql
     * 
     * 
     * @param ApiTester $I
     */
    public function initBaze(ApiTester $I)
    {
        $I->initDB();
    }

    /**
     * get meta
     * 
     * @param ApiTester $I
     */
    public function getMeta(\ApiTester $I)
    {
        $controller = "drzava";
        $view       = "";
        $expected   = "";
        $I->testFormMeta('drzava', '');
    }

//    public function getList(ApiTester $I)
//    {
//        $list     = $I->successfullyGetList($this->restUrl, []);
//        $I->assertNotEmpty($list['data']);
//        $this->id = array_pop($list['data'])['id'];
//        codecept_debug($list);
//    }
    // tests
    public function create(ApiTester $I)
    {
        $data      = [
            'sifra'     => 'ŽŽ',
            'sifraDolg' => 'XX',
            'isoNum'    => 'xx',
            'isoNaziv'  => 'xx',
            'naziv'     => 'xx',
            'opomba'    => 'xx',
        ];
        $this->obj = $drz       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals('XX', $data['sifraDolg']);
        $I->assertNotEmpty($drz['id']);

        // kreiramo še en zapis
        $data = [
            'sifra'     => 'AA',
            'sifraDolg' => 'AA',
            'isoNum'    => 'aa',
            'isoNaziv'  => 'aa',
            'naziv'     => 'aa',
            'opomba'    => 'aa',
        ];
        $drz  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals('AA', $data['sifraDolg']);
        $I->assertNotEmpty($drz['id']);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $drz          = $this->obj;
        $drz['naziv'] = 'tralala';

        $drz = $I->successfullyUpdate($this->restUrl, $drz['id'], $drz);

        $I->assertEquals('tralala', $drz['naziv']);
    }

    /**
     * 
     * @depends update
     * @param ApiTester $I
     */
    public function read(ApiTester $I)
    {
        $drz = $I->successfullyGet($this->restUrl, $this->obj['id']);

        $I->assertEquals($drz['sifra'], 'ŽŽ');
        $I->assertEquals($drz['sifraDolg'], 'XX');
        $I->assertEquals($drz['isoNum'], 'xx');
        $I->assertEquals($drz['isoNaziv'], 'xx');
        $I->assertEquals($drz['naziv'], 'tralala');
        $I->assertEquals($drz['opomba'], 'xx');
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
//        $I->assertEquals(251, $resp['state']['totalRecords']);
//        $I->assertEquals("aa", $list[0]['naziv']);      //glede na sort
//    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListDefault(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?q=" . $this->obj['isoNum'];
        codecept_debug($listUrl);
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];

        $I->assertNotEmpty($list);
        $totRec = $resp['state']['totalRecords'];
        $I->assertEquals(1, $resp['state']['totalRecords']);
       
        // po vseh
        $resp    = $I->successfullyGetList($this->restUrl, []);
        $list    = $resp['data'];
//        $I->assertNotEmpty($list);
        codecept_debug($list);
        $totRec = $resp['state']['totalRecords'];
        $I->assertGreaterThanOrEqual(2, $totRec);
        $I->assertEquals("AA", $list[0]['sifra']);
      
        // zadnjega preberemo
        $resp    = $I->successfullyGetList($this->restUrl."?sort_by=sifra&order=DESC", []);
        $list    = $resp['data'];
        codecept_debug($list);
        $totRec = $resp['state']['totalRecords'];
        $I->assertGreaterThanOrEqual(2, $totRec);
        $I->assertEquals("ŽŽ", $list[0]['sifra']);
    }

    /**
     * 
     * @depends create 
     * @param ApiTester $I
     */
    public function delete(ApiTester $I)
    {
        $drz = $I->successfullyDelete($this->restUrl, $this->obj['id']);

        $I->failToGet($this->restUrl, $this->obj['id']);
    }

}
