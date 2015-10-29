<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\ProgramFestival;

use ApiTester;

/**
 * Description of ProgramFestivalCest
 * 
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update  
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto
 *      relacije z drugimi entitetami (to many relacije)
 *           -(ni) pri many to many relacijah testiraj : update, get (list+id), delete
 *      - pri one to many relacijah testiraj : get (list+id)
 *       . drugiViri
 *      getlist različne variante relacij
 *      - vse
 *      - default
 *
 * @author rado
 */
class ProgramFestivalCest
{

    private $restUrl                = '/rest/programfestival';
    private $obj1;
    private $obj2;
    private $drugiVirUrl            = '/rest/drugivir';
    private $objDrugiVir1;
    private $objDrugiVir2;
    private $rpcOptionsUrl          = '/rpc/app/options';
    private $maticnoGledalisce;
    private $lookProdukcijskaHisa1;
    private $lookProdukcijskaHisa2;
    private $lookProdukcijskaHisa3;
    private $lookProdukcijskaHisa4;
    private $lookProdukcijskaHisa5;
    private $lookupProdukcijskaHisa = '/lookup/produkcijskahisa';
    private $produkcijaDelitevUrl   = '/rest/produkcijadelitev';
    private $objProdukcijaDelitev1;
    private $objProdukcijaDelitev2;
    private $produkcijskaHisaUrl    = '/rest/produkcijskahisa';
    private $popaUrl                = '/rest/popa';

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
        $popaId = $I->successfullyCallRpc($this->rpcOptionsUrl, 'getOptions', ["name" => "application.tenant.maticnopodjetje"]);
        codecept_debug($popaId);

        $popa                    = $I->successfullyGet($this->popaUrl, $popaId);
        $this->maticnoGledalisce = $popa['sifra'];
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
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data       = [
            'programDela'        => null,
            'naziv'              => 'zz',
            'zvrst'              => 'zz',
            'stPredstav'         => 1,
            'stOkroglihMiz'      => 1,
            'stPredstavitev'     => 1,
            'stDelavnic'         => 1,
            'stDrugiDogodki'     => 1,
            'stProdukcij'        => 1,
            'obiskDoma'          => 1,
            'casPriprave'        => 'zz',
            'casIzvedbe'         => 'zz',
            'prizorisca'         => 'zz',
            'umetVodja'          => 'zz',
            'programskoTelo'     => 'zz',
            'stTujihSelektorjev' => 1,
            'stZaposlenih'       => 1,
            'stHonorarnihZun'    => 1,
//            'celotnaVrednost'         => 1.24,
            'nasDelez'           => 4,
            'zaproseno'          => 1.24,
//            'lastnaSredstva'          => 1.24,
//            'drugiViri'               => 1.24,
            'drugiJavni'         => 1.24,
            'sort'               => 8,
            'imaKoprodukcije'    => TRUE,
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['naziv'], 'zz');

        // kreiramo še en zapis
        $data       = [
            'programDela'        => null,
            'naziv'              => 'aa',
            'zvrst'              => 'aa',
            'stPredstav'         => 2,
            'stOkroglihMiz'      => 2,
            'stPredstavitev'     => 2,
            'stDelavnic'         => 2,
            'stDrugiDogodki'     => 2,
            'stProdukcij'        => 2,
            'obiskDoma'          => 2,
            'casPriprave'        => 'aa',
            'casIzvedbe'         => 'aa',
            'prizorisca'         => 'aa',
            'umetVodja'          => 'aa',
            'programskoTelo'     => 'aa',
            'stTujihSelektorjev' => 2,
            'stZaposlenih'       => 2,
            'stHonorarnihZun'    => 2,
//            'zaproseno'            =>1.23,
            'nasDelez'           => 2.24,
            'zaproseno'          => 1.11,
//            'lastnaSredstva'          => 2.24,
//            'drugiViri'               => 2.24,
            'drugiJavni'         => 2.24,
            'sort'               => 2,
            'imaKoprodukcije'    => FALSE,
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['naziv'], 'aa');
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent              = $this->obj1;
        $ent['zaproseno'] = 1.22;

        $this->obj1 = $entR       = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['zaproseno'], 1.22);
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

        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['programDela'], null);
        $I->assertEquals($ent['naziv'], 'zz');
        $I->assertEquals($ent['zvrst'], 'zz');
        $I->assertEquals($ent['stPredstav'], 1);
        $I->assertEquals($ent['stOkroglihMiz'], 1);
        $I->assertEquals($ent['stPredstavitev'], 1);
        $I->assertEquals($ent['stDelavnic'], 1);
        $I->assertEquals($ent['stDrugiDogodki'], 1);
        $I->assertEquals($ent['stProdukcij'], 1);
        $I->assertEquals($ent['obiskDoma'], 1);
        $I->assertEquals($ent['casPriprave'], 'zz');
        $I->assertEquals($ent['casIzvedbe'], 'zz');
        $I->assertEquals($ent['prizorisca'], 'zz');
        $I->assertEquals($ent['umetVodja'], 'zz');
        $I->assertEquals($ent['programskoTelo'], 'zz');
        $I->assertEquals($ent['stTujihSelektorjev'], 1);
        $I->assertEquals($ent['stZaposlenih'], 1);
        $I->assertEquals($ent['stHonorarnihZun'], 1);
        $I->assertEquals($ent['zaproseno'], 1.22, "zaprošeno");
        $I->assertEquals($ent['celotnaVrednost'], 4);
        $I->assertEquals($ent['nasDelez'], 4);
        $I->assertEquals($ent['lastnaSredstva'], $ent['nasDelez'] - $ent['zaproseno'] - $ent['drugiJavni'] - $ent['vlozekGostitelja'], "lastna sredstva");
//        $I->assertEquals($ent['drugiViri'], 1.24);
        $I->assertEquals($ent['drugiJavni'], 1.24);
        $I->assertEquals($ent['sort'], 8);
        $I->assertEquals($ent['imaKoprodukcije'], TRUE);
        $I->assertEquals($ent['avtorskiHonorarji'], 0);
        $I->assertEquals($ent['avtorskiHonorarjiSamoz'], 0);
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
//
//        $I->assertNotEmpty($list);
//        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
//    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListDefault(ApiTester $I)
    {
        $listUrl = $this->restUrl;
        codecept_debug($listUrl);
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];

        $I->assertNotEmpty($list);
        $totRec = $resp['state']['totalRecords'];
        $I->assertGreaterThanOrEqual(2, $totRec);
        $I->assertEquals(2, $list[0]['sort']);
        $I->assertEquals(8, $list[$totRec - 1]['sort']);
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
     *  kreiramo zapis
     * 
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function createVecDrugihVirov(ApiTester $I)
    {
        $data               = [
            'znesek'        => 1.24,
            'opis'          => "zz",
            'enotaPrograma' => $this->obj2['id'],
            'mednarodni'    => FALSE,
        ];
        $this->objDrugiVir1 = $ent                = $I->successfullyCreate($this->drugiVirUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // kreiramo še en zapis
        $data               = [
            'znesek'        => 1.24,
            'opis'          => "dd",
            'enotaPrograma' => $this->obj2['id'],
            'mednarodni'    => true,
        ];
        $this->objDrugiVir2 = $ent                = $I->successfullyCreate($this->drugiVirUrl, $data);
        $I->assertNotEmpty($ent['id']);
    }

    /**
     * preberemo relacije
     * 
     * @depends createVecDrugihVirov
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeZDrugimiViri(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "drugiViri", "");
        $I->assertGreaterThanOrEqual(2, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "drugiViri", $this->objDrugiVir1['id']);
        $I->assertGreaterThanOrEqual(1, count($resp));
    }

    /**
     *  kreiramo zapis
     * 
     * @depends create
     * @depends lookupProdukcijskaHisa
     * 
     * @param ApiTester $I
     */
    public function createVecKoprodukcij(ApiTester $I)
    {
        $data                        = [
            'odstotekFinanciranja' => 40,
            'delez'                => 2.6,
            'zaproseno'            => 2.1,
            'enotaPrograma'        => $this->obj2['id'],
            'koproducent'          => $this->lookProdukcijskaHisa1['id'],
        ];
        $this->objProdukcijaDelitev1 = $ent                         = $I->successfullyCreate($this->produkcijaDelitevUrl, $data);
        $I->assertGuid($ent['id']);

        // kreiramo še en zapis
        $data                        = [
            'odstotekFinanciranja' => 20,
            'delez'                => 1.1,
            'zaproseno'            => 1.02,
            'enotaPrograma'        => $this->obj2['id'],
            'koproducent'          => $this->lookProdukcijskaHisa2['id'],
        ];
        $this->objProdukcijaDelitev2 = $ent                         = $I->successfullyCreate($this->produkcijaDelitevUrl, $data);
        $I->assertGuid($ent['id']);
    }

    /**
     * preberemo relacije
     * 
     * @depends createVecKoprodukcij
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeSKoprodukcijami(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "koprodukcije", "");
        $I->assertGreaterThanOrEqual(2, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "koprodukcije", $this->objProdukcijaDelitev1['id']);
        $I->assertGreaterThanOrEqual(1, count($resp));
    }

    /**
     *  kreiramo zapis s tipom koprodukcije
     * 
     * pričakujemo, da bo kreiral matično koprodukcijo avtomatsko
     * 
     * @depends delete
     * 
     * @param ApiTester $I
     */
    public function createZImaKoprodukcijo(ApiTester $I)
    {
        $data                    = $this->obj1;
        $data['imaKoprodukcije'] = true;
        codecept_debug($data);
        $this->obj3              = $ent                     = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);

        $resp       = $I->successfullyGetRelation($this->restUrl, $this->obj3['id'], "koprodukcije", "");
        codecept_debug($resp);
        $I->assertEquals(1, count($resp));      // mora biti le 1 - t.j. matični
        // vse skupaj ponovimo z update-om:
        $this->obj3 = $ent        = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertGuid($ent['id']);

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj3['id'], "koprodukcije", "");
        codecept_debug($resp);
        $I->assertEquals(1, count($resp));      // mora biti le 1 - t.j. matični
    }

    /**
     *  osvežimo zapis s tipom  brez koprodukcije
     * 
     * pričakujemo, da bo izbrisal vse koprodukcije matično koprodukcijo avtomatsko
     * @depends createVecKoprodukcij
     * 
     * @param ApiTester $I
     */
    public function updateZNimaKoprodukcijePrejVečKoprodukcij(ApiTester $I)
    {
        // najprej preverimo, če je več koprodukcij
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "koprodukcije", "");
        codecept_debug($resp);
        $I->assertGreaterThanOrEqual(2, count($resp));

        $data                    = $this->obj2;
        $data['imaKoprodukcije'] = false;
        $ent                     = $I->successfullyUpdate($this->restUrl, $data['id'], $data);
        $I->assertGuid($ent['id']);
        // pričakujemo izbris vseh koproducentov
        $resp                    = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "koprodukcije", "");
        codecept_debug($resp);
        $I->assertEquals(0, count($resp));      // mora biti brez koproducentov
    }

    /**
     * spremenim zapis za kontrolo zaokroževanja
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updateKontrolaValidacijeZaokrozevanj(ApiTester $I)
    {
        $ent              = $this->obj2;
        $ent['nasDelez']  = 18.01;      // v praksi bo že klient zaokrožil na 2 mesti
        $ent['zaproseno'] = 12.61;

        $ent = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);

        // ali sedaj napaka pri zaprošeno?
        $ent = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);

        $ent['zaproseno'] = 12.62;
        $resp             = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertEquals(1000533, $resp[0]['code']);
    }

    /**
     * test validate
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updateBrezNaziva(ApiTester $I)
    {
        $ent          = $this->obj2;
        $ent['naziv'] = '';

        $resp = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        codecept_debug($resp);
//        $I->assertEquals(1000570, $resp[0]['code']);
    }

}
