<?php

namespace Rest\VrstaStroska;

use ApiTester;

/**
 * Description of VrstaStroskaCest
 * metode, ki jo podpira API
 *      .create
 *      .getlist
 *      .update
 *      .get - kontrola vseh polj te entitete
 *      .delete
 *      validate metodo za entiteto
 *      relacije z drugimi entitetami (to many relacije)
 *          .pri many to many relacijah testiraj : update, get (list+id), delete
 *          .pri one to many relacijah testiraj : get (list+id)
 *      getlist različne variante relacij
 *          .default
 *
 * @author rado
 */
class VrstaStroskaCest
{

    private $restUrl        = '/rest/vrstastroska';
    private $popaUrl        = '/rest/popa';
    private $uprizoritevUrl = '/rest/uprizoritev';
    private $obj1;
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
     *  kreiramo zapis
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data       = [
            'skupina'    => 100,
            'podskupina' => 1,
            'naziv'      => 'aa',
            'opis'       => 'aa',
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['opis'], 'aa');

        // kreiramo še en zapis
        $data       = [
            'skupina'    => 0,
            'podskupina' => 2,
            'naziv'      => 'bb',
            'opis'       => 'bb',
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['opis'], 'bb');
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListDefault(ApiTester $I)
    {
        $resp = $I->successfullyGetList($this->restUrl, []);
        $list = $resp['data'];

        $I->assertNotEmpty($list);
        $totRec = $resp['state']['totalRecords'];
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
        $I->assertEquals(0, $list[0]['skupina']);      //glede na sort
        $I->assertEquals(100, $list[$totRec - 1]['skupina']);      //glede na sort
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

        $I->assertGuid($ent['id']);
        $I->assertEquals($ent['skupina'], 100);
        $I->assertEquals($ent['podskupina'], 1);
        $I->assertEquals($ent['naziv'], 'aa');
        $I->assertEquals($ent['opis'], 'yy');
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
