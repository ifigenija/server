<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\ProgramGostovanje;

use ApiTester;

/**
 * Description of ProgramGostovanjeCest
 * 
 * 
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto
 *      relacije z drugimi entitetami (to many relacije)
 *      - pri many to many relacijah testiraj : update, get (list+id), delete
 *      getlist različne variante relacij
 *      - vse
 *      - default
 *
 * @author rado
 */
class ProgramGostovanjeCest
{

    private $restUrl        = '/rest/programgostovanje';
    private $obj1;
    private $obj2;
    private $uprizoritevUrl = '/rest/uprizoritev';
    private $lookUprizoritev;
    private $popaUrl        = '/rest/popa';
    private $lookPopa1;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupUprizoritev(ApiTester $I)
    {
        $this->lookUprizoritev = $look                  = $I->lookupEntity("uprizoritev", "0001", false);
        $I->assertNotEmpty($look);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupPopa(ApiTester $I)
    {
        $this->lookPopa1 = $ent             = $I->lookupEntity("popa", "0988", false);
        $I->assertNotEmpty($ent);

        $this->lookPopa2 = $ent             = $I->lookupEntity("popa", "0986", false);
    }

    /**
     * @depends lookupUprizoritev
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data       = [
            'dokument'           => NULL,
            'uprizoritev'        => $this->lookUprizoritev['id'],
            'krajGostovanja'     => 'zz',
            'ustanova'           => 'zz',
            'datumGostovanja'    => '2011-02-01T00:00:00+0100',
            'stPonovitev'        => 9,
            'stGledalcev'        => 9,
            'zaproseno'          => 9.12,
            'celotnaVrednost'    => 9.12,
            'transportniStroski' => 9.12,
            'stroskiAvtorZun'    => 9.12,
            'odkup'              => 9.12,
            'lastnaSredstva'     => 9.12,
            'drugiViri'          => 9.12,
            'viriDMinLok'        => 9.12,
            'gostitelj'          => $this->lookPopa1['id'],
            'sort'          => 1,
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['krajGostovanja'], 'zz');

        // kreiramo še en zapis
        $data       = [
            'dokument'           => NULL,
            'uprizoritev'        => NULL,
            'krajGostovanja'     => 'aa',
            'ustanova'           => 'aa',
            'datumGostovanja'    => '2011-02-01T00:00:00+0100',
            'stPonovitev'        => 3,
            'stGledalcev'        => 3,
            'zaproseno'          => 3.12,
            'celotnaVrednost'    => 3.12,
            'transportniStroski' => 3.12,
            'stroskiAvtorZun'    => 3.12,
            'odkup'              => 3.12,
            'lastnaSredstva'     => 3.12,
            'drugiViri'          => 3.12,
            'viriDMinLok'        => 3.12,
            'gostitelj'          => null,
            'sort'          => 2,
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['krajGostovanja'], 'aa');
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent          = $this->obj1;
        $ent['odkup'] = 2.34;

        $this->obj1 = $entR       = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['odkup'], 2.34);
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

        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['uprizoritev']['id'], $this->lookUprizoritev['id']);
        $I->assertEquals($ent['krajGostovanja'], 'zz');
        $I->assertEquals($ent['ustanova'], 'zz');
        $I->assertEquals($ent['datumGostovanja'], '2011-02-01T00:00:00+0100');
        $I->assertEquals($ent['stPonovitev'], 9);
        $I->assertEquals($ent['stGledalcev'], 9);
        $I->assertEquals($ent['zaproseno'], 9.12);
        $I->assertEquals($ent['celotnaVrednost'], 9.12);
        $I->assertEquals($ent['transportniStroski'], 9.12);
        $I->assertEquals($ent['stroskiAvtorZun'], 9.12);
        $I->assertEquals($ent['odkup'], 2.34);
        $I->assertEquals($ent['lastnaSredstva'], 9.12);
        $I->assertEquals($ent['drugiViri'], 9.12);
        $I->assertEquals($ent['viriDMinLok'], 9.12);
        $I->assertEquals($ent['dokument'], NULL);
        $I->assertEquals($ent['gostitelj']['id'], $this->lookPopa1['id']);
        $I->assertEquals($ent['sort'], 1);
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
        $listUrl = $this->restUrl;
        codecept_debug($listUrl);
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];

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
