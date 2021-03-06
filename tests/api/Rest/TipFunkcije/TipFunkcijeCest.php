<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\TipFunkcije;

use ApiTester;

/**
 * Description of TipFunkcijeCest
 * 
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto - je ni
 *      relacije z drugimi entitetami
 *      - funkcije - bomo pretestirali na drugi strani
 *      getlist različne variante relacij
 *      - vse
 *      - default
 *      - funkcije - bomo pretestirali na strani funkcije
 *
 * @author rado
 */
class TipFunkcijeCest
{

    private $restUrl = '/rest/tipfunkcije';
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
            'sifra'     => '99',
            'ime'       => 'zz',
            'opis'      => 'xx',
            'imeZenski' => 'yy',
            'podrocje'  => 'umetnik',
            'sort'  => 9999,
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);
//        $I->assertEquals($ent['opis'], 'zz');
        // kreiramo še en zapis
        $data      = [
            'sifra'      => '98',
            'ime'        => 'aa',
            'opis'       => 'bb',
            'imeZenski'  => 'cc',
            'podrocje'   => 'tehnik',
            'pomembnost' => 'aa',
            'sort'  => 9999,
        ];
        $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['opis'], 'bb');

        /**
         *  kreiramo še en zapis za sort
         */
        $data = [
            'sifra'      => '00',
            'ime'        => 'dd',
            'opis'       => 'dd',
            'imeZenski'  => 'dd',
            'podrocje'   => 'igralec',
            'pomembnost' => 'dd',
            'sort'  => 9999,
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
    }

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
        $I->assertGreaterThanOrEqual(16, $resp['state']['totalRecords']);
        $I->assertEquals("00", $list[0]['sifra']);
        $I->assertEquals("99", $list[$totRec - 1]['sifra']);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoTipuFunkcije(ApiTester $I)
    {
        //iskanje imenu
        $listUrl = $this->restUrl . "?q=" . "aa";

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        $I->assertGreaterThanOrEqual(1, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);

        //iskanje zenskem imenu 
        $listUrl = $this->restUrl . "?q=" . "cc";

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        $I->assertGreaterThanOrEqual(1, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);

        //iskanje podrocje 
        $listUrl = $this->restUrl . "?q=" . "umetnik";

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        $I->assertGreaterThanOrEqual(14, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);

        //iskanje sifra 
        $listUrl = $this->restUrl . "?q=" . "98";

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        $I->assertGreaterThanOrEqual(1, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
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
//        $I->assertTrue(count($list) > 0);
////        $I->assertEquals("Avtor", $list[0]['ime']);      //glede na sort
//    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent         = $this->obj;
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
        codecept_debug($ent);

        $I->assertGuid($ent['id']);
        $I->assertEquals($ent['sifra'], '99');
        $I->assertEquals($ent['ime'], 'zz');
        $I->assertEquals($ent['opis'], 'yy');
        $I->assertEquals($ent['imeZenski'], 'yy');
        $I->assertEquals($ent['podrocje'], 'umetnik');
        $I->assertEquals($ent['sort'], 9999);
        $I->assertTrue(isset($ent['funkcije']), "ali so funkcije");
        $I->assertEquals(0, count($ent['funkcije']), "število funkcij");
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
