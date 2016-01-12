<?php

namespace Rest\Funkcija;

use ApiTester;

/**
 * Description of FunkcijaCest

 * 
 * metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto - je ni
 *      relacije z drugimi entitetami
 *      - alternacije O2M
 *      - uprizoritev 
 *      - privzeta alternacija
 *      - tipFunkcije 
 * 
 * getlist različne variante relacij
 *      - vse
 *      - uprizoritev
 *      - podrocje
 * 
 * @author rado
 */
class FunkcijaCest
{

    private $restUrl        = '/rest/funkcija';
    private $uprizoritevUrl = '/rest/uprizoritev';
    private $besediloUrl    = '/rest/besedilo';
    private $osebaUrl       = '/rest/oseba';
    private $alternacijaUrl = '/rest/alternacija';
    private $tipFunkcijeUrl = '/rest/tipfunkcije';
    private $obj1;
    private $obj2;
    private $obj3teh;
    private $obj4;
    private $objOseba;
    private $lookOseba1;
    private $lookOseba2;
    private $lookOseba3;
    private $lookOseba4;
    private $lookOseba5;
    private $objAlternacija;
    private $objAlternacija1;
    private $objAlternacija2;
    private $objUprizoritev;
    private $objBesedilo;
    private $objTipFunkcije;
    private $lookTipFunkcije1Um;
    private $lookTipFunkcije2Te;
    private $lookTipFunkcije3;
    private $lookUprizoritev1;
    private $lookUprizoritev2;

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
    public function lookupUprizoritev(ApiTester $I)
    {
        $this->lookUprizoritev1 = $look                   = $I->lookupEntity("uprizoritev", "0001", false);
        $I->assertNotEmpty($look);
        $this->lookUprizoritev2 = $look                   = $I->lookupEntity("uprizoritev", "0002", false);
        $I->assertNotEmpty($look);
    }

    /**
     *  kreiramo besedilo
     * 
     * @param ApiTester $I
     */
    public function createBesedilo(ApiTester $I)
    {
        $data              = [
            'naslov'          => 'zz',
            'avtor'           => 'zz',
            'podnaslov'       => 'zz',
            'jezik'           => 'zz',
            'naslovIzvirnika' => 'zz',
            'datumPrejema'    => '2010-02-01T00:00:00+0100',
            'moskeVloge'      => 1,
            'zenskeVloge'     => 2,
            'prevajalec'      => 'zz',
            'povzetekVsebine' => 'zz',
        ];
        $this->objBesedilo = $ent               = $I->successfullyCreate($this->besediloUrl, $data);
        $I->assertGuid($ent['id']);
        $I->assertEquals($ent['naslov'], 'zz');
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupTipFunkcije(ApiTester $I)
    {
        $this->lookTipFunkcije1Um = $ent                      = $I->lookupEntity("tipfunkcije", "01", false);
        codecept_debug($ent);
        $I->assertGuid($ent['id']);
        $I->assertEquals('umetnik', $ent['podrocje']);

        $this->lookTipFunkcije2Te = $ent                      = $I->lookupEntity("tipfunkcije", "17", false);
        codecept_debug($ent);
        $I->assertGuid($ent['id']);
        $I->assertEquals('tehnik', $ent['podrocje']);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupOsebo(ApiTester $I)
    {
        $this->lookOseba1 = $look             = $I->lookupEntity("oseba", "0006", false);
        $I->assertNotEmpty($look);

        $this->lookOseba2 = $look             = $I->lookupEntity("oseba", "0007", false);
        $I->assertGuid($look['id']);

        $this->lookOseba3 = $look             = $I->lookupEntity("oseba", "0008", false);
        $I->assertGuid($look['id']);

        $this->lookOseba4 = $look             = $I->lookupEntity("oseba", "0009", false);
        $I->assertGuid($look['id']);

        $this->lookOseba5 = $look             = $I->lookupEntity("oseba", "0010", false);
        $I->assertGuid($look['id']);
    }

    /**
     *  napolnimo vsaj en zapis
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data       = [
//            'podrocje'          => 'igralec',   
            'vodjaEkipe'        => FALSE,
            'naziv'             => 'zz',
            'komentar'          => 'zz',
            'velikost'          => 'velika',
            'pomembna'          => true,
            'sort'              => 8,
            'sePlanira'         => true,
            'dovoliPrekrivanje' => false,
            'uprizoritev'       => $this->lookUprizoritev1['id'],
            'privzeti'          => $this->objAlternacija['id'], //$$ to ne deluje izgleda - jemlje kot null?
            'tipFunkcije'       => $this->lookTipFunkcije1Um['id'],
            'maxPrekrivanj'     => 3,
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals($ent['naziv'], 'zz');
        $I->assertGuid($ent['id']);

        /*
         *  kreiramo še en zapis
         */
        $data       = [
            'vodjaEkipe'        => FALSE,
            'naziv'             => 'aa',
            'komentar'          => 'aa',
            'velikost'          => 'mala',
            'pomembna'          => false,
            'sort'              => 1,
            'sePlanira'         => true,
            'dovoliPrekrivanje' => false,
            'uprizoritev'       => $this->lookUprizoritev1['id'],
            'privzeti'          => null,
            'tipFunkcije'       => $this->lookTipFunkcije1Um['id'],
            'maxPrekrivanj'     => 4,
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals($ent['naziv'], 'aa');
        $I->assertGuid($ent['id']);

        /*
         *  kreiramo še en zapis s področjem tehnik
         */
        $data          = [
            'tipFunkcije'       => $this->lookTipFunkcije2Te['id'],
            'vodjaEkipe'        => FALSE,
            'naziv'             => 'teh',
            'komentar'          => 'teh',
            'velikost'          => 'mala',
            'pomembna'          => false,
            'sort'              => 4,
            'sePlanira'         => false,
            'dovoliPrekrivanje' => true,
            'uprizoritev'       => $this->lookUprizoritev1['id'],
            'privzeti'          => null,
            'maxPrekrivanj'     => 4,
        ];
        $this->obj3teh = $ent           = $I->successfullyCreate($this->restUrl, $data);
        codecept_debug($ent);
        $I->assertEquals($ent['podrocje'], 'tehnik');
        $I->assertGuid($ent['id']);
    }

    /**
     *  kreiramo zapis
     * 
     * @depends lookupOsebo
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function createVecAlternacij(ApiTester $I)
    {
        $data                  = [
            'zaposlen'     => true,
            'funkcija'     => $this->obj2['id'],
            'sodelovanje'  => NULL,
            'oseba'        => $this->lookOseba1['id'],
            'koprodukcija' => NULL,
            'pogodba'      => NULL,
        ];
        $this->objAlternacija1 = $ent                   = $I->successfullyCreate($this->alternacijaUrl, $data);
        $I->assertGuid($ent['id']);

        $data                  = [
            'zaposlen'     => true,
            'funkcija'     => $this->obj2['id'],
            'sodelovanje'  => NULL,
            'oseba'        => $this->lookOseba1['id'],
            'koprodukcija' => NULL,
            'pogodba'      => NULL,
        ];
        $this->objAlternacija2 = $ent                   = $I->successfullyCreate($this->alternacijaUrl, $data);
        $I->assertGuid($ent['id']);

        /*
         * jan-avgust
         */
        $data = [
            'zacetek'      => '2010-01-01T00:00:00+0100',
            'konec'        => '2010-08-31T00:00:00+0100',
            'zaposlen'     => true,
            'funkcija'     => $this->obj2['id'],
            'sodelovanje'  => NULL,
            'oseba'        => $this->lookOseba2['id'],
            'koprodukcija' => NULL,
            'pogodba'      => NULL,
        ];
        $ent  = $I->successfullyCreate($this->alternacijaUrl, $data);
        $I->assertGuid($ent['id']);

        /*
         * junij-december
         */
        $data = [
            'zacetek'      => '2010-06-01T00:00:00+0100',
            'konec'        => '2010-12-31T00:00:00+0100',
            'zaposlen'     => true,
            'funkcija'     => $this->obj2['id'],
            'sodelovanje'  => NULL,
            'oseba'        => $this->lookOseba3['id'],
            'koprodukcija' => NULL,
            'pogodba'      => NULL,
        ];
        $ent  = $I->successfullyCreate($this->alternacijaUrl, $data);
        $I->assertGuid($ent['id']);
    }

    /**
     * preberi vse zapise od uprizoritve
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoUprizoritvi(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?uprizoritev=" . $this->lookUprizoritev1['id'];

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];
        codecept_debug($list);

//        $I->assertEquals(2, $resp['state']['totalRecords']);
        $totRec  = $resp['state']['totalRecords'];
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
        $I->assertEquals(1, $list[0]['sort']);      // odvisno od sortiranja
        $I->assertEquals(8, $list[$totRec - 1]['sort']);      // odvisno od sortiranja
        // še po 2. uprizoritvi
        $listUrl = $this->restUrl . "?uprizoritev=" . $this->lookUprizoritev2['id'];
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];
        $I->assertNotEmpty($list);
        codecept_debug($resp);
        $I->assertGreaterThanOrEqual(8, $resp['state']['totalRecords']);
    }

    /**
     * preberi vse zapise od uprizoritve
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoUprizoritviInPodrocjih(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?uprizoritev=" . $this->lookUprizoritev2['id'] . "&podrocje[]=igralec";
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];
        codecept_debug($resp);
        $I->assertGreaterThanOrEqual(3, $resp['state']['totalRecords']);

        // test validiranja, če področje ni array
//                            $this->expect(is_array($options['podrocje']), "Parameter področje mora biti array", 1000671);
        $listUrl = $this->restUrl . "?uprizoritev=" . $this->lookUprizoritev2['id'] . "&podrocje=igralec";
        $resp    = $I->failToGetList($listUrl, []);
        $I->assertEquals(1000671, $resp[0]['code']);

//        $$ to še moram izvesti - unija večih področij
        // še po večih področjih
        $listUrl = $this->restUrl . "?uprizoritev=" . $this->lookUprizoritev2['id'] . "&podrocje[]=igralec&podrocje[]=umetnik";
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];
        codecept_debug($resp);
        $I->assertGreaterThanOrEqual(5, $resp['state']['totalRecords']);

        // še podobno po inšpicientu in tehnikuj
        $listUrl = $this->restUrl . "?uprizoritev=" . $this->lookUprizoritev2['id'] . "&podrocje[]=tehnik&podrocje[]=inspicient";
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];
        codecept_debug($resp);
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);        //$$ število je verjetno drugačno od 5
    }

    /**
     * preberi planirane funkcije brez aktivnih alternacij
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListPlanBrezAktAlt(ApiTester $I)
    {
        /**
         * 1. datum
         */
        $resp       = $I->successfullyGetList($this->restUrl . "/planbrezakt?uprizoritev=" . $this->lookUprizoritev2['id']
                . "&datum=2015-01-01", []);
        $list       = $resp['data'];
        codecept_debug($list);
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
        $sePlaniraA = array_unique(array_column($list, "sePlanira"));
        codecept_debug($sePlaniraA);
        $I->assertEquals(1, count($sePlaniraA), "vsi vse planira morajo biti true");
        $I->assertEquals(true, $sePlaniraA[0]);
        
        $nazivA = array_unique(array_column($list, "naziv"));
        $I->assertNotContains("Avtor", $nazivA);
        $I->assertContains("Razsvetljava", $nazivA);
        $I->assertNotContains("Inšpicient", $nazivA);
        $I->assertContains("Režija",  $nazivA);

        /**
         * 2. datum
         */
        $resp       = $I->successfullyGetList($this->restUrl . "/planbrezakt?uprizoritev=" . $this->lookUprizoritev2['id']
                . "&datum=2016-01-01", []);
        $list       = $resp['data'];
        codecept_debug($list);
        $sePlaniraA = array_unique(array_column($list, "sePlanira"));
        codecept_debug($sePlaniraA);
        $nazivA = array_unique(array_column($list, "naziv"));
        $I->assertNotContains("Avtor", $nazivA);
        $I->assertNotContains("Razsvetljava", $nazivA);
        $I->assertNotContains("Inšpicient", $nazivA);
        $I->assertNotContains("Režija",  $nazivA);


        /**
         * 3. datum
         */
        $resp       = $I->successfullyGetList($this->restUrl . "/planbrezakt?uprizoritev=" . $this->lookUprizoritev2['id']
                . "&datum=2016-01-20", []);
        $list       = $resp['data'];
        codecept_debug($list);
        $sePlaniraA = array_unique(array_column($list, "sePlanira"));
        codecept_debug($sePlaniraA);
        $nazivA = array_unique(array_column($list, "naziv"));
        $I->assertNotContains("Avtor", $nazivA);
        $I->assertContains("Razsvetljava", $nazivA);
        $I->assertContains("Inšpicient", $nazivA);
        $I->assertNotContains("Režija",  $nazivA);
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent             = $this->obj1;
        $ent['velikost'] = 'mala';

        $this->obj1 = $entR       = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['velikost'], 'mala');


        /**
         * še preverjanja avtorizacij, posebnih dovoljenj
         */
        $entTeh = $this->obj3teh;
        $I->assertEquals('tehnik', $entTeh['podrocje']);
        $entUm  = $this->obj2;                            //netehnik
        $I->assertNotEquals('tehnik', $entUm['podrocje']);

        /*
         * uporabnik brez Funkcija-vse dovoljenja
         * ne tehnika ne sme spreminjati
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vinko, \IfiTest\AuthPage::$vinkoPass);
        $resp                  = $I->failToUpdate($this->restUrl, $entUm['id'], $entUm);
        codecept_debug($resp);
        $I->assertEquals(1000101, $resp[0]['code']);
        /**
         * tehnika lahko spremeni
         */
        $resp                  = $I->successfullyUpdate($this->restUrl, $entTeh['id'], $entTeh);
        codecept_debug($resp);
        /*
         * ne more spremeniti področja funkcije
         */
        $entTeh['tipFunkcije'] = $this->lookTipFunkcije1Um['id'];
        $resp                  = $I->failToUpdate($this->restUrl, $entTeh['id'], $entTeh);
        codecept_debug($resp);
        $I->assertEquals(1000672, $resp[0]['code']);

        /*
         * uporabnik s Funkcija-vse dovoljenjem
         * ne tehnika  sme spreminjati
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vihra, \IfiTest\AuthPage::$vihraPass);
        $resp = $I->successfullyUpdate($this->restUrl, $entUm['id'], $entUm);
        codecept_debug($resp);
        /**
         * tehnika lahko spremeni
         */
        $resp = $I->successfullyUpdate($this->restUrl, $entTeh['id'], $entTeh);
        codecept_debug($resp);
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

        $I->assertGuid($ent['id']);
        $I->assertEquals($ent['podrocje'], $this->lookTipFunkcije1Um['podrocje'], "področje iz tipa funkcije");
        $I->assertEquals($ent['vodjaEkipe'], FALSE);
        $I->assertEquals($ent['naziv'], 'zz');
        $I->assertEquals($ent['komentar'], 'zz');
        $I->assertEquals($ent['velikost'], 'mala', "velikost funkcije");
        $I->assertEquals($ent['pomembna'], true);
        $I->assertEquals($ent['sort'], 8);
        $I->assertEquals($ent['uprizoritev'], $this->lookUprizoritev1['id']);
        $I->assertEquals($ent['privzeti'], $this->objAlternacija['id'], "privzeti");
        $I->assertEquals($ent['tipFunkcije'], $this->lookTipFunkcije1Um['id'], "tip funkcije");
        $I->assertEquals($ent['maxPrekrivanj'], 3, "maks prekrivanj");

        $I->assertTrue(isset($ent['alternacije']));

        $I->assertEquals(0, count($ent['alternacije']));
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
     * preberemo relacije
     * 
     * @depends createVecAlternacij
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeZAlternacijami(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "alternacije", "");
        $I->assertGreaterThanOrEqual(2, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "alternacije", $this->objAlternacija1['id']);
        $I->assertEquals(1, count($resp));
    }

    /**
     * napolnimo vsaj en zapis
     *
     * @param ApiTester $I
     */
    public function createBrezTipafunkcije(ApiTester $I)
    {
        $data = [
            'tipFunkcije'       => null,
            'vodjaEkipe'        => FALSE,
            'naziv'             => 'btf',
            'komentar'          => 'btf',
            'velikost'          => 'velika',
            'pomembna'          => true,
            'sort'              => 11,
            'sePlanira'         => true,
            'dovoliPrekrivanje' => false,
            'uprizoritev'       => $this->lookUprizoritev1['id'],
            'privzeti'          => $this->objAlternacija['id'],
            'maxPrekrivanj'     => 34,
        ];
        $resp = $I->failToCreate($this->restUrl, $data);
        $I->assertContains("required", $resp[0]['message'], "tip funkcije obvezen podatek");
    }

}
