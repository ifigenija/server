<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\Dodatek;

use ApiTester;

/**
 * Description of DodatekCest
 * 
 *      metode, ki jo podpira API
 *       - create
 *       - getlist
 *       - update
 *       - get - kontrola vseh polj te entitete
 *       - delete
 *      validate metodo za entiteto - ni validacije
 * relacije z drugimi entitetami
 * - uprizoritev
 * - dogodek
 *      getlist različne variante relacij
 *       - default
 *       - po terminu storitve
 * 
 * @author rado
 */
class DodatekCest
{

    private $restUrl           = '/rest/dodatek';
    private $terminStoritveUrl = '/rest/terminstoritve';
    private $obj1;
    private $obj2;
    private $obj3;
    private $obj4;
    private $objTerminStoritve1;
    private $objTerminStoritve2;
    private $objTerminStoritve3;
    private $lookTipDodatka1;
    private $lookTipDodatka2;
    private $lookTipDodatka3;

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
    public function lookupTerminStoritve(ApiTester $I)
    {
        $resp = $I->successfullyGetList($this->terminStoritveUrl, []);
        $list = $resp['data'];
        codecept_debug($list);

        $this->objTerminStoritve1 = $look                     = array_pop($list);
        codecept_debug($look);
        $I->assertGuid($look['id']);

        $this->objTerminStoritve2 = $look                     = array_pop($list);
        codecept_debug($look);
        $I->assertGuid($look['id']);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupTipDodatka(ApiTester $I)
    {
        $this->lookTipDodatka1 = $look                  = $I->lookupEntity("tipdodatka", "0001", false);
        $I->assertGuid($look['id']);

        $this->lookTipDodatka2 = $look                  = $I->lookupEntity("tipdodatka", "0002", false);
        $I->assertGuid($look['id']);

        $this->lookTipDodatka3 = $look                  = $I->lookupEntity("tipdodatka", "0003", false);
        $I->assertGuid($look['id']);
    }

    /**
     *  kreiramo zapisa vaja in dogodek
     * 
     * če je začetek naveden, se kreira zraven tudi dogodek
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data       = [
            'trajanje'       => 120,
            'terminStoritve' => $this->objTerminStoritve1['id'],
            'tipdodatka'     => $this->lookTipDodatka1['id'],
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        codecept_debug($ent);
        $I->assertGuid($ent['id']);


        $data       = [
            'trajanje'       => 30,
            'terminStoritve' => $this->objTerminStoritve1['id'],
            'tipdodatka'     => $this->lookTipDodatka2['id'],
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        codecept_debug($ent);
        $I->assertGuid($ent['id']);

        /**
         * še en z drugim terminom storitve
         */
        $data       = [
            'trajanje'       => 30,
            'terminStoritve' => $this->objTerminStoritve2['id'],
            'tipdodatka'     => $this->lookTipDodatka3['id'],
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        codecept_debug($ent);
        $I->assertGuid($ent['id']);


        /*
         * validacija le 1 z istim tipom dodatka
         */
        $data = [
            'trajanje'       => 45,
            'terminStoritve' => $this->objTerminStoritve2['id'],
            'tipdodatka'     => $this->lookTipDodatka3['id'], // isti tip dodatka in termin st. kot prejšnji
        ];
        $resp = $I->failToCreate($this->restUrl, $data);
        codecept_debug($resp);
        $I->assertEquals(1001701, $resp[0]['code']);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListDefault(ApiTester $I)
    {
        $resp = $I->successfullyGetList($this->restUrl, []);
        $list = $resp['data'];
        codecept_debug($list);
        $I->assertGreaterThanOrEqual(3, $resp['state']['totalRecords']);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoTerminuStoritev(ApiTester $I)
    {
        $resp = $I->successfullyGetList($this->restUrl . '?terminStoritve=' . $this->objTerminStoritve1['id'], []);
        $list = $resp['data'];
        codecept_debug($list);
        $I->assertEquals(2, $resp['state']['totalRecords']);
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $data             = $this->obj1;
        $data['trajanje'] = 240;

        $this->obj1 = $ent        = $I->successfullyUpdate($this->restUrl, $data['id'], $data);

        $I->assertEquals($ent['trajanje'], $data['trajanje']);
    }

    /**
     * test validacij
     * 
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function updateValidate(ApiTester $I)
    {
        $data             = $this->obj1;
        $data['trajanje'] = -2;     // trajanje ne sme biti negativno število

        $resp = $I->failToUpdate($this->restUrl, $data['id'], $data);
        codecept_debug($resp);

//        $I->assertEquals(19999, $resp[0]['code']);
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
        $I->assertEquals($ent['trajanje'], 240);
        $I->assertEquals($ent['terminStoritve'], $this->objTerminStoritve1['id']);
        $I->assertEquals($ent['tipdodatka'], $this->lookTipDodatka1['id']);
    }

    /**
     * brisanje zapisa
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $I->successfullyDelete($this->restUrl, $this->obj1['id']);
        $I->failToGet($this->restUrl, $this->obj1['id']);
    }

}
