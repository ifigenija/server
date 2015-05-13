<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\TipFunkcije;

use ApiTester;

/**
 * Description of TipFunkcijeCest
 * 
 * metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *  - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto - je ni
 * relacije z drugimi entitetami
 *  - funkcije - bomo pretestirali na drugi strani
 * getlist različne variante relacij
 *      - vse
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
            'ime'               => 'zz',
            'opis'              => 'zz',
            'dovoliPrekrivanje' => TRUE,
            'maxPrekrivanj'     => 1,
            'nastopajoc'        => TRUE,
            'imeZenski'         => 'zz',
            'podrocje'          => 'zz',
            'pomembnost'        => 'zz',
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['opis'], 'zz');

        // kreiramo še en zapis
        $data      = [
            'ime'               => 'aa',
            'opis'              => 'aa',
            'dovoliPrekrivanje' => TRUE,
            'maxPrekrivanj'     => 2,
            'nastopajoc'        => TRUE,
            'imeZenski'         => 'aa',
            'podrocje'          => 'aa',
            'pomembnost'        => 'aa',
        ];
        $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['opis'], 'aa');
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
        $I->assertEquals("aa", $list[0]['ime']);      //glede na sort
    }

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

        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['ime'], 'zz');
        $I->assertEquals($ent['opis'], 'yy');
        $I->assertEquals($ent['dovoliPrekrivanje'], TRUE);
        $I->assertEquals($ent['maxPrekrivanj'], 1);
        $I->assertEquals($ent['nastopajoc'], TRUE);
        $I->assertEquals($ent['imeZenski'], 'zz');
        $I->assertEquals($ent['podrocje'], 'zz');
        $I->assertEquals($ent['pomembnost'], 'zz', "pomembnost");
        $I->assertTrue(isset($ent['funkcije']), "ali so funkcije");
        $I->assertEquals(0, count($ent['funkcije']),"število funkcij");
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