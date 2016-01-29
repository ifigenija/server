<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\Koledar\DogodekTehnicni;

use ApiTester;

/**
 * Description of DogodekTehnicniCest
 *
 * 
 * @author rado
 */
class DogodekTehnicniCest
{

    private $restUrl        = '/rest/dogodekTehnicni';
    private $dogodekUrl     = '/rest/dogodek';
    private $uprizoritevUrl = '/rest/uprizoritev';
    private $obj1;
    private $obj2;
    private $obj3;
    private $obj4;
    private $objDogodek;
    private $gostovanjeUrl  = '/rest/gostovanje';
    private $objGostovanje;
    private $lookDrzavaId;
    private $objVaja;
    private $lookProstor1;
    private $lookProstor2;
    private $lookProstor3;
    private $lookSezona2015;
    private $lookSezona2016;
    private $lookSezona2017;
    private $lookSezona2014;
    private $lookOseba1;
    private $lookOseba2;
    private $lookOseba3;
    private $lookOseba4;
    private $altUpr1Ids;
    private $altUpr2Ids;
    private $altUpr3Ids;

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
    public function lookupOsebe(ApiTester $I)
    {
        $this->lookOseba1 = $look             = $I->lookupEntity("oseba", "0001", false);
        codecept_debug($look);
        $I->assertGuid($look['id']);

        $this->lookOseba2 = $look             = $I->lookupEntity("oseba", "0002", false);
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
    public function lookupProstor(ApiTester $I)
    {
        $this->lookProstor1 = $ent                = $I->lookupEntity("prostor", "0006", false);
        $I->assertGuid($ent['id']);

        $this->lookProstor2 = $ent                = $I->lookupEntity("prostor", "0005", false);
        $I->assertGuid($ent['id']);

        $this->lookProstor3 = $ent                = $I->lookupEntity("prostor", "0003", false);
        $I->assertGuid($ent['id']);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupSezona(ApiTester $I)
    {
        $this->lookSezona2014 = $look                 = $I->lookupEntity("sezona", "2014", false);
        $I->assertGuid($look['id']);

        $this->lookSezona2015 = $look                 = $I->lookupEntity("sezona", "2015", false);
        $I->assertGuid($look['id']);

        $this->lookSezona2016 = $look                 = $I->lookupEntity("sezona", "2016", false);
        $I->assertGuid($look['id']);

        $this->lookSezona2017 = $look                 = $I->lookupEntity("sezona", "2017", false);
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
    public function lookupDrzavo(ApiTester $I)
    {
        $this->lookDrzavaId = $look               = $I->lookupEntity("drzava", "SI");
        $I->assertGuid($look);
    }

    /**
     * @depends lookupDrzavo
     * @param ApiTester $I
     */
    public function createGostovanje(ApiTester $I)
    {
        $zacetek             = '2014-05-01T20:00:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $data                = [
            'vrsta'   => 'zz',
            'drzava'  => $this->lookDrzavaId,
            'zacetek' => $zacetek,
            'title'   => "Gostovanje $zacetek",
            'status'  => '200s',
            'konec'   => '2014-05-09T23:00:00+0200',
        ];
        codecept_debug($data);
        $this->objGostovanje = $ent                 = $I->successfullyCreate($this->gostovanjeUrl, $data);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);
    }

    /**
     *  kreiramo zapis
     * 
     * @depends createGostovanje
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $zacetek       = '2014-05-07T20:00:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $data          = [
            'zacetek'             => $zacetek,
            'title'               => "Tehnični $zacetek",
            'status'              => '200s',
            'konec'               => '2014-05-07T23:00:00+0200',
            'prostor'             => $this->lookProstor1['id'],
            'barva'               => '#123456',
            'nadrejenoGostovanje' => $this->objGostovanje['id'],
        ];
        $parSodelujoci = 'sodelujoc[]=' . $this->lookOseba1['id'] . '&'
                . 'sodelujoc[]=' . $this->lookOseba2['id'] . '&'
                . 'sodelujoc[]=' . $this->lookOseba3['id'] . '&';
        $parDelte      = 'deltaZac=21&';
        $this->obj1    = $ent           = $I->successfullyCreate($this->restUrl . "?" . $parSodelujoci . $parDelte, $data);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);
        codecept_debug($data);
        $I->assertEquals($ent['title'], $data['title']);
        $I->assertEquals($ent['status'], $data['status']);
        $I->assertEquals($ent['zacetek'], $data['zacetek']);
        $I->assertEquals($ent['konec'], $data['konec']);
        $I->assertEquals($ent['prostor'], $data['prostor']);
        $I->assertEquals($ent['sezona'], $this->lookSezona2014['id']);
        $I->assertEquals($ent['barva'], $data['barva']);
        $I->assertEquals($ent['nadrejenoGostovanje'], $data['nadrejenoGostovanje']);

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
        $I->assertEquals($dogodek['prostor']['id'], $data['prostor'], 'prostor');
        $I->assertEquals($dogodek['sezona'], $ent['sezona'], 'sezona');
        $I->assertEquals($dogodek['barva'], $data['barva']);
        $I->assertEquals($dogodek['nadrejenoGostovanje'], $data['nadrejenoGostovanje']);

        /*
         * kreiram še en zapis
         */
        $zacetek       = '2014-06-07T20:00:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $data          = [
            'zacetek' => $zacetek,
            'title'   => "Tehnični $zacetek",
            'status'  => '200s',
            'konec'   => '2014-06-07T23:00:00+0200',
            'prostor' => $this->lookProstor1['id'],
        ];
        $parSodelujoci = 'sodelujoc[]=' . $this->lookOseba1['id'] . '&'
                . 'sodelujoc[]=' . $this->lookOseba3['id'] . '&';
        $parDelte      = 'deltaKon=32&';
        $this->obj2    = $ent           = $I->successfullyCreate($this->restUrl . "?" . $parSodelujoci . $parDelte, $data);
        $I->assertGuid($ent['id']);

        /*
         * poskus kreiranja za alternacijami
         */
        $parAlternacije = '';   //init
        for ($i = 1; $i <= 3; $i++) {
            $parAlternacije .= 'alternacija[]=' . $this->altUpr1Ids[$i] . '&';
        }
        $data = [
            'zacetek' => '2014-06-07T11:00:00+0200',
            'konec'   => '2014-06-07T12:00:00+0200',
            'title'   => "Tehnični $zacetek",
            'status'  => '200s',
            'prostor' => $this->lookProstor1['id'],
        ];
        $resp = $I->failToCreate($this->restUrl . "?" . $parAlternacije, $data);
        codecept_debug($resp);
        $I->assertEquals(1001089, $resp[0]['code'], 'uprizoritev za ta dogodek ne obstaja');
    }

    /**
     * preberi vse zapise od dogodek
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoProstoru(ApiTester $I)
    {
        $resp   = $I->successfullyGetList($this->restUrl . "?prostor=" . $this->lookProstor1['id'], []);
        $list   = $resp['data'];
        codecept_debug($resp);
        $totRec = $resp['state']['totalRecords'];

        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
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
        $data           = $this->obj1;
        $data['status'] = '400s';
        $this->obj1     = $ent            = $I->successfullyUpdate($this->restUrl, $data['id'], $data);
        $I->assertEquals($ent['status'], $data['status']);

        /*
         * update čas - mora spremeniti čase terminov storitev glede na njihove delte
         */
        $data            = $this->obj2;
        $data['zacetek'] = '2014-06-08T20:20:00+0200';
        $data['konec']   = '2014-06-08T22:20:00+0200';
        $this->obj2      = $ent             = $I->successfullyUpdate($this->restUrl, $data['id'], $data);
        /*
         * $$ tu bi še lahko preveril čase terminov storitev
         */
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
        $I->assertEquals($ent['dogodek']['id'], $this->objDogodek['id']);

        $zacetek = '2014-05-07T20:00:00+0200';
        $I->assertEquals($ent['zacetek'], $zacetek);
        $I->assertEquals($ent['title'], "Tehnični $zacetek");
        $I->assertEquals($ent['status'], '400s');
        $I->assertEquals($ent['konec'], '2014-05-07T23:00:00+0200');
        $I->assertEquals($ent['prostor'], $this->lookProstor1['id']);
        $I->assertEquals($ent['sezona'], $this->lookSezona2014['id']);
        $I->assertEquals($ent['barva'], '#123456', "barva");
        $I->assertEquals($ent['nadrejenoGostovanje'], $this->objGostovanje['id'], "nadrejeno gostovanje");
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
        /**
         * ali je hkrati brisal tudi dogodek
         */
        $I->failToGet($this->dogodekUrl, $this->obj1['dogodek']['id']);
    }

}
