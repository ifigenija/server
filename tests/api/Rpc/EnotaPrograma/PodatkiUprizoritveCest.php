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
     * vzame default datume za začetek in konec 
     * 
     * @param ApiTester $I 
     */
    public function podatkiUprizoritveBrezDatumov(ApiTester $I)
    {
//
        $resp = $I->successfullyCallRpc($this->rpcUrl, 'podatkiUprizoritve', ["uprizoritevId" => $this->lookUprizoritev['id']]);
        codecept_debug($resp);
        $I->assertNotEmpty($resp);
        $I->seeResponseIsJson();
        $I->assertGreaterThanOrEqual(132, $resp['Do']['avtorskiHonorarji'], "avtorski do");
        $I->assertGreaterThanOrEqual(200, $resp['Do']['tantieme'], "tantieme do");
        $I->assertGreaterThanOrEqual(1058.2, $resp['Do']['nasDelez'], "naš delež do");
        $I->assertGreaterThanOrEqual(93, $resp['Na']['avtorskiHonorarji'], "avtorski na");
        $I->assertGreaterThanOrEqual(10, $resp['Na']['tantieme'], "tantieme na");
        $I->assertGreaterThanOrEqual(126.1, $resp['Na']['nasDelez'], "naš delž na");
        $I->assertGreaterThanOrEqual(5, $resp['stZaposUmet'], "št. zaposlenih umetnikov"); 
        $I->assertGreaterThanOrEqual(1, $resp['stZaposDrug'], "št. zaposl. drugih"); 
        $I->assertGreaterThanOrEqual(3, $resp['stHonorarnih'], "honorarnih");
        $I->assertGreaterThanOrEqual(2, $resp['stHonorarnihIgr'], "honorarnih igralcev");
        $I->assertGreaterThanOrEqual(1, $resp['stHonorarnihIgrTujJZ']);
        $I->assertGreaterThanOrEqual(1, $resp['stHonorarnihIgrSamoz']);
        $I->assertEquals("2016-01-01T00:00:00+01:00", $resp['datumZacStudija']);
        $I->assertEquals("2016-04-20T00:00:00+02:00", $resp['datumPremiere']);
    }

    /**
     * 
     * @param ApiTester $I 
     */
    public function podatkiUprizoritve(ApiTester $I)
    {
//
        $resp = $I->successfullyCallRpc($this->rpcUrl, 'podatkiUprizoritve', ["uprizoritevId" => $this->lookUprizoritev['id']
            , "zacetek"       => "1970-01-01T01:00:00+0100", "konec"         => "2999-01-01T01:00:00+0100"
        ]);
        codecept_debug($resp);
        $I->assertNotEmpty($resp);
        $I->seeResponseIsJson();
        $I->assertGreaterThanOrEqual(132, $resp['Do']['avtorskiHonorarji'], "avtorski do");
        $I->assertGreaterThanOrEqual(200, $resp['Do']['tantieme'], "tantieme do");
        $I->assertGreaterThanOrEqual(1058.2, $resp['Do']['nasDelez'], "naš delež do");
        $I->assertGreaterThanOrEqual(93, $resp['Na']['avtorskiHonorarji'], "avtorski na");
        $I->assertGreaterThanOrEqual(10, $resp['Na']['tantieme'], "tantieme na");
        $I->assertGreaterThanOrEqual(126.1, $resp['Na']['nasDelez'], "naš delž na");
        $I->assertGreaterThanOrEqual(5, $resp['stZaposUmet'], "št. zaposlenih umetnikov"); //$$ prej 2
        $I->assertGreaterThanOrEqual(1, $resp['stZaposDrug'], "št. zaposl. drugih");  //$$ PREJ 3
        $I->assertGreaterThanOrEqual(3, $resp['stHonorarnih']);
        $I->assertGreaterThanOrEqual(2, $resp['stHonorarnihIgr'], "honorarnih igralcev");
        $I->assertGreaterThanOrEqual(1, $resp['stHonorarnihIgrTujJZ']);
        $I->assertGreaterThanOrEqual(1, $resp['stHonorarnihIgrSamoz']);
        $I->assertEquals("2016-01-01T00:00:00+01:00", $resp['datumZacStudija']);
        $I->assertEquals("2016-04-20T00:00:00+02:00", $resp['datumPremiere']);
    }

    /**
     * moral bi sešteti le tiste alternacije, ki se vsaj deloma prekrivajo z datumom in začetkom programa dela
     * 
     * @param ApiTester $I 
     */
    public function podatkiUprizoritveZOzjimIntervalom(ApiTester $I)
    {
//
        $resp = $I->successfullyCallRpc($this->rpcUrl, 'podatkiUprizoritve', ["uprizoritevId" => $this->lookUprizoritev['id']
            , "zacetek"       => "2016-01-01T00:00:00+0100", "konec"         => "2016-04-20T00:00:00+0200"
        ]);
        codecept_debug($resp);
        $I->assertNotEmpty($resp);
        $I->seeResponseIsJson();
        $I->assertEquals(2, $resp['stZaposUmet'], "št. zaposlenih umetnikov -ali sedaj manjše?"); 
        $I->assertEquals("2016-01-01T00:00:00+01:00", $resp['datumZacStudija']);
        $I->assertEquals("2016-04-20T00:00:00+02:00", $resp['datumPremiere']);
    }

    /**
     * 
     * @param ApiTester $I 
     */
    public function podatkiUprizoritveZNapacenFormatId(ApiTester $I)
    {
        /**
         * napačen ID
         */
        $resp = $I->failCallRpc($this->rpcUrl, 'podatkiUprizoritve', ["uprizoritevId" => 'napačen format id']);
        codecept_debug($resp);
        $I->assertNotEmpty($resp);
        $I->seeResponseIsJson();
        $I->assertEquals(1000971, $resp['code']);
    }

    /**
     * 
     * @param ApiTester $I 
     */
    public function podatkiUprizoritveZNapacenFormatDatumov(ApiTester $I)
    {
//        $this->expectIsoDate($zacetek, $this->translate('Začetek ('.$zacetek.') ni datum v ISO8601 obliki'), 1000972);
//        $this->expectIsoDate($konec, $this->translate('Konec ('.$konec.') ni datum v ISO8601 obliki'), 1000973);


        /**
         * napačen začetek
         */
        $resp = $I->failCallRpc($this->rpcUrl, 'podatkiUprizoritve', ["uprizoritevId" => $this->lookUprizoritev['id']
            , "zacetek"       => "leto 2050 -napačen format"
        ]);
        codecept_debug($resp);
        $I->assertNotEmpty($resp);
        $I->seeResponseIsJson();
        $I->assertEquals(1000972, $resp['code']);


        /**
         * napačen konec
         */
        $resp = $I->failCallRpc($this->rpcUrl, 'podatkiUprizoritve', ["uprizoritevId" => $this->lookUprizoritev['id']
            , "konec"         => "leto 2050 -napačen format"
        ]);
        codecept_debug($resp);
        $I->assertNotEmpty($resp);
        $I->seeResponseIsJson();
        $I->assertEquals(1000973, $resp['code']);
    }

}
