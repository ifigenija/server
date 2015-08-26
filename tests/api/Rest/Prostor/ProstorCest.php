<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\Prostor;

use ApiTester;

/**
 * Description of ProstorCest
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
class ProstorCest
{

    private $restUrl = '/rest/prostor';
    private $popaUrl = '/rest/popa';
    private $obj1;
    private $obj2;
    private $lookPopa2;
    private $lookPopa1;
    private $objPopa2;
    private $objPopa1;

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
    public function lookupPopa(ApiTester $I)
    {
        $this->lookPopa1 = $ent             = $I->lookupEntity("popa", "0988", false);
        $I->assertNotEmpty($ent);
        $this->lookPopa2 = $ent             = $I->lookupEntity("popa", "0989", false);
        $I->assertNotEmpty($ent);
    }

    /**
     * @depends lookupPopa 
     * @param ApiTester $I
     */
    public function getPopaInNaslov(\ApiTester $I)
    {
        $popa1 = $I->successfullyGet($this->popaUrl, $this->lookPopa1['id']);
        $popa2 = $I->successfullyGet($this->popaUrl, $this->lookPopa2['id']);

        codecept_debug($popa1);
        codecept_debug($popa2);
        
        
    }

    /**
     *  kreiramo zapis
     * 
     * @depends getPopaInNaslov
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data       = [
            'sifra'        => '12',
            'naziv'        => 'Z Z',
            'jePrizorisce' => true,
            'kapaciteta'   => 1,
            'opis'         => 'zz',
            'popa'         => $this->lookPopa1['id'],
            'naslov'       => null,
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['sifra'], '12');

        // kreiramo še en zapis
        $data       = [
            'sifra'        => '13',
            'naziv'        => 'aa',
            'jePrizorisce' => true,
            'kapaciteta'   => 2,
            'opis'         => 'aa',
            'popa'         => null,
            'naslov'       => null,
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['sifra'], '13');
    }

    /**
     * preberi vse zapise od osebe
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoDefaultu(ApiTester $I)
    {
        $listUrl = $this->restUrl;

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];
        codecept_debug($resp);

        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
//        $I->assertEquals("Z Z", $list[0]['naziv']);      // odvisno od sortiranja
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
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
//        $I->assertEquals("Z Z", $list[0]['naziv']);      // odvisno od sortiranja
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
        $ent['naziv'] = 'yy';

        $this->obj1 = $entR       = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['naziv'], 'yy');
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

        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['naziv'], 'yy');
        $I->assertEquals($ent['sifra'], '12');
        $I->assertEquals($ent['jePrizorisce'], true);
        $I->assertEquals($ent['kapaciteta'], 1);
        $I->assertEquals($ent['opis'], 'zz');
        $I->assertEquals($ent['popa'], null, "popa");
        $I->assertEquals($ent['naslov'], null, "naslov");
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
