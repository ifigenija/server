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
    private $obj;
    private $obj2;
    private $obj3;
    private $obj4;
    private $obj5;
    private $objPopa;
    private $objDrzava;
    private $objOseba;
    private $lookDrzava;
    private $lookPopa;
    private $lookOseba1;
    private $lookOseba2;
    private $lookOseba3;
    private $objTrr;
    private $objAlternacija1;
    private $objAlternacija2;
    private $lookAlternacija1;
    private $lookAlternacija2;
    private $lookAlternacija3;
    private $lookupAlternacijaUrl = '/lookup/alternacija';

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
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
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupPopa(ApiTester $I)
    {
        $this->lookPopa = $ent            = $I->lookupEntity("popa", "0988", false);
        $I->assertNotEmpty($ent);
    }

    /**
     * kreiram popa
     *  
     * @param ApiTester $I
     */
//    public function createPopa(ApiTester $I)
//    {
//        $data          = [
//            'sifra'  => 'X12',
//            'naziv'  => 'zz',
////            'naziv1'    => 'zz',
////            'panoga'    => 'zz',
////            'email'     => 'z@zzz.zz',
////            'url'       => 'zz',
////            'opomba'    => 'zz',
//            'drzava' => $this->lookDrzava['id'],
////            'idddv'     => 'zz',
////            'maticna'   => 'ZZ123',
////            'zavezanec' => 'Da',
////            'jeeu'      => 'Da',
////            'datZav'    => '2010-02-01T00:00:00+0100',
////            'datnZav'   => '2017-02-01T00:00:00+0100',
////            'zamejstvo' => FALSE,
//        ];
//        $this->objPopa = $popa          = $I->successfullyCreate($this->popaUrl, $data);
//
//        $I->assertNotEmpty($popa['id']);
//    }

    /**
     *  kreiramo  osebo
     * 
     * @param ApiTester $I
     */
//    public function createOsebo(ApiTester $I)
//    {
//        $data = [
//            'naziv'         => 'zz',
//            'ime'           => 'zz',
//            'priimek'       => 'zz',
//            'funkcija'      => 'zz',
//            'srednjeIme'    => 'zz',
//            'psevdonim'     => 'zz',
//            'email'         => 'x@xxx.xx',
//            'datumRojstva'  => '1973-28-03T04:30:00',
//            'emso'          => 'ZZ',
//            'davcna'        => 'ZZ123',
//            'spol'          => 'M',
//            'opombe'        => 'zz',
//            'drzavljanstvo' => 'zz',
//            'drzavaRojstva' => 'zz',
//            'krajRojstva'   => 'zz',
//            'user'          => null,
//        ];
//
//        $this->objOseba = $oseba          = $I->successfullyCreate($this->osebaUrl, $data);
//
//        $I->assertEquals('zz', $oseba['ime']);
//        $I->assertNotEmpty($oseba['id']);
//    }

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
            'popa'     => $this->lookPopa['id'],
            'oseba'    => NULL,
        ];
        $this->objTrr = $trr          = $I->successfullyCreate($this->trrUrl, $data);
        $I->assertEquals('ZZ123', $trr['banka']);
        $I->assertNotEmpty($trr['id']);
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
        $data      = [
            'sifra'              => 'ZZ123',
            'vrednostVaj'       => 33.33,
            'vrednostPredstave'  => 44.44,
            'vrednostUre'        => 22.22,
            'aktivna'            => false,
            'opis'               => 'zz',
            'oseba'              => $this->lookOseba1['id'],
            'popa'               => $this->lookPopa['id'],
            'trr'                => $this->objTrr['id'],
            'vrednostDo'         => 55.5,
            'zacetek'            => '2012-02-01T00:00:00+0100',
            'konec'              => '2014-02-01T00:00:00+0100',
            'vrednostDoPremiere' => 66.33,
            'zaposlenVDrJz'      => true,
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['sifra'], 'ZZ123');

        // kreiramo še en zapis
        $data       = [
            'sifra'              => 'WW4',
            'vrednostVaj'       => 33.33,
            'vrednostPredstave'  => 44.22,
            'vrednostUre'        => 11.11,
            'aktivna'            => false,
            'opis'               => 'ww',
            'oseba'              => $this->lookOseba2['id'],
            'popa'               => null,
            'trr'                => $this->objTrr['id'],
            'vrednostDo'         => 66.5,
            'zacetek'            => '2017-02-01T00:00:00+0100',
            'konec'              => '2017-03-01T00:00:00+0100',
            'vrednostDoPremiere' => 62.13,
            'zaposlenVDrJz'      => FALSE,
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['sifra'], 'WW4');

        // kreiramo še en zapis
        $data       = [
            'sifra'              => 'A1',
            'vrednostVaj'       => 3.33,
            'vrednostPredstave'  => 4.44,
            'vrednostUre'        => 2.22,
            'aktivna'            => false,
            'opis'               => 'aa',
            'oseba'              => $this->lookOseba3['id'],
            'popa'               => null,
            'trr'                => $this->objTrr['id'],
            'vrednostDo'         => 77.7,
            'zacetek'            => '2012-03-01T00:00:00+0100',
            'konec'              => '2014-04-01T00:00:00+0100',
            'vrednostDoPremiere' => 67.72,
            'zaposlenVDrJz'      => true,
        ];
        $this->obj3 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['sifra'], 'A1');

// kreiramo še en zapis, da ga potem lahko izbrišemo
        // kreiramo še en zapis
        $data       = [
            'sifra'              => 'BB',
            'vrednostVaj'       => 3.11,
            'vrednostPredstave'  => 4.11,
            'vrednostUre'        => 2.11,
            'aktivna'            => false,
            'opis'               => 'bb',
            'oseba'              => $this->lookOseba1['id'],
            'popa'               => null,
            'trr'                => null,
            'vrednostDo'         => 77.1,
            'zacetek'            => '2012-03-01T00:00:00+0100',
            'konec'              => '2013-04-01T00:00:00+0100',
            'vrednostDoPremiere' => 67.11,
            'zaposlenVDrJz'      => true,
        ];
        $this->obj4 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['sifra'], 'BB');

        // kreiramo še en zapis brez šifre, da vidimo, če jo kreira
        $data       = [
//            'sifra'              => 'BB',
            'vrednostVaj'       => 3.11,
            'vrednostPredstave'  => 4.11,
            'vrednostUre'        => 2.11,
            'aktivna'            => false,
            'opis'               => 'cc',
            'oseba'              => $this->lookOseba1['id'],
            'popa'               => null,
            'trr'                => null,
            'vrednostDo'         => 77.1,
            'zacetek'            => '2012-03-01T00:00:00+0100',
            'konec'              => '2013-04-01T00:00:00+0100',
            'vrednostDoPremiere' => 67.11,
            'zaposlenVDrJz'      => true,
        ];
        $this->obj5 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['opis'], 'cc');
    }

    /**
     * @param ApiTester $I
     */
//    public function getListAlternacija(ApiTester $I)
//    {
//        $resp                  = $I->successfullyGetList($this->alternacijaUrl . "/vse", []);
//        $list                  = $resp['data'];
//        $I->assertNotEmpty($list);
//        $this->objAlternacija1 = $ent                   = array_pop($list);
//        $I->assertNotEmpty($ent);
//        $this->objAlternacija2 = $ent                   = array_pop($list);
//        $I->assertNotEmpty($ent);
//    }

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
    }

    /**
     *  kreiramo zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updateAlternacijoSPogodbo(ApiTester $I)
    {
        $ent                    = $I->successfullyGet($this->alternacijaUrl, $this->lookAlternacija1['id']);
        $I->assertNotEmpty($ent);
        $ent['pogodba']         = $this->obj['id'];
        $this->lookAlternacija1 = $ent                    = $I->successfullyUpdate($this->alternacijaUrl, $ent['id'], $ent);
        $I->assertNotEmpty($ent['id']);

        $ent                    = $I->successfullyGet($this->alternacijaUrl, $this->lookAlternacija2['id']);
        $I->assertNotEmpty($ent);
        $ent['pogodba']         = $this->obj2['id'];
        $this->lookAlternacija2 = $ent                    = $I->successfullyUpdate($this->alternacijaUrl, $ent['id'], $ent);
        $I->assertNotEmpty($ent['id']);

        $ent                    = $I->successfullyGet($this->alternacijaUrl, $this->lookAlternacija3['id']);
        $I->assertNotEmpty($ent);
        $ent['pogodba']         = $this->obj2['id'];
        $this->lookAlternacija3 = $ent                    = $I->successfullyUpdate($this->alternacijaUrl, $ent['id'], $ent);
        $I->assertNotEmpty($ent['id']);
    }

    /**
     * preberi vse naslove od osebe
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoOsebi(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?oseba=" . $this->lookOseba1['id'];

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];
        codecept_debug($resp);

        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords'], "neznano zakaj vrne 1 in ne 2 $$ - glej pogodbe");
        $I->assertNotEmpty($list);
//        $I->assertEquals("WW4", $list[0]['sifra']);
    }

    /**
     * preberi vse naslove od poslovnega partnerja
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoPopa(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?popa=" . $this->lookPopa['id'];

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        $I->assertGreaterThanOrEqual(1, $resp['state']['totalRecords'], "$$ vrne 0 (glej pogodbe)");
        $I->assertNotEmpty($list);
//        $I->assertEquals("ZZ123", $list[0]['sifra']);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListVse(ApiTester $I)
    {
        $listUrl = $this->restUrl . "/vse";
        codecept_debug($listUrl);
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];
        codecept_debug($list);

        $I->assertNotEmpty($list);
        $I->assertGreaterThanOrEqual(4, $resp['state']['totalRecords']);
//        $I->assertEquals("A1", $list[0]['sifra']);      //glede na sort
    }

    /**
     * spremenim pogodbo
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent         = $this->obj;
        $ent['opis'] = 'xx';

        $this->obj = $entR      = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

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
        $ent = $I->successfullyGet($this->restUrl, $this->obj['id']);

        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['sifra'], 'ZZ123');
        $I->assertEquals($ent['vrednostVaj'], 33.33);
        $I->assertEquals($ent['vrednostPredstave'], 44.44);
        $I->assertEquals($ent['vrednostUre'], 22.22);
        $I->assertEquals($ent['aktivna'], false);
        $I->assertEquals($ent['opis'], 'xx');
        $I->assertEquals($ent['oseba']['id'], $this->lookOseba1['id']);
        $I->assertEquals($ent['popa']['id'], $this->lookPopa['id']);
        $I->assertEquals($ent['trr'], $this->objTrr['id']);
        $I->assertEquals($ent['vrednostDo'], 55.5);
        $I->assertEquals($ent['zacetek'], '2012-02-01T00:00:00+0100');
        $I->assertEquals($ent['konec'], '2014-02-01T00:00:00+0100');
        $I->assertEquals($ent['vrednostDoPremiere'], 66.33);
        $I->assertEquals($ent['zaposlenVDrJz'], true);
    }

    /**
     * test validacije
     * 
     * @depends create
     * @param ApiTester $I
     */
//    public function updatePogodboZOseboZravenPopa(ApiTester $I)
//    {
////        $this->expect($this->oseba || $this->popa, "Pogodba nima subjekta. Oseba ali poslovni partner sta obvezna", 1000340);
////        $this->expect(!($this->popa && $this->oseba), "Pogodba nima subjekta. Subjekt je lahko samo ali poslovni partner ali oseba -ne oba hkrati", 1000341);
////        $this->expect($this->sifra, "sifra je obvezen podatek", 1000342);
//
//        $ent          = $this->obj;
//        $ent['oseba'] = $this->lookOseba1['id'];
//
//        // test validacije - oseba mora imeti ime
//        $resp = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
//        $I->assertNotEmpty($resp);
//        // testiramo na enako številko napake kot je v validaciji
//        $I->assertEquals(1000341, $resp[0]['code']);
//    }

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
            'vrednostVaj'      => 33.33,
            'vrednostPredstave' => 44.44,
            'vrednostUre'       => 22.22,
            'aktivna'           => false,
            'opis'              => 'yy',
            'oseba'             => null,
            'popa'              => null,
            'trr'               => null,
        ];
        // test validacije - oseba mora imeti ime
        $resp = $I->failToCreate($this->restUrl, $data);
        $I->assertNotEmpty($resp);
        // testiramo na enako številko napake kot je v validaciji
        $I->assertEquals(1000343, $resp[0]['code']);
    }

    /**
     * brisanje pogodbe
     * 
     * @depends create
     */
    public function deleteEnega(ApiTester $I)
    {
        // brišemo 3. zapis, ker prvega ne moremo zaradi referenčne integritete
        $I->successfullyDelete($this->restUrl, $this->obj4['id']);
        $I->failToGet($this->restUrl, $this->obj4['id']);
    }

    /**
     * preberemo relacije
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeZAlternacijami(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "alternacije", "");
        $I->assertEquals(2, count($resp));

        // get po popa id  
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "alternacije", $this->lookAlternacija3['id']);
        $I->assertEquals(1, count($resp));
    }

}
