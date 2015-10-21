<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\Praznik;

use ApiTester;

/**
 * Description of PraznikCest
 *  metode, ki jo podpira API
 *      .create
 *      .getlist
 *      .update
 *      .get - kontrola vseh polj te entitete
 *      .delete
 *      validate metodo za entiteto
 *      relacije z drugimi entitetami (to many relacije)
 *      .pri many to many relacijah testiraj : update, get (list+id), delete
 *      .pri one to many relacijah testiraj : get (list+id)
 *       getlist različne variante odobrenih relacij
 *      .default list
 *      .po filtrih
 *      .sortiranja (po polju, ASC/DESC)
 * 
 * @author rado
 */
class PraznikCest
{

    private $restUrl = '/rest/praznik';
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
            'ime'       => 'zz',
            'dan'       => 22,
            'mesec'     => 8,
            'leto'      => 2006,
            'delaProst' => true,
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['ime'], 'zz');

        // kreiramo še en zapis
        $data       = [
            'ime'       => 'aa',
            'dan'       => 11,
            'mesec'     => 7,
            'leto'      => null,
            'delaProst' => false,
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
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
        $I->assertGreaterThanOrEqual(17, $resp['state']['totalRecords']);
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent        = $this->obj1;
        $ent['ime'] = 'uu';

        $this->obj1 = $entR       = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['ime'], 'uu');
    }

    /**
     * Preberem zapis in preverim vsa polja
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function read(\ApiTester $I)
    {
        $this->obj1 = $ent        = $I->successfullyGet($this->restUrl, $this->obj1['id']);
        codecept_debug($ent);

        $I->assertGuid($ent['id']);
        $I->assertEquals($ent['ime'], 'uu');
        $I->assertEquals($ent['dan'], 22);
        $I->assertEquals($ent['mesec'], 8);
        $I->assertEquals($ent['leto'], 2006);
        $I->assertEquals($ent['delaProst'], true);
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updateZaValidate(ApiTester $I)
    {
//        $this->expect($this->dan && $this->dan >= 1 && $this->dan <= 31, "Dan je lahko le med 1 in 31, je pa $this->dan", 1001100);
//        $this->expect($this->mesec && $this->mesec >= 1 && $this->mesec <= 12, "Dan je lahko le med 1 in 12, je pa $this->mesec", 1001101);
//        $this->expect(checkdate($this->mesec, $this->dan, $letoprim), "Datum ni veljaven $this->dan $this->mesec $this->leto", 1001102);

        /**
         * dan
         */
        $ent        = $this->obj1;
        $ent['dan'] = 32;
        $resp       = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertEquals(1001100, $resp[0]['code']);
        $ent['dan'] = -1;
        $resp       = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
//{"success":false,"errors":[{"message":"praznik.dan: The input is not greater or equal than \u00270\u0027","cargo":null,"code":"","severity":"error"}]}

        /**
         * mesec
         */
        $ent          = $this->obj1;
        $ent['mesec'] = 13;
        $resp         = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertEquals(1001101, $resp[0]['code']);

        /**
         * celoten datum
         */
        $ent          = $this->obj1;
        $ent['dan']   = 29;
        $ent['mesec'] = 2;
        $ent['leto']  = null;
        $resp         = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertEquals(1001102, $resp[0]['code']);

        $ent['leto']  = 2007;    // ni prestopno leto
        $resp         = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertEquals(1001102, $resp[0]['code']);
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
