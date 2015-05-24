<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\Rekvizit;

use ApiTester;

/**
 * Description of BesediloCest
 *
 * metode, ki jo podpira API
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
 * @author rado
 */
class BesediloCest
{

    private $restUrl = '/rest/besedilo';
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
            'naslov'          => 'zz',
            'avtor'           => 'zz',
            'podnaslov'       => 'zz',
            'jezik'           => 'zz',
            'naslovIzvirnika' => 'zz',
            'datumPrejema'    => '2010-02-01T00:00:00+0100',
            'moskeVloge'      => 1,
            'zenskeVloge'     => 2,
            'prevajalec'      => 'zz',
            'povzetekVsebine' => 'zz',
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['naslov'], 'zz');

        // kreiramo še en zapis
        $data = [
            'naslov'          => 'aa',
            'avtor'           => 'aa',
            'podnaslov'       => 'aa',
            'jezik'           => 'aa',
            'naslovIzvirnika' => 'aa',
            'datumPrejema'    => '2011-03-01T00:00:00+0100',
            'moskeVloge'      => 1,
            'zenskeVloge'     => 2,
            'prevajalec'      => 'aa',
            'povzetekVsebine' => 'aa',
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['naslov'], 'aa');
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getList(ApiTester $I)
    {
        $listUrl = $this->restUrl ;
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];
        codecept_debug($list);

        $I->assertNotEmpty($list);
        $I->assertEquals(2, $resp['state']['totalRecords']);
        $I->assertEquals("aa", $list[0]['naslov']);      //glede na sort
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListVse(ApiTester $I)
    {
        $listUrl = $this->restUrl . "/vse";
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];
        codecept_debug($list);

        $I->assertNotEmpty($list);
        $I->assertEquals(2, $resp['state']['totalRecords']);
        $I->assertEquals("aa", $list[0]['naslov']);      //glede na sort
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
        $ent['avtor'] = 'xx';

        $ent = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($ent['avtor'], 'xx');
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

        $I->assertNotEmpty($ent['id'], 'zz');
        $I->assertEquals($ent['naslov'], 'zz');
        $I->assertEquals($ent['avtor'], 'xx');
        $I->assertEquals($ent['podnaslov'], 'zz');
        $I->assertEquals($ent['jezik'], 'zz');
        $I->assertEquals($ent['naslovIzvirnika'], 'zz');
#        $I->assertEquals($ent['datumPrejema'], '2010-02-01T00:00:00+0100');
        $I->assertEquals($ent['moskeVloge'], 1);
        $I->assertEquals($ent['zenskeVloge'], 2);
        $I->assertEquals($ent['prevajalec'], 'zz');
        $I->assertEquals($ent['povzetekVsebine'], 'zz');
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
