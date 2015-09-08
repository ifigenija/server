<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\Besedilo;

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
    private $obj2;

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
            'naslov'                => 'zz',
            'avtor'                 => 'yy',
            'podnaslov'             => 'xx',
            'jezik'                 => 'ww',
            'naslovIzvirnika'       => 'vv',
            'datumPrejema'          => '2010-02-01T00:00:00+0100',
            'moskeVloge'            => 1,
            'zenskeVloge'           => 2,
            'prevajalec'            => 'uu',
            'povzetekVsebine'       => 'tt',
            'letoIzida'             => '1995',
            'krajIzida'             => 'ss',
            'zaloznik'              => 'rr',
            'internacionalniNaslov' => 'qq',
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['naslov'], 'zz');

        // kreiramo še en zapis
        $data       = [
            'naslov'                => 'aa',
            'avtor'                 => 'bb',
            'podnaslov'             => 'cc',
            'jezik'                 => 'dd',
            'naslovIzvirnika'       => 'ee',
            'datumPrejema'          => '2011-03-01T00:00:00+0100',
            'moskeVloge'            => 1,
            'zenskeVloge'           => 2,
            'prevajalec'            => 'ff',
            'povzetekVsebine'       => 'gg',
            'letoIzida'             => '1996',
            'krajIzida'             => 'hh',
            'zaloznik'              => 'ii',
            'internacionalniNaslov' => 'jj',
            'stevilka'              => '9999'
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['naslov'], 'aa');
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getList(ApiTester $I)
    {
        $listUrl = $this->restUrl;
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];
        codecept_debug($list);

        $I->assertNotEmpty($list);
        $I->assertTrue($resp['state']['totalRecords'] >= 2);
        $I->assertEquals("aa", $list[0]['naslov']);      //glede na sort
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoBesedilu(ApiTester $I)
    {
        //iskanje po številki
        $listUrl = $this->restUrl . "?q=" . "999";

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        $I->assertEquals(1, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
        
        //iskanje po avtor
        $listUrl = $this->restUrl . "?q=" . "bb";

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        $I->assertEquals(1, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
        
        //iskanje po naslov
        $listUrl = $this->restUrl . "?q=" . "aa";

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        $I->assertEquals(1, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
        
        //iskanje po naslovIzvirnika
        $listUrl = $this->restUrl . "?q=" . "ee";

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        $I->assertEquals(1, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
        
        //iskanje po internacionalni naslov
        $listUrl = $this->restUrl . "?q=" . "jj";

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        $I->assertEquals(1, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
        
        //iskanje po prevajalec
        $listUrl = $this->restUrl . "?q=" . "ff";

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        $I->assertEquals(1, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
        
        //iskanje po založnik
        $listUrl = $this->restUrl . "?q=" . "ii";

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        $I->assertEquals(1, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
//    public function getListVse(ApiTester $I)
//    {
//        $listUrl = $this->restUrl . "/vse";
//        $resp    = $I->successfullyGetList($listUrl, []);
//        $list    = $resp['data'];
//        codecept_debug($list);
//
//        $I->assertNotEmpty($list);
//        $I->assertTrue($resp['state']['totalRecords'] >= 2);
//        $I->assertEquals("aa", $list[0]['naslov']);      //glede na sort
//    }

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
        $I->assertEquals($ent['podnaslov'], 'xx');
        $I->assertEquals($ent['jezik'], 'ww');
        $I->assertEquals($ent['naslovIzvirnika'], 'vv');
#        $I->assertEquals($ent['datumPrejema'], '2010-02-01T00:00:00+0100');
        $I->assertEquals($ent['moskeVloge'], 1);
        $I->assertEquals($ent['zenskeVloge'], 2);
        $I->assertEquals($ent['prevajalec'], 'uu');
        $I->assertEquals($ent['povzetekVsebine'], 'tt');

        $I->assertEquals($ent['letoIzida'], '1995');
        $I->assertEquals($ent['krajIzida'], 'ss');
        $I->assertEquals($ent['zaloznik'], 'rr');
        $I->assertEquals($ent['internacionalniNaslov'], 'qq');
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
