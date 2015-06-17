<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\Gostujoca;

use ApiTester;

/**
 * Description of GostujocaCest
 *
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto-je ni
 *      relacije z drugimi entitetami
 *      - uprizoritev
 *      - predstave  o2M
 *      getlist različne variante relacij
 *      - vse
 *      - uprizoritev
 * 
 * @author rado
 */
class GostujocaCest
{

    private $restUrl        = '/rest/gostujoca';
    private $uprizoritevUrl = '/rest/uprizoritev';
    private $predstavaUrl   = '/rest/predstava';
    private $obj;
    private $objGostujoca2;
    private $objUprizoritev;
    private $lookUprizoritev;
    private $objPredstava1;
    private $objPredstava2;

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
    public function lookupUprizoritev(ApiTester $I)
    {
        $this->lookUprizoritev = $look                  = $I->lookupEntity("uprizoritev", "0001", false);
        $I->assertNotEmpty($look);
    }

    
    /**
     * 
     * @param ApiTester $I
     */
//    public function createUprizoritev(ApiTester $I)
//    {
//        $data                 = [
//            'faza'             => 'arhiv',
//            'naslov'           => 'zz',
//            'podnaslov'        => 'zz',
//            'delovniNaslov'    => 'zz',
//            'datumPremiere'    => '2010-02-01T00:00:00+0100',
//            'stOdmorov'        => 1,
//            'avtor'            => 'zz',
//            'gostujoca'        => true,
//            'trajanje'         => 2,
//            'opis'             => 'zz',
//            'arhIdent'         => 'zz',
//            'arhOpomba'        => 'zz',
//            'datumZakljucka'   => '2019-02-01T00:00:00+0100',
//            'sloAvtor'         => true,
//            'kratkiNaslov'     => 'zz',
//            'besedilo'         => null,
//            'zvrstUprizoritve' => null,
//            'zvrstSurs'        => null,
//        ];
//        $this->objUprizoritev = $ent                  = $I->successfullyCreate($this->uprizoritevUrl, $data);
//        $I->assertNotEmpty($ent['id']);
//        codecept_debug($ent);
//        $I->assertEquals($ent['opis'], 'zz');
//    }

    /**
     *  kreiramo zapis
     * 
     * @depends lookupUprizoritev
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'uprizoritev' => $this->lookUprizoritev['id'],
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['uprizoritev'], $this->lookUprizoritev['id']);

        // kreiramo še en zapis
        $data                = [
            'uprizoritev' => $this->lookUprizoritev['id'],
        ];
        $this->objGostujoca2 = $ent                 = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['uprizoritev'], $this->lookUprizoritev['id']);
    }

    /**
     *  kreiramo zapis
     * 
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function createPredstavo(ApiTester $I)
    {
        $data                = [
            'dogodek'     => NULL,
            'uprizoritev' => null,
            'gostovanje'  => null,
            'gostujoca'   => $this->objGostujoca2['id'],
        ];
        $this->objPredstava1 = $ent                 = $I->successfullyCreate($this->predstavaUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // kreiramo še en zapis
        $data                = [
            'dogodek'     => NULL,
            'uprizoritev' => null,
            'gostovanje'  => null,
            'gostujoca'   => $this->objGostujoca2['id'],
        ];
        $this->objPredstava2 = $ent                 = $I->successfullyCreate($this->predstavaUrl, $data);
        $I->assertNotEmpty($ent['id']);
    }

    /**
     * preberi vse zapise od osebe
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoUprizoritvi(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?uprizoritev=" . $this->lookUprizoritev['id'];

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];
        codecept_debug($resp);

        $I->assertEquals(2, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
//        $I->assertEquals("xx", $list[0]['status']);      // odvisno od sortiranja
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
//        $I->assertEquals("zz", $list[0]['status']);      //glede na sort
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $I->assertTrue(true, "ni polja za update");  //$$ rb verjetno update-a sploh ni možnega
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
        $I->assertEquals($ent['uprizoritev'], $this->lookUprizoritev['id']);

        $I->assertTrue(isset($ent['predstave']));

        $I->assertEquals(0, count($ent['predstave']));
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

            /**
     * preberemo relacije
     * @depends createPredstavo
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeSPredstavami(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->objGostujoca2['id'], "predstave", "");
        $I->assertEquals(2, count($resp));

        // get po popa id  
        $resp = $I->successfullyGetRelation($this->restUrl, $this->objGostujoca2['id'], "predstave", $this->objPredstava1['id']);
        $I->assertEquals(1, count($resp));

    }

    
}
