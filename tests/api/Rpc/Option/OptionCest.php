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
 * - setUserOption
 * - setGlobalOption
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
        $pricakovano = array(array("key" => "M", "value" => "Moški"), array("key" => "Z", "value" => "Ženska"));

        $opt = $I->successfullyCallRpc($this->rpcUrl, 'getOptions', ["name" => "oseba.spol"]);
        $I->assertNotEmpty($opt);
        $I->assertEquals($pricakovano, $opt);
    }

    public function getOptionGlobal(ApiTester $I)
    {
        //  pričakujemo enako, kot smo nastavili v fixture-ju
        $pricakovano = array(array("key" => "m", "value" => "modra"));

        $opt = $I->successfullyCallRpc($this->rpcUrl, 'getOptions', ["name" => "test1.barva.ozadja"]);
        $I->assertNotEmpty($opt);
        $I->assertEquals($pricakovano, $opt);
    }
    public function getOptionUser(ApiTester $I)
    {
        //  pričakujemo enako, kot smo nastavili v fixture-ju
        $pricakovano = array(array("key" => "z", "value" => "zelena"));

        $opt = $I->successfullyCallRpc($this->rpcUrl, 'getOptions', ["name" => "test1.barva.ozadja"]);
        $I->assertNotEmpty($opt);
        $I->assertEquals($pricakovano, $opt);
    }
    public function pisiSSetUserOption(ApiTester $I)
    {
        //  pričakujemo enako, kot smo nastavili v fixture-ju
        $novaV = "nova user vrednost";

        $opt = $I->successfullyCallRpc($this->rpcUrl, ' setUserOption', ["name" => "test1.barva.ozadja"]);
        $I->assertNotEmpty($opt);
        $I->assertEquals($pricakovano, $opt);
    }

}
