<?php

namespace Rpc\EnotaPrograma;

use ApiTester;

/**
 * Testiranje metod EnotaProgramaService-a
 * - podatkiUprizoritve
 * negativni testi
 * - neveljaven id uprizoritve
 * - itd.
 * idempotentnost
 */
class PodatkiUprizoritveCest
{

    private $rpcUrl               = '/rpc/programdela/enotaprograma';
    private $programPremieraUrl   = '/rest/programpremiera';
    private $produkcijaDelitevUrl = '/rest/produkcijadelitev';
    private $objProgramPremiera1;
    private $objProgramPremiera2;
    private $lookUprizoritev;
    private $uprizoritevUrl       = '/rest/uprizoritev';

    public function _before(ApiTester $I)
    {
        // da testiramo vsa posamezna dovoljenja brez shortCurcuit
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vesna, \IfiTest\AuthPage::$vesnaPass);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupUprizoritev(ApiTester $I)
    {
        $this->lookUprizoritev = $look                  = $I->lookupEntity("uprizoritev", "0002", false);
        $I->assertNotEmpty($look);
    }

    /**
     * 
     * @param ApiTester $I 
     */
    public function podatkiUprizoritve(ApiTester $I)
    {
        //
        $resp = $I->successfullyCallRpc($this->rpcUrl, 'podatkiUprizoritve', ["uprizoritevId" => $this->lookUprizoritev['id']]);
        codecept_debug($resp);
        $I->assertNotEmpty($resp);
        $I->seeResponseIsJson();
        $I->assertGreaterThanOrEqual(1203, $resp['Do']['avtorskiHonorarji'], "avtorski do");
        $I->assertGreaterThanOrEqual(2129.2, $resp['Do']['nasDelez'], "naš delež do");
        $I->assertGreaterThanOrEqual(200, $resp['Do']['tantieme'], "tantieme do");
        $I->assertGreaterThanOrEqual(93, $resp['Na']['avtorskiHonorarji'], "avtorski do");
        $I->assertGreaterThanOrEqual(126.1, $resp['Na']['nasDelez'], "naš delež");
        $I->assertGreaterThanOrEqual(10, $resp['Na']['tantieme'], "tantieme");
        $I->assertGreaterThanOrEqual(2, $resp['stZaposUmet']);
        $I->assertGreaterThanOrEqual(3, $resp['stZaposDrug']);
        $I->assertGreaterThanOrEqual(3, $resp['stHonorarnih']);
        $I->assertGreaterThanOrEqual(2, $resp['stHonorarnihIgr']);
        $I->assertGreaterThanOrEqual(1, $resp['stHonorarnihIgrTujJZ']);
    }

    /**
     * 
     * @param ApiTester $I 
     */
    public function podatkiUprizoritveZNapacenFormatId(ApiTester $I)
    {
        // pričakujemo kreiranje nove produkcijske delitve za lastno gledališče
        $resp = $I->failCallRpc($this->rpcUrl, 'podatkiUprizoritve', ["uprizoritevId" => 'napačen format id']);
        codecept_debug($resp);
        $I->assertNotEmpty($resp);
        $I->seeResponseIsJson();
        $I->assertEquals(1000971, $resp['code']);
    }

}
