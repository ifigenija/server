<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\StrosekUprizoritve;

use ApiTester;

/**
 * Description of StrosekUprizoritveCest
 * 
 * metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto - je ni
 * na drugi strani relacije uprizoritev, popacest $$
 * relacije z drugimi entitetami
 * - ni to many relacij
 * - popa
 * - uprizoritev
 *       pri many to many relacijah testiraj : update, get (list+id), delete
 *      getlist različne variante relacij
 *      - vse
 *      - uprizoritev
 *
 * @author rado
 */
class StrosekUprizoritveCest
{

    private $restUrl        = '/rest/strosekuprizoritve';
    private $popaUrl        = '/rest/popa';
    private $uprizoritevUrl = '/rest/uprizoritev';
    private $obj;
    private $obj2;
    private $lookPopa;
    private $lookUprizoritev;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
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
        $this->lookPopa = $ent            = $I->lookupEntity("popa", "0988", false);
        $I->assertNotEmpty($ent);
    }

    /**
     *  kreiramo zapis
     * 
     * @depends lookupPopa
     * @depends lookupUprizoritev
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'naziv'       => 'zz',
            'vrednostDo'  => 1.23,
            'vrednostNa'  => 4.56,
            'opis'        => 'zz',
            'sort'        => 1,
            'uprizoritev' => $this->lookUprizoritev['id'],
            'popa'        => $this->lookPopa['id'],
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['opis'], 'zz');

        // kreiramo še en zapis
        $data      = [
            'naziv'       => 'aa',
            'vrednostDo'  => 2.34,
            'vrednostNa'  => 5.67,
            'opis'        => 'aa',
            'sort'        => 2,
            'uprizoritev' => $this->lookUprizoritev['id'],
            'popa'        => $this->lookPopa['id'],
        ];
        $this->obj2 = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['opis'], 'aa');
    }


    /**
     * preberi vse zapise od osebe
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoUprizoritvi(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?uprizoritev=" . $this->lookUprizoritev['id'];

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];
        codecept_debug($resp);

        $I->assertNotEmpty($list);
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
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
//        $I->assertEquals("zz", $list[0]['status']);      //glede na sort
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent           = $this->obj;
        $ent['opis'] = 'yy';

        $this->obj = $entR      = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['opis'], 'yy');
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
        $I->assertEquals($ent['opis'], 'yy');
        $I->assertEquals($ent['naziv'       ], 'zz');
        $I->assertEquals($ent['vrednostDo'  ], 1.23);
        $I->assertEquals($ent['vrednostNa'  ], 4.56);
        $I->assertEquals($ent['sort'        ], 1);
        $I->assertEquals($ent['uprizoritev' ], $this->lookUprizoritev['id']);
        $I->assertEquals($ent['popa'        ], $this->lookPopa['id']);
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
