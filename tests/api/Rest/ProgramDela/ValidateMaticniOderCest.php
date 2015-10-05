<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\ProgramDela;

use ApiTester;

/**
 * 
 * @author rado
 */
class ValidateMaticniOderCest
{

    private $restUrl                      = '/rest/programdela';
    private $obj1;
    private $obj2;
    private $programPremieraUrl           = '/rest/programpremiera';
    private $programPonovitevPremiereUrl  = '/rest/programponovitevpremiere';
    private $programPonovitevPrejsnjihUrl = '/rest/programponovitevprejsnjih';
    private $objProgramPremiera1;
    private $objProgramPremiera2;
    private $objProgramPremiera3;
    private $objProgramPonovitevPremiere1;
    private $objProgramPonovitevPremiere2;
    private $objProgramPonovitevPrejsnjih1;
    private $objProgramPonovitevPrejsnjih2;
    private $programIzjemniUrl            = '/rest/programizjemni';
    private $programGostujocaUrl          = '/rest/programgostujoca';
    private $programGostovanjaUrl         = '/rest/programgostovanje';
    private $programFestivalUrl           = '/rest/programfestival';
    private $programRaznoUrl              = '/rest/programrazno';
    private $objProgramIzjemni1;
    private $objProgramGostujoca1;
    private $objProgramGostovanj1;
    private $objProgramGostovanj2;
    private $objProgramFestival1;
    private $objProgramFestival2;
    private $objProgramRazno1;
    private $objProgramRazno2;
    private $uprizoritevUrl               = '/rest/uprizoritev';
    private $lookUprizoritev1;
    private $lookUprizoritev2;
    private $lookUprizoritev3;
    private $lookUprizoritev4;
    private $lookUprizoritev5;
    private $tipProgramskeEnoteUrl        = '/rest/tipprogramskeenote';
    private $lookTipProgramskeEnote1;
    private $lookTipProgramskeEnote2;
    private $lookTipProgramskeEnote3;
    private $lookTipProgramskeEnote4;
    private $lookTipProgramskeEnote5;
    private $drugiVirUrl                  = '/rest/drugivir';
    private $produkcijaDelitevUrl         = '/rest/produkcijadelitev';
    private $lookupProdukcijskaHisa       = '/lookup/produkcijskahisa';
    private $lookProdukcijskaHisa1;
    private $lookProdukcijskaHisa2;
    private $lookProdukcijskaHisa3;
    private $lookProdukcijskaHisa4;
    private $lookProdukcijskaHisa5;
    private $rpcUrl                       = '/rpc/programdela/programdela';
    private $objDrugiVir1;
    private $objDrugiVir2;
    private $objKoprodukcija1;
    private $objKoprodukcija2;
    private $objKoprodukcija3;
    private $programskaEnotaSklopaUrl     = '/rest/programskaenotasklopa';
    private $objPESklopa1;
    private $objPESklopa2;
    private $lookPopa1;
    private $drzavaUrl                    = '/rest/drzava';
    private $objDrzava1;
    private $objDrzava2;
    private $rpcOptionsUrl                = '/rpc/app/options';
    private $maticnoGledalisce;
    private $popaUrl                      = '/rest/popa';

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
    public function lookupUprizoritev(ApiTester $I)
    {
        $this->lookUprizoritev1 = $look                   = $I->lookupEntity("uprizoritev", "0001", false);
        $I->assertNotEmpty($look);

        $this->lookUprizoritev2 = $look                   = $I->lookupEntity("uprizoritev", "0002", false);
        $I->assertNotEmpty($look);

        $this->lookUprizoritev3 = $look                   = $I->lookupEntity("uprizoritev", "0003", false);
        $I->assertNotEmpty($look);

        $this->lookUprizoritev4 = $look                   = $I->lookupEntity("uprizoritev", "0004", false);
        $I->assertNotEmpty($look);

        $this->lookUprizoritev5 = $look                   = $I->lookupEntity("uprizoritev", "0005", false);
        $I->assertNotEmpty($look);
    }

    /**
     * najde državo
     * 
     * @param ApiTester $I
     */
    public function getListDrzava(ApiTester $I)
    {
        $resp             = $I->successfullyGetList($this->drzavaUrl, []);
        $list             = $resp['data'];
        $I->assertNotEmpty($list);
        $this->objDrzava1 = $drzava           = array_pop($list);
        $I->assertNotEmpty($drzava);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookuptipProgramskeEnote(ApiTester $I)
    {
        $this->lookTipProgramskeEnote1 = $look                          = $I->lookupEntity("tipProgramskeEnote", "01", false);
        $I->assertNotEmpty($look);
        $this->lookTipProgramskeEnote2 = $look                          = $I->lookupEntity("tipProgramskeEnote", "02", false);
        $I->assertNotEmpty($look);
        $this->lookTipProgramskeEnote3 = $look                          = $I->lookupEntity("tipProgramskeEnote", "03", false);
        $I->assertNotEmpty($look);
        $this->lookTipProgramskeEnote4 = $look                          = $I->lookupEntity("tipProgramskeEnote", "04", false);
        $I->assertNotEmpty($look);
        $this->lookTipProgramskeEnote5 = $look                          = $I->lookupEntity("tipProgramskeEnote", "05", false);
        $I->assertNotEmpty($look);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupPopa(ApiTester $I)
    {
        $this->lookPopa1 = $ent             = $I->lookupEntity("popa", "0988", false);
        $I->assertNotEmpty($ent);

        $this->lookPopa2 = $ent             = $I->lookupEntity("popa", "0986", false);
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
            'naziv'            => 'zz',
            'zacetek'          => '2015-02-01T00:00:00+01:00',
            'konec'            => '2016-02-01T00:00:00+0100',
            'potrjenProgram'   => false,
            'avgCenaVstopnice' => 7.89,
            'stProdVstopnic'   => 7,
            'stZaposlenih'     => 7,
            'stZaposIgralcev'  => 7,
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
    }

    /**
     *  kreiramo zapis
     * 
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function createProgramPremiere(ApiTester $I)
    {
        // premiera brez uprizoritve
        $data = [
            'uprizoritev'             => null,
            'nasDelez'                => 100.24,
            'zaproseno'               => 1.24,
            'avtorskiHonorarji'       => 1.24,
            'avtorskiHonorarjiSamoz'  => 1.24,
            'tantieme'                => 1.24,
            'materialni'              => 1.24,
            'avtorskePravice'         => 1.24,
            'drugiViri'               => 1.24,
            'opredelitevDrugiViri'    => "zz",
            'drugiJavni'              => 1.24,
            'obiskDoma'               => 22,
            'obiskKopr'               => 0,
            'tipProgramskeEnote'      => $this->lookTipProgramskeEnote5['id'],
            'kpe'                     => 0.1,
            'sort'                    => 1,
            'stZaposUmet'             => 1,
            'stZaposDrug'             => 1,
            'stHonorarnihZun'         => 10,
            'stHonorarnihZunIgr'      => 7,
            'stHonorarnihZunIgrTujJZ' => 5,
            'stHonorarnihZunSamoz'    => 5,
            'dokument'                => $this->obj1['id'],
        ];
        $resp = $I->failToCreate($this->programPremieraUrl, $data);
        codecept_debug($resp);
        $I->assertEquals(1000790, $resp[0]['code']);
    }

}
