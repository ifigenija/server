<?php

namespace Rpc\Praznik;

use ApiTester;

/**
 * Testiranje rpc metode v PraznikRpcService
 * - delaProstDan
 *  . različni datumi
 *  . validacije
 *  . avtorizacije
 */
class DelaProstDanCest
{

    private $rpcUrl = '/rpc/koledar/praznik';

    public function _before(ApiTester $I)
    {
// da testiramo vsa posamezna dovoljenja brez shortCurcuit
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vesna, \IfiTest\AuthPage::$vesnaPass);
    }

    /**
     * 
     * @param ApiTester $I 
     */
    public function delaProstDan(ApiTester $I)
    {
// novo leto
        $resp = $I->successfullyCallRpc($this->rpcUrl, 'delaProstDan', [ "datum" => "2017-01-01T01:00:00+0100"]);
        codecept_debug($resp);
        $I->assertTrue($resp);
        
// navaden dan
        $resp = $I->successfullyCallRpc($this->rpcUrl, 'delaProstDan', [ "datum" => "2017-01-05T01:00:00+0100"]);
        codecept_debug($resp);
        $I->assertFalse($resp);
// velika noč
        $resp = $I->successfullyCallRpc($this->rpcUrl, 'delaProstDan', [ "datum" => "2017-04-17T01:00:00+0200"]);
        $I->assertTrue($resp);
// ni velika noč
        $resp = $I->successfullyCallRpc($this->rpcUrl, 'delaProstDan', [ "datum" => "2018-04-17T01:00:00+0200"]);
        $I->assertFalse($resp);
    }

    /**
     * vzame default datume za začetek in konec 
     * 
     * @param ApiTester $I 
     */
    public function delaProstZNapacnimFormatomDatuma(ApiTester $I)
    {
        $resp = $I->failCallRpc($this->rpcUrl, 'delaProstDan', ["datum" => "to ni datum 1.1.2018"]);
        codecept_debug($resp);
        $I->assertEquals(1001110, $resp['code']);
    }
    
}
