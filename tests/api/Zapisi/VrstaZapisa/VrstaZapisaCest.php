<?php

/*
 *  Licenca GPLv3
 */

namespace Zapisi\VrstaZapisa;

use ApiTester;

/**
 * Description of MapaCest
 * 
 *      metode, ki jo podpira API
 *      .create
 *      .getlist
 *      .update
 *      .get - kontrola vseh polj te entitete
 *      .delete
 * validate metodo za entiteto
 * relacije z drugimi entitetami (to many relacije)
 * .pri many to many relacijah testiraj : update, get (list+id), delete
 * .pri one to many relacijah testiraj : get (list+id)
 *      getlist različne variante relacij
 *      .vse
 *      .default
 * 
 * @author rado
 */
class VrstaZapisaCest
{

    private $restUrl    = '/rest/vrstazapisa/default';
    private $restUrlVse = '/rest/vrstazapisa/vse';
    private $obj1;
    private $obj2;

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
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data       = [
            'oznaka'  => 'AA',
            'naziv'   => 'AA',
            'aktiven' => TRUE,
            'znacka'  => TRUE,
            'ikona'   => 'AA',
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);

        // kreiramo še en zapis
        $data       = [
            'oznaka'  => 'BB',
            'naziv'   => 'BB',
            'aktiven' => TRUE,
            'znacka'  => TRUE,
            'ikona'   => 'BB',
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);

        /**
         *  kreiramo še en  neaktiven zapis
         */
        $data = [
            'oznaka'  => 'cc',
            'naziv'   => 'cc',
            'aktiven' => false,
            'znacka'  => TRUE,
            'ikona'   => 'ccc',
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent          = $this->obj1;
        $ent['naziv'] = 'uu';

        $this->obj1 = $entR       = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['naziv'], 'uu');
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
        $I->assertEquals($ent['oznaka'], 'AA');
        $I->assertEquals($ent['naziv'], 'uu');
        $I->assertEquals($ent['aktiven'], TRUE);
        $I->assertEquals($ent['znacka'], TRUE);
        $I->assertEquals($ent['ikona'], 'AA');
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
        $I->assertEquals(2, $resp['state']['totalRecords']);

        $resp = $I->successfullyGetList($this->restUrl . "?text=u", []);
        $list = $resp['data'];
        codecept_debug($list);
        $I->assertEquals(1, $resp['state']['totalRecords']);

        /**
         * neaktivne
         */
        $resp = $I->successfullyGetList($this->restUrl . "?neaktivne=true", []);
        $list = $resp['data'];
        codecept_debug($list);
        $I->assertEquals(1, $resp['state']['totalRecords']);
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
