<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\OrganizacijskaEnota;

use ApiTester;

/**
 * Description of OrganizacijskaEnotaCest
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
 *      getlist različne variante relacij
 *      - vse
 *      - oseba
 * 
 * @author rado
 */
class OrganizacijskaEnotaCest
{

    private $restUrl        = '/rest/organizacijskaEnota';
    private $restZaposlitev = '/rest/zaposlitev';
    private $obj;
    private $lookOseba1;
    private $lookOseba2;

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
        $this->objZaposlitev1 = $ent                  = $I->successfullyCreate($this->restZaposlitev, $data);
        $I->assertNotEmpty($ent['id']);

        $data                 = [
            'sifra'               => '22',
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
        $this->objZaposlitev2 = $ent                  = $I->successfullyCreate($this->restZaposlitev, $data);
        $I->assertNotEmpty($ent['id']);


        /**
         * kreiramo še en zapis brez šifre
         */
        $data                 = [
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
            'organizacijskaEnota' => null,
        ];
        $this->objZaposlitev3 = $ent                  = $I->successfullyCreate($this->restZaposlitev, $data);
        $I->assertNotEmpty($ent['id']);
    }

    /**
     *  kreiramo zapis
     * 
     * @depends lookupOsebo
     * @depends createZaposlitev
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'sifra'      => '99',
            'naziv'      => 'OEA',
            'parent'     => null,
            'vodja'      => $this->objZaposlitev1['id'],
            'namestnik'  => $this->objZaposlitev2['id'],
            'zaposlitve' => $this->objZaposlitev3['id'],
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['naziv'], 'OEA');
        
        $data      = [
            'sifra'      => '77',
            'naziv'      => 'OEAA',
            'parent'     => null,
            'vodja'      => $this->objZaposlitev1['id'],
            'namestnik'  => $this->objZaposlitev2['id'],
            'zaposlitve' => $this->objZaposlitev3['id'],
        ];
        $this->obj2 = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['naziv'], 'OEAA');
    }
    
    /**
     *  kreiramo zapis
     * 
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function createVecChildren(ApiTester $I)
    {
        $data       = [
            'sifra'      => '88',
            'naziv'      => 'OEAA',
            'parent'     => $this->obj2['id'],
            'vodja'      => $this->objZaposlitev1['id'],
            'namestnik'  => $this->objZaposlitev2['id'],
            'zaposlitve' => $this->objZaposlitev3['id'],
            'children'   => $this->obj2['id'],
        ];
        $this->objChildren1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['naziv'], 'OEAA');
        
        $data       = [
            'sifra'      => '66',
            'naziv'      => 'OEAAA',
            'parent'     => $this->obj2['id'],
            'vodja'      => $this->objZaposlitev1['id'],
            'namestnik'  => $this->objZaposlitev2['id'],
            'zaposlitve' => $this->objZaposlitev3['id'],
            'children'   => $this->obj2['id'],
        ];
        $this->objChildren2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['naziv'], 'OEAAA');
    }

    /**
     *  kreiramo zapis
     * 
     * @depends lookupOsebo
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function createVecZaposlitev(ApiTester $I)
    {
        $data                 = [
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
            'organizacijskaEnota' => $this->obj2['id'],
        ];
        $this->objZaposlitev4 = $ent                  = $I->successfullyCreate($this->restZaposlitev, $data);
        $I->assertNotEmpty($ent['id']);

        $data                 = [
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
            'organizacijskaEnota' => $this->obj2['id'],
        ];
        $this->objZaposlitev5 = $ent                  = $I->successfullyCreate($this->restZaposlitev, $data);
        $I->assertNotEmpty($ent['id']);


        /**
         * kreiramo še en zapis brez šifre
         */
        $data                 = [
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
            'organizacijskaEnota' => $this->obj2['id'],
        ];
        $this->objZaposlitev6 = $ent                  = $I->successfullyCreate($this->restZaposlitev, $data);
        $I->assertNotEmpty($ent['id']);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListDefault(ApiTester $I)
    {
        $listUrl = $this->restUrl . "/default";
        codecept_debug($listUrl);
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];

        $I->assertNotEmpty($list);
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);

        $listUrl = $this->restUrl . "/default?sort_by=sifra";
        codecept_debug($listUrl);
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];

        $I->assertNotEmpty($list);
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
        $ent          = $this->obj;
        $ent['naziv'] = 'B';

        $this->obj = $entR      = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['naziv'], 'B');
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
        $I->assertEquals($ent['sifra'], '99');
        $I->assertEquals($ent['naziv'], 'B');
        $I->assertEquals($ent['vodja'], $this->objZaposlitev1['id']);
        $I->assertEquals($ent['namestnik'], $this->objZaposlitev2['id']);

        $I->assertFalse(isset($ent['parent']));
    }

    /**
     * preberemo relacije
     * 
     * @depends createVecZaposlitev
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeSChildren(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "children", "");
        $I->assertEquals(2, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "children", $this->objChildren1['id']);
        $I->assertEquals(1, count($resp));
    }

    /**
     * preberemo relacije
     * 
     * @depends createVecZaposlitev
     * @depends create
     * 
     * @param ApiTester $I
     */
//    public function preberiRelacijeZZaposlitvami(ApiTester $I)
//    {
//        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "zaposlitve", "");
//        $I->assertEquals(3, count($resp));
//
//        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "zaposlitve", $this->objZaposlitev5['id']);
//        $I->assertEquals(1, count($resp));
//    }

    /**
     * brisanje zapisa
     * 
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $I->successfullyDelete($this->restUrl, $this->objChildren1['id']);
        $I->failToGet($this->restUrl, $this->objChildren1['id']);

        $I->successfullyDelete($this->restUrl, $this->obj['id']);
        $I->failToGet($this->restUrl, $this->obj['id']);
    }

}
