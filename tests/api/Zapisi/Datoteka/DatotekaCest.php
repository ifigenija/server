<?php

/*
 *  Licenca GPLv3
 */

namespace module\Zapisi\Datoteka;

use ApiTester;

/**
 * Description of DatotekaCest
 * 
 * 
 * @author rado
 */
class DatotekaCest
{

    private $restUrl = '/rest/datoteka/default';
    private $restUrlVse = '/rest/datoteka/vse';
    private $obj1;
    private $obj2;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\Page\AuthPage::$admin, \Page\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     *  kreiramo zapis
     * 
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data = [
            'filename' => 'aa',
            'owner' => \Page\SifrantPage::$user_joza,
        ];
        $this->obj1 = $ent = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);

        // kreiramo še en zapis
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent = $this->obj1;
        $ent['owner'] = \Page\SifrantPage::$user_admin;

        $this->obj1 = $entR = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['owner']['id'], \Page\SifrantPage::$user_admin);
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
        $I->assertGuid($ent['id']);
        $I->assertEquals($ent['filename'], 'aa');
        $I->assertEquals($ent['owner']['id'], \Page\SifrantPage::$user_admin);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
//    public function getListVse(ApiTester $I)
//    {
//        $listUrl = $this->restUrlVse;
//        codecept_debug($listUrl);
//        $resp = $I->successfullyGetList($listUrl, []);
//        $list = $resp['data'];
//
//        $I->assertNotEmpty($list);
//        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
//    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListDefault(ApiTester $I)
    {
        $resp = $I->successfullyGetList($this->restUrl, []);
        $list = $resp['data'];
        codecept_debug($list);
        $I->assertNotEmpty($list);
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
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
