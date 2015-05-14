<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\Zaposlitev;

use ApiTester;

/**
 * Description of VajaCest
 *
 * metode, ki jo podpira API
 * - create
 * - getlist
 * - update
 * - get - kontrola vseh polj te entitete
 * - delete
 * validate metodo za entiteto
 * relacije z drugimi entitetami
 * getlist različne variante relacij
 * 
 * @author rado
 */
class VajaCest
{

    private $restUrl    = '/rest/vaja';
    private $dogodekUrl = '/rest/dogodek';
    private $obj;
    private $objDogodek;

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
    public function createDogodek(ApiTester $I)
    {
        $data             = [
            'planiranZacetek' => '2011-02-01T00:00:00+0100',
            'zacetek'         => '2012-02-01T00:00:00+0100',
            'konec'           => '2013-02-01T00:00:00+0100',
            'status'          => 1,
            'razred'          => null,
            'termin'          => null,
            'ime'             => null,
            'predstava'       => null,
            'zasedenost'      => null,
            'vaja'            => null,
            'gostovanje'      => null,
            'dogodekIzven'    => null,
            'prostor'         => null,
            'sezona'          => null,
        ];
        $this->objDogodek = $ent              = $I->successfullyCreate($this->dogodekUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['status'], 1);
    }

    /**
     *  kreiramo zapis
     * 
     * @depends createDogodek
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'zaporedna'   => 1,
            'porocilo'    => 'zz',
            'dogodek'     => $this->objDogodek['id'],
            'uprizoritev' => null,
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['porocilo'], 'zz');

        // kreiramo še en zapis
        $data = [
            'zaporedna'   => 2,
            'porocilo'    => 'aa',
            'dogodek'     => $this->objDogodek['id'],
            'uprizoritev' => null,
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['porocilo'], 'aa');
    }

    /**
     * preberi vse zapise od dogodka
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoDogodku(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?dogodek=" . $this->objDogodek['id'];

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];
        codecept_debug($resp);

        $I->assertEquals(2, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
        $I->assertEquals("aa", $list[0]['porocilo']);      //  odvisno od sortiranja
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
        $I->assertEquals("aa", $list[0]['porocilo']);      //  odvisno od sortiranja
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent             = $this->obj;
        $ent['porocilo'] = 'yy';

        $this->obj = $entR      = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['porocilo'], 'yy');
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
        $I->assertEquals($ent['zaporedna'], 1);
        $I->assertEquals($ent['porocilo'], 'yy');
        $I->assertEquals($ent['dogodek'], $this->objDogodek['id']);
        $I->assertEquals($ent['uprizoritev'], null);
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
