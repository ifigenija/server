<?php

namespace Rpc\Option;

use ApiTester;

/**
 * 
 * Testiram metode OptionsService-a
 * 
 * - getOptions  defaultValue 
 * - getOptions  globalna vrednost
 * - getOptions  user vrednost
 * - getOptions    opcija ne obstaja
 * - setUserOption zamenja vrednosti
 * - setUserOption kreira novo vrednost
 * - setUserOption vrednosti ne more kreirati, ker ni perUser
 * - setGlobalOption zamenja vrednost
 * - setGlobalOption kreira novo vrednost
 * - setGlobalOption vrednosti ne more kreirati, ker je readonly
 * - getOptions  globalna vrednost prebere prej kreirano
 * - getOptions  user vrednost prebere prej kreirano
 *  
 * 
 */
class OptionCest
{

    private $rpcUrl = '/rpc/app/options';

    /**
     * prebere defaultno vrednost opcije
     * 
     * @param ApiTester $I 
     */
    public function getOptionDefault(ApiTester $I)
    {
        //  pričakujemo enako, kot smo nastavili v fixture-ju
        $pricakovano = array("privzeta trojka");

        $opt = $I->successfullyCallRpc($this->rpcUrl, 'getOptions', ["name" => "test3.readonly"]);
        $I->assertNotEmpty($opt);
        $I->assertEquals($pricakovano, $opt);
    }

    public function getOptionGlobal(ApiTester $I)
    {
        //  pričakujemo enako, kot smo nastavili v fixture-ju
        $pricakovano = array(array("key" => "g", "value" => "globalna"));

        $opt = $I->successfullyCallRpc($this->rpcUrl, 'getOptions', ["name" => "test2.glob"]);
        $I->assertNotEmpty($opt);
        $I->assertEquals($pricakovano, $opt);
    }

    public function getOptionUser(ApiTester $I)
    {
        //  pričakujemo enako, kot smo nastavili v fixture-ju
        // zelena je pri anonymous -u
        $pricakovano = array(array("key" => "z", "value" => "zelena"));

        $opt = $I->successfullyCallRpc($this->rpcUrl, 'getOptions', ["name" => "test1.barva.ozadja"]);
        $I->assertNotEmpty($opt);
        $I->assertEquals($pricakovano, $opt);
    }

    public function getOptionNeobstojeca(ApiTester $I)
    {

        $opt = $I->successfullyCallRpc($this->rpcUrl, 'getOptions', ["name" => "neobstojeca"]);
        $I->assertEmpty($opt);
    }

    public function zamenjajVrednostSSetUserOption(ApiTester $I)
    {

        $odg = $I->successfullyCallRpc($this->rpcUrl, 'setUserOption', ["name"  => "test1.barva.ozadja",
            "value" => "nova userjeva vrednost"]);
        $I->assertNotEmpty($odg);
        $I->assertTrue($odg);
    }
    public function kreirajVrednostSSetUserOption(ApiTester $I)
    {
        $odg = $I->successfullyCallRpc($this->rpcUrl, 'setUserOption', ["name"  => "test2.glob",
            "value" => "kreirana user vrednost"]);
        $I->assertNotEmpty($odg);
        $I->assertTrue($odg);
    }

    public function pisiSsetGlobalOption(ApiTester $I)
    {

        $odg = $I->successfullyCallRpc($this->rpcUrl, 'setGlobalOption', ["name"  => "test1.barva.ozadja",
            "value" => "nova globalna vrednost"]);
        $I->assertNotEmpty($odg);
        $I->assertTrue($odg);
    }

}
