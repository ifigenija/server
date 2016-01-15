<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\Koledar\Predstava;

use ApiTester;

/**
 * Description of PredstavaCest
 *
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto - je ni
 *      relacije z drugimi entitetami
 *      - uprizoritev
 *      - dogodek
 *      - gostovanje
 *     
 *      getlist različne variante relacij
 *      - vse
 *      - uprizoritev
 * 
 * @author rado
 */
class PredstavaCest
{

    private $restUrl        = '/rest/predstava';
    private $dogodekUrl     = '/rest/dogodek';
    private $uprizoritevUrl = '/rest/uprizoritev';
    private $gostovanjeUrl  = '/rest/gostovanje';
    private $drzavaUrl      = '/rest/drzava';
    private $obj1;
    private $obj2;
    private $objDogodek;
    private $objUprizoritev;
    private $lookUprizoritev1;
    private $lookUprizoritev2;
    private $lookUprizoritev3;
    private $altUpr2Ids;
    private $altUpr1Ids;
    private $altUpr3Ids;
    private $objGostovanje;
    private $objDrzava;
    private $lookProstor1;
    private $lookProstor2;
    private $lookProstor3;
    private $abonmaUrl      = '/rest/abonma';
    private $objAbonma1;
    private $objAbonma2;
    private $objAbonma3;
    private $lookSezona1;
    private $lookSezona2;
    private $lookSezona3;
    private $lookOseba1;
    private $lookOseba2;
    private $lookOseba3;

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
        $this->objDrzava = $look            = $I->lookupEntity("drzava", "SI");
        $I->assertNotEmpty($look);
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

        $this->lookOseba3 = $look             = $I->lookupEntity("oseba", "0003", false);
        codecept_debug($look);
        $I->assertGuid($look['id']);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupUprizoritev(ApiTester $I)
    {

        $this->lookUprizoritev1 = $look                   = $I->lookupEntity("uprizoritev", "0002", false);
        $I->assertGuid($look['id']);
        /*
         * še poiščemo vse pripadajoče alternacije
         */
        $upr                    = $I->successfullyGet($this->uprizoritevUrl, $look ['id']);
        $this->altUpr1Ids       = $altUpr                 = array_column($I->subarrayValuesToArray(array_column($upr['funkcije'], 'alternacije')), 'id');
        codecept_debug($altUpr);

        $this->lookUprizoritev2 = $look                   = $I->lookupEntity("uprizoritev", "0001", false);
        codecept_debug($look);
        $I->assertGuid($look['id']);
        /*
         * še poiščemo vse pripadajoče alternacije
         */
        $upr                    = $I->successfullyGet($this->uprizoritevUrl, $look ['id']);
        $this->altUpr2Ids       = $altUpr                 = array_column($I->subarrayValuesToArray(array_column($upr['funkcije'], 'alternacije')), 'id');
        codecept_debug($altUpr);

        $this->lookUprizoritev3 = $look                   = $I->lookupEntity("uprizoritev", "0003", false);
        $I->assertGuid($look['id']);
        /*
         * še poiščemo vse pripadajoče alternacije
         */
        $upr                    = $I->successfullyGet($this->uprizoritevUrl, $look ['id']);
        $this->altUpr3Ids       = $altUpr                 = array_column($I->subarrayValuesToArray(array_column($upr['funkcije'], 'alternacije')), 'id');
        codecept_debug($altUpr);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupProstor(ApiTester $I)
    {
        $this->lookProstor1 = $look               = $I->lookupEntity("prostor", "0001", false);
        $I->assertGuid($look['id']);

        $this->lookProstor2 = $look               = $I->lookupEntity("prostor", "0002", false);
        $I->assertGuid($look['id']);

        $this->lookProstor3 = $look               = $I->lookupEntity("prostor", "0003", false);
        $I->assertGuid($look['id']);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupSezona(ApiTester $I)
    {
        $this->lookSezona1 = $look              = $I->lookupEntity("sezona", "2015", false);
        $I->assertGuid($look['id']);

        $this->lookSezona2 = $look              = $I->lookupEntity("sezona", "2016", false);
        $I->assertGuid($look['id']);

        $this->lookSezona3 = $look              = $I->lookupEntity("sezona", "2017", false);
        $I->assertGuid($look['id']);
    }

    /**
     * najdemo abonmaje
     * 
     * @param ApiTester $I
     */
    public function getListAbonmaji(ApiTester $I)
    {
        $resp = $I->successfullyGetList($this->abonmaUrl, []);
        $list = $resp['data'];
        $I->assertNotEmpty($list);

        $this->objAbonma1 = $ent              = array_pop($list);
        codecept_debug($ent);
        $I->assertGuid($ent['id']);

        $this->objAbonma2 = $ent              = array_pop($list);
        codecept_debug($ent);
        $I->assertGuid($ent['id']);

        $this->objAbonma3 = $ent              = array_pop($list);
        codecept_debug($ent);
        $I->assertGuid($ent['id']);
    }

    /**
     * 
     * @param ApiTester $I
     */
//    public function createGostovanje(ApiTester $I)
//    {
//        codecept_debug($this->lookUprizoritev);
//        $data                = [
//            'vrsta'   => 'zz',
//            'dogodek' => null,
//            'drzava'  => $this->objDrzava['id'],
//        ];
//        codecept_debug($data);
//        $this->objGostovanje = $ent                 = $I->successfullyCreate($this->gostovanjeUrl, $data);
//        $I->assertGuid($ent['id']);
//        codecept_debug($ent);
//        $I->assertEquals($ent['vrsta'], 'zz');
//    }

    /**
     *  kreiramo zapis
     * 
     * @depends lookupUprizoritev
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $zacetek = '2014-05-07T20:00:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $data    = [
            'zaporedna'    => 6,
            'zaporednaSez' => 3,
            'uprizoritev'  => $this->lookUprizoritev1['id'],
            'title'        => "Predstava $zacetek",
            'status'       => '200s',
            'zacetek'      => $zacetek,
            'konec'        => '2014-05-07T23:00:00+0200',
            'prostor'      => $this->lookProstor1['id'],
            'sezona'       => $this->lookSezona1['id'],
            'dezurni'      => $this->lookOseba1['id'],
//            'gostovanje'  => $this->objGostovanje['id'],
//            'dogodek'     => NULL,
        ];


        /*
         * pripravimo parametre alternacij, npr. prve 3 te uprizoritve
         */
        $parAlternacije = '';   //init
        for ($i = 1; $i <= 3; $i++) {
            codecept_debug($this->altUpr1Ids);
            $parAlternacije .= 'alternacija[]=' . $this->altUpr1Ids[$i] . '&';
        }
        $parDezurni = 'dezurni[]=' . $this->lookOseba1['id'] . '&'
                . 'dezurni[]=' . $this->lookOseba2['id'] . '&'
                . 'dezurni[]=' . $this->lookOseba3['id'] . '&';
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl . "?" . $parAlternacije . $parDezurni, $data);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);
        codecept_debug($data);
        $I->assertEquals($ent['zaporedna'], $data['zaporedna']);
        $I->assertEquals($ent['zacetek'], $data['zacetek']);
        $I->assertEquals($ent['konec'], $data['konec']);

//        $I->fail('$$');

        /**
         * preveri dogodek
         */
        $this->objDogodek = $dogodek          = $I->successfullyGet($this->dogodekUrl, $ent['dogodek']['id']);

        codecept_debug($dogodek);
        $I->assertGuid($dogodek['id']);
        $I->assertEquals($dogodek['zacetek'], $data['zacetek'], "začetek");
        $I->assertEquals($dogodek['konec'], $data['konec'], "konec");

        // kreiramo še en zapis
        $zacetek        = '2014-05-08T20:00:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $data           = [
            'zaporedna'    => 2,
            'zaporednaSez' => 2,
            'uprizoritev'  => $this->lookUprizoritev1['id'],
            'title'        => "Predstava $zacetek",
            'status'       => '400s',
            'zacetek'      => $zacetek,
            'konec'        => '2014-05-08T23:00:00+0200',
            'prostor'      => null, // če je gostovanje ne rabimo prostora
            'sezona'       => null,
            'dezurni'      => NULL,
        ];
        $parAlternacije = '';   //init
        for ($i = 1; $i <= 3; $i++) {
            codecept_debug($this->altUpr1Ids);
            $parAlternacije .= 'alternacija[]=' . $this->altUpr1Ids[$i] . '&';
        }
        $parDezurni = 'dezurni[]=' . $this->lookOseba1['id'] . '&'
                . 'dezurni[]=' . $this->lookOseba2['id'] . '&'
                . 'dezurni[]=' . $this->lookOseba3['id'] . '&';
        $parDelte   = 'deltaZac=44&deltaKon=33&';
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl . "?" . $parAlternacije . $parDezurni .$parDelte, $data);
        $I->assertGuid($ent['id']);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListDefaultPoUprizoritvi(ApiTester $I)
    {
        $resp   = $I->successfullyGetList($this->restUrl . "?uprizoritev=" . $this->lookUprizoritev1['id'], []);
        $list   = $resp['data'];
        $totRec = $resp['state']['totalRecords'];
        codecept_debug($list);
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
        $I->assertEquals(2, $list[0]['zaporedna']);      //  odvisno od sortiranja
        $I->assertEquals(6, $list[$totRec - 1]['zaporedna']);      //  odvisno od sortiranja
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
        $ent['title'] = 'uu';

        $this->obj1 = $entR       = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['title'], $ent['title']);
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

        codecept_debug($ent);
        $zacetek = '2014-05-07T20:00:00+0200';
        $I->assertGuid($ent['id']);
        $I->assertEquals($ent['dogodek']['id'], $this->objDogodek['id']);
        $I->assertEquals($ent['zaporedna'], 6);
        $I->assertEquals($ent['zaporednaSez'], 3);
        $I->assertEquals($ent['uprizoritev'], $this->lookUprizoritev1['id']);
        $I->assertEquals($ent['title'], "uu");
        $I->assertEquals($ent['status'], '200s');
        $I->assertEquals($ent['zacetek'], $zacetek);
        $I->assertEquals($ent['konec'], '2014-05-07T23:00:00+0200');
        $I->assertEquals($ent['prostor'], $this->lookProstor1['id']);
        $I->assertEquals($ent['sezona'], $this->lookSezona1['id'], "sezona");
        $I->assertEquals($ent['dezurni'], $this->lookOseba1['id']);
    }

    /**
     * brisanje zapisa
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $I->successfullyDelete($this->restUrl, $this->obj1['id']);
        $I->failToGet($this->restUrl, $this->obj1['id']);
        /**
         * ali je hkrati brisal tudi dogodek
         */
        $I->failToGet($this->dogodekUrl, $this->obj1['dogodek']['id']);
    }

    /**
     * kreiramo relacijo
     * 
     * @depends create
     * @depends getListAbonmaji
     * 
     * @param ApiTester $I
     */
    public function dodajAbonmaNaPredstavo(ApiTester $I)
    {
        $resp = $I->successfullyUpdate($this->restUrl, $this->obj2['id'] . "/abonmaji/" . $this->objAbonma1['id'], []);
        codecept_debug($resp);

        // ustvarimo še eno relacijo
        $resp = $I->successfullyUpdate($this->restUrl, $this->obj2['id'] . "/abonmaji/" . $this->objAbonma2['id'], []);
        codecept_debug($resp);
    }

    /**
     * preberemo relacije
     * @depends dodajAbonmaNaPredstavo
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeZAbonma(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "abonmaji", "");
        $I->assertGreaterThanOrEqual(2, count($resp));
        codecept_debug($resp);

        // get po abonma ID
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "abonmaji", $this->objAbonma1['id']);
        $I->assertEquals(1, count($resp));
    }

    /**
     * brisanje relacij
     * @depends dodajAbonmaNaPredstavo
     * 
     * @param ApiTester $I
     */
    public function deleteRelacijoZAbonma(ApiTester $I)
    {
        $resp = $I->successfullyDeleteRelation($this->restUrl, $this->obj2['id'], "abonmaji", $this->objAbonma1['id']);

        $resp = $I->emptyGetRelation($this->restUrl, $this->obj2['id'], "abonmaji", $this->objAbonma1['id']);
    }

}
