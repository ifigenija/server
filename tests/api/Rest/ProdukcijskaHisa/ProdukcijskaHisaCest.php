<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\Pogodba;

use ApiTester;

/**
 * Description of ProdukcijskaHisaCest
 * 
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto - je ni
 *      relacije z drugimi entitetami
 *      -koprodukcije O2M
 *      -popa
 *       getlist različne variante relacij
 *      - popa
 *      - vse
 * @author rado
 */
class ProdukcijskaHisaCest
{

    private $restUrl              = '/rest/produkcijskahisa';
    private $popaUrl              = '/rest/popa';
    private $drzavaUrl            = '/rest/drzava';
    private $produkcijaDelitevUrl = '/rest/produkcijadelitev';
    private $uprizoritevUrl       = '/rest/uprizoritev';
    private $objUprizoritev;
    private $obj;
    private $objProdukcijskaHisa2;
    private $objPopa1;
    private $objPopa2;
    private $objDrzava;
    private $objKoprodukcija1;
    private $objKoprodukcija2;

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
     * kreiram popa
     *  
     * @param ApiTester $I
     */
    public function createPopa(ApiTester $I)
    {
        $data           = [
            'sifra'  => 'X12',
            'naziv'  => 'zz',
//            'naziv1'    => 'zz',
//            'panoga'    => 'zz',
//            'email'     => 'z@zzz.zz',
//            'url'       => 'zz',
//            'opomba'    => 'zz',
            'drzava' => $this->objDrzava['id'],
//            'idddv'     => 'zz',
//            'maticna'   => 'ZZ123',
//            'zavezanec' => 'Da',
//            'jeeu'      => 'Da',
//            'datZav'    => '2010-02-01T00:00:00+0100',
//            'datnZav'   => '2017-02-01T00:00:00+0100',
//            'zamejstvo' => FALSE,
        ];
        $this->objPopa1 = $popa           = $I->successfullyCreate($this->popaUrl, $data);

        $I->assertNotEmpty($popa['id']);

        $data           = [
            'sifra'  => 'A12',
            'naziv'  => 'aa',
            'drzava' => $this->objDrzava['id'],
        ];
        $this->objPopa2 = $popa           = $I->successfullyCreate($this->popaUrl, $data);

        $I->assertNotEmpty($popa['id']);
    }

    /**
     *  kreiramo zapis
     * 
     * @depends createPopa
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'status' => 'zz',
            'popa'   => $this->objPopa1['id'],
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['status'], 'zz');


        $data                       = [
            'status' => 'bb',
            'popa'   => $this->objPopa2['id'],
        ];
        $this->objProdukcijskaHisa2 = $ent                        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
    }

    /**
     *  kreiramo zapis uprizoritev
     * 
     * @param ApiTester $I
     */
    public function createUprizoritev(ApiTester $I)
    {
        $data                 = [
            'faza'             => 'arhiv',
            'naslov'           => 'zz',
            'podnaslov'        => 'zz',
            'delovniNaslov'    => 'zz',
            'datumPremiere'    => '2010-02-01T00:00:00+0100',
            'stOdmorov'        => 1,
            'avtor'            => 'zz',
            'gostujoca'        => true,
            'trajanje'         => 2,
            'opis'             => 'zz',
            'arhIdent'         => 'zz',
            'arhOpomba'        => 'zz',
            'datumZakljucka'   => '2019-02-01T00:00:00+0100',
            'sloAvtor'         => true,
            'besedilo'         => null,
            'zvrstUprizoritve' => null,
            'zvrstSurs'        => null,
        ];
        $this->objUprizoritev = $ent                  = $I->successfullyCreate($this->uprizoritevUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['opis'], 'zz');
    }

    /**
     *  kreiramo zapis
     * 
     * @depends create
     * @depends createUprizoritev
     * 
     * @param ApiTester $I
     */
    public function createVecKoproducentov(ApiTester $I)
    {
        $data                   = [
            'odstotekFinanciranja' => 1.23,
            'vrstaKoproducenta'    => 'zz',
            'uprizoritev'          => $this->objUprizoritev['id'],
            'koproducent'          => $this->objProdukcijskaHisa2['id'],
        ];
        $I->assertTrue(true);
        $this->objKoprodukcija1 = $ent                    = $I->successfullyCreate($this->produkcijaDelitevUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['vrstaKoproducenta'], 'zz');

        // kreiram še en zapis
        $data                   = [
            'odstotekFinanciranja' => 7.90,
            'vrstaKoproducenta'    => 'yy',
            'uprizoritev'          => $this->objUprizoritev['id'],
            'koproducent'          => $this->objProdukcijskaHisa2['id'],
        ];
        $this->objKoprodukcija2 = $ent                    = $I->successfullyCreate($this->produkcijaDelitevUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['vrstaKoproducenta'], 'yy');
    }

    /**
     * preberi vse naslove od poslovnega partnerja
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoPopa(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?popa=" . $this->objPopa1['id'];

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        $I->assertEquals(1, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
        $I->assertEquals("zz", $list[0]['status']);
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
        $I->assertEquals(2, $resp['state']['totalRecords']);
        $I->assertEquals("bb", $list[0]['status']);
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent           = $this->obj;
        $ent['status'] = 'yy';

        $this->obj = $entR      = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['status'], 'yy');
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
        $I->assertEquals($ent['status'], 'yy');
        $I->assertEquals($ent['popa'], $this->objPopa1['id']);
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
     * @depends createVecKoproducentov
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeSKoproducenti(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->objProdukcijskaHisa2['id'], "koprodukcije", "");
        $I->assertEquals(2, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->objProdukcijskaHisa2['id'], "koprodukcije", $this->objKoprodukcija1['id']);
        $I->assertEquals(1, count($resp));
    }

}
