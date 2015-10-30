<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\ProgramFestival;

use ApiTester;

/**
 * Init baze, da kasnejši testi ne javljajo več error 
 * 
 * @author rado
 */
class AAInitBazeCest
{

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
