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

//use Page\SifrantPage;

/**
 * Kreiranje kalkulacije 
 *
 * Scenarij:
 * 
 * 1. kreiraj priponko,
 * 2. 
 * 
 * 
 * @author boris
 */
class ZapisScenarijCest
{

    private $pripUrl     = '/rest/zapis/default';
    private $lastnikUrl  = '/rest/zapislastnik/default';
    private $datUrl      = '/rest/zapis/default';
    private $uploadUrl   = '/fs/nalozi/zapisi';
    private $downloadUrl = '/fs/prenesi/zapisi';
    private $mapaUrl     = '/rest/mapa/default';
    private $objZapis1;
    private $objZapis2;
    private $objZapis3;
    private $objZapis4;
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
    public function lookupOsebo(ApiTester $I)
    {
        $this->lookOseba1 = $ent              = $I->lookupEntity("oseba", "0006", false);
        $I->assertGuid($ent['id']);

        $this->lookOseba2 = $ent              = $I->lookupEntity("oseba", "0007", false);
        $I->assertGuid($ent['id']);
    }

    /**
     * Ustvarim nov komentar in ga povežem na osebo 
     * 
     * @depends lookupOsebo
     * @param ApiTester $I
     */
    public function ustvariZapisKomentar(ApiTester $I)
    {
// pripnem komentar na kontaktno osebo         
        $lastnik = [
            'lastnik'       => $this->lookOseba1['id'],
            'classLastnika' => 'Oseba',
        ];

        $l = $I->successfullyCreate($this->lastnikUrl, $lastnik);

        $data            = [
            'title'       => 'tralalla',
            'tip'         => 'komentar',
            'description' => "1212",
            'vrsta'       => null,
        ];
        $this->objZapis1 = $prip            = $I->successfullyCreate($this->pripUrl . '?lastnik=' . $l['id'], $data);

        $I->assertNull($prip['datoteka']);
        $I->assertEquals($data['title'], $prip['title']);

// spremenim komentar
        $prip['title'] = "trala komen";
        $updated       = $I->successfullyUpdate($this->pripUrl, $prip['id'], $prip);
        $I->assertEquals($updated['title'], $prip['title']);
        $I->assertNotEmpty($updated['lastniki']);
        $I->assertNull($updated['datoteka']);
    }

    /**
     * Testiram ustvarjanje priponke, tipa datoteka 
     * 
     * @depends lookupOsebo
     * @param ApiTester $I
     */
    public function ustvariZapisDatoteka(ApiTester $I)
    {

// pripnem komentar na kontaktno osebo         
        $lastnik = [
            'lastnik'       => $this->lookOseba1['id'],
            'classLastnika' => 'Oseba',
        ];

        /**
         * kreiram zapis
         */
        $l = $I->successfullyCreate($this->lastnikUrl, $lastnik);

        $data               = [
            'title'       => 'hopsasa',
            'tip'         => 'datoteka',
            'description' => "zz",
            'vrsta'       => null,
        ];
        $this->objZapis2    = $prip               = $I->successfullyCreate($this->pripUrl . "?lastnik=" . $l['id'], $data);
        codecept_debug($prip['datoteka']);
        $I->assertNotEmpty($prip['datoteka'], "datoteka");
        $I->assertGuid($prip['datoteka']['id'], "id datoteke");
        $this->objDatoteka1 = $prip['datoteka'];
        $I->assertEquals($data['title'], $prip['title'], " title");

        /**
         * update zapisa
         */
        $prip['title'] = "hopsasa dat";
        $p             = $I->successfullyUpdate($this->pripUrl, $prip['id'], $prip);
        $I->assertEquals($p['title'], $prip['title']);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function uploadDatoteke(ApiTester $I)
    {
        $urlcel   = $this->uploadUrl . "/" . $this->objDatoteka1['id'];
        $base_url = $I->getPhpBrowserUrl();

        $filePath = 'data/fileexamples/a.txt';
        $body     = fopen($filePath, 'r');

        $client   = new \GuzzleHttp\Client(['base_uri' => $base_url]);
        $response = $client->request('POST', $urlcel, [
            'multipart' => [
                [
                    'name'     => 'fileupload',
                    'contents' => fopen($filePath, 'r')
                ],
            ]
        ]);
    }

    /**
     * @depends uploadDatoteke
     * @param ApiTester $I
     */
    public function downloadDatoteke(ApiTester $I)
    {
        $data = $this->objDatoteka1;
        codecept_debug($data);

        $resp = $I->successfullyGetAttachment($this->downloadUrl, $this->objDatoteka1['id']);
        codecept_debug($resp);
    }

    /**
     * Testiram ustvarjanje priponke, tipa datoteka 
     * @param ApiTester $I
     */
    public function ustvariZapisMapa(ApiTester $I)
    {
        /**
         *  pripnem komentar na osebo         
         */
        $lastnik = [
            'lastnik'       => $this->lookOseba1['id'],
            'classLastnika' => 'Oseba',
        ];

        $l = $I->successfullyCreate($this->lastnikUrl, $lastnik);

        $data            = [
            'title'       => 'neki naslov',
            'tip'         => 'mapa',
            'description' => "1212",
            'vrsta'       => null,
            "mapa"        => $this->lookMapa1['id'],
        ];
        $this->objZapis3 = $prip            = $I->successfullyCreate($this->pripUrl . "?lastnik=" . $l['id'], $data);

        $I->assertNotNull($prip['mapa']);
        $I->assertEquals($data['title'], $prip['title']);

        $prip['title'] = "juhuhu mapca";
        $p             = $I->successfullyUpdate($this->pripUrl, $prip['id'], $prip);
        $I->assertEquals($p['title'], $prip['title']);
    }

    /**
     * kreiramo relacijo
     * 
     * @param ApiTester $I
     */
    public function dodajZapisVMapo(ApiTester $I)
    {
        $resp = $I->successfullyUpdate($this->mapaUrl, $this->lookMapa1['id'] . "/zapisi/" . $this->objZapis1['id'], []);
        codecept_debug($resp);

        /**
         *  ustvarimo še eno relacijo
         */
        $resp = $I->successfullyUpdate($this->mapaUrl, $this->lookMapa1['id'] . "/zapisi/" . $this->objZapis2['id'], []);
        codecept_debug($resp);
    }

    /**
     * preberemo relacije
     * @depends dodajZapisVMapo
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeMapaZapis(ApiTester $I)
    {

        $resp = $I->successfullyGetRelation($this->mapaUrl, $this->lookMapa1['id'], "zapisi", "");
        $I->assertGreaterThanOrEqual(2, count($resp));
        codecept_debug($resp);

        $resp = $I->successfullyGetRelation($this->mapaUrl, $this->lookMapa1['id'], "zapisi", $this->objZapis1['id']);
        $I->assertEquals(1, count($resp));
    }

    /**
     * brisanje relacij
     * @depends dodajZapisVMapo
     * 
     * @param ApiTester $I
     */
    public function deleteRelacijoMapaZapis(ApiTester $I)
    {
        $resp = $I->successfullyDeleteRelation($this->mapaUrl, $this->lookMapa1['id'], "zapisi", $this->objZapis1['id']);

        $resp = $I->failToGetRelation($this->mapaUrl, $this->lookMapa1['id'], "zapisi", $this->objZapis1['id']);
    }

    /**
     * za nek zapis kreiramo novega zapis lastnika
     * 
     * @param ApiTester $I
     */
    public function poveziZapisIzMape(ApiTester $I)
    {
        $lastnik = [
            'lastnik'       => $this->lookOseba2['id'],
            'classLastnika' => 'Oseba',
            'zapis'         => $this->objZapis1['id'],
        ];
        $l       = $I->successfullyCreate($this->lastnikUrl, $lastnik);
    }

}
