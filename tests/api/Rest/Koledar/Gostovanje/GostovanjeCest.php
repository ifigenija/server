<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\Koledar\Gostovanje;

use ApiTester;

/**
 * Description of GostovanjeCest
 *
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto -je ni
 *      relacije z drugimi entitetami
 *      - dogodek
 *      - predstave  O2M
 *      - drzava
 *      getlist različne variante relacij
 *      - vse
 *      - drzava
 * @author rado
 */
class GostovanjeCest
{

    private $restUrl      = '/rest/gostovanje';
    private $dogodekUrl   = '/rest/dogodek';
    private $drzavaUrl    = '/rest/drzava';
    private $vajaUrl      = '/rest/vaja';
    private $predstavaUrl = '/rest/predstava';
    private $obj;
    private $obj2;
    private $objDrzava;
    private $objDogodek;
    private $objVaja;
    private $objPredstava1;
    private $objPredstava2;

    public function _before(ApiTester $I)
    {
        $I->assertTrue(false, "popraviti ko se bolje doreče logika");
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

        /**
     * 
     * @param ApiTester $I
     */
    public function lookupDrzavo(ApiTester $I)
    {
        $this->objDrzava = $look            = $I->lookupEntity("drzava", "SI");
        $I->assertNotEmpty($look);
    }

    /**
     *  kreiramo zapis
     * 
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'vrsta'   => 'zz',
            'dogodek' => null,
            'drzava'  => $this->objDrzava['id'],
        ];
        codecept_debug($data);
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['vrsta'], 'zz');

        // kreiramo še en zapis
        $data       = [
            'vrsta'   => 'aa',
            'dogodek' => null,
            'drzava'  => $this->objDrzava['id'],
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['vrsta'], 'aa');
    }

    /**
     *  kreiramo zapis
     * 
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function createVecPredstav(ApiTester $I)
    {
        $data                = [
            'dogodek'     => NULL,
            'uprizoritev' => null,
            'gostovanje'  => $this->obj2['id'],
            'gostujoca'   => null,
        ];
        $this->objPredstava1 = $ent                 = $I->successfullyCreate($this->predstavaUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // kreiramo še en zapis
        $data                = [
            'dogodek'     => NULL,
            'uprizoritev' => null,
            'gostovanje'  => $this->obj2['id'],
            'gostujoca'   => null,
        ];
        $this->objPredstava2 = $ent                 = $I->successfullyCreate($this->predstavaUrl, $data);
        $I->assertNotEmpty($ent['id']);
        
        
        $I->assertTrue(false, "predstave brez uprizoritve ne sme bit možno kreirat");
    }

    /**
     * dogodek kreiramo, ko zapis zasedenost obstaja, ker je Dogodek lastnik relacije
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function createDogodek(ApiTester $I)
    {
        $data             = [
            'planiranZacetek' => '2011-02-01T00:00:00+0100',
            'zacetek'         => '2012-02-01T00:00:00+0100',
            'konec'           => '2013-02-01T00:00:00+0100',
            'status'          => "100",
            'razred'          => "300",
            'termin'          => null,
            'title'             => "nekaj",
            'gostovanje'      => $this->obj['id'],
            'prostor'         => null,
            'sezona'          => null,
        ];
        $this->objDogodek = $ent              = $I->successfullyCreate($this->dogodekUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['status'], "100");
    }

    /**
     * preberi vse zapise od osebe
     * 
     * @depends create
     * @param ApiTester $I
     */
//    public function getListPoDrzavi(ApiTester $I)
//    {
//        $listUrl = $this->restUrl . "?drzava=" . $this->objDrzava['id'];
//
//        $resp = $I->successfullyGetList($listUrl, []);
//        $list = $resp['data'];
//        codecept_debug($resp);
//
//        $I->assertEquals(2, $resp['state']['totalRecords']);
//        $I->assertNotEmpty($list);
//        $I->assertEquals("aa", $list[0]['vrsta']);      //  odvisno od sortiranja
//    }

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
        $I->assertEquals(2, $resp['state']['totalRecords']);
        $I->assertEquals("aa", $list[0]['vrsta']);      //glede na sort
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent          = $this->obj;
        $ent['vrsta'] = 'yy';

        $this->obj = $entR      = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['vrsta'], 'yy');
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
        $I->assertEquals($ent['vrsta'], 'yy');
        $I->assertEquals($ent['dogodek'], $this->objDogodek['id']);
        $I->assertEquals($ent['drzava'], $this->objDrzava['id']);

        $I->assertTrue(isset($ent['predstave']));

        $I->assertEquals(0, count($ent['predstave']));
    }

    /**
     * brisanje zapisa
     * 
     * @depends createDogodek
     */
    public function deleteDogodek(ApiTester $I)
    {
        $I->successfullyDelete($this->dogodekUrl, $this->objDogodek['id']);
        $I->failToGet($this->dogodekUrl, $this->objDogodek['id']);
    }

    /**
     * brisanje zapisa
     * 
     * @depends deleteDogodek
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $I->successfullyDelete($this->restUrl, $this->obj['id']);
        $I->failToGet($this->restUrl, $this->obj['id']);
    }

    /**
     * preberemo relacije
     * @depends createVecPredstav
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeSPredstavami(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "predstave", "");
        $I->assertEquals(2, count($resp));

        // get po popa id  
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "predstave", $this->objPredstava1['id']);
        $I->assertEquals(1, count($resp));
    }

}
