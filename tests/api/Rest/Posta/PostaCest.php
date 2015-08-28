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

    public function getList(ApiTester $I)
    {
        $resp     = $I->successfullyGetList($this->restUrl, []);
        $list     = $resp["data"];
        $I->assertNotEmpty($list);
        $this->id = array_pop($list)['id'];
    }

    // tests
    public function create(ApiTester $I)
    {
        $data      = [
            'sifra' => 'UU',
            'naziv' => 'xx',
        ];
        $this->obj = $posta     = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals('xx', $posta['naziv']);

        // kreiramo še en zapis
        $data  = [
            'sifra' => 'AA',
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
        $posta['naziv'] = 'tralala';

        $posta = $I->successfullyUpdate($this->restUrl, $posta['id'], $posta);

        $I->assertEquals('tralala', $posta['naziv']);
    }

    // tests
    public function read(ApiTester $I)
    {
        $posta = $I->successfullyGet($this->restUrl, $this->obj['id']);

        // preverimo vsa polja
        $I->assertEquals('tralala', $posta['naziv']);
        $I->assertEquals('UU', $posta['sifra']);
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
        $I->assertEquals("1000", $list[0]['sifra']);      //glede na sort
    }

    // tests
    public function delete(ApiTester $I)
    {
        $posta = $I->successfullyDelete($this->restUrl, $this->obj['id']);

        $I->failToGet($this->restUrl, $this->obj['id']);
    }

}
