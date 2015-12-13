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
    private $lookupUrl      = '/lookup/zaposlitev';
    private $osebaUrl       = '/rest/oseba';
    private $alternacijaUrl = '/rest/alternacija';
    private $zaposlitevUrl  = '/rest/zaposlitev';
    private $orgEnotaUrl    = '/rest/organizacijskaEnota';
    private $obj1;
    private $obj2;
    private $obj3;
    private $obj4;
    private $objOseba;
    private $lookOseba1;
    private $lookOseba2;
    private $lookOseba3;
    private $lookOseba4;
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

        $this->lookOseba3 = $ent              = $I->lookupEntity("oseba", "0008", false);
        $I->assertGuid($ent['id']);

        $this->lookOseba4 = $ent              = $I->lookupEntity("oseba", "0009", false);
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
        $data               = [
            'sifra'      => '99',
            'naziv'      => 'OEA',
            'parent'     => null,
            'vodja'      => $this->objZaposlitev1['id'],
            'namestnik'  => $this->objZaposlitev1['id'],
            'zaposlitve' => $this->objZaposlitev1['id'],
        ];
        $this->objOrgEnota1 = $ent                = $I->successfullyCreate($this->orgEnotaUrl, $data);
        $I->assertNotEmpty($ent['id']);
    }

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
        $data       = [
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
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
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


        /**
         * še preverjanja avtorizacij, posebnih dovoljenj
         */
        $dataOs = [
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
            'oseba'               => $this->lookOseba4['id'],
        ];


        /*
         * uporabnik brez OsebniPodatki-write dovoljenja
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vinko, \IfiTest\AuthPage::$vinkoPass);
        $resp = $I->failToCreate($this->restUrl, $dataOs);
        codecept_debug($resp);
        $I->assertEquals(1000009, $resp[0]['code']);

        /*
         * uporabnik z OsebniPodatki-write dovoljenjem
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vihra, \IfiTest\AuthPage::$vihraPass);
        $this->obj4 = $ent        = $I->successfullyCreate($this->restUrl, $dataOs);
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


        /*
         * uporabnik brez OsebniPodatki-read dovoljenja
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$rudi, \IfiTest\AuthPage::$rudiPass);
        $resp = $I->failToGetList($listUrl, []);
        codecept_debug($resp);
        $I->assertEquals(1001660, $resp[0]['code']);

        /*
         * uporabnik z OsebniPodatki-read dovoljenjem
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$cene, \IfiTest\AuthPage::$cenePass);
        $resp = $I->successfullyGetList($listUrl, []);
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
        $ent           = $this->obj1;
        $ent['status'] = 'A';

        $this->obj1 = $entR       = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['status'], 'A');

        /**
         * še preverjanja avtorizacij, posebnih dovoljenj
         */
        $entOs                 = $this->obj4;
        $entOs['delovnoMesto'] = 'ZA ose';
        codecept_debug($entOs);
        $I->assertNotNull($entOs['oseba']);

        /*
         * uporabnik brez OsebniPodatki-write dovoljenja
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vinko, \IfiTest\AuthPage::$vinkoPass);
        $resp = $I->failToUpdate($this->restUrl, $entOs['id'], $entOs);
        codecept_debug($resp);
        $I->assertEquals(1000101, $resp[0]['code']);

        /*
         * uporabnik z OsebniPodatki-write dovoljenjem
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vihra, \IfiTest\AuthPage::$vihraPass);
        $ent = $I->successfullyUpdate($this->restUrl, $entOs['id'], $entOs);
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


        /**
         * še preverjanja avtorizacij, posebnih dovoljenj
         */
        $entOs = $this->obj4;
        $I->assertNotNull($entOs['oseba']);

        /*
         * uporabnik brez OsebniPodatki-read dovoljenja
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$rudi, \IfiTest\AuthPage::$rudiPass);
        $resp = $I->failToGet($this->restUrl, $entOs['id']);
        codecept_debug($resp);
        $I->assertEquals(100099, $resp[0][0]['code']);

        /*
         * uporabnik z OsebniPodatki-read dovoljenjem
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$cene, \IfiTest\AuthPage::$cenePass);
        $ent = $I->successfullyGet($this->restUrl, $entOs['id']);
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
         * še preverjanja avtorizacij, posebnih dovoljenj
         */
        $entOs = $this->obj4;
        $I->assertNotNull($entOs['oseba']);

        /*
         * uporabnik brez OsebniPodatki-write dovoljenja
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vinko, \IfiTest\AuthPage::$vinkoPass);
        $resp = $I->failToDelete($this->restUrl, $entOs['id']);
        codecept_debug($resp);
        $I->assertEquals(100201, $resp[0]['code']);

        /*
         * uporabnik z OsebniPodatki-write dovoljenjem
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vihra, \IfiTest\AuthPage::$vihraPass);
        $ent = $I->successfullyDelete($this->restUrl, $entOs['id']);
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
        codecept_debug($resp);
        $I->assertEquals(2, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "alternacije", $this->objAlternacija1['id']);
        codecept_debug($resp);
        $I->assertEquals(1, count($resp));

        /**
         * še preverjanje posebnih dovoljenj
         */
        /*
         * uporabnik brez OsebniPodatki-read dovoljenja
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$rudi, \IfiTest\AuthPage::$rudiPass);
        $resp = $I->failToGetRelation($this->restUrl, $this->obj2['id'], "alternacije", "");
        codecept_debug($resp);
        $I->assertEquals(100699, $resp[0][0]['code']);

        /*
         * uporabnik z OsebniPodatki-read dovoljenjem
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$cene, \IfiTest\AuthPage::$cenePass);
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "alternacije", $this->objAlternacija1['id']);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookup(ApiTester $I)
    {
        $resp = $I->successfullyGetList($this->lookupUrl, []);
        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->assertTrue(array_key_exists('data', $resp), "ima data");
        $I->assertTrue(array_key_exists('label', $resp['data'][0]), "ima labelo");


        /**
         * še preverjanja avtorizacij, posebnih dovoljenj
         */
        /*
         * uporabnik brez Zaposlitev-read dovoljenja
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$breznik, \IfiTest\AuthPage::$breznikPass);
        $resp = $I->failToGetList($this->lookupUrl, []);
        codecept_debug($resp);
        $I->assertEquals(1000632, $resp[0]['code']);

        /*
         * 
         * uporabnik z Zaposlitev-read dovoljenjem
         * uporabnik brez OsebniPodatki-read dovoljenja
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$rudi, \IfiTest\AuthPage::$rudiPass);
        $resp = $I->successfullyGetList($this->lookupUrl, []);
    }

}
