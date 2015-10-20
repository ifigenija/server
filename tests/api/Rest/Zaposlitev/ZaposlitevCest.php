<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\Zaposlitev;

use ApiTester;

/**
 * Description of ZaposlitevCest
 *
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto - je ni
 *      relacije z drugimi entitetami
 *      - oseba
 *      - alternacije O2M
 *      getlist različne variante relacij
 *      - vse
 *      - oseba
 * 
 * @author rado
 */
class ZaposlitevCest
{

    private $restUrl        = '/rest/zaposlitev';
    private $osebaUrl       = '/rest/oseba';
    private $alternacijaUrl = '/rest/alternacija';
    private $zaposlitevUrl = '/rest/zaposlitev';
    private $orgEnotaUrl = '/rest/organizacijskaEnota';
    private $obj;
    private $obj2;
    private $objOseba;
    private $lookOseba1;
    private $lookOseba2;
    private $lookFunkcija;
    private $objAlternacija1;
    private $objAlternacija2;
    private $objOrgEnota1;

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
    public function lookupFunkcijo(ApiTester $I)
    {
        $this->lookFunkcija = $look               = $I->lookupEntity("funkcija", "Tezej", false);
        $I->assertNotEmpty($look);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupOsebo(ApiTester $I)
    {
        $this->lookOseba1 = $ent              = $I->lookupEntity("oseba", "0006", false);
        $I->assertGuid($ent['id']);

        $this->lookOseba2 = $ent              = $I->lookupEntity("oseba", "0007", false);
        $I->assertGuid($ent['id']);
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
        $data                 = [
            'sifra'                        => '99',
            'status'                       => 'A',
            'zacetek'                      => '2010-02-01T00:00:00+0100',
            'konec'                        => '2010-02-01T00:00:00+0100',
            'tip'                          => 1,
            'delovnaObveza'                => 2,
            'malica'                       => 'zz',
            'delovnoMesto'                 => 'XXX',
            'izmenskoDelo'                 => true,
            'individualnaPogodba'          => true,
            'jeZaposlenVdrugemJz'          => TRUE,
            'jeNastopajoci'                => TRUE,
            'oseba'                        => $this->lookOseba1['id'],
            'organizacijskaEnota'          => null,
            'vodjaOrganizacijskihEnot'     => null,
            'namestnikOrganizacijskihEnot' => null
        ];
        $this->objZaposlitev1 = $ent                  = $I->successfullyCreate($this->zaposlitevUrl, $data);
        $I->assertNotEmpty($ent['id']);
    }
    
    /**
     * @depends createZaposlitev
     * @param ApiTester $I
     */
    public function createOrgEnota(ApiTester $I)
    {
        $data      = [
            'sifra'      => '99',
            'naziv'      => 'OEA',
            'parent'     => null,
            'vodja'      => $this->objZaposlitev1['id'],
            'namestnik'  => $this->objZaposlitev1['id'],
            'zaposlitve' => $this->objZaposlitev1['id'],
        ];
        $this->objOrgEnota1 = $ent       = $I->successfullyCreate($this->orgEnotaUrl, $data);
        $I->assertNotEmpty($ent['id']);
    }

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
     *  kreiramo zapis
     * 
     * @depends lookupOsebo
     * @depends createOrgEnota
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'sifra'               => '99',
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
            'oseba'               => $this->lookOseba1['id'],
            'organizacijskaEnota' => $this->objOrgEnota1['id'],
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['status'], 'A');

        // kreiramo še en zapis
        $data       = [
            'sifra'               => '00',
            'status'              => 'N',
            'zacetek'             => '2015-02-01T00:00:00+0100',
            'konec'               => '2016-02-01T00:00:00+0100',
            'tip'                 => 4,
            'delovnaObveza'       => 5,
            'delovnoMesto'        => 'XXX',
            'malica'              => 'xx',
            'izmenskoDelo'        => true,
            'individualnaPogodba' => true,
            'jeZaposlenVdrugemJz' => TRUE,
            'jeNastopajoci'       => TRUE,
            'oseba'               => $this->lookOseba1['id'],
            'organizacijskaEnota' => null,
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['status'], 'N');

        /**
         * kreiramo še en zapis brez šifre
         */
        $data       = [
            'status'              => 'N',
            'zacetek'             => '2016-02-01T00:00:00+0100',
            'konec'               => '2017-02-01T00:00:00+0100',
            'tip'                 => 4,
            'delovnaObveza'       => 5,
            'delovnoMesto'        => 'XXX',
            'malica'              => 'xx',
            'izmenskoDelo'        => true,
            'individualnaPogodba' => true,
            'jeZaposlenVdrugemJz' => TRUE,
            'jeNastopajoci'       => TRUE,
            'oseba'               => $this->lookOseba2['id'],
        ];
        $this->obj3 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['status'], 'N');
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
            'funkcija'     => $this->lookFunkcija['id'],
            'zaposlitev'   => $this->obj2['id'],
            'oseba'        => $this->lookOseba1['id'],
            'koprodukcija' => NULL,
            'pogodba'      => NULL,
        ];
        $this->objAlternacija1 = $ent                   = $I->successfullyCreate($this->alternacijaUrl, $data);
        $I->assertNotEmpty($ent['id']);

        $data                  = [
            'zaposlen'     => true,
            'funkcija'     => $this->lookFunkcija['id'],
            'zaposlitev'   => $this->obj2['id'],
            'oseba'        => $this->lookOseba1['id'],
            'koprodukcija' => NULL,
            'pogodba'      => NULL,
        ];
        $this->objAlternacija2 = $ent                   = $I->successfullyCreate($this->alternacijaUrl, $data);
        $I->assertNotEmpty($ent['id']);
    }

    /**
     * preberi vse zapise od osebe
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoOsebi(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?oseba=" . $this->lookOseba1['id'];

        $resp   = $I->successfullyGetList($listUrl, []);
        $list   = $resp['data'];
        codecept_debug($resp);
        $totRec = $resp['state']['totalRecords'];
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
//        $I->assertEquals("00", $list[0]['sifra']);      // odvisno od sortiranja
//        $I->assertEquals("99x", $list[$totRec - 1]['sifra']);      // odvisno od sortiranja
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
//    public function getListVse(ApiTester $I)
//    {
//        $resp    = $I->successfullyGetList($this->restUrl . "/vse", []);
//        $list    = $resp['data'];
//        codecept_debug($list);
//        $totRec = $resp['state']['totalRecords'];
//        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
//        $I->assertEquals("Ana  Potočnik", $list[0]['oseba']['label']);      //glede na sort
//        $I->assertEquals("Mojca  Vidmar", $list[$totRec - 1]['oseba']['label']);      //glede na sort
// 
//        /**
//         * še po drugem sortnem polju
//         */
//        $resp    = $I->successfullyGetList($this->restUrl . "/vse?sort_by=sifra&order=DESC", []);
//        $list    = $resp['data'];
//        codecept_debug($list);
//        $totRec = $resp['state']['totalRecords'];
//        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
//        $I->assertEquals("06", $list[0]['sifra']);      //glede na sort
//        $I->assertEquals("0006", $list[$totRec - 1]['sifra']);      //glede na sort
//
//        
//    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent           = $this->obj;
        $ent['status'] = 'A';

        $this->obj = $entR      = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['status'], 'A');
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
        codecept_debug($ent);

        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['status'], 'A');
        $I->assertEquals($ent['zacetek'], '2010-02-01T00:00:00+0100');
        $I->assertEquals($ent['konec'], '2010-02-01T00:00:00+0100');
//        $I->assertEquals($ent['tip'], 1);     // $$zaenkrat nimamo definiranih vrednosti
        $I->assertEquals($ent['delovnaObveza'], 2);
//        $I->assertEquals($ent['malica'], 'zz');  //$$zaenkrat nimamo definiranih vrednosti
        $I->assertEquals($ent['izmenskoDelo'], true);
        $I->assertEquals("XXX", $ent['delovnoMesto']);
        $I->assertEquals($ent['individualnaPogodba'], true);
        $I->assertEquals($ent['jeZaposlenVdrugemJz'], TRUE);
        $I->assertEquals($ent['jeNastopajoci'], TRUE);
        $I->assertEquals($ent['oseba']['id'], $this->lookOseba1['id']);
        $I->assertEquals($ent['organizacijskaEnota'], $this->objOrgEnota1['id']);
    }

    /**
     * brisanje zapisa
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
     * @depends createVecAlternacij
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeZAlternacijami(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "alternacije", "");
        $I->assertEquals(2, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "alternacije", $this->objAlternacija1['id']);
        $I->assertEquals(1, count($resp));
    }

    /**
     *  testiram #1172 - zakaj zapis une uspe?
     * 
     * @depends lookupOsebo
     * 
     * @param ApiTester $I
     */
//    public function createNaVse(ApiTester $I)
//    {
//        $data      = [
//            'status'              => 'vv',
//            'zacetek'             => '2010-02-01T00:00:00+0100',
//            'konec'               => '2010-02-01T00:00:00+0100',
//            'tip'                 => 1,
//            'delovnaObveza'       => 2,
//            'malica'              => 'vv',
//            'izmenskoDelo'        => true,
//            'individualnaPogodba' => true,
//            'jeZaposlenVdrugemJz' => TRUE,
//            'jeNastopajoci'       => TRUE,
//            'oseba'               => $this->lookOseba1['id'],
//        ];
//        $ent       = $I->successfullyCreate($this->restUrl."/vse", $data);
//        $I->assertNotEmpty($ent['id']);
//        codecept_debug($ent);
//        $I->assertEquals($ent['status'], 'A');
//        
//    }
}
