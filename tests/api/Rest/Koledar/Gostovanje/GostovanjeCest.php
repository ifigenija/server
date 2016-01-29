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
    private $objPredstava3;
    private $objPredstava4;
    private $objPredstava5;
    private $objPredstava6;
    private $objPredstava7;
    private $objPredstava8;
    private $objDogPredstava1;
    private $objDogPredstava2;
    private $objDogPredstava3;
    private $objDogPredstava4;
    private $objDogPredstava5;
    private $objDogPredstava6;
    private $objDogPredstava7;
    private $objDogPredstava8;
    private $lookSezona2015;
    private $lookSezona2016;
    private $lookSezona2017;
    private $lookSezona2014;
    private $lookUprizoritev1;
    private $lookUprizoritev2;
    private $lookUprizoritev3;
    private $lookOseba1;
    private $lookOseba2;
    private $lookOseba3;
    private $lookOseba4;
    private $lookGostovanjeId1;
    private $lookDogGostovanje1;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    /**
     * @param ApiTester $I
     */
    public function getListDogodke(ApiTester $I)
    {
        /*
         * dogodek, ki je gostovanje
         */
        $resp                     = $I->successfullyGetList($this->dogodekUrl
                . "?q=Gostovanje 1.&zacetek=2000-01-01&konec=2200-05-05&razred[]=300s", []);
        $list                     = $resp['data'];
        codecept_debug($list);
        $I->assertEquals(1, $resp['state']['totalRecords']);
        $ent                      = array_pop($list);
        $this->lookDogGostovanje1 = $look                     = $ent;
        codecept_debug($look);
        $this->lookGostovanjeId1  = $lookId                   = $ent['gostovanje'];
        codecept_debug($lookId);
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
        $this->lookUprizoritev1 = $look                   = $I->lookupEntity("uprizoritev", "0001", false);
        $I->assertNotEmpty($look);
        $this->lookUprizoritev2 = $look                   = $I->lookupEntity("uprizoritev", "0002", false);
        $I->assertNotEmpty($look);
        $this->lookUprizoritev3 = $look                   = $I->lookupEntity("uprizoritev", "0003", false);
        $I->assertNotEmpty($look);
    }

    /**
     *  kreiramo dogodke, ki jih bomo kasneje dodajali v gostovanje
     * 
     * @param ApiTester $I
     */
    public function createVecDogodkov(ApiTester $I)
    {
        $zacetek                = '2014-05-07T10:00:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $data                   = [
            'zaporedna'           => 6,
            'zaporednaSez'        => 3,
            'porocilo'            => "zz",
            'uprizoritev'         => $this->lookUprizoritev1['id'],
            'title'               => "Predstava $zacetek",
            'status'              => '200s',
            'zacetek'             => $zacetek,
            'konec'               => '2014-05-07T11:00:00+0200',
            'prostor'             => null,
            'dezurni'             => null,
            'nadrejenoGostovanje' => null,
        ];
        $this->objPredstava3    = $ent                    = $I->successfullyCreate($this->predstavaUrl, $data);
        $I->assertGuid($ent['id']);
        $this->objDogPredstava3 = $dogodek                = $I->successfullyGet($this->dogodekUrl, $ent['dogodek']['id']);



        /**
         *  kreiramo še en zapis
         */
        $zacetek                = '2014-05-08T10:00:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $data                   = [
            'zaporedna'           => 7,
            'zaporednaSez'        => 4,
            'porocilo'            => "aa",
            'uprizoritev'         => $this->lookUprizoritev1['id'],
            'title'               => "Predstava $zacetek",
            'status'              => '200s',
            'zacetek'             => $zacetek,
            'konec'               => '2014-05-08T11:00:00+0200',
            'prostor'             => null,
            'dezurni'             => null,
            'nadrejenoGostovanje' => null,
        ];
        $this->objPredstava4    = $ent                    = $I->successfullyCreate($this->predstavaUrl, $data);
        $I->assertGuid($ent['id']);
        $this->objDogPredstava4 = $dogodek                = $I->successfullyGet($this->dogodekUrl, $ent['dogodek']['id']);

        /**
         *  kreiramo še en zapis
         */
        $zacetek                = '2014-05-08T11:00:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $data                   = [
            'uprizoritev'         => $this->lookUprizoritev1['id'],
            'title'               => "Predstava $zacetek",
            'status'              => '200s',
            'zacetek'             => $zacetek,
            'konec'               => '2014-05-08T12:00:00+0200',
            'prostor'             => null,
            'dezurni'             => null,
            'nadrejenoGostovanje' => null,
        ];
        $this->objPredstava5    = $ent                    = $I->successfullyCreate($this->predstavaUrl, $data);
        $I->assertGuid($ent['id']);
        $this->objDogPredstava5 = $dogodek                = $I->successfullyGet($this->dogodekUrl, $ent['dogodek']['id']);

        /**
         *  kreiramo še en dogodek, katerega interval ni v celoti znotraj gostovanja
         */
        $zacetek                = '2014-04-30T00:00:00+0200'; // začetek pred gostovanjem
        $data                   = [
            'uprizoritev'         => $this->lookUprizoritev1['id'],
            'title'               => "Predstava $zacetek",
            'status'              => '200s',
            'zacetek'             => $zacetek,
            'konec'               => '2014-05-08T12:00:00+0200',
            'prostor'             => null,
            'dezurni'             => null,
            'nadrejenoGostovanje' => null,
        ];
        $this->objPredstava6    = $ent                    = $I->successfullyCreate($this->predstavaUrl, $data);
        $I->assertGuid($ent['id']);
        $this->objDogPredstava6 = $dogodek                = $I->successfullyGet($this->dogodekUrl, $ent['dogodek']['id']);

        /**
         *  kreiramo še en dogodek, katerega interval ni v celoti znotraj gostovanja
         */
        $zacetek                = '2014-05-09T11:00:00+0200';
        $data                   = [
            'uprizoritev'         => $this->lookUprizoritev1['id'],
            'title'               => "Predstava $zacetek",
            'status'              => '200s',
            'zacetek'             => $zacetek,
            'konec'               => '2014-05-21T12:00:00+0200', // konec po gostovanju
            'prostor'             => null,
            'dezurni'             => null,
            'nadrejenoGostovanje' => null,
        ];
        $this->objPredstava7    = $ent                    = $I->successfullyCreate($this->predstavaUrl, $data);
        $I->assertGuid($ent['id']);
        $this->objDogPredstava7 = $dogodek                = $I->successfullyGet($this->dogodekUrl, $ent['dogodek']['id']);
    }

    /**
     *  kreiramo zapis
     *
     * @depends lookupOsebe
     * @depends createVecDogodkov 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $zacetek       = '2014-05-01T20:00:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $data          = [
            'vrsta'     => 'zz',
            'drzava'    => $this->lookDrzava1,
            'zacetek'   => $zacetek,
            'title'     => "Gostovanje $zacetek",
            'status'    => '200s',
            'konec'     => '2014-05-20T23:00:00+0200',
            'barva'     => '#123456',
            'zamejstvo' => true,
            'kraj'      => 'zzCity',
        ];
        $parDogodki    = 'dogodek[]=' . $this->objDogPredstava3['id'] . "&"
                . 'dogodek[]=' . $this->objDogPredstava4['id'] . "&";
        $parSodelujoci = 'sodelujoc[]=' . $this->lookOseba1['id'] . '&'
                . 'sodelujoc[]=' . $this->lookOseba2['id'] . '&'
                . 'sodelujoc[]=' . $this->lookOseba3['id'] . '&';
        $parDelte      = 'deltaZac=-25&deltaKon=+26&';
        $this->obj1    = $ent           = $I->successfullyCreate($this->restUrl . "?" . $parDogodki . $parSodelujoci . $parDelte, $data);
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
        $I->assertEquals($ent['barva'], $data['barva']);
        $I->assertEquals($ent['zamejstvo'], $data['zamejstvo']);
        $I->assertEquals($ent['kraj'], $data['kraj']);

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
        $I->assertEquals($dogodek['barva'], $data['barva']);

        /**
         *  kreiramo še en zapis
         */
        $zacetek    = '2014-06-01T20:00:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $data       = [
            'vrsta'   => 'aa',
            'drzava'  => $this->lookDrzava1,
            'zacetek' => $zacetek,
            'title'   => "Gostovanje $zacetek",
            'status'  => '200s',
            'konec'   => '2014-06-09T23:00:00+0200',
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
    }

    /**
     * test validacij pri create-u gostovanja
     * 
     * @depends getListDogodke
     * @param ApiTester $I
     */
    public function createZaValidacije(ApiTester $I)
    {
        /*
         * probamo dodati zapis z poddogodkom , ki 2x nastopa
         */
        $zacetek    = '2014-05-01T20:01:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $data       = [
            'vrsta'     => 'vv',
            'drzava'    => $this->lookDrzava1,
            'zacetek'   => $zacetek,
            'title'     => "Gostovanje $zacetek",
            'status'    => '200s',
            'konec'     => '2014-05-20T23:01:00+0200',
            'barva'     => '#123456',
            'zamejstvo' => false,
            'kraj'      => 'vvCity',
        ];
        $parDogodki = 'dogodek[]=' . $this->objDogPredstava5['id'] . "&"
                . 'dogodek[]=' . $this->objDogPredstava5['id'] . "&"; // še 1x isti dogodek
        $resp       = $I->failToCreate($this->restUrl . "?" . $parDogodki, $data);
        codecept_debug($resp);
        $I->assertEquals(1001952, $resp[0]['code']); //ne pride do 1001972 - 

        /*
         * začetek poddogodka pred gostovanjem
         */
        $parDogodki = 'dogodek[]=' . $this->objDogPredstava6['id'] . "&";
        $resp       = $I->failToCreate($this->restUrl . "?" . $parDogodki, $data);
        codecept_debug($resp);
        $I->assertEquals(1001970, $resp[0]['code']);

        /*
         *  konec poddogodka za gostovanjem
         */
        $parDogodki = 'dogodek[]=' . $this->objDogPredstava7['id'] . "&";
        $resp       = $I->failToCreate($this->restUrl . "?" . $parDogodki, $data);
        codecept_debug($resp);
        $I->assertEquals(1001970, $resp[0]['code']);

        /*
         *  poddogodek je gostovanje
         */
        $parDogodki = 'dogodek[]=' . $this->lookDogGostovanje1['id'] . "&";
        codecept_debug($parDogodki);
        $resp       = $I->failToCreate($this->restUrl . "?" . $parDogodki, $data);
        codecept_debug($resp);
        $I->assertEquals(1001971, $resp[0]['code']);
    }

    /**
     *  kreiramo zapis
     * 
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function createVecPodDogodkov(ApiTester $I)
    {
        $zacetek                = '2014-05-07T20:00:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $data                   = [
            'zaporedna'           => 6,
            'zaporednaSez'        => 3,
            'porocilo'            => "zz",
            'uprizoritev'         => $this->lookUprizoritev1['id'],
            'title'               => "Predstava $zacetek",
            'status'              => '200s',
            'zacetek'             => $zacetek,
            'konec'               => '2014-05-07T23:00:00+0200',
            'prostor'             => null,
            'dezurni'             => null,
            'nadrejenoGostovanje' => $this->obj1['id'],
        ];
        $this->objPredstava1    = $ent                    = $I->successfullyCreate($this->predstavaUrl, $data);
        $I->assertGuid($ent['id']);
        $this->objDogPredstava1 = $dogodek                = $I->successfullyGet($this->dogodekUrl, $ent['dogodek']['id']);



        /**
         *  kreiramo še en zapis
         */
        $zacetek             = '2014-05-08T20:00:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $data                = [
            'zaporedna'           => 7,
            'zaporednaSez'        => 4,
            'porocilo'            => "aa",
            'uprizoritev'         => $this->lookUprizoritev1['id'],
            'title'               => "Predstava $zacetek",
            'status'              => '200s',
            'zacetek'             => $zacetek,
            'konec'               => '2014-05-08T23:00:00+0200',
            'prostor'             => null,
            'dezurni'             => null,
            'nadrejenoGostovanje' => $this->obj1['id'],
        ];
        $this->objPredstava2 = $ent                 = $I->successfullyCreate($this->predstavaUrl, $data);
        $I->assertGuid($ent['id']);
    }

    /**
     *  update razred poddogodka gostovanja
     * 
     * @depends createVecPodDogodkov
     * 
     * @param ApiTester $I
     */
    public function updateRazredPodDogodek(ApiTester $I)
    {
        /*
         * ali sploh deluje update poddogodka?
         */
        $data                = $this->objPredstava1;
        $data ['konec']      = '2014-05-07T23:01:00+0200';
        $this->objPredstava1 = $ent                 = $I->successfullyUpdate($this->predstavaUrl, $data['id'], $data);
        $I->assertGuid($ent['id']);
        $I->assertEquals($ent ['konec'], $data ['konec']);

        /*
         * začetek izven intervala gostovanja
         */
        $data ['zacetek'] = '2014-04-30T00:00:00+0200';
        $resp             = $I->failToUpdate($this->predstavaUrl, $data['id'], $data);
        codecept_debug($resp);
        $I->assertEquals(1001711, $resp[0]['code']);
    }

    /**
     *  update poddogodka gostovanja
     * 
     * @depends createVecPodDogodkov
     * 
     * @param ApiTester $I
     */
    public function updatePodDogodek(ApiTester $I)
    {
        /*
         * ali sploh deluje update poddogodka?
         */
        $data           = $this->objDogPredstava1;
        $data ['konec'] = '2014-05-07T23:02:00+0200';
        $ent            = $I->successfullyUpdate($this->dogodekUrl, $data['id'], $data);
        $I->assertGuid($ent['id']);
        $I->assertEquals($ent ['konec'], $data ['konec']);

        /*
         * začetek izven intervala gostovanja
         */
        $data ['zacetek'] = '2014-04-30T00:00:00+0200';
        $resp             = $I->failToUpdate($this->dogodekUrl, $data['id'], $data);
        codecept_debug($resp);
        $I->assertEquals(1001711, $resp[0]['code']);

        /*
         *  - poddogodek ne more biti gostovanje
         * 
         */
        $data            = $this->objDogPredstava1;
        $data ['razred'] = '300s'; // gostovanje
        $resp            = $I->failToUpdate($this->dogodekUrl, $data['id'], $data);
        codecept_debug($resp);
        $I->assertEquals(1001706, $resp[0]['code'], "v restu dogodka ni dovoljeno spreminjanja razreda");
    }

    /**
     *  testiranje validacij pri kreiranju poddogodkov
     * 
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function createPodDogodekZaValidacijo(ApiTester $I)
    {
        /*
         * čas poddogodka ni v celoti v intervalu gostovanja
         */
        $zacetek = '2014-04-30T20:00:00+0200'; // pred začetkom gostovanja
        $data    = [
            'uprizoritev'         => $this->lookUprizoritev1['id'],
            'title'               => "Predstava $zacetek",
            'status'              => '200s',
            'zacetek'             => $zacetek,
            'konec'               => '2014-05-07T23:00:00+0200',
            'prostor'             => null,
            'dezurni'             => null,
            'nadrejenoGostovanje' => $this->obj1['id'],
        ];
        $resp    = $I->failToCreate($this->predstavaUrl, $data);
        codecept_debug($resp);
        $I->assertEquals(1001711, $resp[0]['code']);

        /*
         * ni možno testirati:
         *  - create gostovanja, ki je poddogodek drugega gostovanja, ker:
         *      . ni možen POST dogodek
         *      . v formi gostovanja ni polja nadrejen dogodek
         *  - le 1 poddogodek na gostovanju
         *      . ker če pri POST (razred poddogodka) zaradi M2O relacije ne moremo dodati istega dogodka v gostovanje
         */
    }

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
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
//        $I->assertEquals("aa", $list[0]['vrsta']);      //glede na sort
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
        $data['vrsta'] = 'uu';

        $this->obj1 = $ent        = $I->successfullyUpdate($this->restUrl, $data['id'], $data);

        $I->assertEquals($ent['vrsta'], 'uu');
    }

    /**
     * validacija pri update-u
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updateZaValidacijo(ApiTester $I)
    {
        /*
         * interval gostovanja mora vsebovati intervale vseh poddogodkov
         */
        $data            = $this->obj1;
        $data['zacetek'] = '2014-05-07T21:00:00+0200'; // za začetkom poddogodka
        $resp            = $I->failToUpdate($this->restUrl, $data['id'], $data);
        codecept_debug($resp);
        $I->assertEquals(1001970, $resp[0]['code'], "napačen interval");


        $data          = $this->obj1;
        $data['konec'] = '2014-05-07T21:00:00+0200'; // pred koncem poddogodka
        $resp          = $I->failToUpdate($this->restUrl, $data['id'], $data);
        codecept_debug($resp);
        $I->assertEquals(1001970, $resp[0]['code'], "napačen interval");


        /*
         * gostovanje ne sme biti poddogodek gostovanja
         */
        $data                        = $this->obj1;
        $data['nadrejenoGostovanje'] = $this->lookGostovanjeId1;
        $ent                         = $I->successfullyUpdate($this->restUrl, $data['id'], $data);
        codecept_debug($ent);
        $I->assertTrue(array_key_exists('id', $ent));
        $I->assertFalse(array_key_exists('nadrejenoGostovanje', $ent), "nadrejenega gostovanja pri gostovanju ne sme biti v formi");
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

        $zacetek = '2014-05-01T20:00:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $I->assertGuid($ent['id']);
        $I->assertEquals($ent['vrsta'], 'uu');
        $I->assertEquals($ent['drzava'], $this->lookDrzava1);
        $I->assertEquals($ent['title'], "Gostovanje $zacetek");
        $I->assertEquals($ent['status'], '200s');
        $I->assertEquals($ent['zacetek'], $zacetek);
        $I->assertEquals($ent['konec'], '2014-05-20T23:00:00+0200');
        $I->assertEquals($ent['sezona'], $this->lookSezona2014['id']);
        $I->assertEquals($ent['barva'], '#123456', "barva");
        $I->assertEquals($ent['kraj'], 'zzCity');
        $I->assertEquals($ent['zamejstvo'], true);

        $I->assertTrue(isset($ent['podrejeniDogodki']));
        $I->assertEquals(4, count($ent['podrejeniDogodki']), "število podrejenih dogodkov (2+2)");
        $I->assertEquals($ent['dogodek']['id'], $this->objDogodek['id']);
        $I->assertEquals(3, count($ent['dogodek']['terminiStoritve']), "število terminov storitve");
    }

    /**
     * preberemo relacije
     * 
     * @depends createVecPodDogodkov
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeSPodDogodki(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj1['id'], "podrejeniDogodki", "");
        $I->assertEquals(4, count($resp));

        // get po popa id  
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj1['id'], "podrejeniDogodki", $this->objDogPredstava1['id']);
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


        /*
         * pri brisanju naslednjega preverimo, če je v poddogodkih izbrisal 
         * relacijo nanj
         */
        $ent        = $I->successfullyGet($this->restUrl, $this->obj1['id']);
        codecept_debug($ent);
        $poddogodek = $I->successfullyGet($this->dogodekUrl, $ent['podrejeniDogodki'][0]);
        codecept_debug($poddogodek);
        $I->assertEquals($ent['id'], $poddogodek['nadrejenoGostovanje']);     // prej še je notrii

        $I->successfullyDelete($this->restUrl, $ent['id']);
        $I->failToGet($this->restUrl, $ent['id']);
        $poddogodek = $I->successfullyGet($this->dogodekUrl, $ent['podrejeniDogodki'][0]);
        codecept_debug($poddogodek);
        $I->assertEmpty($poddogodek['nadrejenoGostovanje']);    // uspešno izbrisano
    }

}
