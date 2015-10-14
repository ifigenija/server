<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\TipPopa;

use ApiTester;

/**
 * Description of TipPopaCest
 * 
 *      metode, ki jo podpira API
 *      .create
 *      .getlist
 *      .update
 *      .get - kontrola vseh polj te entitete
 *      .delete
 *      validate metodo za entiteto
 *      relacije z drugimi entitetami (to many relacije)
 *      .pri many to many relacijah testiraj : update, get (list+id), delete
 *          .pri one to many relacijah testiraj : get (list+id)
 *      getlist različne variante odobrenih relacij
 *      .default list
 *      .po filtrih
 *      .sortiranja (po polju, ASC/DESC)
 *
 * @author rado
 */
class TipPopaCest
{

    private $restUrl = '/rest/tippopa';
    private $obj1;
    private $obj2;
    private $obj3;

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
        $data       = [
            'sifra' => '01',
            'ime'   => 'zz',
            'opis'  => 'znd',
            'sort'  => 9999,
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['ime'], 'zz');

        // kreiramo še en zapis
        $data       = [
            'sifra' => '02',
            'ime'   => 'aa',
            'opis'  => 'and',
            'sort'  => 2,
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);


        /**
         *  kreiramo še en zapis za sort
         */
        $data       = [
            'sifra' => '03',
            'ime'   => 'bb',
            'opis'  => 'bnd',
            'sort'  => 5,
        ];
        $this->obj3 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);

        /**
         *  kreiramo še en zapis za številčenje (brez šifre)
         */
        $data       = [
            'ime'   => 'xx',
            'opis'  => 'cnd',
            'sort'  =>4,
        ];
        $this->obj3 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
        $I->assertNotEmpty($ent['ime'], 'zz');
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
        $I->assertGreaterThanOrEqual(3, $resp['state']['totalRecords']);
        $I->assertEquals(2, $list[0]['sort']);
        $I->assertEquals(9999, $list[$totRec - 1]['sort']);
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

        //iskanje po opisu 
        $listUrl = $this->restUrl . "?q=" . "bnd";

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        $I->assertGreaterThanOrEqual(1, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent         = $this->obj1;
        $ent['opis'] = 'yy';

        $this->obj1 = $entR       = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

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
        $ent = $I->successfullyGet($this->restUrl, $this->obj1['id']);
        codecept_debug($ent);

        $I->assertGuid($ent['id']);
        $I->assertEquals($ent['sifra'], '01');
        $I->assertEquals($ent['ime'], 'zz');
        $I->assertEquals($ent['opis'], 'yy');
        $I->assertEquals($ent['sort'], 9999);
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updateZaValidate(ApiTester $I)
    {
        $ent        = $this->obj1;
        $ent['ime'] = '';

        $resp = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        codecept_debug($resp);
        $I->assertContains("required", $resp[0]['message'], 'ime ne sme biti prazno');
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
