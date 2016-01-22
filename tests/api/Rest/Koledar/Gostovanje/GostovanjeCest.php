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
    private $obj1;
    private $obj2;
    private $lookDrzava1;
    private $lookDrzava2;
    private $objDogodek;
    private $objVaja;
    private $objPredstava1;
    private $objPredstava2;
    private $lookSezona2015;
    private $lookSezona2016;
    private $lookSezona2017;
    private $lookSezona2014;
    private $lookUprizoritev1;
    private $lookUprizoritev2;
    private $lookUprizoritev3;

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
    public function lookupDrzavo(ApiTester $I)
    {
        $this->lookDrzava1 = $look              = $I->lookupEntity("drzava", "IE");
        $I->assertGuid($look);

        $this->lookDrzava2 = $look              = $I->lookupEntity("drzava", "FR");
        $I->assertGuid($look);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupSezona(ApiTester $I)
    {
        $this->lookSezona2014 = $look              = $I->lookupEntity("sezona", "2014", false);
        $I->assertGuid($look['id']);

        $this->lookSezona2015 = $look              = $I->lookupEntity("sezona", "2015", false);
        $I->assertGuid($look['id']);

        $this->lookSezona2016 = $look              = $I->lookupEntity("sezona", "2016", false);
        $I->assertGuid($look['id']);

        $this->lookSezona2017 = $look              = $I->lookupEntity("sezona", "2017", false);
        $I->assertGuid($look['id']);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupUprizoritev(ApiTester $I)
    {
        $this->lookUprizoritev1 = $look                   = $I->lookupEntity("uprizoritev", "0001", false);
        $I->assertNotEmpty($look);
        $this->lookUprizoritev2 = $look                   = $I->lookupEntity("uprizoritev", "0002", false);
        $I->assertNotEmpty($look);
        $this->lookUprizoritev3 = $look                   = $I->lookupEntity("uprizoritev", "0003", false);
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
        $zacetek    = '2014-05-07T20:00:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $data       = [
            'vrsta'   => 'zz',
            'drzava'  => $this->lookDrzava1,
            'zacetek' => $zacetek,
            'title'   => "Gostovanje $zacetek",
            'status'  => '200s',
            'konec'   => '2014-05-07T23:00:00+0200',
        ];
        codecept_debug($data);
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['vrsta'], 'zz');
        $I->assertEquals($ent['drzava'], $this->lookDrzava1);
        $I->assertEquals($ent['title'], $data['title']);
        $I->assertEquals($ent['status'], $data['status']);
        $I->assertEquals($ent['zacetek'], $data['zacetek']);
        $I->assertEquals($ent['konec'], $data['konec']);
//        $I->assertEquals($ent['prostor'], $data['prostor']);
        $I->assertEquals($ent['sezona'], $this->lookSezona2014['id']);

        /**
         * preveri dogodek
         */
        $this->objDogodek = $dogodek          = $I->successfullyGet($this->dogodekUrl, $ent['dogodek']['id']);

        codecept_debug($dogodek);
        $I->assertGuid($dogodek['id']);
        $I->assertEquals($dogodek['title'], $data['title'], 'title');
        $I->assertEquals($dogodek['status'], $data['status'], 'status');
        $I->assertEquals($dogodek['zacetek'], $data['zacetek'], 'zacetek');
        $I->assertEquals($dogodek['konec'], $data['konec'], 'konec');
//        $I->assertEquals($dogodek['prostor'], $data['prostor'], 'prostor');
        $I->assertEquals($dogodek['sezona'], $ent['sezona'], 'sezona');

        /**
         *  kreiramo še en zapis
         */
        $zacetek    = '2014-05-07T20:00:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $data       = [
            'vrsta'   => 'aa',
            'drzava'  => $this->lookDrzava1,
            'zacetek' => $zacetek,
            'title'   => "Gostovanje $zacetek",
            'status'  => '200s',
            'konec'   => '2014-05-07T23:00:00+0200',
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
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
        $zacetek             = '2014-05-07T20:00:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $data                = [
            'zaporedna'    => 6,
            'zaporednaSez' => 3,
            'porocilo'     => "zz",
            'uprizoritev'  => $this->lookUprizoritev1['id'],
            'title'        => "Predstava $zacetek",
            'status'       => '200s',
            'zacetek'      => $zacetek,
            'konec'        => '2014-05-07T23:00:00+0200',
            'prostor'      => null,
            'dezurni'      => null,
            'gostovanje'   => $this->obj1['id'],
        ];
        $this->objPredstava1 = $ent                 = $I->successfullyCreate($this->predstavaUrl, $data);
        $I->assertGuid($ent['id']);

        /**
         *  kreiramo še en zapis
         */
        $zacetek             = '2014-05-08T20:00:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $data                = [
            'zaporedna'    => 7,
            'zaporednaSez' => 4,
            'porocilo'     => "aa",
            'uprizoritev'  => $this->lookUprizoritev1['id'],
            'title'        => "Predstava $zacetek",
            'status'       => '200s',
            'zacetek'      => $zacetek,
            'konec'        => '2014-05-08T23:00:00+0200',
            'prostor'      => null,
            'dezurni'      => null,
            'gostovanje'   => $this->obj1['id'],
        ];
        $this->objPredstava2 = $ent                 = $I->successfullyCreate($this->predstavaUrl, $data);
        $I->assertGuid($ent['id']);
    }

    /**
     * preberi vse zapise od osebe
     * 
     * @depends create
     * @param ApiTester $I
     */
//    public function getListPoDrzavi(ApiTester $I)
//    {
//        $listUrl = $this->restUrl . "?drzava=" . $this->lookDrzava1['id'];
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
        $ent          = $this->obj1;
        $ent['vrsta'] = 'uu';

        $this->obj1 = $entR       = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['vrsta'], 'uu');
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

        $zacetek = '2014-05-07T20:00:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $I->assertGuid($ent['id']);
        $I->assertEquals($ent['vrsta'], 'uu');
        $I->assertEquals($ent['drzava'], $this->lookDrzava1);
        $I->assertEquals($ent['dogodek']['id'], $this->objDogodek['id']);
        $I->assertEquals($ent['title'], "Gostovanje $zacetek");
        $I->assertEquals($ent['status'], '200s');
        $I->assertEquals($ent['zacetek'], $zacetek);
        $I->assertEquals($ent['konec'], '2014-05-07T23:00:00+0200');
        $I->assertEquals($ent['sezona'], $this->lookSezona2014['id']);

        $I->assertTrue(isset($ent['predstave']));
        $I->assertEquals(2, count($ent['predstave']));
    }

    /**
     * preberemo relacije
     * @depends createVecPredstav
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeSPredstavami(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj1['id'], "predstave", "");
        $I->assertEquals(2, count($resp));

        // get po popa id  
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj1['id'], "predstave", $this->objPredstava1['id']);
        $I->assertEquals(1, count($resp));
    }

    /**
     * brisanje zapisa
     * 
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $I->successfullyDelete($this->restUrl, $this->obj2['id']);
        $I->failToGet($this->restUrl, $this->obj2['id']);
    }

}
