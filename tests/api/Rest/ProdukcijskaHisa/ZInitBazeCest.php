<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\ProdukcijskaHisa;

use ApiTester;

/**
 * Init baze, da kasnejši testi ne javljajo več error 
 * Zakaj je to potrebno ni čisto razjasnjeno
 * 
 * @author rado
 */
class ZInitBazeCest
{

    private $enotaProgramaRpcUrl    = '/rpc/programdela/enotaprograma';

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }
    /**
     * inicializira bazo  glede na DumpFunctional.sql
     * 
     * 
     * @param ApiTester $I
     */
    public function initBaze(ApiTester $I)
    {
        $I->initDB();
    }

}
