<?php

namespace Rest\Abonma;

use ApiTester;

/**
 *      metode, ki jo podpira API
 *      -create
 *      -getlist
 *      -update
 *      -get - kontrola vseh polj te entitete
 *      -delete
 *      validate metodo za entiteto - zaenkrat ni veljavne validacije
 * relacije z drugimi entitetami (to many relacije)
 * .pri many to many relacijah testiraj : update, get (list+id), delete
 *          .pri one to many relacijah testiraj : get (list+id)
 *      getlist različne variante relacij
 *      - vse
 *      - default
 * 
 */
class AbonmaCest
{

    private $restUrl = '/rest/abonma';
    private $id;
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
     *  napolnimo vsaj en zapis
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data       = [
            'stPredstav' => 5,
            'stKuponov'  => 55,
            'ime'        => 'zz',
            'opis'       => 'zz',
            'kapaciteta' => 555,
            'barva'      => '#123456',
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals($ent['ime'], 'zz');

        // kreiramo še en zapis za test sortov
        $data       = [
            'stPredstav' => 7,
            'stKuponov'  => 8,
            'ime'        => 'Živa',
            'opis'       => 'aa',
            'kapaciteta' => 9,
            'barva'      => '#aabbcc',
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);

        // kreiramo še en zapis
        $data = [
            'stPredstav' => 7,
            'stKuponov'  => 8,
            'ime'        => 'aa',
            'opis'       => 'aa',
            'kapaciteta' => 9,
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
    }

    /**
     * spremenim abonma
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent               = $this->obj1;
        $ent['kapaciteta'] = '444';

        $ent = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($ent['kapaciteta'], '444');
    }

    /**
     * Preberem abonma
     * 
     * @param ApiTester $I
     * @depends create
     */
    public function read(\ApiTester $I)
    {
        $ent = $I->successfullyGet($this->restUrl, $this->obj1['id']);
        codecept_debug($ent);

        $I->assertEquals($ent['stPredstav'], 5);
        $I->assertEquals($ent['stKuponov'], 55);
        $I->assertEquals($ent['ime'], 'zz');
        $I->assertEquals($ent['opis'], 'zz');
        $I->assertEquals($ent['kapaciteta'], 444);
        $I->assertEquals($ent['barva'], '#123456');
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
        $totalRecords = $resp['state']['totalRecords'];
        $I->assertGreaterThanOrEqual(2, $totalRecords);
        $I->assertEquals("aa", $list[0]['ime']);      //glede na sort
        $I->assertEquals("Živa", $list[$totalRecords - 1]['ime']);      //glede na sort
    }

    /**
     * sprobati validacijo filtra barv
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updateBarv(ApiTester $I)
    {
        $data          = $this->obj1;
        $data['barva'] = '#123';     // napačen format
        $ent = $I->successfullyUpdate($this->restUrl, $data['id'], $data);
        $I->assertEquals($data['barva'],$ent['barva']);
        
        $data['barva'] = '#g00';     // napačen format
        $resp = $I->failToUpdate($this->restUrl, $data['id'], $data);
        codecept_debug($resp);
        
        $data['barva'] = '#12';     // napačen format
        $resp = $I->failToUpdate($this->restUrl, $data['id'], $data);
        codecept_debug($resp);
        
        $data['barva'] = '#1234';     // napačen format
        $resp = $I->failToUpdate($this->restUrl, $data['id'], $data);
        codecept_debug($resp);
        
        $data['barva'] = '#123456789';     // napačen format
        $resp = $I->failToUpdate($this->restUrl, $data['id'], $data);
        codecept_debug($resp);
    }

    /**
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $user = $I->successfullyDelete($this->restUrl, $this->obj1['id']);
        $I->failToGet($this->restUrl, $this->obj1['id']);
    }

    /**
     * kreiramo osebo, test validacije
     * 
     * @param ApiTester $I
     */
//    public function validacijaAbonmaStPredstav(ApiTester $I)   
//    {
////          $this->expect($this->stPredstav >= 0, "Število predstava ne sme biti negativno", 1000330);
//
//        $data = [
//            'stPredstav' => -3,
//            'stKuponov'  => 7,
//            'ime'        => 'yy',
////            'opis'       => 'zz',
//            'kapaciteta' => 777,
//        ];
//        // test validacije - oseba mora imeti ime
//        $resp = $I->failToCreate($this->restUrl, $data);
//        $I->assertNotEmpty($resp);
//        // testiramo na enako številko napake kot je v validaciji
//        $I->assertEquals(1000330, $resp[0]['code']);
//    }
}
