<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\ProgramDela;

use ApiTester;

/**
 * Description of ProgramDelaCest
 * 
 * 
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto
 *      relacije z drugimi entitetami (to many relacije)
 *      - pri many to many relacijah testiraj : update, get (list+id), delete
 *      - pri one to many relacijah testiraj : get (list+id)
 *          - premiere
 *          - ponovitve
 *          - izjemni
 *          - programFestival
 *          - gostujoci
 *          - gostovanje        
 *      getlist različne variante relacij
 *      - vse
 *      - default
 *
 * @author rado
 */
class SkrajsanCest
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

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vesna, \IfiTest\AuthPage::$vesnaPass);
    }

    public function _after(ApiTester $I)
    {
        
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
    public function lookupProdukcijskaHisa(ApiTester $I)
    {

        $resp = $I->successfullyGetList($this->lookupProdukcijskaHisa, []);
        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->assertTrue(array_key_exists('data', $resp), "ima data");
        $I->assertGreaterThanOrEqual(1, $resp['state']['totalRecords'], "total records");

        $ind                         = array_search("0900", array_column($resp['data'], 'ident'));
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
//            'sifra'            => 'ZZ',
            'naziv'            => 'zz',
            'zacetek'          => '2015-02-01T00:00:00+0100',
            'konec'            => '2016-02-01T00:00:00+0100',
            'potrjenProgram'   => false,
            'sezona'           => null,
            'avgZasedDvoran'   => 7.89,
            'avgCenaVstopnice' => 7.89,
            'stProdVstopnic'   => 7,
            'stZaposlenih'     => 7,
            'stZaposIgralcev'  => 7,
            'avgStNastopovIgr' => 7.89,
//            'vrPS1Mat'         => 7.89,
//            'vrPS1GostovSZ'    => 7.89,
//            'stHonorarnih'         => 7,
//            'stHonorarnihIgr'      => 7,
//            'stHonorarnihIgrTujJZ' => 7,
//            'sredstvaInt'          => 7.89,
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['naziv'], 'zz');

// kreiramo še en zapis
        $data       = [
//            'sifra'          => 'BB',
            'naziv'          => 'bb',
            'zacetek'        => '2016-02-01T00:00:00+0100',
            'konec'          => '2017-02-01T00:00:00+0100',
            'potrjenProgram' => TRUE,
            'sezona'         => null,
//            'vrPS1Mat'       => 7.89,
//            'vrPS1GostovSZ'  => 7.89,
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['naziv'], 'bb');
    }

    /**
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function kloniraj(ApiTester $I)
    {
        // preberemo star program dela
        $oldPD = $I->successfullyGet($this->restUrl, $this->obj2['id']);
        $I->assertNotEmpty($oldPD);
//   
        // kloniramo program dela
        $resp = $I->successfullyCallRpc($this->rpcUrl, 'kloniraj', ["programDelaId" => $this->obj2['id']]);
        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->seeResponseIsJson();
        $I->assertEquals(36, strlen($resp), "dolžina guid");
        $I->assertEquals(8, stripos($resp, "-"), "prvi '-' v  guid");

        $ent  = $I->successfullyGet($this->restUrl, $resp);
//        codecept_debug($ent);
        // pri update preračuna kazalnike
        $entR = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertNotEmpty($entR['id']);
        $I->assertNotEquals($oldPD['id'], $entR['id']," id");
        $I->assertNotEquals($oldPD['sifra'], $entR['sifra']," id");
        $I->assertEquals($oldPD['stPremier'], $entR['stPremier'], "št. premier");
        $I->assertEquals($oldPD['stPonPrej'], $entR['stPonPrej'], "št. ponovitev prejšnjih sezon");
        $I->assertEquals($oldPD['stPonPrejVelikih'], $entR['stPonPrejVelikih']);
        $I->assertEquals($oldPD['stPonPrejMalih'], $entR['stPonPrejMalih']);
        $I->assertEquals($oldPD['stPonPrejMalihKopr'], $entR['stPonPrejMalihKopr']);
        $I->assertEquals($oldPD['stPonPrejSredKopr'], $entR['stPonPrejSredKopr']);
        $I->assertEquals($oldPD['stPonPrejVelikihKopr'], $entR['stPonPrejVelikihKopr']);
        $I->assertEquals($oldPD['vrPS1'], $entR['vrPS1'], "vrednost PS1");
        $I->assertEquals($oldPD['vrPS1Mat'], $entR['vrPS1Mat'], "vr PS1 mat");
        $I->assertEquals($oldPD['vrPS1GostovSZ'], $entR['vrPS1GostovSZ'], "vr ps1 gostov slo zam");
        $I->assertEquals($oldPD['vrPS1Do'], $entR['vrPS1Do']);
        $I->assertEquals($oldPD['stNekomerc'], $entR['stNekomerc'], "št nekomerc");
        $I->assertEquals($oldPD['stIzvPonPrem'], $entR['stIzvPonPrem'], "št. izvedb pon premier");
        $I->assertEquals($oldPD['stIzvPrej'], $entR['stIzvPrej'], "št. izvedb prejšnjih");
        $I->assertEquals($oldPD['stIzvGostuj'], $entR['stIzvGostuj'], "št. izvedb gostujočih");
        $I->assertEquals($oldPD['stIzvOstalihNek'], $entR['stIzvOstalihNek'], "št. izvedb ostalih nekom");
        $I->assertEquals($oldPD['stGostovanjSlo'], $entR['stGostovanjSlo'], "");
        $I->assertEquals($oldPD['stGostovanjZam'], $entR['stGostovanjZam'], "");
        $I->assertEquals($oldPD['stGostovanjInt'], $entR['stGostovanjInt'], "");
        $I->assertEquals($oldPD['stObiskNekom'], $entR['stObiskNekom'], "Obisk vseh nekom.");
        $I->assertEquals($oldPD['stObiskNekomMat'], $entR['stObiskNekomMat'], "");
        $I->assertEquals($oldPD['stObiskNekomGostSlo'], $entR['stObiskNekomGostSlo'], "");
        $I->assertEquals($oldPD['stObiskNekomGostZam'], $entR['stObiskNekomGostZam'], "");
        $I->assertEquals($oldPD['stObiskNekomGostInt'], $entR['stObiskNekomGostInt'], "");
        $I->assertEquals($oldPD['avgObiskPrired']   , $entR['avgObiskPrired'], "povprečno št. obiskovalcev");     //kvocient drugih dveh števil
        $I->assertEquals($oldPD['stHonorarnih'], $entR['stHonorarnih'], "");
        $I->assertEquals($oldPD['stHonorarnihIgr'], $entR['stHonorarnihIgr'], "");
        $I->assertEquals($oldPD['stHonorarnihIgrTujJZ'], $entR['stHonorarnihIgrTujJZ'], "");
        $I->assertEquals($oldPD['sredstvaAvt'], $entR['sredstvaAvt'], "");
        $I->assertEquals($oldPD['sredstvaInt'], $entR['sredstvaInt'], "mednarodni viri");
        $I->assertEquals($oldPD['stKoprodukcij'], $entR['stKoprodukcij'], "");
        $I->assertEquals($oldPD['stKoprodukcijInt'], $entR['stKoprodukcijInt'], "število mednarodnih koprodukcij");
        $I->assertEquals($oldPD['stKoprodukcijNVO'], $entR['stKoprodukcijNVO'], "");
    }

}
