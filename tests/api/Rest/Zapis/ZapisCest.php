<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\Zapis;

use ApiTester;

/**
 * Description of DrugiVirCest
 * 
 * metode, ki jo podpira API
 * - create
 * - getlist
 * - update
 * - get - kontrola vseh polj te entitete
 * - delete
 * - tudi view zaklenjen
 * getlist različne variante relacij
 * - vse
 * - default
 * . po zapisu
 * . po lastniku 
 * validate metodo za entiteto
 * relacije z drugimi entitetami (to many relacije)
 * - pri many to many relacijah testiraj : update, get (list+id), delete
 * - pri one to many relacijah testiraj : get (list+id)
 * 
 * @author rado
 */
class ZapisCest
{

    private $restUrl            = '/rest/zapis';
    private $obj1;
    private $obj2;
    private $programPremieraUrl = '/rest/programpremiera';
    private $objProgramPremiera1;
    private $objProgramPremiera2;
    private $objProgramPremiera3;

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
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data       = [
            'tip'         => 'komentar',
            'vrsta'       => null,
            'datoteka'    => null,
            'identifier'  => null,
            'subject'     => 'zz',
            'title'       => 'zz',
            'description' => 'zz',
            'coverage'    => 'zz',
//            'creator'     => 'zz',
            'language'    => 'zz',
            'date'        => '2016-01-01T00:00:00+0100',
            'publisher'   => 'zz',
            'relation'    => 'zz',
            'rights'      => 'zz',
            'source'      => 'zz',
            'standard'    => 'zz',
            'lokacija'    => 'zz',
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
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
        $ent            = $this->obj1;
        $ent['lastnik'] = $this->objProgramPremiera3['id'];

        $this->obj1 = $entR       = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['lastnik'], $this->objProgramPremiera3['id']);
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
        $I->assertEquals($ent['lastnik'], $this->objProgramPremiera3['id']);
        $I->assertEquals($ent['classLastnika'], 'ProgramPremiera');
        $I->assertEquals($ent['zapis'], null);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListVse(ApiTester $I)
    {
        $listUrl = $this->restUrl . "/vse";
        codecept_debug($listUrl);
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];

        $I->assertNotEmpty($list);
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
    }

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

        $resp = $I->successfullyGetList($this->restUrl . "?lastnik=" . $this->objProgramPremiera2['id'], []);
        $list = $resp['data'];
        codecept_debug($list);
        $I->assertNotEmpty($list);
        $I->assertEquals(1, $resp['state']['totalRecords']);
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
