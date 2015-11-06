<?php

/*
 * Licenca GPL V3 or later
 *  
 */

namespace module\Zapisi\Zapis;

/*
 * Licenca GPL V3 or later
 *  
 */

use ApiTester;
use Page\SifrantPage;

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
    private $obj1;
    private $obj2;
    private $objDatoteka1;
    private $objDatoteka2;
    private $objDatoteka3;
    private $objDatoteka4;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\Page\AuthPage::$admin, \Page\AuthPage::$adminPass);
    }

    /**
     * Ustvarim nov komentar in ga povežem na kontaktno osebe 
     * 
     * @param ApiTester $I
     */
    public function ustvariKomentar(ApiTester $I)
    {
        // pripnem komentar na kontaktno osebo         
        $lastnik = [
            'lastnik'       => SifrantPage::$kontaktna_k1_1,
            'classLastnika' => 'Kontaktna',
        ];

        $l = $I->successfullyCreate($this->lastnikUrl, $lastnik);

        $data = [
            'title'       => 'tralalla',
            'tip'         => 'komentar',
            'description' => "1212"
        ];

        $prip = $I->successfullyCreate($this->pripUrl . '?lastnik=' . $l['id'], $data);

        $I->assertNull($prip['datoteka']);
        $I->assertEquals($data['title'], $prip['title']);

        // spremenim komentar
        $prip['title'] = "hopsasa";
        $updated       = $I->successfullyUpdate($this->pripUrl, $prip['id'], $prip);
        $I->assertEquals('hopsasa', $updated['title']);
        $I->assertNotEmpty($updated['lastniki']);
        $I->assertNull($updated['datoteka']);
    }

    /**
     * Testiram ustvarjanje priponke, tipa datoteka 
     * @param ApiTester $I
     */
    public function ustvariDatoteko(ApiTester $I)
    {

        // pripnem komentar na kontaktno osebo         
        $lastnik = [
            'lastnik'       => SifrantPage::$kontaktna_k1_1,
            'classLastnika' => 'Kontaktna',
        ];

        $l = $I->successfullyCreate($this->lastnikUrl, $lastnik);

        $data               = [
            'title'       => 'tralalla',
            'tip'         => 'datoteka',
            'description' => "zz",
        ];
        $prip               = $I->successfullyCreate($this->pripUrl . "?lastnik=" . $l['id'], $data);
        codecept_debug($prip['datoteka']);
        $I->assertNotEmpty($prip['datoteka'], "datoteka");
        $I->assertGuid($prip['datoteka']['id'], "id datoteke");
        $this->objDatoteka1 = $prip['datoteka'];
        $I->assertEquals($data['title'], $prip['title'], " title");

        $prip['title'] = "hopsasa";
        $p             = $I->successfullyUpdate($this->pripUrl, $prip['id'], $prip);
        $I->assertEquals('hopsasa', $p['title']);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function uploadDatoteke(ApiTester $I)
    {


        $urlcel   = $this->uploadUrl . "/" . $this->objDatoteka1['id'];
        $base_url = $I->getPhpBrowserUrl();

        codecept_debug($urlcel);
        $client   = new \GuzzleHttp\Client(['base_url' => $base_url, 'defaults' => ['auth' => [\Page\AuthPage::$admin, \Page\AuthPage::$admin],]]);
        $request  = $client->createRequest('POST', $urlcel);
        $postBody = $request->getBody();
        $filePath = 'data/fileexamples/a.txt';
        $postBody->addFile(New \GuzzleHttp\Post\PostFile('fileupload', fopen($filePath, 'r')));
        $resp     = $client->send($request);
        codecept_debug($resp->getHeader('Content-Type'));
    }

    /**
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
    public function ustvariMapo(ApiTester $I)
    {
        // pripnem komentar na kontaktno osebo         
        $lastnik = [
            'lastnik'       => SifrantPage::$kontaktna_k1_1,
            'classLastnika' => 'Kontaktna',
        ];

        $l = $I->successfullyCreate($this->lastnikUrl, $lastnik);

        $data = [
            'title'       => 'neki naslov',
            'tip'         => 'mapa',
            'description' => "1212",
            "mapa"        => \Page\SifrantPage::$mapa_prva
        ];
        $prip = $I->successfullyCreate($this->pripUrl . "?lastnik=" . $l['id'], $data);

        $I->assertNotNull($prip['mapa']);
        $I->assertEquals($data['title'], $prip['title']);

        $prip['title'] = "juhuhu";
        $p             = $I->successfullyUpdate($this->pripUrl, $prip['id'], $prip);
        $I->assertEquals('juhuhu', $p['title']);
    }

    /**
     * izpis prefix url-ja iz konfiguracijske datoteke.
     */
    public function izpisUrljaOdModulaPhpBrowser(ApiTester $I)
    {
        $url = $I->getPhpBrowserUrl();
        codecept_debug($url);
    }

}
