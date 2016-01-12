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
    private $lookUprizoritev1;
    private $lookUprizoritev2;
    private $lookUprizoritev3;
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
        $this->lookUprizoritev1 = $look                   = $I->lookupEntity("uprizoritev", "0002", false);
        $I->assertNotEmpty($look);

        // uprizoritev s praznimi datumi:
        $this->lookUprizoritev2 = $look                   = $I->lookupEntity("uprizoritev", "0006", false);
        $I->assertNotEmpty($look);

        // uprizoritev za analizo #1100 - število igralcev
        $this->lookUprizoritev3 = $look                   = $I->lookupEntity("uprizoritev", "0001", false);
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
        $resp = $I->successfullyCallRpc($this->rpcUrl, 'podatkiUprizoritve', ["uprizoritevId" => $this->lookUprizoritev1['id']]);
        codecept_debug($resp);
        $I->assertNotEmpty($resp);
        $I->seeResponseIsJson();
        $I->assertGreaterThanOrEqual(132, $resp['Do']['avtorskiHonorarji'], "avtorski do");
        $I->assertGreaterThanOrEqual(300, $resp['Do']['avtorskePravice'], "avtorskePravice");
        $I->assertGreaterThanOrEqual(726.2, $resp['Do']['materialni'], "materialni");
        $I->assertGreaterThanOrEqual(1058.2, $resp['Do']['nasDelez'], "naš delež do");
        $I->assertGreaterThanOrEqual(61, $resp['Na']['avtorskiHonorarji'], "avtorski na");
        $I->assertGreaterThanOrEqual(0, $resp['Na']['avtorskePravice'], "avtorskePravice");
        $I->assertGreaterThanOrEqual(23.1, $resp['Na']['materialni'], "materialni");
        $I->assertGreaterThanOrEqual(5, $resp['stZaposUmet'], "št. zaposlenih umetnikov");
        $I->assertGreaterThanOrEqual(1, $resp['stZaposDrug'], "št. zaposl. drugih");
        $I->assertGreaterThanOrEqual(3, $resp['Do']['stHonorarnihZun'], "honorarnih do");
        $I->assertGreaterThanOrEqual(2, $resp['Na']['stHonorarnihZun'], "honorarnih na");
        $I->assertGreaterThanOrEqual(2, $resp['Do']['stHonorarnihZunIgr'], "honorarnih igralcev do");
        $I->assertGreaterThanOrEqual(2, $resp['Na']['stHonorarnihZunIgr'], "honorarnih igralcev na");
        $I->assertGreaterThanOrEqual(1, $resp['Do']['stHonorarnihZunIgrTujJZ']);
        $I->assertGreaterThanOrEqual(1, $resp['Na']['stHonorarnihZunIgrTujJZ']);
        $I->assertGreaterThanOrEqual(1, $resp['Do']['stHonorarnihZunSamoz']);
        $I->assertGreaterThanOrEqual(1, $resp['Na']['stHonorarnihZunSamoz']);
        $I->assertEquals("2016-01-01T00:00:00+0100", $resp['datumZacStudija']);
        $I->assertEquals("2016-04-20T00:00:00+0200", $resp['datumPremiere']);
    }

    /**
     * 
     * @param ApiTester $I 
     */
    public function podatkiUprizoritve(ApiTester $I)
    {
//
        $resp        = $I->successfullyCallRpc($this->rpcUrl, 'podatkiUprizoritve', ["uprizoritevId" => $this->lookUprizoritev1['id']
            , "zacetek"       => "1970-01-01T01:00:00+0100", "konec"         => "2999-01-01T01:00:00+0100"
        ]);
        codecept_debug($resp);
        $stZaposUmet = $resp['stZaposUmet'];

        $I->seeResponseIsJson();
        $I->assertGreaterThanOrEqual(132, $resp['Do']['avtorskiHonorarji'], "avtorski do");
        $I->assertGreaterThanOrEqual(1058.2, $resp['Do']['nasDelez'], "naš delež do");
        $I->assertGreaterThanOrEqual(61, $resp['Na']['avtorskiHonorarji'], "avtorski na");
        $I->assertGreaterThanOrEqual(5, $resp['stZaposUmet'], "št. zaposlenih umetnikov"); //$$ prej 2
        $I->assertGreaterThanOrEqual(1, $resp['stZaposDrug'], "št. zaposl. drugih");  //$$ PREJ 3
        $I->assertGreaterThanOrEqual(3, $resp['Do']['stHonorarnihZun'], "honorarnih do");
        $I->assertGreaterThanOrEqual(2, $resp['Na']['stHonorarnihZun'], "honorarnih na");
        $I->assertGreaterThanOrEqual(2, $resp['Do']['stHonorarnihZunIgr'], "honorarnih igralcev do");
        $I->assertGreaterThanOrEqual(2, $resp['Na']['stHonorarnihZunIgr'], "honorarnih igralcev na");
        $I->assertGreaterThanOrEqual(1, $resp['Do']['stHonorarnihZunIgrTujJZ']);
        $I->assertGreaterThanOrEqual(1, $resp['Na']['stHonorarnihZunIgrTujJZ']);
        $I->assertGreaterThanOrEqual(1, $resp['Do']['stHonorarnihZunSamoz']);
        $I->assertGreaterThanOrEqual(1, $resp['Na']['stHonorarnihZunSamoz']);
        $I->assertEquals("2016-01-01T00:00:00+0100", $resp['datumZacStudija']);
        $I->assertEquals("2016-04-20T00:00:00+0200", $resp['datumPremiere']);


        /**
         * podatkiUprizoritveZOzjimIntervalom
         * moral bi sešteti le tiste alternacije, ki se vsaj deloma prekrivajo z datumom in začetkom programa dela
         */
        $resp = $I->successfullyCallRpc($this->rpcUrl, 'podatkiUprizoritve', ["uprizoritevId" => $this->lookUprizoritev1['id']
            , "zacetek"       => "2016-01-01T00:00:00+0100", "konec"         => "2016-04-20T00:00:00+0200"
        ]);
        codecept_debug($resp);
        $I->assertNotEmpty($resp);
        $I->seeResponseIsJson();
        $I->assertGreaterThanOrEqual(3, $resp['stZaposUmet']);
        $I->assertLessThan($stZaposUmet, $resp['stZaposUmet'], "št. zaposlenih umetnikov -ali sedaj manjše?");
        $I->assertEquals("2016-01-01T00:00:00+0100", $resp['datumZacStudija']);
        $I->assertEquals("2016-04-20T00:00:00+0200", $resp['datumPremiere']);
    }

    /**
     * moral bi sešteti le tiste alternacije, ki se vsaj deloma prekrivajo z datumom in začetkom programa dela
     * 
     * @param ApiTester $I 
     */
    public function podatkiUprizoritveZNeIsoZacetkom(ApiTester $I)
    {
//
        $resp = $I->successfullyCallRpc($this->rpcUrl, 'podatkiUprizoritve', ["uprizoritevId" => $this->lookUprizoritev1['id']
            , "zacetek"       => "2015-10-27T11:33:29+0200", "konec"         => "2016-04-20T00:00:00+0200"
//            , "zacetek"       => "1995-10-27T11:33:29+0200", "konec"         => "2016-04-20T00:00:00+0200"
//            , "zacetek"       => "2016-01-01T00:00:00+0100", "konec"         => "2016-04-20T00:00:00+0200"
        ]);
        codecept_debug($resp);
        $I->assertNotEmpty($resp);
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
        $resp = $I->failCallRpc($this->rpcUrl, 'podatkiUprizoritve', ["uprizoritevId" => $this->lookUprizoritev1['id']
            , "zacetek"       => "leto 2050 -napačen format"
        ]);
        codecept_debug($resp);
        $I->assertNotEmpty($resp);
        $I->seeResponseIsJson();
        $I->assertEquals(1000972, $resp['code']);


        /**
         * napačen konec
         */
        $resp = $I->failCallRpc($this->rpcUrl, 'podatkiUprizoritve', ["uprizoritevId" => $this->lookUprizoritev1['id']
            , "konec"         => "leto 2050 -napačen format"
        ]);
        codecept_debug($resp);
        $I->assertNotEmpty($resp);
        $I->seeResponseIsJson();
        $I->assertEquals(1000973, $resp['code']);
    }

    /**
     * 
     * @param ApiTester $I 
     */
    public function podatkiUprizoritveSPraznimDatumomVUprizoritvi(ApiTester $I)
    {
        /**
         * napačen začetek
         */
        $resp = $I->successfullyCallRpc($this->rpcUrl, 'podatkiUprizoritve', ["uprizoritevId" => $this->lookUprizoritev2['id']]);
        codecept_debug($resp);
        $I->assertNotEmpty($resp);
        $I->seeResponseIsJson();
//        $I->assertEquals(1000972, $resp['code']);
    }

}
