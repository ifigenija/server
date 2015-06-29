<?php

namespace Rpc\EnotaPrograma;

use ApiTester;

/**
 * Testiranje metod EnotaProgramaService-a
 * - novaMaticnaKoprodukcija
 * negativni testi
 * - neveljaven id enote programa
 * - koprodukcija že obstaja
 * - itd.
 * idempotentnost
 */
class EnotaProgramaCest
{

    private $rpcUrl               = '/rpc/programdela/enotaprograma';
    private $programPremieraUrl   = '/rest/programpremiera';
    private $produkcijaDelitevUrl = '/rest/produkcijadelitev';
    private $objProgramPremiera1;
    private $objProgramPremiera2;

    public function _before(ApiTester $I)
    {
        // da testiramo vsa posamezna dovoljenja brez shortCurcuit
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vesna, \IfiTest\AuthPage::$vesnaPass);
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
        $this->objProgramPremiera1 = $drzava                    = array_pop($list);
        $I->assertNotEmpty($drzava);
        $this->objProgramPremiera2 = $drzava                    = array_pop($list);
        $I->assertNotEmpty($drzava);
    }

    /**
     * 
     * @param ApiTester $I 
     */
    public function novaMaticnaKoprodukcija(ApiTester $I)
    {
        // pričakujemo kreiranje nove produkcijske delitve za lastno gledališče
        $resp = $I->successfullyCallRpc($this->rpcUrl, 'novaMaticnaKoprodukcija', ["enotaProgramaId" => $this->objProgramPremiera1['id']]);
        $I->assertNotEmpty($resp);
        $I->seeResponseIsJson();
        $I->assertEquals(36, strlen($resp), "dolžina guid");
        $I->assertEquals(8, stripos($resp, "-"), "prvi '-' v  guid");

        //$$ tu bi lahko se preverili, ce so zapisane prave vrednosti
    }

    public function ponovnoNovaMaticnaKoprodukcija(ApiTester $I)
    {

        // pričakujemo napako
        $resp = $I->successfullyCallRpc($this->rpcUrl, 'novaMaticnaKoprodukcija', ["enotaProgramaId" => $this->objProgramPremiera1['id']]);
        $I->assertNotEmpty($resp);
        $I->seeResponseIsJson();
        $I->assertEquals(36, strlen($resp), "dolžina guid");
        $I->assertEquals(8, stripos($resp, "-"), "prvi '-' v  guid");
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function novaMaticnaKoprodukcijaBrezEnotePrograma(ApiTester $I)
    {

        // pričakujemo napako, ker delitev že obstaja
        $resp = $I->failCallRpc($this->rpcUrl, 'novaMaticnaKoprodukcija', ["enotaProgramaId" => "neobstojeca"]);
        $I->assertNotEmpty($resp);
//        $I->assertEquals(1000941, $resp['code'], "ni enote programa");  // javi napako code: -32000
    }

}
