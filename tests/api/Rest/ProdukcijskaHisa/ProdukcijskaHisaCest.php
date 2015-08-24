<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\ProdukcijskaHisa;

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
 *      -uprizoritve O2M
 *      -popa
 *       getlist različne variante relacij
 *      - popa
 *      - vse
 * @author rado
 */
class ProdukcijskaHisaCest
{

    private $restUrl                = '/rest/produkcijskahisa';
    private $popaUrl                = '/rest/popa';
    private $drzavaUrl              = '/rest/drzava';
    private $produkcijaDelitevUrl   = '/rest/produkcijadelitev';
    private $uprizoritevUrl         = '/rest/uprizoritev';
    private $lookupProdukcijskaHisa = '/lookup/produkcijskahisa';
    private $objUprizoritev1;
    private $objUprizoritev2;
    private $lookUprizoritev;
    private $rpcOptionsUrl = '/rpc/app/options';
    private $maticnoGledalisce;
    private $obj;
    private $obj2;
    private $lookPopa1;
    private $lookPopa2;
    private $objKoprodukcija1;
    private $objKoprodukcija2;
    private $programPremieraUrl     = '/rest/programpremiera';
    private $objProgramPremiera1;
    private $objProgramPremiera2;
    private $lookProdukcijskaHisa1;
    private $lookProdukcijskaHisa2;
    private $lookProdukcijskaHisa3;
    private $lookProdukcijskaHisa4;
    private $lookProdukcijskaHisa5;
    private $enotaProgramaRpcUrl    = '/rpc/programdela/enotaprograma';

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

        /**
     * - getOptions  globalna vrednost
     * 
     * @param ApiTester $I
     */
    public function preberiOpcijoMaticno(ApiTester $I)
    {
        $opt = $I->successfullyCallRpc($this->rpcOptionsUrl, 'getOptions', ["name" => "application.tenant.maticnopodjetje"]);
        $I->assertNotEmpty($opt);
        $this->maticnoGledalisce=$opt;
    }
    
    /**
     * najde enoto programa
     * 
     * @param ApiTester $I
     */
    public function getListProgramPremiera(ApiTester $I)
    {
        $resp                      = $I->successfullyGetList($this->programPremieraUrl, []);
        $list                      = $resp['data'];
        $I->assertNotEmpty($list);
        $this->objProgramPremiera1 = $ent                       = array_pop($list);
        $I->assertNotEmpty($ent);
        $this->objProgramPremiera2 = $ent                       = array_pop($list);
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

        $this->lookPopa2 = $ent             = $I->lookupEntity("popa", "0985", false);
    }

    /**
     * najde državo
     * 
     * @param ApiTester $I
     */
//    public function getListDrzava(ApiTester $I)
//    {
//        $resp            = $I->successfullyGetList($this->drzavaUrl, []);
//        $list            = $resp['data'];
//        $I->assertNotEmpty($list);
//        $this->objDrzava = $drzava          = array_pop($list);
//        $I->assertNotEmpty($drzava);
//    }

    /**
     * kreiram popa
     *  
     * @param ApiTester $I
     */
//    public function createPopa(ApiTester $I)
//    {
//        $data           = [
//            'sifra'  => 'X12',
//            'naziv'  => 'zz',
////            'naziv1'    => 'zz',
////            'panoga'    => 'zz',
////            'email'     => 'z@zzz.zz',
////            'url'       => 'zz',
////            'opomba'    => 'zz',
//            'drzava' => $this->objDrzava['id'],
////            'idddv'     => 'zz',
////            'maticna'   => 'ZZ123',
////            'zavezanec' => 'Da',
////            'jeeu'      => 'Da',
////            'datZav'    => '2010-02-01T00:00:00+0100',
////            'datnZav'   => '2017-02-01T00:00:00+0100',
////            'zamejstvo' => FALSE,
//        ];
//        $this->objPopa1 = $popa           = $I->successfullyCreate($this->popaUrl, $data);
//
//        $I->assertNotEmpty($popa['id']);
//
//        $data           = [
//            'sifra'  => 'A12',
//            'naziv'  => 'aa',
//            'drzava' => $this->objDrzava['id'],
//        ];
//        $this->objPopa2 = $popa           = $I->successfullyCreate($this->popaUrl, $data);
//
//        $I->assertNotEmpty($popa['id']);
//    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupProdukcijskeHise(ApiTester $I)
    {

        $resp = $I->successfullyGetList($this->lookupProdukcijskaHisa, []);
        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->assertTrue(array_key_exists('data', $resp), "ima data");
        $I->assertGreaterThanOrEqual(1, $resp['state']['totalRecords'], "total records");

        $ind                         = array_search($this->maticnoGledalisce, array_column($resp['data'], 'ident'));
        $this->lookProdukcijskaHisa1 = $lookPH                      = $resp['data'][$ind];
        codecept_debug($lookPH);

        $ind                         = array_search("0989", array_column($resp['data'], 'ident'));
        $this->lookProdukcijskaHisa2 = $lookPH                      = $resp['data'][$ind];
        codecept_debug($lookPH);

        $ind                         = array_search("0986", array_column($resp['data'], 'ident'));
        $this->lookProdukcijskaHisa3 = $lookPH                      = $resp['data'][$ind];
        codecept_debug($lookPH);

        $ind                         = array_search("0982", array_column($resp['data'], 'ident'));
        $this->lookProdukcijskaHisa4 = $lookPH                      = $resp['data'][$ind];
        codecept_debug($lookPH);

        $ind                         = array_search("0984", array_column($resp['data'], 'ident'));
        $this->lookProdukcijskaHisa5 = $lookPH                      = $resp['data'][$ind];
        codecept_debug($lookPH);
    }

    /**
     *  kreiramo zapis
     * 
     * @depends lookupPopa
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'status' => 'NA',
            'popa'   => $this->lookPopa1['id'],
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['status'], 'NA');
        $I->assertEquals($ent['sifra'], '0988');


        $data       = [
            'status' => 'AK',
            'popa'   => $this->lookPopa2['id'],
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['sifra'], '0985');
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupUprizoritev(ApiTester $I)
    {
        $this->lookUprizoritev = $look                  = $I->lookupEntity("uprizoritev", "0001", false);
        $I->assertNotEmpty($look);
    }

    /**
     *  kreiramo zapis uprizoritev
     * 
     * @param ApiTester $I
     */
//    public function createUprizoritev(ApiTester $I)
//    {
//
//        $ent                  = $I->lookupEntity('uprizoritev', '0001', false);
//        codecept_debug($ent);
//        $this->objUprizoritev = $ent;
//        $I->assertNotEmpty($this->objUprizoritev);
//    }

    /**
     *  kreiramo zapis
     * 
     * @depends create
     * @depends lookupUprizoritev
     * 
     * @param ApiTester $I
     */
    public function createVecKoproducentov(ApiTester $I)
    {
        // najprej matični koproducent
        // pričakujemo kreiranje nove produkcijske delitve za lastno gledališče
        $resp = $I->successfullyCallRpc($this->enotaProgramaRpcUrl, 'novaMaticnaKoprodukcija', ["enotaProgramaId" => $this->objProgramPremiera1['id']]);
        $I->assertNotEmpty($resp);
        $I->assertGuid($resp);

        $data                   = [
//            'odstotekFinanciranja' => 30,
            'delez'         => 4000,
            'koproducent'   => $this->obj2['id'],
            'enotaPrograma' => $this->objProgramPremiera1['id'],
        ];
        $I->assertTrue(true);
        $this->objKoprodukcija1 = $ent                    = $I->successfullyCreate($this->produkcijaDelitevUrl, $data);
        $I->assertNotEmpty($ent['id']);

        //  matični koproducent še za 2. premiero
        // pričakujemo kreiranje nove produkcijske delitve za lastno gledališče
        $resp                   = $I->successfullyCallRpc($this->enotaProgramaRpcUrl, 'novaMaticnaKoprodukcija', ["enotaProgramaId" => $this->objProgramPremiera2['id']]);
        $I->assertNotEmpty($resp);
        $I->assertGuid($resp);

        // kreiram še en zapis
        $data                   = [
//            'odstotekFinanciranja' => 7.90,
            'delez'         => 44000,
            'koproducent'   => $this->obj2['id'],
            'enotaPrograma' => $this->objProgramPremiera2['id'],
        ];
        $this->objKoprodukcija2 = $ent                    = $I->successfullyCreate($this->produkcijaDelitevUrl, $data);
        $I->assertNotEmpty($ent['id']);
    }

    /**
     * preberi vse naslove od poslovnega partnerja
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoPopa(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?popa=" . $this->lookPopa1['id'];

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        $I->assertEquals(1, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
        $I->assertEquals("NA", $list[0]['status']);
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
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
//        $I->assertEquals("bb", $list[0]['status']);
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
        $ent['status'] = 'AK';

        $this->obj = $entR      = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['status'], 'AK');
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
        $I->assertEquals($ent['status'], 'AK');
        $I->assertEquals($ent['popa'], $this->lookPopa1['id']);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupProdukcijskaHisa(ApiTester $I)
    {

        $resp = $I->successfullyGetList($this->lookupProdukcijskaHisa, []);
        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->assertTrue(array_key_exists('data', $resp), "ima data");
        $I->assertTrue(array_key_exists('label', $resp['data'][0]), "ima labelo");
        $I->assertTrue(array_key_exists('totalRecords', $resp['state']), "ima total records");
        $I->assertGreaterThanOrEqual(1, $resp['state']['totalRecords'], "total records");
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupProdukcijskaHisaSifra(ApiTester $I)
    {
        $resp = $I->successfullyGetList($this->lookupProdukcijskaHisa . '?ident=' . $this->lookPopa2['ident'], []); 
        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->assertTrue(array_key_exists('data', $resp), "ima data");
        $I->assertTrue(array_key_exists('label', $resp['data'][0]), "ima labelo");
        $I->assertTrue(array_key_exists('totalRecords', $resp['state']), "ima total records");
        $I->assertEquals(1, $resp['state']['totalRecords'], "total records");
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
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "koprodukcije", "");
        $I->assertEquals(2, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "koprodukcije", $this->objKoprodukcija1['id']);
        $I->assertEquals(1, count($resp));
    }

    /**
     * preberemo relacije
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeUprizoritve(ApiTester $I)
    {
        $resp    = $I->successfullyGetList($this->lookupProdukcijskaHisa . '?ident=' . "0987", []);
        $pHisaId = $resp['data'][0]['id'];

        $resp          = $I->successfullyGetRelation($this->restUrl, $pHisaId, "uprizoritve", "");
        $I->assertGreaterThanOrEqual(2, count($resp));
//        codecept_debug($resp);
        $uprizoritevId = $resp[0]['id'];

        $resp = $I->successfullyGetRelation($this->restUrl, $pHisaId, "uprizoritve", $uprizoritevId);
        $I->assertGreaterThanOrEqual(1, count($resp));
//        codecept_debug($resp);
    }

}
