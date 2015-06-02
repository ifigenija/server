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

    private $restUrl        = '/rest/pogodba';
    private $popaUrl        = '/rest/popa';
    private $drzavaUrl      = '/rest/drzava';
    private $osebaUrl       = '/rest/oseba';
    private $trrUrl         = '/rest/trr';
    private $alternacijaUrl = '/rest/alternacija';
    private $obj;
    private $obj2;
    private $objPopa;
    private $objDrzava;
    private $objOseba;
    private $lookDrzava;
    private $lookPopa;
    private $lookOseba;
    private $objTrr;
    private $objAlternacija1;
    private $objAlternacija2;

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
        $this->lookOseba = $ent             = $I->lookupEntity("oseba", "0006", false);
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
            'sifra'             => 'ZZ123',
            'vrednostVaje'      => 33.33,
            'vrednostPredstave' => 44.44,
            'vrednostUre'       => 22.22,
            'aktivna'           => false,
            'opis'              => 'zz',
            'oseba'             => null,
            'popa'              => $this->lookPopa['id'],
            'trr'               => $this->objTrr['id'],
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['sifra'], 'ZZ123');

        // kreiramo še en zapis
        $data       = [
            'sifra'             => 'WW4',
            'vrednostVaje'      => 33.33,
            'vrednostPredstave' => 44.44,
            'vrednostUre'       => 22.22,
            'aktivna'           => false,
            'opis'              => 'ww',
            'oseba'             => $this->lookOseba['id'],
            'popa'              => null,
            'trr'               => $this->objTrr['id'],
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['sifra'], 'WW4');

        // kreiramo še en zapis
        $data = [
            'sifra'             => 'A1',
            'vrednostVaje'      => 3.33,
            'vrednostPredstave' => 4.44,
            'vrednostUre'       => 2.22,
            'aktivna'           => false,
            'opis'              => 'aa',
            'oseba'             => $this->lookOseba['id'],
            'popa'              => null,
            'trr'               => $this->objTrr['id'],
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['sifra'], 'A1');
    }

    /**
     * @param ApiTester $I
     */
    public function getListAlternacija(ApiTester $I)
    {
        $resp                  = $I->successfullyGetList($this->alternacijaUrl . "/vse", []);
        $list                  = $resp['data'];
        $I->assertNotEmpty($list);
        $this->objAlternacija1 = $ent                   = array_pop($list);
        $I->assertNotEmpty($ent);
        $this->objAlternacija2 = $ent                   = array_pop($list);
        $I->assertNotEmpty($ent);
    }

    /**
     *  kreiramo zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updateAlternacijoSPogodbo(ApiTester $I)
    {
        $data                  = $this->objAlternacija1;
        $I->assertNotEmpty($data);
        $data['pogodba'] = $this->obj2['id'];
        $I->assertNotEmpty($data);
        $this->objAlternacija1 = $ent                   = $I->successfullyUpdate($this->alternacijaUrl, $data['id'], $data);
        $I->assertNotEmpty($ent['id']);

        // kreiram še en zapis
        $data                  = $this->objAlternacija2;
        $data['pogodba'] = $this->obj2['id'];
        $this->objAlternacija2 = $ent                   = $I->successfullyUpdate($this->alternacijaUrl, $data['id'], $data);
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
        $listUrl = $this->restUrl . "?oseba=" . $this->lookOseba['id'];

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];
        codecept_debug($resp);

        $I->assertEquals(2, $resp['state']['totalRecords'],"neznano zakaj vrne 1 in ne 2 $$");
        $I->assertNotEmpty($list);
        $I->assertEquals("WW4", $list[0]['sifra']);
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

        $I->assertEquals(1, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
        $I->assertEquals("ZZ123", $list[0]['sifra']);
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
        $I->assertEquals(3, $resp['state']['totalRecords']);
        $I->assertEquals("A1", $list[0]['sifra']);      //glede na sort
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
        $I->assertEquals($ent['vrednostVaje'], 33.33);
        $I->assertEquals($ent['vrednostPredstave'], 44.44);
        $I->assertEquals($ent['vrednostUre'], 22.22);
        $I->assertEquals($ent['aktivna'], false);
        $I->assertEquals($ent['opis'], 'xx');
        $I->assertEquals($ent['oseba'], null);
        $I->assertEquals($ent['popa'], $this->lookPopa['id']);
        $I->assertEquals($ent['trr'], $this->objTrr['id']);
    }

    /**
     * test validacije
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updatePogodboZOseboZravenPopa(ApiTester $I)
    {
//        $this->expect($this->oseba || $this->popa, "Pogodba nima subjekta. Oseba ali poslovni partner sta obvezna", 1000340);
//        $this->expect(!($this->popa && $this->oseba), "Pogodba nima subjekta. Subjekt je lahko samo ali poslovni partner ali oseba -ne oba hkrati", 1000341);
//        $this->expect($this->sifra, "sifra je obvezen podatek", 1000342);

        $ent          = $this->obj;
        $ent['oseba'] = $this->lookOseba['id'];

        // test validacije - oseba mora imeti ime
        $resp = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertNotEmpty($resp);
        // testiramo na enako številko napake kot je v validaciji
        $I->assertEquals(1000341, $resp[0]['code']);
    }

    /**
     * kreiramo pogodbo, test validacije
     * 
     * @param ApiTester $I
     */
    public function createPogodboBrezPopaInOsebe(ApiTester $I)
    {
//                  $this->expect($this->ime, "Ime je obvezen podatek", 1000301);
//                  $this->expect($this->priimek, "Priimek je obvezen podatek", 1000302);
        $data = [
            'sifra'             => 'yy123',
            'vrednostVaje'      => 33.33,
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
        $I->assertEquals(1000340, $resp[0]['code']);
    }

    /**
     * brisanje pogodbe
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
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeZAlternacijami(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "alternacije", "");
        $I->assertEquals(2, count($resp));

        // get po popa id  
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "alternacije", $this->objAlternacija1['id']);
        $I->assertEquals(1, count($resp));
    }

}
