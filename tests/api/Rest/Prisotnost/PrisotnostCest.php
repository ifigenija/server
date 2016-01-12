<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\Prisotnost;

use ApiTester;

/**
 * Description of PrisotnostCest
 *
 * metode, ki jo podpira API
 * - create
 * - getlist
 * - update
 * - get - kontrola vseh polj te entitete
 * - delete
 * validate metodo za entiteto - je ni
 * relacije z drugimi entitetami
 * getlist različne variante relacij
 * 
 * @author rado
 */
class PrisotnostCest
{

    private $restUrl  = '/rest/prisotnost';
    private $osebaUrl = '/rest/oseba';
    private $obj1;
    private $obj2;
    private $objOseba;
    private $lookOseba1;
    private $lookOseba2;

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
    public function lookupOsebo(ApiTester $I)
    {
        $this->lookOseba1 = $look             = $I->lookupEntity("oseba", "0006", false);
        codecept_debug($look);
        $I->assertGuid($look['id']);

        $this->lookOseba2 = $look             = $I->lookupEntity("oseba", "0007", false);
        codecept_debug($look);
        $I->assertGuid($look['id']);
    }

    /**
     *  kreiramo zapis
     * 
     * @depends lookupOsebo
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data       = [
            'zacetek' => '2015-02-01T08:00:00+0100',
            'konec'   => '2015-02-01T15:00:00+0100',
            'oseba'   => $this->lookOseba1['id'],
            'terminStoritve'   => null,
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        codecept_debug($ent);
        $I->assertGuid($ent['id']);

        $data       = [
            'zacetek' => '2015-02-02T08:00:00+0100',
            'konec'   => '2015-02-02T15:00:00+0100',
            'oseba'   => $this->lookOseba1['id'],
            'terminStoritve'   => null,
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        codecept_debug($ent);
        $I->assertGuid($ent['id']);
    }

    /**
     * preberi vse zapise od osebe
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getList(ApiTester $I)
    {
        $resp   = $I->successfullyGetList($this->restUrl, []);
        $list   = $resp['data'];
        codecept_debug($resp);
        $totRec = $resp['state']['totalRecords'];
        codecept_debug($totRec);
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $data            = $this->obj1;
        $data['zacetek'] = '2015-02-01T09:00:00+0100';

        $this->obj1 = $ent        = $I->successfullyUpdate($this->restUrl, $data['id'], $data);
        $I->assertEquals($data['zacetek'], $ent['zacetek']);
    }

    /**
     * Preberem zapis in preverim vsa polja
     * 
     * @depends update
     * @param ApiTester $I
     */
    public function read(\ApiTester $I)
    {
        $ent = $I->successfullyGet($this->restUrl, $this->obj1['id']);

        $I->assertGuid($ent['id']);
        $I->assertEquals($ent['zacetek'], '2015-02-01T09:00:00+0100');
        $I->assertEquals($ent['konec'], '2015-02-01T15:00:00+0100');
        $I->assertEquals($ent['oseba'], $this->lookOseba1['id']);
        $I->assertEquals($ent['terminStoritve'], NULL);
    }

    /**
     * spremenim zapis za kontrolo validacije
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updateZaValidacijo(ApiTester $I)
    {
        /**
         * konec mora biti za začetkom
         */
        $data            = $this->obj1;
        $data['zacetek'] = '2015-02-01T20:00:00+0100';
        $data['konec']   = '2015-02-01T15:00:00+0100';    // pred začetkom
        $resp            = $I->failToUpdate($this->restUrl, $data['id'], $data);
        $I->assertEquals(1001773, $resp[0]['code']);
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
