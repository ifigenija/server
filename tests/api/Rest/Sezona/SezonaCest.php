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
 * relacije z drugimi entitetami
 * - dogodki 2M     $$ rb 
 *      getlist različne variante relacij
 *      - vse
 * 
 * @author rado
 */
class SezonaCest
{

    private $restUrl = '/rest/sezona';
    private $obj;

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
        $data      = [
            'imeSezone' => 'zz',
            'zacetek'   => '2010-02-01T00:00:00+0100',
            'konec'     => '2011-02-01T00:00:00+0100',
            'aktivna'   => true,
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['imeSezone'], 'zz');

        // kreiramo še en zapis
        $data = [
            'imeSezone' => 'aa',
            'zacetek'   => '2012-02-01T00:00:00+0100',
            'konec'     => '2013-02-01T00:00:00+0100',
            'aktivna'   => true,
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['imeSezone'], 'aa');
    }

    /**
     * preberi vse zapise od osebe
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoDefaultu(ApiTester $I)
    {
        $listUrl = $this->restUrl;

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];
        codecept_debug($resp);

        $I->assertEquals(2, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
        $I->assertEquals("aa", $list[0]['imeSezone']);      // odvisno od sortiranja
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getList(ApiTester $I)
    {
        $listUrl = $this->restUrl . "/vse";
        codecept_debug($listUrl);
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];

        $I->assertNotEmpty($list);
        $I->assertEquals(2, $resp['state']['totalRecords']);
        $I->assertEquals("aa", $list[0]['imeSezone']);      // odvisno od sortiranja
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent              = $this->obj;
        $ent['imeSezone'] = 'yy';

        $this->obj = $entR      = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['imeSezone'], 'yy');
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
        $I->assertEquals($ent['zacetek'],'2010-02-01T00:00:00+0100' );
        $I->assertEquals($ent['konec'  ],'2011-02-01T00:00:00+0100' );
        $I->assertEquals($ent['aktivna'],true );

        $I->assertTrue(isset($ent['dogodki']));

        $I->assertEquals(0, count($ent['dogodki']));
    }

    /**
     * brisanje zapisa
     * 
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $I->successfullyDelete($this->restUrl, $this->obj['id']);
        $I->failToGet($this->restUrl, $this->obj['id']);
    }

}
