<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\ZvrstSurs;

use ApiTester;

/**
 * Description of ZvrstSursCest
 * 
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *       validate metodo za entiteto - ima zaenkrat prazno
 *      relacije z drugimi entitetami - jih ni
 * 
 * @author rado
 */
class ZvrstSursCest
{

    private $restUrl = '/rest/zvrstsurs';
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
            'sifra' => '99',
            'naziv' => 'yy',
            'opis'  => 'zz',
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals($ent['naziv'], 'yy');
        $I->assertNotEmpty($ent['id']);

        // kreiramo še en zapis
        $data = [
            'sifra' => '00',
            'naziv' => 'bb',
            'opis'  => 'cc',
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals($ent['naziv'], 'bb');
        $I->assertNotEmpty($ent['id']);

        // kreiramo še en zapis za sort
        $data = [
            'sifra' => '91',
            'naziv' => 'aa',
            'opis'  => 'aa',
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
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
        $ent['naziv'] = 'zz';

        $ent = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($ent['naziv'], 'zz');
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

        $I->assertEquals($ent['sifra'], '99');
        $I->assertEquals($ent['naziv'], 'zz');
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
////        $I->assertEquals("aa", $list[0]['ime']);      //glede na sort
//    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListDefault(ApiTester $I)
    {
        $resp   = $I->successfullyGetList($this->restUrl, []);
        $list   = $resp['data'];
        codecept_debug($list);
        $totRec = $resp['state']['totalRecords'];
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
        $I->assertEquals("00", $list[0]['sifra']);      //glede na sort
        $I->assertEquals("99", $list[$totRec - 1]['sifra']);      //glede na sort

        /**
         * še sort po drugem polju
         */
        $resp   = $I->successfullyGetList($this->restUrl."?sort_by=naziv&order=DESC", []);
        $list   = $resp['data'];
        codecept_debug($list);
        $totRec = $resp['state']['totalRecords'];
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
        $I->assertEquals("zz", $list[0]['naziv']);      //glede na sort
        $I->assertEquals("aa", $list[$totRec - 1]['naziv']);      //glede na sort
    }

    public function getListPoZvrsti(ApiTester $I)
    {
        //iskanje po sifri
        $listUrl = $this->restUrl . "?q=" . "z";

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        $I->assertGreaterThanOrEqual(1, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);

        //iskanje po nazivu
        $listUrl = $this->restUrl . "?q=" . "b";

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

}
