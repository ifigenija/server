<?php

namespace Rest\Pogodba;

use ApiTester;

/**
 * Description of PogodbaCest
 * 
 *      priprava ostalih entitet
 *      - create popa
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto
 *      - brez popa in osebe
 *      - z popa in osebo
 *      relacije z drugimi entitetami
 *      - alternacije    O2M
 *      - oseba
 *      - popa    
 *      - trr         
 *      getlist različne variante relacij
 *      - vse
 *      - oseba, 
 *      - popa
 *      - uprizoritev
 *      - alternacija
 * 
 * spremembe po nazaj na o2m z alternacijo:
 * - relacija z alternacijo
 * 
 * 
 * @author rado
 */
class PogodbaCest
{

    private $restUrl              = '/rest/pogodba';
    private $popaUrl              = '/rest/popa';
    private $drzavaUrl            = '/rest/drzava';
    private $osebaUrl             = '/rest/oseba';
    private $trrUrl               = '/rest/trr';
    private $alternacijaUrl       = '/rest/alternacija';
    private $obj1;
    private $obj2;
    private $obj3;
    private $obj4;
    private $obj5;
    private $objPopa;
    private $objDrzava;
    private $objOseba;
    private $lookDrzava;
    private $lookPopa1;
    private $lookPopa2;
    private $lookOseba1;
    private $lookOseba2;
    private $lookOseba3;
    private $lookOseba4;
    private $lookFunkcija;
    private $objTrr;
    private $objAlternacija1;
    private $objAlternacija2;
    private $lookAlternacija1;
    private $lookAlternacija2;
    private $lookAlternacija3;
    private $lookAlternacija4;
    private $lookAlternacija5;
    private $lookAlternacija6;
    private $lookupAlternacijaUrl = '/lookup/alternacija';
    private $lookUprizoritev1;
    private $lookUprizoritev2;
    private $zaposlitevUrl          = '/rest/zaposlitev';
    private $objZaposlitev;

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
     * najde državo
     * 
     * @param ApiTester $I
     */
    public function getListDrzava(ApiTester $I)
    {
        $resp            = $I->successfullyGetList($this->drzavaUrl, []);
        $list            = $resp['data'];
        $I->assertNotEmpty($list);
        $this->objDrzava = $drzava          = array_pop($list);
        $I->assertNotEmpty($drzava);
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
        // poiščemo iste osebe, kot so že v alternacijah
        $this->lookOseba1 = $ent              = $I->lookupEntity("oseba", "0009", false);
        $I->assertNotEmpty($ent);

        $this->lookOseba2 = $ent              = $I->lookupEntity("oseba", "0010", false);
        $I->assertNotEmpty($ent);

        $this->lookOseba3 = $ent              = $I->lookupEntity("oseba", "0008", false);
        $I->assertNotEmpty($ent);

        $this->lookOseba4 = $ent              = $I->lookupEntity("oseba", "0012", false);
        $I->assertNotEmpty($ent);
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
     * 
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
     * kreiramo Trr od popa
     * 
     * @depends lookupPopa
     * 
     * @param ApiTester $I
     */
    public function createTrr(ApiTester $I)
    {
        $data         = [
            'stevilka' => 'ZZ123',
            'swift'    => 'ZZ123',
            'bic'      => 'ZZ123',
            'banka'    => 'ZZ123',
            'popa'     => $this->lookPopa1['id'],
            'oseba'    => NULL,
        ];
        $this->objTrr = $trr          = $I->successfullyCreate($this->trrUrl, $data);
        $I->assertEquals('ZZ123', $trr['banka']);
        $I->assertNotEmpty($trr['id']);
    }

    /**
     *  kreiramo zapis
     * 
     * @depends lookupOsebo
     * 
     * @param ApiTester $I
     */
    public function createZaposlitev(ApiTester $I)
    {
        $data                = [
            'status'              => 'A',
            'zacetek'             => '2010-02-01T00:00:00+0100',
            'konec'               => '2010-02-01T00:00:00+0100',
            'tip'                 => 1,
            'delovnaObveza'       => 2,
            'malica'              => 'zz',
            'delovnoMesto'        => 'XXX',
            'izmenskoDelo'        => true,
            'individualnaPogodba' => true,
            'jeZaposlenVdrugemJz' => TRUE,
            'jeNastopajoci'       => TRUE,
            'oseba'               => $this->lookOseba2['id'],
        ];
        $this->objZaposlitev = $ent                 = $I->successfullyCreate($this->zaposlitevUrl, $data);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['status'], 'A');
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupAlternacija(ApiTester $I)
    {
        $resp                   = $I->successfullyGetList($this->lookupAlternacijaUrl . '?ident=0001', []);
        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->assertTrue(array_key_exists('data', $resp), "ima data");
        $I->assertTrue(array_key_exists('label', $resp['data'][0]), "ima labelo");
        $I->assertTrue(array_key_exists('totalRecords', $resp['state']), "ima total records");
        $I->assertEquals(1, $resp['state']['totalRecords'], "total records");
        $this->lookAlternacija1 = $resp['data'][0];

        $resp                   = $I->successfullyGetList($this->lookupAlternacijaUrl . '?ident=0002', []);
        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->assertTrue(array_key_exists('data', $resp), "ima data");
        $I->assertTrue(array_key_exists('label', $resp['data'][0]), "ima labelo");
        $I->assertTrue(array_key_exists('totalRecords', $resp['state']), "ima total records");
        $I->assertEquals(1, $resp['state']['totalRecords'], "total records");
        $this->lookAlternacija2 = $resp['data'][0];

        $resp                   = $I->successfullyGetList($this->lookupAlternacijaUrl . '?ident=0006', []);
        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->assertTrue(array_key_exists('data', $resp), "ima data");
        $I->assertTrue(array_key_exists('label', $resp['data'][0]), "ima labelo");
        $I->assertTrue(array_key_exists('totalRecords', $resp['state']), "ima total records");
        $I->assertEquals(1, $resp['state']['totalRecords'], "total records");
        $this->lookAlternacija3 = $resp['data'][0];

        $resp                   = $I->successfullyGetList($this->lookupAlternacijaUrl . '?ident=0003', []);
        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->assertTrue(array_key_exists('data', $resp), "ima data");
        $I->assertTrue(array_key_exists('label', $resp['data'][0]), "ima labelo");
        $I->assertTrue(array_key_exists('totalRecords', $resp['state']), "ima total records");
        $I->assertEquals(1, $resp['state']['totalRecords'], "total records");
        $this->lookAlternacija4 = $resp['data'][0];

        $resp                   = $I->successfullyGetList($this->lookupAlternacijaUrl . '?ident=0005', []);
        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->assertTrue(array_key_exists('data', $resp), "ima data");
        $I->assertTrue(array_key_exists('label', $resp['data'][0]), "ima labelo");
        $I->assertTrue(array_key_exists('totalRecords', $resp['state']), "ima total records");
        $I->assertEquals(1, $resp['state']['totalRecords'], "total records");
        $this->lookAlternacija5 = $resp['data'][0];

        $resp                   = $I->successfullyGetList($this->lookupAlternacijaUrl . '?ident=0007', []);
        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->assertTrue(array_key_exists('data', $resp), "ima data");
        $I->assertTrue(array_key_exists('label', $resp['data'][0]), "ima labelo");
        $I->assertTrue(array_key_exists('totalRecords', $resp['state']), "ima total records");
        $I->assertEquals(1, $resp['state']['totalRecords'], "total records");
        $this->lookAlternacija6 = $resp['data'][0];
    }

    /**
     *  kreiramo pogodbo
     * 
     * @depends lookupOsebo
     * @depends lookupPopa
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data       = [
            'sifra'               => 'ZZ123',
            'vrednostVaj'         => 33.33,
            'vrednostPredstave'   => 44.44,
            'vrednostVaje'        => 22.22,
            'placiloNaVajo'       => false,
            'planiranoSteviloVaj' => 10,
            'aktivna'             => false,
            'opis'                => 'zz',
            'oseba'               => $this->lookOseba1['id'],
            'popa'                => $this->lookPopa1['id'],
            'trr'                 => $this->objTrr['id'],
            'vrednostDo'          => 55.5,
            'zacetek'             => '2012-02-01T00:00:00+0100',
            'konec'               => '2014-02-01T00:00:00+0100',
            'vrednostDoPremiere'  => 66.33,
            'zaposlenVDrJz'       => true,
            'samozaposlen'        => FALSE,
            'jeAvtorskePravice'   => FALSE,
            'igralec'             => true,
            'procentOdInkasa'     => 5.1,
            'jeProcentOdInkasa'   => true,
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['sifra'], 'ZZ123');

        // kreiramo še en zapis
        $data       = [
            'sifra'               => 'WW4',
            'vrednostVaj'         => 33.33,
            'vrednostPredstave'   => 44.22,
            'vrednostVaje'        => 11.11,
            'placiloNaVajo'       => true,
            'planiranoSteviloVaj' => 10,
            'aktivna'             => false,
            'opis'                => 'ww',
            'oseba'               => $this->lookOseba2['id'],
            'popa'                => null,
            'trr'                 => $this->objTrr['id'],
            'vrednostDo'          => 66.5,
            'zacetek'             => '2017-02-01T00:00:00+0100',
            'konec'               => '2017-03-01T00:00:00+0100',
            'vrednostDoPremiere'  => 62.13,
            'zaposlenVDrJz'       => FALSE,
            'samozaposlen'        => true,
            'jeAvtorskePravice'   => false,
            'igralec'             => true,
            'procentOdInkasa'     => 5.1,
            'jeProcentOdInkasa'   => true,
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['sifra'], 'WW4');

        // kreiramo še en zapis
        $data       = [
            'sifra'               => 'A1',
            'vrednostVaj'         => 3.33,
            'vrednostPredstave'   => 4.44,
            'vrednostVaje'        => 2.22,
            'placiloNaVajo'       => false,
            'planiranoSteviloVaj' => 10,
            'aktivna'             => false,
            'opis'                => 'aa',
            'oseba'               => $this->lookOseba3['id'],
            'popa'                => null,
            'trr'                 => $this->objTrr['id'],
            'vrednostDo'          => 77.7,
            'zacetek'             => '2012-03-01T00:00:00+0100',
            'konec'               => '2014-04-01T00:00:00+0100',
            'vrednostDoPremiere'  => 67.72,
            'zaposlenVDrJz'       => true,
            'samozaposlen'        => FALSE,
            'jeAvtorskePravice'   => FALSE,
            'igralec'             => true,
            'procentOdInkasa'     => 5.1,
            'jeProcentOdInkasa'   => true,
        ];
        $this->obj3 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['sifra'], 'A1');

// kreiramo še en zapis, da ga potem lahko izbrišemo
        // kreiramo še en zapis
        $data       = [
            'sifra'               => 'BB',
            'vrednostVaj'         => 3.11,
            'vrednostPredstave'   => 4.11,
            'vrednostVaje'        => 22.22,
            'placiloNaVajo'       => false,
            'planiranoSteviloVaj' => 10,
            'aktivna'             => false,
            'opis'                => 'bb',
            'oseba'               => $this->lookOseba1['id'],
            'popa'                => null,
            'trr'                 => null,
            'vrednostDo'          => 77.1,
            'zacetek'             => '2012-03-01T00:00:00+0100',
            'konec'               => '2013-04-01T00:00:00+0100',
            'vrednostDoPremiere'  => 67.11,
            'zaposlenVDrJz'       => true,
            'samozaposlen'        => FALSE,
            'jeAvtorskePravice'   => FALSE,
            'igralec'             => true,
            'procentOdInkasa'     => 5.1,
            'jeProcentOdInkasa'   => true,
        ];
        $this->obj4 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['sifra'], 'BB');

        // kreiramo še en zapis brez šifre, da vidimo, če jo kreira
        $data       = [
//            'sifra'              => 'BB',
            'vrednostVaj'         => 3.11,
            'vrednostPredstave'   => 4.11,
            'vrednostVaje'        => 22.22,
            'placiloNaVajo'       => false,
            'planiranoSteviloVaj' => 10,
            'aktivna'             => false,
            'opis'                => 'cc',
            'oseba'               => $this->lookOseba1['id'],
            'popa'                => null,
            'trr'                 => null,
            'vrednostDo'          => 77.1,
            'zacetek'             => '2012-03-01T00:00:00+0100',
            'konec'               => '2013-04-01T00:00:00+0100',
            'vrednostDoPremiere'  => 67.11,
            'zaposlenVDrJz'       => true,
            'samozaposlen'        => FALSE,
            'jeAvtorskePravice'   => FALSE,
            'igralec'             => true,
            'procentOdInkasa'     => 5.1,
            'jeProcentOdInkasa'   => true,
        ];
        $this->obj5 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['opis'], 'cc');
    }

    /**
     * spremenim pogodbo
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent         = $this->obj1;
        $ent['opis'] = 'xx';

        $this->obj1 = $entR       = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['opis'], 'xx');
    }

    /**
     * Preberem pogodbo in preverim vsa polja
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function read(\ApiTester $I)
    {
        $ent = $I->successfullyGet($this->restUrl, $this->obj1['id']);

        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['sifra'], 'ZZ123');
        $I->assertEquals($ent['vrednostVaj'], 33.33);
        $I->assertEquals($ent['vrednostVaje'], 22.22);
        $I->assertEquals($ent['vrednostPredstave'], 44.44);
        $I->assertEquals($ent['vrednostVaje'], 22.22);
        $I->assertEquals($ent['placiloNaVajo'], false);
        $I->assertEquals($ent['planiranoSteviloVaj'], 10);

        $I->assertEquals($ent['aktivna'], false);
        $I->assertEquals($ent['jeAvtorskePravice'], false, "jeAvtorskePravice");
        $I->assertEquals($ent['opis'], 'xx');
        $I->assertEquals($ent['oseba']['id'], $this->lookOseba1['id']);
        $I->assertEquals($ent['popa']['id'], $this->lookPopa1['id']);
        $I->assertEquals($ent['trr'], $this->objTrr['id']);
        $I->assertEquals($ent['zacetek'], '2012-02-01T00:00:00+0100');
        $I->assertEquals($ent['konec'], '2014-02-01T00:00:00+0100');
        $I->assertEquals($ent['zaposlenVDrJz'], true, "zaposlen v drugem JZ");
        $I->assertEquals($ent['samozaposlen'], FALSE, "samozaposlen");
        $I->assertEquals($ent['igralec'], true, "igralec");
        $I->assertEquals($ent['procentOdInkasa'], 5.1);
        $I->assertEquals($ent['jeProcentOdInkasa'], true);

        /**
         * $$ še alternacije
         */
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
//    public function getListVse(ApiTester $I)
//    {
//        $listUrl = $this->restUrl . "/vse";
//        codecept_debug($listUrl);
//        $resp    = $I->successfullyGetList($listUrl, []);
//        $list    = $resp['data'];
//        codecept_debug($list);
//
//        $I->assertNotEmpty($list);
//        $I->assertGreaterThanOrEqual(4, $resp['state']['totalRecords']);
////        $I->assertEquals("A1", $list[0]['sifra']);      //glede na sort
//    }

    /**
     * preberi vse naslove od osebe
     * 
     * @depends create
     * @param ApiTester $I
     */
//    public function getListPoOsebi(ApiTester $I)
//    {
//        $listUrl = $this->restUrl . "?oseba=" . $this->lookOseba1['id'];
//        $resp    = $I->successfullyGetList($listUrl, []);
//        $I->assertGreaterThanOrEqual(3, $resp['state']['totalRecords']);
//
//        $listUrl = $this->restUrl . "?oseba=" . $this->lookOseba4['id'];
//        $resp    = $I->successfullyGetList($listUrl, []);
//        $I->assertEquals(0, $resp['state']['totalRecords']);
//    }

    /**
     * preberi vse naslove od poslovnega partnerja
     * 
     * @depends create
     * @param ApiTester $I
     */
//    public function getListPoPopa(ApiTester $I)
//    {
//        $listUrl = $this->restUrl . "?popa=" . $this->lookPopa1['id'];
//        $resp    = $I->successfullyGetList($listUrl, []);
//        $I->assertGreaterThanOrEqual(1, $resp['state']['totalRecords']);
//
//        $listUrl = $this->restUrl . "?popa=" . $this->lookPopa2['id'];
//        $resp    = $I->successfullyGetList($listUrl, []);
//        $I->assertEquals(0, $resp['state']['totalRecords']);
//    }

    /**
     * preberi vse zapise od uprizoritve 
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoUprizoritvi(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?uprizoritev=" . $this->lookUprizoritev2['id'];
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];

        codecept_debug($list);
        $totRec = $resp['state']['totalRecords'];
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
        $I->assertEquals("0001", $list[0]['sifra']);
        $I->assertEquals("0004", $list[$totRec - 1]['sifra']);

        $listUrl = $this->restUrl . "?uprizoritev=" . $this->lookUprizoritev1['id'];
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];

        $I->assertEquals(0, $resp['state']['totalRecords']);
//        $I->assertNotEmpty($list);
    }

    /**
     * kreiramo pogodbo, test validacije
     * 
     * @param ApiTester $I
     */
    public function createPogodboBrezOsebe(ApiTester $I)
    {
//        $this->expect($this->sifra, "sifra je obvezen podatek", 1000342);
//        $this->expect($this->oseba, "Pogodba nima subjekta. Oseba je obvezna", 1000343);
        $data = [
            'sifra'             => 'yy123',
            'vrednostVaj'       => 33.33,
            'vrednostPredstave' => 44.44,
            'vrednostVaje'      => 22.22,
            'aktivna'           => false,
            'opis'              => 'yy',
            'oseba'             => null,
            'popa'              => null,
            'trr'               => null,
            'zacetek'           => '2012-02-01T00:00:00+0100',
            'procentOdInkasa'   => 5.1,
            'jeProcentOdInkasa' => true,
        ];
        // test validacije - oseba mora imeti ime
        $resp = $I->failToCreate($this->restUrl, $data);
        $I->assertNotEmpty($resp);
        // testiramo na enako številko napake kot je v validaciji
        $I->assertEquals(1000343, $resp[0]['code']);
    }

    public function createPogodboNapacniPopa(ApiTester $I)
    {
//        //ta pogodba se ne sme ustvarit
        $data = [
            'sifra'               => 'ZZ999',
            'vrednostVaj'         => 33.33,
            'vrednostPredstave'   => 44.44,
            'vrednostVaje'        => 22.22,
            'placiloNaVajo'       => false,
            'planiranoSteviloVaj' => 10,
            'aktivna'             => false,
            'opis'                => 'zz',
            'oseba'               => $this->lookOseba4['id'],
            'popa'                => $this->lookPopa1['id'],
            'trr'                 => $this->objTrr['id'],
            'vrednostDo'          => 55.5,
            'zacetek'             => '2012-02-01T00:00:00+0100',
            'konec'               => '2014-02-01T00:00:00+0100',
            'vrednostDoPremiere'  => 66.33,
            'zaposlenVDrJz'       => true,
            'samozaposlen'        => FALSE,
            'jeAvtorskePravice'   => FALSE,
            'igralec'             => true,
            'procentOdInkasa'     => 5.1,
            'jeProcentOdInkasa'   => true,
        ];
        $resp = $I->failToCreate($this->restUrl, $data);
        $I->assertNotEmpty($resp);
        // testiramo na enako številko napake kot je v validaciji
        $I->assertEquals(1000346, $resp[0]['code']);
    }

    /**
     * brisanje pogodbe
     * 
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $ent = $I->successfullyGet($this->restUrl, $this->obj1['id']);
        $I->assertNotEmpty($ent);
        $I->successfullyDelete($this->restUrl, $ent['id']);
        $I->failToGet($this->restUrl, $this->obj1['id']);
        // ali je zbrisal pogodbo v alternaciji?  $$
//        $alt = $I->successfullyGet($this->alternacijaUrl, $ent['alternacija']['id']);
//        $I->assertEquals(NULL, $alt['pogodba'], "pogodba alternacije");
    }

    /**
     * test validacije - ne more biti samozaposlen in 
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updatePogodbaSamozaposlenInZaposlenVDrugemJz(ApiTester $I)
    {
//       $this->expect(!($this->zaposlenVDrJz && $this->samozaposlen), "Oseba ne more biti hkrati zaposlena v drugem jz in samozaposlena", 1000345);

        $ent                  = $I->successfullyGet($this->restUrl, $this->obj2['id']);
        $I->assertNotEmpty($ent);
        $ent['samozaposlen']  = true;
        $ent['zaposlenVDrJz'] = true;
        $resp                 = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertNotEmpty($resp);
        // testiramo na enako številko napake kot je v validaciji
        $I->assertEquals(1000345, $resp[0]['code']);
    }

    /**
     * spremenim pogodbo in preverim preračun
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updatePogodbaPreracunaj(ApiTester $I)
    {
        // plačilo na vajo
        $ent                        = $I->successfullyGet($this->restUrl, $this->obj2['id']);
        $I->assertNotEmpty($ent);
        $ent['placiloNaVajo']       = true;
        $ent['vrednostVaje']        = 13.45;
        $ent['planiranoSteviloVaj'] = 10;
        $ent['vrednostVaj']         = 0;
        $ent                        = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $entR                       = $I->successfullyGet($this->restUrl, $this->obj2['id']);
        $I->assertEquals(134.50, $entR['vrednostDoPremiere'], "vrednost do premiere (st.vaj x vrVaje)");


        // plačilo za vse vaje
        $ent                        = $I->successfullyGet($this->restUrl, $this->obj2['id']);
        $I->assertNotEmpty($ent);
        $ent['placiloNaVajo']       = false;
        $ent['vrednostVaje']        = 13.45;
        $ent['planiranoSteviloVaj'] = 10;
        $ent['vrednostVaj']         = 200.14;
        $ent                        = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $entR                       = $I->successfullyGet($this->restUrl, $this->obj2['id']);
        $I->assertEquals(200.14, $entR['vrednostDoPremiere'], "vrednost do premiere (vrednost vseh vaj)");
    }

    /**
     * @param ApiTester $I
     */
    public function lookupFunkcijo(ApiTester $I)
    {
        $this->lookFunkcija = $look               = $I->lookupEntity("funkcija", "Tezej", false);
        $I->assertNotEmpty($look);
    }

    /**
     *  kreiramo zapis
     * 
     * @depends lookupFunkcijo
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function createVecAlternacij(ApiTester $I)
    {
        
        /**
         * kreiramo alternacijo z zaposlitvijo in pogodbo
         */
        $data                  = [
            'zaposlen'   => false, // v validaciji postavimo na true, če je zaposlitev
            'zacetek'    => '2010-02-01T00:00:00+0100',
            'konec'      => '2020-02-01T00:00:00+0100',
            'opomba'     => 'aa',
            'sort'       => 1,
            'privzeti'   => true,
            'aktivna'    => true,
            'funkcija'   => $this->lookFunkcija['id'],
            'zaposlitev' => $this->objZaposlitev['id'],
            'oseba'      => $this->lookOseba2['id'],
            'pomembna'   => TRUE,
            'pogodba'    => $this->obj2['id'],
        ];
        $this->objAlternacija1 = $ent                   = $I->successfullyCreate($this->alternacijaUrl, $data);
        $I->assertGuid($ent['id']);

        // kreiramo še en zapis
        $data                  = [
            'zaposlen'   => false, // v validaciji postavimo na true, če je zaposlitev
            'zacetek'    => '2020-02-01T00:00:00+0100',
            'konec'      => '2030-02-01T00:00:00+0100',
            'opomba'     => 'bb',
            'sort'       => 1,
            'privzeti'   => true,
            'aktivna'    => true,
            'funkcija'   => $this->lookFunkcija['id'],
            'zaposlitev' => null,
            'oseba'      => $this->lookOseba2['id'],
            'pomembna'   => TRUE,
            'pogodba'    => $this->obj2['id'],
        ];
        $this->objAlternacija1 = $ent                   = $I->successfullyCreate($this->alternacijaUrl, $data);
        $I->assertGuid($ent['id']);
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
        $I->assertGreaterThanOrEqual(1, count($resp));
    }

}
