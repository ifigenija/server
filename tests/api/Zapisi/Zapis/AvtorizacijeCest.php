<?php

/*
 * Licenca GPL V3 or later
 *  
 */

namespace Zapisi\Zapis;

/*
 * Licenca GPL V3 or later
 *  
 */

use ApiTester;

/**
 * Scenarij:
 * - ustvarim zapis  z 2 lastnikoma, v 2 mapah, kjer ima uporabnik1 write/append dostop, uporabnik2 nima niti read dostopa
 * - avtorizacija spremembe zapisa, pričakovano:
 *   . u1 ima update dostop
 *   . u2 nima read dostopa
 * - k zapisu dodamo lastnika3 , kjer u1  nima write dostopa, u2  imaread dostop
 * - avtorizacija spremembe zapisa, pričakovano:
 *   . u1 nima update dostopa
 *   . u2 ima read dostop
 * - odstrani lastnika 3
 * - zapisu dodamo v mapo 3, kjer u1  nima append dostopa, u2  ima read dostop
 * - avtorizacija spremembe zapisa, pričakovano:
 *   . u1 nima update dostopa
 *   . u2 ima read dostop
 * 
 * @author rado
 */
class AvtorizacijeCest
{

    private $zapisUrl    = '/rest/zapis/default';
    private $lastnikUrl  = '/rest/zapislastnik/default';
    private $datUrl      = '/rest/zapis/default';
    private $uploadUrl   = '/fs/nalozi/zapisi';
    private $downloadUrl = '/fs/prenesi/zapisi';
    private $mapaUrl     = '/rest/mapa/default';
    private $objZapis1;
    private $objZapis2;
    private $objZapis3;
    private $objZapis4;
    private $objMapa1;
    private $objMapa2;
    private $objMapa3;
    private $objMapa4;
    private $objMapa5;
    private $objZapisLastnik1;
    private $objZapisLastnik2;
    private $objZapisLastnik3;
    private $objZapisLastnik4;
    private $objDatoteka1;
    private $objDatoteka2;
    private $objDatoteka3;
    private $objDatoteka4;
    private $lookOseba1;
    private $lookOseba2;
    private $lookProgramDela1;
    private $lookProgramDela2;
    private $lookMapa1;
    private $lookMapa2;
    private $lookUprizoritev1;
    private $lookUprizoritev2;
    private $lookUprizoritev3;
    private $lookUprizoritev4;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupMapa(ApiTester $I)
    {
        $this->lookMapa1 = $ent             = $I->lookupEntity("mapa", "Prva mapa", false);
        $I->assertGuid($ent['id']);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupUprizoritev(ApiTester $I)
    {
        $this->lookUprizoritev1 = $look                   = $I->lookupEntity("uprizoritev", "0001", false);
        codecept_debug($look);

        $this->lookUprizoritev2 = $look                   = $I->lookupEntity("uprizoritev", "0002", false);
        codecept_debug($look);

        $this->lookUprizoritev3 = $look                   = $I->lookupEntity("uprizoritev", "0003", false);
        codecept_debug($look);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupOsebo(ApiTester $I)
    {
        $this->lookOseba1 = $ent              = $I->lookupEntity("oseba", "0006", false);
        $I->assertGuid($ent['id']);

        $this->lookOseba2 = $ent              = $I->lookupEntity("oseba", "0007", false);
        $I->assertGuid($ent['id']);
    }

    /**
     * Testiram ustvarjanje priponke, tipa datoteka 
     * 
     * @depends lookupUprizoritev
     * @param ApiTester $I
     */
    public function ustvariZapisDatoteka(ApiTester $I)
    {

// pripnem komentar na kontaktno osebo         
        $lastnik = [
            'lastnik'       => $this->lookUprizoritev1['id'],
            'classLastnika' => 'Uprizoritev',
        ];

        /**
         * kreiram zapis
         */
        $l = $I->successfullyCreate($this->lastnikUrl, $lastnik);

        $data            = [
            'title'       => 'avto',
            'tip'         => 'datoteka',
            'description' => "zz",
            'vrsta'       => null,
        ];
        $this->objZapis2 = $prip            = $I->successfullyCreate($this->zapisUrl . "?lastnik=" . $l['id'], $data);
        codecept_debug($this->objZapis2);

        $this->objDatoteka1 = $prip['datoteka'];
        $I->assertEquals($data['title'], $prip['title'], " title");
    }

    /**
     *  k zapisu dodamo še enega lastnika
     *  u1 ima write dostop
     *  u2 nima niti read dostopa
     * 
     * @depends ustvariZapisDatoteka
     * @param ApiTester $I
     */
    public function dodajLastnikaKZapisu(ApiTester $I)
    {
        $data = [
            'lastnik'       => $this->lookUprizoritev2['id'],
            'classLastnika' => 'Uprizoritev',
            'zapis'         => $this->objZapis2,
        ];

        $this->objZapisLastnik2 = $ent                    = $I->successfullyCreate($this->lastnikUrl, $data);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function ustvariDrevoMap(ApiTester $I)
    {
        $data['ime']         = 'm1a';
        $data['javniDostop'] = 'A';
        $data['parent']      = $this->lookMapa1['id'];
        $this->objMapa1      = $I->successfullyCreate($this->mapaUrl, $data);

        $data['ime']    = 'm2a';
        $this->objMapa2 = $I->successfullyCreate($this->mapaUrl, $data);

        $data['ime']    = 'm4a';
        $this->objMapa4 = $I->successfullyCreate($this->mapaUrl, $data);

        $data['ime']         = 'm3r';
        $data['javniDostop'] = 'R';
        $this->objMapa3      = $I->successfullyCreate($this->mapaUrl, $data);
    }

    /**
     * kreiramo relacijo
     * 
     * @param ApiTester $I
     */
    public function dodajZapisVMapi(ApiTester $I)
    {
        $resp = $I->successfullyUpdate($this->mapaUrl, $this->objMapa1['id'] . "/zapisi/" . $this->objZapis2['id'], []);
        codecept_debug($resp);

        $resp = $I->successfullyUpdate($this->mapaUrl, $this->objMapa2['id'] . "/zapisi/" . $this->objZapis2['id'], []);
        codecept_debug($resp);
    }

    /**
     * 1. scenarij Zapis ima 2 write lastnika in je v 2 append mapah 
     *   . u1 ima update dostop
     *   . u2 nima read dostopa
     * 
     * @param ApiTester $I
     */
    public function checkDostopaDoZapisaZ2WLastnikomaV2AMapah(ApiTester $I)
    {

        /**
         * u1 bi moral imeti write/update dostop do vseh lastnikov zapisa in map
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vlado, \IfiTest\AuthPage::$vladoPass);
        $data            = $this->objZapis2;
        $data['subject'] = "upd vlado";
        $this->objZapis2 = $entR            = $I->successfullyUpdate($this->zapisUrl, $data['id'], $data);
        /**
         * dodajanje v mapo
         *
         * v ne append mapo ne more dodajati
         */
        $resp            = $I->failToUpdate($this->mapaUrl, $this->objMapa3['id'] . "/zapisi/" . $this->objZapis2['id'], []);
        codecept_debug($resp);
        $I->assertEquals(1000601, $resp[0]['code']);
        /**
         * iz ne append mapo ne more odvzemati zapisa
         */
        $resp            = $I->failToDelete($this->mapaUrl, $this->objMapa3['id'] . "/zapisi/" . $this->objZapis2['id'], []);
        codecept_debug($resp);
        $I->assertEquals(100681, $resp[0]['code']);
        /**
         * v append mapo lahko dodaja
         */
        $I->successfullyUpdate($this->mapaUrl, $this->objMapa4['id'] . "/zapisi/" . $this->objZapis2['id'], []);

        /**
         * iz append mapo lahko odvzame zapis
         */
        $I->successfullyDelete($this->mapaUrl, $this->objMapa4['id'] . "/zapisi/" . $this->objZapis2['id'], []);


        /**
         * u2 nima read dostopa do nobenega lastnika in do nobene mape
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$rudi, \IfiTest\AuthPage::$rudiPass);
        $resp = $I->failToGet($this->zapisUrl, $data['id']);
        codecept_debug($resp);
        $I->assertEquals(100099, $resp[0][0]['code']);
        /**
         * getlist
         */
        $resp = $I->failToGetList($this->zapisUrl . "?lastnik=" . $this->objZapisLastnik2['lastnik'], []);
        codecept_debug($resp);
        $I->assertEquals(1001018, $resp[0]['code']);
    }

    /**
     *  k zapisu dodamo še enega lastnika
     *  u1 nima write dostopa
     *  u2 ima read dostop
     * 
     * @depends ustvariZapisDatoteka
     * @param ApiTester $I
     */
    public function dodajLastnikaOseboKZapisu(ApiTester $I)
    {
        $data = [
            'lastnik'       => $this->lookOseba1['id'],
            'classLastnika' => 'Oseba',
            'zapis'         => $this->objZapis2,
        ];

        $this->objZapisLastnik3 = $ent                    = $I->successfullyCreate($this->lastnikUrl, $data);
    }

    /**
     * 2. scenarij Zapis ima 2 write in 1 read  lastnika  in je v 2 append mapah 
     *   . u1 nimaima update dostop
     *   . u2 ima read dostop
     * 
     * @param ApiTester $I
     */
    public function checkDostopaDoZapisaZ2WIn1RLastnikomVVecAMapah(ApiTester $I)
    {
        /**
         * u1 nima write dostopa do vseh lastnikov
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vlado, \IfiTest\AuthPage::$vladoPass);
        $data            = $this->objZapis2;
        $data['subject'] = "upd 2 vlado";
        $resp            = $I->failToUpdate($this->zapisUrl, $data['id'], $data);
        $I->assertEquals(1000101, $resp[0]['code']);

        /**
         * u2  ima read dostopa do 1 lastnika
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$rudi, \IfiTest\AuthPage::$rudiPass);
        $ent = $I->successfullyGet($this->zapisUrl, $data['id']);
        /**
         * getlist
         */
        $I->successfullyGetList($this->zapisUrl . "?lastnik=" . $this->objZapisLastnik2['lastnik'], []);
    }

    /**
     *  k zapisu dodamo še enega lastnika
     *  u1 nima write dostopa
     *  u2 ima read dostop
     * 
     * @depends dodajLastnikaOseboKZapisu
     * @param ApiTester $I
     */
    public function odvzemiLastnikaOseboZapisu(ApiTester $I)
    {
        $this->objZapisLastnik3 = $ent                    = $I->successfullyDelete($this->lastnikUrl, $this->objZapisLastnik3['id']);

        /**
         * preverim za vsak slučaj,
         * 
         * u2 nima več dostopa dostopa do zapisa
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$rudi, \IfiTest\AuthPage::$rudiPass);
        $ent = $I->failToGet($this->zapisUrl, $this->objZapis2['id']);
    }

    /**
     *  zapis dodamo v read mapo
     *  u1 nima write dostopa
     *  u2 ima read dostop
     * 
     * @depends ustvariZapisDatoteka
     * @param ApiTester $I
     */
    public function dodajZapisVReadMapi(ApiTester $I)
    {
        $resp = $I->successfullyUpdate($this->mapaUrl, $this->objMapa3['id'] . "/zapisi/" . $this->objZapis2['id'], []);
        codecept_debug($resp);
    }

    /**
     * 3. scenarij Zapis (ima 2 write lastnika)   in  je v 2 append in eni read mapah 
     *   . u1 nima update dostopa
     *   . u2 ima read dostop
     * 
     * @depends odvzemiLastnikaOseboZapisu
     * @depends dodajZapisVReadMapi
     * @param ApiTester $I
     */
    public function checkDostopaDoZapisaVVecAIn1RMapah(ApiTester $I)
    {
        /**
         * u1 nima append dostopa do vseh map
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vlado, \IfiTest\AuthPage::$vladoPass);
        $data            = $this->objZapis2;
        $data['subject'] = "upd 3 vlado";
        $resp            = $I->failToUpdate($this->zapisUrl, $data['id'], $data);
        $I->assertEquals(1000101, $resp[0]['code']);

        /**
         * u2  ima read dostopa do 1 mape
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$rudi, \IfiTest\AuthPage::$rudiPass);
        $ent = $I->successfullyGet($this->zapisUrl, $data['id']);
        /**
         * getlist
         */
        $I->successfullyGetList($this->zapisUrl . "?lastnik=" . $this->objZapisLastnik2['lastnik'], []);
    }

    /**
     * 
     * 
     * @depends ustvariDrevoMap
     * @param ApiTester $I
     */
    public function checkDodajPodmapo(ApiTester $I)
    {
        /**
         * v append mapo lahko dodamo podmapo
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vihra, \IfiTest\AuthPage::$vihraPass);
        $data['ime']         = 'podmapa 4.1 r';
        $data['javniDostop'] = 'R';
        $data['parent']      = $this->objMapa4['id'];
        $this->objMapa5      = $I->successfullyCreate($this->mapaUrl, $data);

        /**
         * v ne append mapo ne moremo dodati podmape
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vihra, \IfiTest\AuthPage::$vihraPass);
        $data['ime']         = 'podmapa 4.2 r';
        $data['javniDostop'] = 'R';
        $data['parent']      = $this->objMapa3['id'];
        $resp                = $I->failToCreate($this->mapaUrl, $data);
        codecept_debug($resp);
        $I->assertEquals(1007008, $resp[0]['code']);
    }

}

//        $I->assertTrue(false, "$$ začasno");
