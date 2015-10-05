<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\ProgramPonovitevPrejsnjih;

use ApiTester;

/**
 * Description of ProgramPonovitevPrejsnjihCest
 * 
 * 
 *           metode, ki jo podpira API
 *           - create
 *           - getlist
 *           - update
 *           - get - kontrola vseh polj te entitete
 *           - delete
 *           validate metodo za entiteto
 *           relacije z drugimi entitetami (to many relacije)
 *                -(ni) pri many to many relacijah testiraj : update, get (list+id), delete
 *           - pri one to many relacijah testiraj : get (list+id)
 *            . drugiViri
 *          . koprodukcije
 *           getlist različne variante relacij
 * 
 *
 * @author rado
 */
class ProgramPonovitevPrejsnjihCest
{

    protected $restUrl                = '/rest/programponovitevprejsnjih';
    protected $obj1;
    protected $obj2;
    protected $uprizoritevUrl         = '/rest/uprizoritev';
    protected $lookUprizoritev;
    protected $tipProgramskeEnoteUrl  = '/rest/tipprogramskeenote';
    protected $lookTipProgramskeEnote;
    protected $drugiVirUrl            = '/rest/drugivir';
    protected $objDrugiVir1;
    protected $objDrugiVir2;
    protected $produkcijaDelitevUrl   = '/rest/produkcijadelitev';
    protected $objProdukcijaDelitev1;
    protected $objProdukcijaDelitev2;
    protected $produkcijskaHisaUrl    = '/rest/produkcijskahisa';
    protected $lookupProdukcijskaHisa = '/lookup/produkcijskahisa';
    protected $lookProdukcijskaHisa1;
    protected $lookProdukcijskaHisa2;
    protected $lookProdukcijskaHisa3;
    protected $lookProdukcijskaHisa4;
    protected $lookProdukcijskaHisa5;
    private $rpcOptionsUrl            = '/rpc/app/options';
    private $maticnoGledalisce;
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

        $popa = $I->successfullyGet($this->popaUrl, $popaId);
        $this->maticnoGledalisce=$popa['sifra'];
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
     * 
     * @param ApiTester $I
     */
    public function lookupUprizoritev(ApiTester $I)
    {
        $this->lookUprizoritev = $look                  = $I->lookupEntity("uprizoritev", "0001", false);
        $I->assertNotEmpty($look);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookuptipProgramskeEnote(ApiTester $I)
    {
        $this->lookTipProgramskeEnote = $look                         = $I->lookupEntity("tipProgramskeEnote", "01", false);
        $I->assertNotEmpty($look);
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
//            'celotnaVrednost'         => 1.24,
//            'nasDelez'                => 5,
//            'celotnaVrednostMat'      => 1.02,
            'celotnaVrednostGostovSZ' => 3.11,
            'zaproseno'               => 1.24,
//            'lastnaSredstva'          => 1.24,
            'avtorskiHonorarji'       => 1.24,
            'avtorskiHonorarjiSamoz'  => 1.24,
            'tantieme'                => 1.24,
            'materialni'              => 1.24,
//            'avtorskePravice'         => 1.24,
//            'drugiViri'            => 1.24,
            'vlozekGostitelja'        => 1.24,
            'drugiJavni'              => 1.24,
            'obiskDoma'               => 1,
            'obiskKopr'               => 1,
            'obiskGost'               => 1,
            'obiskZamejo'             => 1,
            'obiskInt'                => 1,
            'ponoviDoma'              => 1,
            'ponoviKopr'              => 1,
            'ponoviZamejo'            => 1,
            'ponoviGost'              => 1,
//            'ponoviInt'            => 1,
            'uprizoritev'             => $this->lookUprizoritev['id'],
            'tipProgramskeEnote'      => $this->lookTipProgramskeEnote['id'],
            'dokument'                => null,
            'sort'                    => 1,
            'stZaposUmet'             => 1,
            'stZaposDrug'             => 1,
            'stHonorarnihZun'            => 1,
            'stHonorarnihZunIgr'         => 1,
            'stHonorarnihZunIgrTujJZ'    => 1,
            'stHonorarnihZunIgrTujJZ'    => 1,
            'stHonorarnihZunSamoz'    => 1,
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // kreiramo še en zapis
        $data       = [
            'celotnaVrednost'         => 4.56,
//            'nasDelez'                => 19,
//            'celotnaVrednostMat'      => 2.23,
            'celotnaVrednostGostovSZ' => 1.11,
            'zaproseno'               => 1.24,
            'lastnaSredstva'          => 4.56,
            'avtorskiHonorarji'       => 4.56,
            'avtorskiHonorarjiSamoz'  => 4.56,
            'tantieme'                => 4.56,
            'materialni'              => 4.56,
//            'avtorskePravice'         => 4.56,
//            'drugiViri'            => 4.56,
            'vlozekGostitelja'        => 1.24,
            'drugiJavni'              => 4.56,
            'obiskDoma'               => 4,
            'obiskKopr'               => 4,
            'obiskGost'               => 4,
            'obiskZamejo'             => 4,
            'obiskInt'                => 4,
            'ponoviDoma'              => 4,
            'ponoviKopr'              => 4,
            'ponoviZamejo'            => 4,
            'ponoviGost'              => 4,
//            'ponoviInt'            => 4,
            'uprizoritev'             => $this->lookUprizoritev['id'],
            'tipProgramskeEnote'      => $this->lookTipProgramskeEnote['id'],
            'dokument'                => null,
            'sort'                    => 2,
            'stZaposUmet'             => 2,
            'stZaposDrug'             => 2,
            'stHonorarnihZun'            => 2,
            'stHonorarnihZunIgr'         => 2,
            'stHonorarnihZunIgrTujJZ'    => 2,
            'stHonorarnihZunSamoz'    => 2,
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
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
        $I->assertEquals($ent['celotnaVrednost'], 3.72);
        $I->assertEquals($ent['nasDelez'], 3.72);
        $I->assertEquals($ent['celotnaVrednostGostovSZ'], 3.11);
        $dif = $ent['celotnaVrednost'] - $ent['celotnaVrednostGostovSZ'];
        $I->assertEquals($ent['celotnaVrednostMat'], $ent['celotnaVrednost'] - $ent['celotnaVrednostGostovSZ'], "cel. vr. matič.");
        $I->assertEquals($ent['zaproseno'], 1.22, "zaprošeno");
        $I->assertEquals($ent['lastnaSredstva'], $ent['nasDelez'] - $ent['zaproseno'] - $ent['drugiJavni'] - $ent['vlozekGostitelja'], "lastna sredstva");
        $I->assertEquals($ent['avtorskiHonorarji'], 1.24);
        $I->assertEquals($ent['avtorskiHonorarjiSamoz'], 1.24);
        $I->assertEquals($ent['tantieme'], 1.24);
        $I->assertEquals($ent['materialni'], 1.24);
        $I->assertEquals($ent['avtorskePravice'], 0);
//        $I->assertEquals($ent['drugiViri'], 1.24);
        $I->assertEquals($ent['vlozekGostitelja'], 1.24);
        $I->assertEquals($ent['drugiJavni'], 1.24);
        $I->assertEquals($ent['obiskDoma'], 1);
        $I->assertEquals($ent['obiskKopr'], 1);
        $I->assertEquals($ent['obiskGost'], 1);
        $I->assertEquals($ent['obiskZamejo'], 1);
        $I->assertEquals($ent['obiskInt'], 0, "obisk Int");
        $I->assertEquals($ent['ponoviDoma'], 1);
        $I->assertEquals($ent['ponoviKopr'], 1);
        $I->assertEquals($ent['ponoviZamejo'], 1);
        $I->assertEquals($ent['ponoviGost'], 1);
        $I->assertEquals($ent['ponoviInt'], 0, "ponovi Int");
        $I->assertEquals($ent['uprizoritev']['id'], $this->lookUprizoritev['id']);

        $I->assertEquals($ent['tipProgramskeEnote'], $this->lookTipProgramskeEnote['id']);
        $I->assertEquals($ent['sort'], 1, 'sort');

        $I->assertEquals($ent['dokument'], null);
        $I->assertEquals($ent['stZaposUmet'], 1);
        $I->assertEquals($ent['stZaposDrug'], 1);
        $I->assertEquals($ent['stHonorarnihZun'], 1);
        $I->assertEquals($ent['stHonorarnihZunIgr'], 1);
        $I->assertEquals($ent['stHonorarnihZunIgrTujJZ'], 1);
        $I->assertEquals($ent['stHonorarnihZunSamoz'], 1);
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
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
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
        $I->assertNotEmpty($ent['id']);

        // kreiramo še en zapis
        $data                        = [
            'odstotekFinanciranja' => 20,
            'delez'                => 1.1,
            'zaproseno'            => 1.02,
            'enotaPrograma'        => $this->obj2['id'],
            'koproducent'          => $this->lookProdukcijskaHisa2['id'],
        ];
        $this->objProdukcijaDelitev2 = $ent                         = $I->successfullyCreate($this->produkcijaDelitevUrl, $data);
        $I->assertNotEmpty($ent['id']);
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
     * spremenim zapis za kontrolo zaokroževanja
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updateKontrolaValidacijeZaokrozevanj(ApiTester $I)
    {
        $ent                           = $this->obj2;
        $ent['avtorskiHonorarji']      = $ent['avtorskiHonorarjiSamoz'] = 1.01;      // v praksi bo že klient zaokrožil na 2 mesti

        $ent['tantieme']   = 2.02;
//        $ent['avtorskePravice']   = 0;
        $ent['materialni'] = 0;
        $ent['zaproseno']  = 1.82;

        $ent = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);

        // ali sedaj napaka pri zaprošeno?
        $ent = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);

        $ent['zaproseno'] = 1.83;
        $resp             = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertEquals(1000561, $resp[0]['code']);
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function createBrezUprizoritve(ApiTester $I)
    {
//                $this->expect($this->getUprizoritev(), "Uprizoritev je obvezen podatek", 1000562);
        // brez uprizoritve
        $data = [
            'uprizoritev'             => null,
//            'celotnaVrednost'         => 1.24,
//            'nasDelez'                => 5,
//            'celotnaVrednostMat'      => 1.02,
            'celotnaVrednostGostovSZ' => 3.11,
            'zaproseno'               => 1.24,
//            'lastnaSredstva'          => 1.24,
            'avtorskiHonorarji'       => 1.24,
            'avtorskiHonorarjiSamoz'  => 1.24,
            'tantieme'                => 1.24,
            'materialni'              => 1.24,
//            'avtorskePravice'         => 1.24,
//            'drugiViri'            => 1.24,
            'vlozekGostitelja'        => 1.24,
            'drugiJavni'              => 1.24,
            'obiskDoma'               => 1,
            'obiskKopr'               => 1,
            'obiskGost'               => 1,
            'obiskZamejo'             => 1,
            'obiskInt'                => 1,
            'ponoviDoma'              => 1,
            'ponoviKopr'              => 1,
            'ponoviZamejo'            => 1,
            'ponoviGost'              => 1,
//            'ponoviInt'            => 1,
            'tipProgramskeEnote'      => $this->lookTipProgramskeEnote['id'],
            'dokument'                => null,
            'sort'                    => 1,
            'stZaposUmet'             => 1,
            'stZaposDrug'             => 1,
            'stHonorarnihZun'            => 1,
            'stHonorarnihZunIgr'         => 1,
            'stHonorarnihZunIgrTujJZ'    => 1,
            'stHonorarnihZunIgrTujJZ'    => 1,
            'stHonorarnihZunSamoz'    => 1,
        ];
        codecept_debug($data);
        $resp = $I->failToCreate($this->restUrl, $data);
        codecept_debug($resp);
        $I->assertEquals(1000562, $resp[0]['code']);
    }

}
