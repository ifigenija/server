<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\ZvrstUprizoritve;

use ApiTester;

/**
 * Description of ZvrstUprizoritveCest
 *
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto -je prazna
 *      relacije z drugimi entitetami - je ni
 *      getlist različne variante relacij
 *      - vse
 *      - default
 * 
 * @author rado
 */
class ZvrstUprizoritveCest
{

    private $restUrl = '/rest/zvrstuprizoritve';
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
            'sifra' => 'ZZ',
            'naziv' => 'zz',
            'opis'  => 'zz',
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals($ent['naziv'], 'zz');
        $I->assertNotEmpty($ent['id']);

        // kreiramo še en zapis
        $data = [
            'sifra' => 'AA',
            'naziv' => 'aa',
            'opis'  => 'aa',
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals($ent['naziv'], 'aa');
        $I->assertNotEmpty($ent['id']);
        
        // kreiramo še en zapis
        $data = [
            'sifra' => 'BB',
            'naziv' => 'ŽŽ',
            'opis'  => 'dd',
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent          = $this->obj;
        $ent['naziv'] = 'uu';

        $ent = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($ent['naziv'], 'uu');
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

        $I->assertEquals($ent['sifra'], 'ZZ');
        $I->assertEquals($ent['naziv'], 'uu');
        $I->assertEquals($ent['opis'], 'zz');
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
//        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
////        $I->assertEquals("aa", $list[0]['naziv']);      //glede na sort
//    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListDefault(ApiTester $I)
    {
        $resp    = $I->successfullyGetList($this->restUrl, []);
        $list    = $resp['data'];
        $totRec=$resp['state']['totalRecords'];
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
        $I->assertEquals("AA", $list[0]['sifra']);      //glede na sort
        $I->assertEquals("ZZ", $list[$totRec-1]['sifra']);      //glede na sort

        /**
         * še po drugem sortnem polju
         */
        $resp    = $I->successfullyGetList($this->restUrl."?sort_by=naziv&order=DESC", []);
        $list    = $resp['data'];
        codecept_debug($list);
        $totRec=$resp['state']['totalRecords'];
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
        $I->assertEquals("ŽŽ", $list[0]['naziv']);      //glede na sort
        $I->assertEquals("aa", $list[$totRec-1]['naziv']);      //glede na sort
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoZvrstiUprizoritve(ApiTester $I)
    {
        //iskanje po sifra
        $listUrl = $this->restUrl . "?q=" . "zz";

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        $I->assertGreaterThanOrEqual(1, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
        
        //iskanje po sifra
        $listUrl = $this->restUrl . "?q=" . "bb";

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        $I->assertGreaterThanOrEqual(1, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
    }

    /**
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $I->successfullyDelete($this->restUrl, $this->obj['id']);
        $I->failToGet($this->restUrl, $this->obj['id']);
    }

    /**
     * ali sam generira šifro?
     * 
     * @param ApiTester $I
     */
    public function createBrezSifre(ApiTester $I)
    {
        $data = [
            'sifra' => '',
            'naziv' => 'ss',
            'opis'  => 'ss',
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
        $I->assertNotEmpty($ent['sifra']);
    }

}
