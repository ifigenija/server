<?php

namespace Rpc\Option;

use ApiTester;

/**
 * 
 * Testiranje metod OptionsService-a
 * 
 * testi iz fixturj-jev:
 *      - getOptions  defaultValue 
 *      - getOptions  globalna vrednost
 *      - getOptions  user vrednost
 * 
 * nastavljanje in branje vrednosti:
 *      - setGlobalOption zamenja vrednost
 *      - setGlobalOption kreira novo vrednost
 *      - getOptions  globalna vrednost prebere prej kreirano 
 *      - setUserOption zamenja vrednosti
 *      - setUserOption kreira novo vrednost
 *      - getOptions  user vrednost prebere prej kreirano
 * 
 * negativni testi 
 *      - getOptions    opcija ne obstaja
 *      - setGlobalOption vrednosti ne more kreirati, ker je readonly
 *      - setUserOption vrednosti ne more kreirati, ker ni perUser
 * 
 */
class OptionCest
{

    private $rpcUrl = '/rpc/app/options';

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    /**
     *  -  getOptions  defaultValue 
     * 
     * @param ApiTester $I 
     */
    public function beriPrivzetoOpcijoIzFixturjev(ApiTester $I)
    {
        //  pričakujemo enako, kot smo nastavili v fixture-ju
        $pricakovano = array("privzeta trojka");

        $opt = $I->successfullyCallRpc($this->rpcUrl, 'getOptions', ["name" => "test3.readonly"]);
        $I->assertNotEmpty($opt);
        $I->assertEquals($pricakovano, $opt);
        $I->seeResponseIsJson();
    }

    /**
     * - getOptions  globalna vrednost
     * 
     * @param ApiTester $I
     */
    public function preberiGlobalnoOpcijoIzFixturjev(ApiTester $I)
    {
        //  pričakujemo enako, kot smo nastavili v fixture-ju
        $pricakovano = array(array("key" => "g", "value" => "globalna"));

        $opt = $I->successfullyCallRpc($this->rpcUrl, 'getOptions', ["name" => "test2.glob"]);
        $I->assertNotEmpty($opt);
        $I->assertEquals($pricakovano, $opt);
        $I->seeResponseIsJson();
    }

    /**
     *  - getOptions  user vrednost
     * 
     * @param ApiTester $I
     */
    public function preberiUserOpcijoIzFixturjev(ApiTester $I)
    {
        //  pričakujemo enako, kot smo nastavili v fixture-ju
        //  rumena je pri admin@ifigenija.si
        $pricakovano = array(array("key" => "r", "value" => "rumena"));

        $opt = $I->successfullyCallRpc($this->rpcUrl, 'getOptions', ["name" => "test1.barva.ozadja"]);
        $I->assertNotEmpty($opt);

        $I->assertEquals($pricakovano, $opt);
        $I->seeResponseIsJson();
    }

    /**
     * - setGlobalOption zamenja vrednost
     * 
     * @param ApiTester $I
     */
    public function zamenjajGlobalnoOpcijo(ApiTester $I)
    {

        $odg = $I->successfullyCallRpc($this->rpcUrl, 'setGlobalOption', ["name"  => "test1.barva.ozadja",
            "value" => "nova globalna vrednost"]);
        $I->assertNotEmpty($odg);
        $I->assertTrue($odg);
    }

    /**
     *     - setGlobalOption kreira novo vrednost
     * 
     * @param ApiTester $I
     */
    public function kreirajGlobalnoOpcijo(ApiTester $I)
    {

        $odg = $I->successfullyCallRpc($this->rpcUrl, 'setGlobalOption', ["name"  => "test4",
            "value" => "nova glob vr"]);
        $I->assertNotEmpty($odg);
        $I->assertTrue($odg);
    }

    /**
     * - getOptions  globalna vrednost prebere prej kreirano
     * 
     * paziti je potrebno, da še ni user opcije, sicer bi prebral le-to
     * 
     * @depends kreirajGlobalnoOpcijo 
     * @param ApiTester $I
     */
    public function preberiKreiranoGlobalnoOpcijo(ApiTester $I)
    {
        $pricakovano = "nova glob vr";

        $opt = $I->successfullyCallRpc($this->rpcUrl, 'getOptions', ["name" => "test4"]);
        $I->assertNotEmpty($opt);
        $I->assertEquals($pricakovano, $opt);
        $I->seeResponseIsJson();
    }

    /**
     *  - setUserOption zamenja vrednosti
     * 
     * @param ApiTester $I
     */
    public function zamenjajVrednostUserOpcije(ApiTester $I)
    {

        $odg = $I->successfullyCallRpc($this->rpcUrl, 'setUserOption', ["name"  => "test1.barva.ozadja",
            "value" => "nova userjeva vrednost"]);
        $I->assertNotEmpty($odg);
        $I->assertTrue($odg);
    }

    /**
     * - setUserOption kreira novo vrednost
     * 
     * @param ApiTester $I
     */
    public function kreirajUserOpcijo(ApiTester $I)
    {
        $odg = $I->successfullyCallRpc($this->rpcUrl, 'setUserOption', ["name"  => "test4",
            "value" => "kreirana nuv"]);
        $I->assertNotEmpty($odg);
        $I->assertTrue($odg);
    }

    /**
     * - getOptions  user vrednost prebere prej kreirano
     *  
     * @depends kreirajUserOpcijo
     * @param ApiTester $I
     */
    public function preberiKreiranoUserOpcijo(ApiTester $I)
    {
        $pricakovano = "kreirana nuv";

        $opt = $I->successfullyCallRpc($this->rpcUrl, 'getOptions', ["name" => "test4"]);
        $I->assertNotEmpty($opt);
        $I->assertEquals($pricakovano, $opt);
        $I->seeResponseIsJson();
    }

    /**
     * - getOptions    opcija ne obstaja
     * 
     * @param ApiTester $I
     */
    public function poskusiPrebratiNeobstojeco(ApiTester $I)
    {

        $odg = $I->failCallRpc($this->rpcUrl, 'getOptions', ["name" => "neobstojeca"]);
        $I->assertNotEmpty($odg);
        $I->seeResponseIsJson();
    }

    //- setGlobalOption vrednosti ne more kreirati, ker je readonly
    public function poizkusiKreiratiOnemogocenoGlobalnoOpcijo(ApiTester $I)
    {

        $odg = $I->failCallRpc($this->rpcUrl, 'setGlobalOption', ["name"  => "test3.readonly",
            "value" => "onemogočena globalna opcija"]);
        $I->assertNotEmpty($odg);
        $I->seeResponseIsJson();
    }

//- setUserOption vrednosti ne more kreirati, ker ni perUser
    public function poskusiKreiratiOnemogocenoUserOpcijo(ApiTester $I)
    {

        $odg = $I->failCallRpc($this->rpcUrl, 'setUserOption', ["name"  => "test5.notperUser",
            "value" => "onemogočena user opcija"]);
        $I->assertNotEmpty($odg);
        $I->seeResponseIsJson();
    }

}
