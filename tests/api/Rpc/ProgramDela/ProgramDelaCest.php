<?php

namespace Rpc\ProgramDela;

use ApiTester;

/**
 * Testiranje metod ProgramDelaService-a
 * - zakleni
 * negativni testi
 * - neveljaven id enote programa
 * - pomenjkanje privilegijev
 * idempotentnost
 */
class ProgramDelaCest
{

    private $rpcUrl  = '/rpc/programdela/programdela';
    private $restUrl = '/rest/programdela';
    private $objProgramDela1;
    private $objProgramDela2;

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
    public function getListProgramDela(ApiTester $I)
    {
        $resp                  = $I->successfullyGetList($this->restUrl, []);
        $list                  = $resp['data'];
        $I->assertNotEmpty($list);
        $this->objProgramDela1 = $ent                   = array_pop($list);
        $I->assertNotEmpty($ent);
    }

    /**
     * @depends getListProgramDela
     * 
     * @param ApiTester $I 
     */
    public function zakleni(ApiTester $I)
    {
        // preverimo, če je prej nastavljeno na false
        $ent = $I->successfullyGet($this->restUrl, $this->objProgramDela1['id']);
        $I->assertFalse($ent['zakljuceno'], "ali zaključeno");

        // pričakujemo, da bo polje  zakljuceno nastavil na true
        $resp = $I->successfullyCallRpc($this->rpcUrl, 'zakleni', ["programDelaId" => $this->objProgramDela1['id']]);
        $I->assertNotEmpty($resp);
        $I->seeResponseIsJson();
        $I->assertTrue($resp, "ali uspešno");

        // preverimo, če so v bazi prave vrednosti
        $ent = $I->successfullyGet($this->restUrl, $this->objProgramDela1['id']);
        $I->assertTrue($ent['zakljuceno'], "ali zaključeno");
    }

    /**
     * @depends zakleni
     * @param ApiTester $I
     */
    public function ponovnoZakleni(ApiTester $I)
    {

        // pričakujemo, da bo polje  zakljuceno nastavil na true
        $resp = $I->successfullyCallRpc($this->rpcUrl, 'zakleni', ["programDelaId" => $this->objProgramDela1['id']]);
        $I->assertNotEmpty($resp);
        $I->seeResponseIsJson();
        $I->assertTrue($resp, "ali uspešno");

        // preverimo, če so v bazi prave vrednosti
        $ent = $I->successfullyGet($this->restUrl, $this->objProgramDela1['id']);
        $I->assertTrue($ent['zakljuceno'], "ali zaključeno");
    }

    /**
     * 
     * @depends getListProgramDela
     * @param ApiTester $I
     */
    public function zakleniZNeobstojecimId(ApiTester $I)
    {
        $resp = $I->failCallRpc($this->rpcUrl, 'zakleni', ["programDelaId" => "neobstojeca"]);
        $I->assertNotEmpty($resp);
    }

    /**
     * @depends ponovnoZakleni
     * @param ApiTester $I
     */
    public function odkleni(ApiTester $I)
    {

        // pričakujemo, da bo polje  zakljuceno nastavil na false
        $resp = $I->successfullyCallRpc($this->rpcUrl, 'odkleni', ["programDelaId" => $this->objProgramDela1['id']]);
        $I->assertNotEmpty($resp);
        $I->seeResponseIsJson();
        $I->assertTrue($resp, "ali uspešno");

        // preverimo, če so v bazi prave vrednosti
        $ent = $I->successfullyGet($this->restUrl, $this->objProgramDela1['id']);
        $I->assertFalse($ent['zakljuceno'], "ali odklenjeno");
    }

    /**
     * @depends getListProgramDela
     * @param ApiTester $I
     */
    public function podatkiPrilogaC2(ApiTester $I)
    {
        $resp = $I->successfullyCallRpc($this->rpcUrl, 'podatkiPrilogaC2', ["programDelaId" => $this->objProgramDela1['id']]);
        codecept_debug($resp);
        $I->assertNotEmpty($resp);
        $I->seeResponseIsJson();
//        $I->assertGreaterThanOrEqual(726.2, $resp['premiere']['2.0']['vrednost'],"['premiere']['2.0']");

    }

}
