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
    private $drzavaUrl      = '/rest/drzava';
    private $obj1;
    private $obj2;
    private $objDogodek;
    private $gostovanjeUrl  = '/rest/gostovanje';
    private $objGostovanje;
    private $lookDrzavaId;
    private $objUprizoritev;
    private $lookUprizoritev1;
    private $lookUprizoritev2;
    private $lookUprizoritev3;
    private $altUpr2Ids;
    private $altUpr1Ids;
    private $altUpr3Ids;
    private $lookProstor1;
    private $lookProstor2;
    private $lookProstor3;
    private $abonmaUrl      = '/rest/abonma';
    private $objAbonma1;
    private $objAbonma2;
    private $objAbonma3;
    private $lookSezona2015;
    private $lookSezona2016;
    private $lookSezona2017;
    private $lookSezona2014;
    private $lookOseba1;
    private $lookOseba2;
    private $lookOseba3;
    private $lookPredstavaIdA;
    private $lookPredstavaIdB;
    private $lookPredstavaIdC;
    private $lookPredstavaIdD;
    private $lookPredstavaIdE;
    private $lookPredstavaIdF;
    private $lookPredstavaIdG;
    private $lookPredstavaIdH;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     * @param ApiTester $I
     */
    public function getListDogPredstave(ApiTester $I)
    {
        /*
         * dogodki, ki so predstave
         */
        $resp                   = $I->successfullyGetList($this->dogodekUrl
                . "?q=Predstava 1.&zacetek=2000-01-01&konec=2200-05-05&razred[]=100s", []);
        $list                   = $resp['data'];
        codecept_debug($list);
        $I->assertEquals(1, $resp['state']['totalRecords']);
        $ent                    = array_pop($list);
        $this->lookPredstavaIdA = $predstavaId            = $ent['predstava'];
        codecept_debug($predstavaId);



        $resp                   = $I->successfullyGetList($this->dogodekUrl
                . "?q=Predstava 7.&zacetek=2000-01-01&konec=2200-05-05&razred[]=100s", []);
        $list                   = $resp['data'];
        codecept_debug($list);
        $I->assertEquals(1, $resp['state']['totalRecords']);
        $ent                    = array_pop($list);
        $this->lookPredstavaIdB = $predstavaId            = $ent['predstava'];
        codecept_debug($predstavaId);

        $resp                   = $I->successfullyGetList($this->dogodekUrl
                . "?q=Predstava 11.&zacetek=2000-01-01&konec=2200-05-05&razred[]=100s", []);
        $list                   = $resp['data'];
        codecept_debug($list);
        $I->assertEquals(1, $resp['state']['totalRecords']);
        $ent                    = array_pop($list);
        $this->lookPredstavaIdC = $predstavaId            = $ent['predstava'];
        codecept_debug($predstavaId);

        $resp                   = $I->successfullyGetList($this->dogodekUrl
                . "?q=Predstava 8.&zacetek=2000-01-01&konec=2200-05-05&razred[]=100s", []);
        $list                   = $resp['data'];
        codecept_debug($list);
        $I->assertEquals(1, $resp['state']['totalRecords']);
        $ent                    = array_pop($list);
        $this->lookPredstavaIdD = $predstavaId            = $ent['predstava'];
        codecept_debug($predstavaId);

        $resp                   = $I->successfullyGetList($this->dogodekUrl
                . "?q=Predstava 14.&zacetek=2000-01-01&konec=2200-05-05&razred[]=100s", []);
        $list                   = $resp['data'];
        codecept_debug($list);
        $I->assertEquals(1, $resp['state']['totalRecords']);
        $ent                    = array_pop($list);
        $this->lookPredstavaIdE = $predstavaId            = $ent['predstava'];
        codecept_debug($predstavaId);

        $resp                   = $I->successfullyGetList($this->dogodekUrl
                . "?q=Predstava 6.&zacetek=2000-01-01&konec=2200-05-05&razred[]=100s", []);
        $list                   = $resp['data'];
        codecept_debug($list);
        $I->assertEquals(1, $resp['state']['totalRecords']);
        $ent                    = array_pop($list);
        $this->lookPredstavaIdF = $predstavaId            = $ent['predstava'];
        codecept_debug($predstavaId);

        $resp                   = $I->successfullyGetList($this->dogodekUrl
                . "?q=Predstava 13.&zacetek=2000-01-01&konec=2200-05-05&razred[]=100s", []);
        $list                   = $resp['data'];
        codecept_debug($list);
        $I->assertEquals(1, $resp['state']['totalRecords']);
        $ent                    = array_pop($list);
        $this->lookPredstavaIdG = $predstavaId            = $ent['predstava'];
        codecept_debug($predstavaId);

        $resp                   = $I->successfullyGetList($this->dogodekUrl
                . "?q=Predstava 12.&zacetek=2000-01-01&konec=2200-05-05&razred[]=100s", []);
        $list                   = $resp['data'];
        codecept_debug($list);
        $I->assertEquals(1, $resp['state']['totalRecords']);
        $ent                    = array_pop($list);
        $this->lookPredstavaIdH = $predstavaId            = $ent['predstava'];
        codecept_debug($predstavaId);
    }

    /**
     * 
     * @param ApiTester $I
     */
    private function getDogPredstaveADoH(ApiTester $I)
    {
        codecept_debug(__FUNCTION__);

        $entAH['A'] = $I->successfullyGet($this->restUrl, $this->lookPredstavaIdA);
        $entAH['B'] = $I->successfullyGet($this->restUrl, $this->lookPredstavaIdB);
        $entAH['C'] = $I->successfullyGet($this->restUrl, $this->lookPredstavaIdC);
        $entAH['D'] = $I->successfullyGet($this->restUrl, $this->lookPredstavaIdD);
        $entAH['E'] = $I->successfullyGet($this->restUrl, $this->lookPredstavaIdE);
        $entAH['F'] = $I->successfullyGet($this->restUrl, $this->lookPredstavaIdF);
        $entAH['G'] = $I->successfullyGet($this->restUrl, $this->lookPredstavaIdG);
        $entAH['H'] = $I->successfullyGet($this->restUrl, $this->lookPredstavaIdH);

        return $entAH;
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
     * @depends lookupUprizoritev
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $zacetek = '2014-05-07T20:00:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $data    = [
            'uprizoritev'         => $this->lookUprizoritev1['id'],
            'title'               => "Predstava $zacetek",
            'status'              => '200s',
            'zacetek'             => $zacetek,
            'konec'               => '2014-05-07T23:00:00+0200',
            'prostor'             => $this->lookProstor1['id'],
            'barva'               => '#123456',
            'nadrejenoGostovanje' => $this->objGostovanje['id'],
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
        $I->assertEquals($ent['zacetek'], $data['zacetek']);
        $I->assertEquals($ent['konec'], $data['konec']);
        $I->assertEquals($ent['prostor'], $data['prostor']);
        $I->assertEquals($ent['barva'], $data['barva']);
        $I->assertEquals($ent['nadrejenoGostovanje'], $data['nadrejenoGostovanje']);

        /**
         * preveri dogodek
         */
        $this->objDogodek = $dogodek          = $I->successfullyGet($this->dogodekUrl, $ent['dogodek']['id']);

        codecept_debug($dogodek);
        $I->assertGuid($dogodek['id']);
        $I->assertEquals($dogodek['zacetek'], $data['zacetek'], "začetek");
        $I->assertEquals($dogodek['konec'], $data['konec'], "konec");
        $I->assertEquals($dogodek['prostor']['id'], $data['prostor']);
        $I->assertEquals($dogodek['barva'], $data['barva']);
        $I->assertEquals($dogodek['nadrejenoGostovanje'], $data['nadrejenoGostovanje']);

        // kreiramo še en zapis
        $zacetek        = '2014-05-08T20:00:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $data           = [
            'uprizoritev' => $this->lookUprizoritev1['id'],
            'title'       => "Predstava $zacetek",
            'status'      => '400s',
            'zacetek'     => $zacetek,
            'konec'       => '2014-05-08T23:00:00+0200',
            'prostor'     => null, // če je gostovanje ne rabimo prostora
        ];
        $parAlternacije = '';   //init
        for ($i = 1; $i <= 3; $i++) {
            codecept_debug($this->altUpr1Ids);
            $parAlternacije .= 'alternacija[]=' . $this->altUpr1Ids[$i] . '&';
        }
        $parDezurni = 'dezurni[]=' . $this->lookOseba1['id'] . '&'
                . 'dezurni[]=' . $this->lookOseba2['id'] . '&'
                . 'dezurni[]=' . $this->lookOseba3['id'] . '&';
        $parDelte   = 'deltaZac=-44&deltaKon=33&';
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl . "?" . $parAlternacije . $parDezurni . $parDelte, $data);
        $I->assertGuid($ent['id']);


        /**
         * kreiranje predstave z napačnimi alternacijami
         */
        $zacetek        = '2014-05-08T20:00:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $data           = [
            'uprizoritev' => $this->lookUprizoritev2['id'],
            'title'       => "Predstava $zacetek",
            'status'      => '400s',
            'zacetek'     => $zacetek,
            'konec'       => '2014-05-08T23:00:00+0200',
            'prostor'     => null, // če je gostovanje ne rabimo prostora
        ];
        $parAlternacije = '';   //init
        for ($i = 1; $i <= 3; $i++) {
            codecept_debug($this->altUpr1Ids);
            $parAlternacije .= 'alternacija[]=' . $this->altUpr1Ids[$i] . '&';  // alternacije od druge uprizoritve
        }
        $parDezurni = 'dezurni[]=' . $this->lookOseba1['id'] . '&'
                . 'dezurni[]=' . $this->lookOseba2['id'] . '&'
                . 'dezurni[]=' . $this->lookOseba3['id'] . '&';
        $parDelte   = 'deltaZac=-44&deltaKon=33&';
        $parGosti   = 'gost[]=' . $this->lookOseba1['id'] . '&'
                . 'gost[]=' . $this->lookOseba2['id'] . '&';
        $parDezurni = 'dezurni[]=' . $this->lookOseba1['id'];
        $resp       = $I->failToCreate($this->restUrl . "?" . $parAlternacije, $data);
        codecept_debug($resp);
        $I->assertEquals(1001090, $resp[0]['code']);

        /*
         * gost ni dovoljen
         */
        $resp = $I->failToCreate($this->restUrl . "?" . $parGosti, $data);
        codecept_debug($resp);
        $I->assertEquals(1001091, $resp[0]['code']);
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
        $I->assertEquals($ent['uprizoritev']['id'], $this->lookUprizoritev1['id']);
        $I->assertEquals($ent['title'], "uu");
        $I->assertEquals($ent['status'], '200s');
        $I->assertEquals($ent['zacetek'], $zacetek);
        $I->assertEquals($ent['konec'], '2014-05-07T23:00:00+0200');
        $I->assertEquals($ent['sezona'], $this->lookSezona2014['id'], "sezona");
        $I->assertEquals($ent['prostor'], $this->lookProstor1['id'], "prostor");
        $I->assertEquals($ent['barva'], '#123456', "barva");
        $I->assertEquals($ent['nadrejenoGostovanje'], $this->objGostovanje['id'], "nadrejeno gostovanje");
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

    /**
     * Testne predstave, sortirane po začetku::
     *      Ista sezona   Ista uprizoritev
     * A          0              1
     * B          0              0
     * C          1              1
     * D          1              0
     * 
     * E          1              0
     * F          1              1
     * G          0              0
     * H          0              1
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function azurirajZaRacunanjeZaporednih(ApiTester $I)
    {
        /*
         * zapomnimo si začetne zaporedne številke
         */
        $entAH = $this->getDogPredstaveADoH($I);
        codecept_debug($entAH);
        /*
         * začetne zaporedne številke
         */
        foreach (['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'] as $j) {
            $zapS[$j]  = (int) $entAH[$j]['zaporednaSezVsehUpr'];
            $zapU[$j]  = (int) $entAH[$j]['zaporedna'];
            $zapUS[$j] = (int) $entAH[$j]['zaporednaSez'];
        }
        codecept_debug($zapS);
        codecept_debug($zapU);
        codecept_debug($zapUS);

        /*
         * vrinemo predstavo med D  in E
         */
        $zacetek = '2015-05-19T10:00:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $data    = [
            'uprizoritev' => $this->lookUprizoritev1['id'],
            'title'       => "Predstava $zacetek",
            'status'      => '200s',
            'zacetek'     => $zacetek,
            'konec'       => '2015-05-19T10:00:00+0200',
            'prostor'     => null, // če je gostovanje ne rabimo prostora
        ];
        $entI    = $I->successfullyCreate($this->restUrl, $data);
        /*
         * preverimo, če so se zaporedne ustrezno spremenile
         */
        $entAH   = $this->getDogPredstaveADoH($I);
        $I->assertGreaterThan($entAH['C']['zaporedna'], $entI['zaporedna']);
        $I->assertLessThan($entAH['F']['zaporedna'], $entI['zaporedna']);
        $I->assertEquals($zapU['A'], $entAH['A']['zaporedna']);
        $I->assertEquals($zapU['B'], $entAH['B']['zaporedna']);
        $I->assertEquals($zapU['C'], $entAH['C']['zaporedna']);
        $I->assertEquals($zapU['D'], $entAH['D']['zaporedna']);
        $I->assertEquals($zapU['E'], $entAH['E']['zaporedna']);
        $I->assertEquals($zapU['F'] + 1, $entAH['F']['zaporedna'], "zap F");
        $I->assertEquals($zapU['G'], $entAH['G']['zaporedna']);
        $I->assertEquals($zapU['H'] + 1, $entAH['H']['zaporedna']);


        $I->assertGreaterThan($entAH['C']['zaporednaSez'], $entI['zaporednaSez']);
        $I->assertLessThan($entAH['F']['zaporednaSez'], $entI['zaporednaSez']);
        $I->assertEquals($zapUS['A'], $entAH['A']['zaporednaSez']);
        $I->assertEquals($zapUS['B'], $entAH['B']['zaporednaSez']);
        $I->assertEquals($zapUS['C'], $entAH['C']['zaporednaSez']);
        $I->assertEquals($zapUS['D'], $entAH['D']['zaporednaSez']);
        $I->assertEquals($zapUS['E'], $entAH['E']['zaporednaSez']);
        $I->assertEquals($zapUS['F'] + 1, $entAH['F']['zaporednaSez']);
        $I->assertEquals($zapUS['G'], $entAH['G']['zaporednaSez']);
        $I->assertEquals($zapUS['H'], $entAH['H']['zaporednaSez']);

        $I->assertGreaterThan($entAH['C']['zaporednaSezVsehUpr'], $entI['zaporednaSezVsehUpr']);
        $I->assertGreaterThan($entAH['D']['zaporednaSezVsehUpr'], $entI['zaporednaSezVsehUpr']);
        $I->assertLessThan($entAH['E']['zaporednaSezVsehUpr'], $entI['zaporednaSezVsehUpr']);
        $I->assertLessThan($entAH['F']['zaporednaSezVsehUpr'], $entI['zaporednaSezVsehUpr']);
        $I->assertEquals($zapS['A'], $entAH['A']['zaporednaSezVsehUpr']);
        $I->assertEquals($zapS['B'], $entAH['B']['zaporednaSezVsehUpr']);
        $I->assertEquals($zapS['C'], $entAH['C']['zaporednaSezVsehUpr']);
        $I->assertEquals($zapS['D'], $entAH['D']['zaporednaSezVsehUpr']);
        $I->assertEquals($zapS['E'] + 1, $entAH['E']['zaporednaSezVsehUpr']);
        $I->assertEquals($zapS['F'] + 1, $entAH['F']['zaporednaSezVsehUpr']);
        $I->assertEquals($zapS['G'], $entAH['G']['zaporednaSezVsehUpr']);
        $I->assertEquals($zapS['H'], $entAH['H']['zaporednaSezVsehUpr']);




        /*
         * spremenimo status predstavi v odpovedano
         */
        $entI['status'] = "610s";       // odpovedan
        $entI           = $I->successfullyUpdate($this->restUrl, $entI['id'], $entI);

        $entAH = $this->getDogPredstaveADoH($I);
        $I->assertEquals($zapU['A'], $entAH['A']['zaporedna']);
        $I->assertEquals($zapU['B'], $entAH['B']['zaporedna']);
        $I->assertEquals($zapU['C'], $entAH['C']['zaporedna']);
        $I->assertEquals($zapU['D'], $entAH['D']['zaporedna']);
        $I->assertEquals($zapU['E'], $entAH['E']['zaporedna']);
        $I->assertEquals($zapU['F'], $entAH['F']['zaporedna'], "zap F");
        $I->assertEquals($zapU['G'], $entAH['G']['zaporedna']);
        $I->assertEquals($zapU['H'], $entAH['H']['zaporedna']);


        $I->assertEquals($zapUS['A'], $entAH['A']['zaporednaSez']);
        $I->assertEquals($zapUS['B'], $entAH['B']['zaporednaSez']);
        $I->assertEquals($zapUS['C'], $entAH['C']['zaporednaSez']);
        $I->assertEquals($zapUS['D'], $entAH['D']['zaporednaSez']);
        $I->assertEquals($zapUS['E'], $entAH['E']['zaporednaSez']);
        $I->assertEquals($zapUS['F'], $entAH['F']['zaporednaSez']);
        $I->assertEquals($zapUS['G'], $entAH['G']['zaporednaSez']);
        $I->assertEquals($zapUS['H'], $entAH['H']['zaporednaSez']);

        $I->assertEquals($zapS['A'], $entAH['A']['zaporednaSezVsehUpr']);
        $I->assertEquals($zapS['B'], $entAH['B']['zaporednaSezVsehUpr']);
        $I->assertEquals($zapS['C'], $entAH['C']['zaporednaSezVsehUpr']);
        $I->assertEquals($zapS['D'], $entAH['D']['zaporednaSezVsehUpr']);
        $I->assertEquals($zapS['E'], $entAH['E']['zaporednaSezVsehUpr']);
        $I->assertEquals($zapS['F'], $entAH['F']['zaporednaSezVsehUpr']);
        $I->assertEquals($zapS['G'], $entAH['G']['zaporednaSezVsehUpr']);
        $I->assertEquals($zapS['H'], $entAH['H']['zaporednaSezVsehUpr']);



        /*
         * premaknem  predstavo pred prvo v sezoni , ni več odpovedana
         */
        $entI['status']  = "200s";
        $entI['zacetek'] = '2015-04-01T10:00:00+0200';
        $entI['konec']   = '2015-04-01T14:00:00+0200';
        $entI            = $I->successfullyUpdate($this->restUrl, $entI['id'], $entI);
        /*
         * preverimo, če se je prva zaporedna spremenila
         */
        $entAH           = $this->getDogPredstaveADoH($I);
        $I->assertLessThan($entAH['C']['zaporedna'], $entI['zaporedna']);
        $I->assertEquals($zapU['A'], $entAH['A']['zaporedna']);
        $I->assertEquals($zapU['B'], $entAH['B']['zaporedna']);
        $I->assertEquals($zapU['C'] + 1, $entAH['C']['zaporedna']);
        $I->assertEquals($zapU['D'], $entAH['D']['zaporedna']);
        $I->assertEquals($zapU['E'], $entAH['E']['zaporedna']);
        $I->assertEquals($zapU['F'] + 1, $entAH['F']['zaporedna'], "zap F");
        $I->assertEquals($zapU['G'], $entAH['G']['zaporedna']);
        $I->assertEquals($zapU['H'] + 1, $entAH['H']['zaporedna']);


        $I->assertLessThan($entAH['C']['zaporednaSez'], $entI['zaporednaSez']);
        $I->assertEquals($zapUS['A'], $entAH['A']['zaporednaSez']);
        $I->assertEquals($zapUS['B'], $entAH['B']['zaporednaSez']);
        $I->assertEquals($zapUS['C'] + 1, $entAH['C']['zaporednaSez']);
        $I->assertEquals($zapUS['D'], $entAH['D']['zaporednaSez']);
        $I->assertEquals($zapUS['E'], $entAH['E']['zaporednaSez']);
        $I->assertEquals($zapUS['F'] + 1, $entAH['F']['zaporednaSez']);
        $I->assertEquals($zapUS['G'], $entAH['G']['zaporednaSez']);
        $I->assertEquals($zapUS['H'], $entAH['H']['zaporednaSez']);

        $I->assertLessThan($entAH['C']['zaporednaSezVsehUpr'], $entI['zaporednaSezVsehUpr']);
        $I->assertEquals($zapS['A'], $entAH['A']['zaporednaSezVsehUpr']);
        $I->assertEquals($zapS['B'], $entAH['B']['zaporednaSezVsehUpr']);
        $I->assertEquals($zapS['C'] + 1, $entAH['C']['zaporednaSezVsehUpr']);
        $I->assertEquals($zapS['D'] + 1, $entAH['D']['zaporednaSezVsehUpr']);
        $I->assertEquals($zapS['E'] + 1, $entAH['E']['zaporednaSezVsehUpr']);
        $I->assertEquals($zapS['F'] + 1, $entAH['F']['zaporednaSezVsehUpr']);
        $I->assertEquals($zapS['G'], $entAH['G']['zaporednaSezVsehUpr']);
        $I->assertEquals($zapS['H'], $entAH['H']['zaporednaSezVsehUpr']);


        /*
         * brišemo predstavo
         */
        $entI  = $I->successfullyDelete($this->restUrl, $entI['id']);
        /*
         * preverimo, če so se zaporedne vrnile v začetno stqanje
         */
        $entAH = $this->getDogPredstaveADoH($I);
        $I->assertEquals($zapU['A'], $entAH['A']['zaporedna']);
        $I->assertEquals($zapU['B'], $entAH['B']['zaporedna']);
        $I->assertEquals($zapU['C'], $entAH['C']['zaporedna']);
        $I->assertEquals($zapU['D'], $entAH['D']['zaporedna']);
        $I->assertEquals($zapU['E'], $entAH['E']['zaporedna']);
        $I->assertEquals($zapU['F'], $entAH['F']['zaporedna'], "zap F");
        $I->assertEquals($zapU['G'], $entAH['G']['zaporedna']);
        $I->assertEquals($zapU['H'], $entAH['H']['zaporedna']);


        $I->assertEquals($zapUS['A'], $entAH['A']['zaporednaSez']);
        $I->assertEquals($zapUS['B'], $entAH['B']['zaporednaSez']);
        $I->assertEquals($zapUS['C'], $entAH['C']['zaporednaSez']);
        $I->assertEquals($zapUS['D'], $entAH['D']['zaporednaSez']);
        $I->assertEquals($zapUS['E'], $entAH['E']['zaporednaSez']);
        $I->assertEquals($zapUS['F'], $entAH['F']['zaporednaSez']);
        $I->assertEquals($zapUS['G'], $entAH['G']['zaporednaSez']);
        $I->assertEquals($zapUS['H'], $entAH['H']['zaporednaSez']);

        $I->assertEquals($zapS['A'], $entAH['A']['zaporednaSezVsehUpr']);
        $I->assertEquals($zapS['B'], $entAH['B']['zaporednaSezVsehUpr']);
        $I->assertEquals($zapS['C'], $entAH['C']['zaporednaSezVsehUpr']);
        $I->assertEquals($zapS['D'], $entAH['D']['zaporednaSezVsehUpr']);
        $I->assertEquals($zapS['E'], $entAH['E']['zaporednaSezVsehUpr']);
        $I->assertEquals($zapS['F'], $entAH['F']['zaporednaSezVsehUpr']);
        $I->assertEquals($zapS['G'], $entAH['G']['zaporednaSezVsehUpr']);
        $I->assertEquals($zapS['H'], $entAH['H']['zaporednaSezVsehUpr']);
    }

}
