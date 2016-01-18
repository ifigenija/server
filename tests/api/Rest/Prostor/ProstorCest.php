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
    private $obj3;
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
     * inicializira bazo  glede na DumpFunctional.sql
     * 
     * 
     * @param ApiTester $I
     */
    public function initBaze(ApiTester $I)
    {
        $I->initDB();
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
        $this->objPopa1 = $popa1          = $I->successfullyGet($this->popaUrl, $this->lookPopa1['id']);
        $this->objPopa2 = $popa2          = $I->successfullyGet($this->popaUrl, $this->lookPopa2['id']);

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
            'sifra'         => '99',
            'naziv'         => 'aa',
            'jePrizorisce'  => true,
            'jeMaticniOder' => true,
            'sePlanira'     => true,
            'kapaciteta'    => 1,
            'opis'          => 'aa',
            'popa'          => $this->objPopa1['id'],
            'naslov'        => $this->objPopa1['naslovi'][0]['id'],
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['sifra'], '99');

        // kreiramo še en zapis
        $data       = [
            'sifra'         => '13',
            'naziv'         => 'bb',
            'jePrizorisce'  => true,
            'jeMaticniOder' => true,
            'sePlanira'     => false,
            'kapaciteta'    => 2,
            'opis'          => 'bb',
            'popa'          => NULL,
            'naslov'        => null,
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['sifra'], '13');

        // kreiramo še en zapis
        $data       = [
            'sifra'         => '00',
            'naziv'         => 'cc',
            'jePrizorisce'  => true,
            'jeMaticniOder' => true,
            'sePlanira'     => false,
            'kapaciteta'    => 3,
            'opis'          => 'cc',
            'popa'          => $this->objPopa2['id'],
            'naslov'        => $this->objPopa2['naslovi'][0]['id'],
        ];
        $this->obj3 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListDefault(ApiTester $I)
    {
        $listUrl = $this->restUrl;
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];
        codecept_debug($list);
        $totRec  = $resp['state']['totalRecords'];
        $I->assertGreaterThanOrEqual(2, $totRec);
        $I->assertEquals("00", $list[0]['sifra']);
        $I->assertEquals("99", $list[$totRec - 1]['sifra']);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoProstoru(ApiTester $I)
    {
        //iskanje sifra
        $listUrl = $this->restUrl . "?q=" . "01";

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        $I->assertGreaterThanOrEqual(1, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);

        //iskanje naziv
        $listUrl = $this->restUrl . "?q=" . "pos";

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoNaslovu(ApiTester $I)
    {
        //iskanje ulica
        $listUrl = $this->restUrl . "?naslov=" . "rim";

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        $I->assertGreaterThanOrEqual(1, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoPopa(ApiTester $I)
    {
        //iskanje ulica
        $listUrl = $this->restUrl . "?popa=" . "juh";

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
        $data          = $this->obj1;
        $data['naziv'] = 'yy';
        codecept_debug($data);

        $this->obj1 = $ent        = $I->successfullyUpdate($this->restUrl, $data['id'], $data);

        $I->assertEquals($ent['naziv'], 'yy');
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
        $I->assertEquals($ent['sifra'], '99');
        $I->assertEquals($ent['jePrizorisce'], true);
        $I->assertEquals($ent['jeMaticniOder'], true, "jeMaticniOder");
        $I->assertTrue($ent['sePlanira']);
        $I->assertEquals($ent['kapaciteta'], 1);
        $I->assertEquals($ent['opis'], 'aa');
        $I->assertEquals($ent['popa']['id'], $this->objPopa1['id']);
        $I->assertEquals($ent['naslov']['id'], $this->objPopa1['naslovi'][0]['id']);
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

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function updateZaValidacijo(ApiTester $I)
    {
        $data           = $this->obj2;
        $data['popa']   = $this->objPopa1['id'];
//        $data['naslov'] = $this->objPopa1['naslovi'][0]['id'];
        $data['naslov'] = NULL;

        $resp = $I->failToUpdate($this->restUrl, $data['id'], $data);
        $I->assertNotEmpty($resp);
        $I->assertEquals(1000380, $resp[0]['code']);

        $data['naslov'] = $this->objPopa2['naslovi'][0]['id'];   // naslov od drugega popa
        $resp           = $I->failToUpdate($this->restUrl, $data['id'], $data);
        $I->assertNotEmpty($resp);
        $I->assertEquals(1000381, $resp[0]['code']);
    }

    /**
     * brisanje zapisa za test orphan removal
     * 
     * @depends create
     */
    public function deletePopa(ApiTester $I)
    {
        $resp = $I->failToDelete($this->popaUrl, $this->objPopa2['id']);
        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->assertEquals(23503, $resp[1]['code'], " Foreign key violation - brisanje naslova ni mogoček, ker se uporablja v prostoru");
    }

}
