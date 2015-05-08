<?php

namespace Rest\User;

use ApiTester;

/**
 * metode, ki jo podpira API
 *      -create
 *      -getlist
 *      -update
 *      -get - kontrola vseh polj te entitete
 *      -delete
 *  validate metodo za entiteto - zaenkrat ni veljavne validacije
 *  relacije z drugimi entitetami - zaenkrat jih ni
 */
class AbonmaCest
{

    private $restUrl = '/rest/abonma';
    private $id;
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
            'stPredstav' => 5,
            'stKuponov'  => 55,
            'ime'        => 'zz',
            'opis'       => 'zz',
            'kapaciteta' => 555,
        ];
        $this->obj = $abon      = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals($abon['ime'], 'zz');
        $I->assertNotEmpty($abon['id']);
    }

    /**
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getList(ApiTester $I)  
    {
        $resp = $I->successfullyGetList($this->restUrl, []);
        $list = $resp['data'];

        $I->assertNotEmpty($list);
        $this->id = array_pop($list)['id'];
        $I->assertNotEmpty($this->id);
    }

    /**
     * spremenim abonma
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $abon               = $this->obj;
        $abon['kapaciteta'] = '444';

        $abon = $I->successfullyUpdate($this->restUrl, $abon['id'], $abon);

        $I->assertEquals($abon['kapaciteta'], '444');
    }

    /**
     * Preberem abonma
     * 
     * @param ApiTester $I
     * @depends create
     */
    public function read(\ApiTester $I)
    {
        $abon = $I->successfullyGet($this->restUrl, $this->obj['id']);

        $I->assertEquals($abon['stPredstav'], 5);
        $I->assertEquals($abon['stKuponov'], 55);
        $I->assertEquals($abon['ime'], 'zz');
        $I->assertEquals($abon['opis'], 'zz');
        $I->assertEquals($abon['kapaciteta'], 444);
    }

    /**
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $user = $I->successfullyDelete($this->restUrl, $this->obj['id']);
        $I->failToGet($this->restUrl, $this->obj['id']);
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