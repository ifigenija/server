<?php

namespace Rest\Posta;

use ApiTester;

/**
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto - je ni
 *      relacije z drugimi entitetami - jih ni
 *      getlist različne variante relacij
 *      - vse
 *      - default
 * 
 */
class PostaCest
{

    private $restUrl = '/rest/posta';
    private $id      = '00000000-0000-0000-0000-000000000000';
    private $obj;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

//    public function getList(ApiTester $I)
//    {
//        $resp     = $I->successfullyGetList($this->restUrl, []);
//        $list     = $resp["data"];
//        $I->assertNotEmpty($list);
//        $this->id = array_pop($list)['id'];
//    }
    // tests
    public function create(ApiTester $I)
    {
        $data      = [
            'sifra' => '9999',
            'naziv' => 'xx',
        ];
        $this->obj = $posta     = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals('xx', $posta['naziv']);

        // kreiramo še en zapis
        $data  = [
            'sifra' => '0000',
            'naziv' => 'aa',
        ];
        $posta = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals('aa', $posta['naziv']);
        $I->assertNotEmpty($posta['id']);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $posta          = $this->obj;
        $posta['naziv'] = 'uu';

        $posta = $I->successfullyUpdate($this->restUrl, $posta['id'], $posta);

        $I->assertEquals('uu', $posta['naziv']);
    }

    // tests
    public function read(ApiTester $I)
    {
        $posta = $I->successfullyGet($this->restUrl, $this->obj['id']);

        // preverimo vsa polja
        $I->assertEquals('uu', $posta['naziv']);
        $I->assertEquals('9999', $posta['sifra']);
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
//        $I->assertEquals(480, $resp['state']['totalRecords']);
//        $I->assertEquals("1000", $list[0]['sifra']);      //glede na sort
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
        $I->assertEquals(480, $resp['state']['totalRecords']);
        $I->assertEquals("0000", $list[0]['sifra']);      //glede na sort

        /**
         * še padajoč vrstni red
         */
        $resp    = $I->successfullyGetList($this->restUrl."?sort_by=sifra&order=DESC", []);
        $list    = $resp['data'];
        $I->assertEquals("9999", $list[0]['sifra']);      //glede na sort
        
    }
    
    public function getListPoPostniNaslov(ApiTester $I)
    {
        //iskanje sifra
        $listUrl = $this->restUrl . "?q=" . "uu";

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        $I->assertEquals(1, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
        
        //iskanje naziv
        $listUrl = $this->restUrl . "?q=" . "aa";

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        $I->assertEquals(1, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
    }

    // tests
    public function delete(ApiTester $I)
    {
        $posta = $I->successfullyDelete($this->restUrl, $this->obj['id']);

        $I->failToGet($this->restUrl, $this->obj['id']);
    }

}
