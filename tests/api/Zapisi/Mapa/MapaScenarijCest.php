<?php

namespace Zapisi\Mapa;

use \ApiTester;

class MapaScenarijCest
{

    protected $mapaUrl = '/rest/mapa/default';
    protected $aclUrl  = '/rest/mapaacl/default';
    protected $root1;
    protected $root2;
    protected $root3;
    protected $root4;
    protected $root5;
    protected $root6;
    protected $pod1;
    protected $pod2;
    protected $pod3;
    protected $pod4;
    protected $pod5;
    protected $pod6;
    protected $pod7;
    protected $pod8;
    protected $pod9;
    protected $lookPermission1;
    protected $lookPermission2;

    /**
     * @param ApiTester $I
     */
    public function lookupDovoljenje(ApiTester $I)
    {
        $this->lookPermission1 = $look                  = $I->lookupEntity("permission", "Uprizoritev-read", false);
        $I->assertNotEmpty($look);

        $this->lookPermission2 = $look                  = $I->lookupEntity("permission", "Uprizoritev-write", false);
        $I->assertNotEmpty($look);
    }

    /*
     *  tests
     */

    public function ustvariDrevoMap(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
        $data        = [
            'ime'         => "root1",
            'komentar'    => null,
            'javniDostop' => 'R'
        ];
        $this->root1 = $m           = $I->successfullyCreate($this->mapaUrl, $data);

        $data        = [
            'ime'         => "root4",
            'komentar'    => 'ad',
            'javniDostop' => 'RWA'
        ];
        $this->root4 = $m           = $I->successfullyCreate($this->mapaUrl, $data);

        $data        = [
            'ime'         => "root5",
            'komentar'    => 'ad',
            'javniDostop' => 'RWA'
        ];
        $this->root5 = $m           = $I->successfullyCreate($this->mapaUrl, $data);
        $data        = [
            'ime'         => "root6",
            'komentar'    => 'ad',
            'javniDostop' => 'RWA'
        ];
        $this->root6 = $m           = $I->successfullyCreate($this->mapaUrl, $data);

        /**
         *  Mapa s takim imenom že obstaja
         */
        $resp = $I->failToCreate($this->mapaUrl, $data);
        codecept_debug($resp);
        $I->assertEquals(1005000, $resp[0]['code']);

        $data['ime']    = 'podmapa';
        $data['parent'] = $this->root1['id'];
        $I->successfullyCreate($this->mapaUrl, $data);

        $data['javniDostop'] = 'RW';
        $data['ime']         = 'podmapa 1';
        $this->pod1          = $I->successfullyCreate($this->mapaUrl, $data);

        $data['ime']    = 'podmapa 2';
        $data['parent'] = $this->pod1['id'];
        $this->pod2     = $I->successfullyCreate($this->mapaUrl, $data);

        $data['ime']    = 'podmapa 3';
        $data['parent'] = $this->pod1['id'];
        $this->pod3     = $I->successfullyCreate($this->mapaUrl, $data);
    }

    /**
     * @depends ustvariDrevoMap
     */
    public function brisiMapo(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
        $I->successfullyDelete($this->mapaUrl, $this->pod2['id']);


        /**
         * Mapa ima podmape. Brisanje ni možno
         */
        $resp = $I->failToDelete($this->mapaUrl, $this->root1['id']);
        codecept_debug($resp);
        $I->assertEquals(1007032, $resp[0]['code']);
    }

    /**
     * @depends ustvariDrevoMap
     */
    public function dodajBrezPrivilegija(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$breznik, \IfiTest\AuthPage::$breznikPass);
        $data = [
            'ime'         => "rootx",
            'komentar'    => null,
            'javniDostop' => 'R',
            'parent'      => $this->root1['id']
        ];

        $resp = $I->failToCreate($this->mapaUrl, $data);
        codecept_debug($resp);
        $I->assertEquals(1000008, $resp[0]['code']);
    }

    /**
     * 
     * @depends ustvariDrevoMap
     */
    public function dodajAclNaMapoInPreveriDovoljenjeZaKreiranje(\ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
        $data = [
            'mapa'   => $this->root1['id'],
            'perm'   => $this->lookPermission1['id'],
            'dostop' => 'RAW'
        ];

        $mapaAcl = $I->successfullyCreate($this->aclUrl, $data);

        $mapa = $I->successfullyGet($this->mapaUrl, $this->root1['id']);
        codecept_debug($mapa);
        $I->assertEquals($mapa['acl'][0]['id'], $mapaAcl['id']);
    }

    /**
     * test avtorizacij kreiranja root mape
     *  
     * @param ApiTester $I
     */
    public function kreirajRootMape(\ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
        $data        = [
            'ime'         => "vrhnja admin",
            'komentar'    => "ad",
            'javniDostop' => 'RWA'
        ];
        $this->root2 = $m           = $I->successfullyCreate($this->mapaUrl, $data);

        /**
         * brez privilegijev
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$breznik, \IfiTest\AuthPage::$breznikPass);
        $data = [
            'ime'         => "vrhnja breznik",
            'komentar'    => "br",
            'javniDostop' => 'R'
        ];
        $resp = $I->failToCreate($this->mapaUrl, $data);
        codecept_debug($resp);
        $I->assertEquals(1000008, $resp[0]['code']);

        /**
         * brez write privilegijev
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$rudi, \IfiTest\AuthPage::$rudiPass);
        $data = [
            'ime'         => "vrhnja rudi",
            'komentar'    => "ru",
            'javniDostop' => 'R'
        ];
        $resp = $I->failToCreate($this->mapaUrl, $data);
        codecept_debug($resp);
        $I->assertEquals(1000008, $resp[0]['code']);


        /**
         * s premalo privilegiji
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vinko, \IfiTest\AuthPage::$vinkoPass);
        $data = [
            'ime'         => "vrhnja vinko",
            'komentar'    => "vi",
            'javniDostop' => 'R'
        ];
        $resp = $I->failToCreate($this->mapaUrl, $data);
        codecept_debug($resp);
        /**
         * Nimate dovoljenja za kreiranje vrhnje mape
         */
        $I->assertEquals(1007009, $resp[0]['code']);

        /**
         * s tudi specialnim dovoljenjem Mapa-writeroot
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vlado, \IfiTest\AuthPage::$vladoPass);
        $data        = [
            'ime'         => "vrhnja vlado",
            'komentar'    => "vLado",
            'javniDostop' => 'R'
        ];
        $this->root3 = $m           = $I->successfullyCreate($this->mapaUrl, $data);
        codecept_debug($m);
    }

    /**
     * test avtorizacij update root mape
     * 
     * @depends kreirajRootMape 
     * @param ApiTester $I
     */
    public function spremeniRootMape(\ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
        $data             = $this->root3;
        $data['komentar'] = 'uu admin';
        $data['parent']   = $this->root1['id'];    // provokativno probamo spremeniti parenta, da bi se probali izogniti avtorizaciji
        $m                = $I->successfullyUpdate($this->mapaUrl, $data['id'], $data);

        /**
         * brez privilegijev
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$breznik, \IfiTest\AuthPage::$breznikPass);
        $data             = $this->root2;
        $data['komentar'] = 'uu';
        $data['parent']   = $this->root1['id'];    // provokativno probamo spremeniti parenta, da bi se probali izogniti avtorizaciji
        $resp             = $I->failToUpdate($this->mapaUrl, $data['id'], $data);
        codecept_debug($resp);
        $I->assertEquals(1000101, $resp[0]['code']);

        /**
         * z le read pravico
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$rudi, \IfiTest\AuthPage::$rudiPass);
        $data             = $this->root2;
        $data['komentar'] = 'uu';
        $data['parent']   = $this->root1['id'];    // provokativno probamo spremeniti parenta, da bi se probali izogniti avtorizaciji
        $resp             = $I->failToUpdate($this->mapaUrl, $data['id'], $data);
        codecept_debug($resp);
        $I->assertEquals(1000101, $resp[0]['code']);

        /**
         * brez write pravicami, brez writeroot
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vinko, \IfiTest\AuthPage::$vinkoPass);
        $data             = $this->root2;
        $data['komentar'] = 'uu';
        $data['parent']   = $this->root1['id'];    // provokativno probamo spremeniti parenta, da bi se probali izogniti avtorizaciji
        $resp             = $I->failToUpdate($this->mapaUrl, $data['id'], $data);
        codecept_debug($resp);
        $I->assertEquals(1007006, $resp[0]['code']);

        /**
         * s tudi specialnim dovoljenjem Mapa-writeroot
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vlado, \IfiTest\AuthPage::$vladoPass);
        $data             = $this->root2;
        $data['komentar'] = 'uu vlado';
        $m                = $I->successfullyUpdate($this->mapaUrl, $data['id'], $data);
    }

    /**
     * test avtorizacij delete root mape
     * 
     * @depends ustvariDrevoMap
     * @param ApiTester $I
     */
    public function izbrisiRootMape(\ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
        $I->successfullyDelete($this->mapaUrl, $this->root4['id']);

        /**
         * brez dovoljenj
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$breznik, \IfiTest\AuthPage::$breznikPass);
        $resp = $I->failToDelete($this->mapaUrl, $this->root5['id']);
        codecept_debug($resp);
        $I->assertEquals(100201, $resp[0]['code']);

        /**
         * z le read pravico
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$rudi, \IfiTest\AuthPage::$rudiPass);
        $resp = $I->failToDelete($this->mapaUrl, $this->root5['id']);
        codecept_debug($resp);
        $I->assertEquals(100201, $resp[0]['code']);

        /**
         * z write pravicami, brez writeroot
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vinko, \IfiTest\AuthPage::$vinkoPass);
        $resp = $I->failToDelete($this->mapaUrl, $this->root5['id']);
        codecept_debug($resp);
        $I->assertEquals(1007005, $resp[0]['code']);

        /**
         * s tudi specialnim dovoljenjem Mapa-writeroot
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vlado, \IfiTest\AuthPage::$vladoPass);
        $I->successfullyDelete($this->mapaUrl, $this->root5['id']);
    }

    /**
     * 
     * @depends dodajAclNaMapoInPreveriDovoljenjeZaKreiranje
     * @param ApiTester $I
     */
    public function dodajVladoDodaMapoKjerLahko(\ApiTester $I)
    {

        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vlado, \IfiTest\AuthPage::$vladoPass);
        $dataM = [
            'ime'         => "rootx",
            'komentar'    => null,
            'javniDostop' => '',
            'parent'      => $this->root6['id']
        ];
        $mapa  = $I->successfullyCreate($this->mapaUrl, $dataM);

        $dataM['ime'] = 'p 4';
        $this->pod4   = $I->successfullyCreate($this->mapaUrl, $dataM);

        $dataM['parent'] = $this->pod1['id'];
        $I->failToCreate($this->mapaUrl, $dataM);

        // uporabnik lahko briše mapo, ki je njegova
        $I->successfullyDelete($this->mapaUrl, $mapa['id']);

        $I->failToDelete($this->mapaUrl, $this->pod1['id']);
    }

    /**
     * 
     * @depends dodajVladoDodaMapoKjerLahko
     */
    public function vladoUrejaAcl(\ApiTester $I)
    {

        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vlado, \IfiTest\AuthPage::$vladoPass);
        $data = [
            'mapa'   => $this->root1['id'],
            'perm'   => $this->lookPermission1['id'],
            'dostop' => 'RAW'
        ];
        // na root mapi nima dovoljenja 
        $I->failToCreate($this->aclUrl, $data);

        // na podmapi sem lastnik in bi moralo 
        // biti dovolj za dostop
        $data['mapa'] = $this->pod4['id'];
        $mapaAcl      = $I->successfullyCreate($this->aclUrl, $data);

        $mapa = $I->successfullyGet($this->mapaUrl, $this->pod4['id']);

        codecept_debug($mapa);
        codecept_debug($mapaAcl);

        $I->assertEquals($mapa['acl'][0]['id'], $mapaAcl['id']);
    }

    /**
     * test avtorizacij kreiranja navadnih map
     *  
     * @param ApiTester $I
     */
    public function kreirajPodMape(\ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
        $data       = [
            'ime'         => "pod 5",
            'javniDostop' => '',
            'parent'      => $this->root6['id'],
        ];
        $this->pod5 = $m          = $I->successfullyCreate($this->mapaUrl, $data);

        /**
         * brez privilegijev
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$breznik, \IfiTest\AuthPage::$breznikPass);
        $data['ime'] = 'podmapa breznik';
        $resp        = $I->failToCreate($this->mapaUrl, $data);
        codecept_debug($resp);
        $I->assertEquals(1000008, $resp[0]['code']);

        /**
         * brez write privilegijev
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$rudi, \IfiTest\AuthPage::$rudiPass);
        $data['ime'] = 'podmapa rudi';
        $resp        = $I->failToCreate($this->mapaUrl, $data);
        codecept_debug($resp);
        $I->assertEquals(1000008, $resp[0]['code']);


        /**
         * z Mapa-write privilegijem a brez Mapa-append
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vinko, \IfiTest\AuthPage::$vinkoPass);
        $data['ime'] = 'podmapa vinko';
        $resp        = $I->failToCreate($this->mapaUrl, $data);
        codecept_debug($resp);
        $I->assertEquals(1007008, $resp[0]['code']);

        /**
         * z Mapa-write  in  Mapa-append
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vihra, \IfiTest\AuthPage::$vihraPass);
        $data['ime'] = 'podmapa vihra';
        $this->pod6  = $I->successfullyCreate($this->mapaUrl, $data);
    }

    /**
     * test avtorizacij dodajanja ACL-ov k mapam
     *  
     * @param ApiTester $I
     */
    public function dodajAcle(\ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
        $data = [
            'mapa'   => $this->root6['id'],
            'perm'   => $this->lookPermission1['id'],
            'dostop' => 'RAW'
        ];

        $mapaAcl = $I->successfullyCreate($this->aclUrl, $data);

        /**
         * brez privilegijev
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$breznik, \IfiTest\AuthPage::$breznikPass);
        $data['dostop'] = 'R';
        $resp           = $I->failToCreate($this->aclUrl, $data);
        codecept_debug($resp);
        $I->assertEquals(1000008, $resp[0]['code']);

        /**
         * brez write privilegijev
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$rudi, \IfiTest\AuthPage::$rudiPass);
        $resp = $I->failToCreate($this->aclUrl, $data);
        codecept_debug($resp);
        $I->assertEquals(1000008, $resp[0]['code']);


        /**
         * z Mapa-write in MapaAcl-write
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vinko, \IfiTest\AuthPage::$vinkoPass);
        $mapaAcl = $I->successfullyCreate($this->aclUrl, $data);
    }

    /**
     * test Mapa-append assertov
     * 
     * @depends kreirajPodMape
     * @param ApiTester $I
     */
    public function dodajMapaAsserti(\ApiTester $I)
    {
        /**
         * assert po lastniku
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vihra, \IfiTest\AuthPage::$vihraPass);
        $data = [
            'ime'         => "assert lastnik vihra",
            'javniDostop' => '',
            'parent'      => $this->pod5['id'], //lastnik admin
        ];
        $resp = $I->failToCreate($this->mapaUrl, $data);
        codecept_debug($resp);
        $I->assertEquals(1007008, $resp[0]['code']);


        $data['parent'] = $this->pod6['id']; //lastnik vihra
        $m              = $I->successfullyCreate($this->mapaUrl, $data);

        /**
         * assert po javnem dostopu
         */
        $data                = [
            'ime'         => "assert javni dostop vihra",
            'javniDostop' => '',
            'parent'      => $this->pod4['id'], //brez javnega dostopa
        ];
        $resp                = $I->failToCreate($this->mapaUrl, $data);
        codecept_debug($resp);
        $I->assertEquals(1007008, $resp[0]['code']);
        /**
         * spremenimo javni dostop bodoče parent mape
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
        $mapa                = $I->successfullyGet($this->mapaUrl, $this->pod4['id']);
        $mapa['javniDostop'] = 'RWA';
        $this->pod4          = $I->successfullyUpdate($this->mapaUrl, $mapa['id'], $mapa);
        /**
         * ponovimo isti dostop, da vidimo, če spremenjen dostop javni sedaj pomaga
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vihra, \IfiTest\AuthPage::$vihraPass);
        $resp                = $I->successfullyCreate($this->mapaUrl, $data);

        /**
         * assert po ACL-ju dostop po acl-ju
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vlado, \IfiTest\AuthPage::$vladoPass);
        $data    = [
            'ime'         => "assert acl vlado",
            'javniDostop' => '',
            'parent'      => $this->pod5['id'],
        ];
        $resp    = $I->failToCreate($this->mapaUrl, $data);
        codecept_debug($resp);
        $I->assertEquals(1007008, $resp[0]['code']);
        /**
         * dodamo acl za dovoljenje, ki ga ima tudi uporabnik
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
        $dataAcl    = [
            'mapa'   => $this->pod5['id'],
            'perm'   => $this->lookPermission2['id'], // to doovoljenje že ima uporabnik
            'dostop' => 'RAW'
        ];
        $mapaAcl = $I->successfullyCreate($this->aclUrl, $dataAcl);
        /**
         * ponovimo poskus kreiranja, sedaj ko ima parent mapa dodan acl
         */
        $m       = $I->successfullyCreate($this->mapaUrl, $data);
    }

}
