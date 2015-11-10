<?php

namespace module\Zapisi;

use \ApiTester;

class MapeCest
{

    protected $mapaUrl = '/rest/mapa/default';
    protected $aclUrl  = '/rest/mapaacl/default';
    protected $root;
    protected $pod1;
    protected $pod2;
    protected $lookPermission1;
    protected $lookPermission2;

    /**
     * @param ApiTester $I
     */
    public function lookupDovoljenje(ApiTester $I)
    {
        $this->lookPermission1 = $look                  = $I->lookupEntity("permission", "Posta-read", false);
        $I->assertNotEmpty($look);

        $this->lookPermission2 = $look                  = $I->lookupEntity("permission", "Posta-write", false);
        $I->assertNotEmpty($look);
    }

    /*
     *  tests
     */

    public function ustvariDrevoMap(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
        $data       = [
            'ime'         => "root",
            'komentar'    => null,
            'javniDostop' => 'R'
        ];
        $this->root = $m          = $I->successfullyCreate($this->mapaUrl, $data);

        /**
         *  Mapa s takim imenom že obstaja
         */
        $resp = $I->failToCreate($this->mapaUrl, $data);
        codecept_debug($resp);
        $I->assertEquals(1005000, $resp[0]['code']);

        $data['ime']    = 'podmapa';
        $data['parent'] = $m['id'];
        $I->successfullyCreate($this->mapaUrl, $data);

        $data['ime'] = 'podmapa 1';
        $this->pod1  = $I->successfullyCreate($this->mapaUrl, $data);

        $data['ime']    = 'podmapa 2';
        $data['parent'] = $this->pod1['id'];
        $this->pod2     = $I->successfullyCreate($this->mapaUrl, $data);
    }

    /**
     * @depends ustvariDrevoMap
     */
    public function brisiMapo(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
        $I->successfullyDelete($this->mapaUrl, $this->pod2['id']);
        $resp = $I->failToDelete($this->mapaUrl, $this->root['id']);
        codecept_debug($resp);

        /**
         * Mapa ima podmape. Brisanje ni možno
         */
        $I->assertEquals(1007002, $resp[0]['code']);
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
            'parent'      => $this->root['id']
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
            'mapa'   => $this->root['id'],
            'perm'   => $this->lookPermission1['id'],
            'dostop' => 'RAW'
        ];

        $mapaAcl = $I->successfullyCreate($this->aclUrl, $data);

        $mapa = $I->successfullyGet($this->mapaUrl, $this->root['id']);
        codecept_debug($mapa);
        $I->assertEquals($mapa['acl'][0]['id'], $mapaAcl['id']);
    }

    /**
     * 
     * 
     * @depends dodajAclNaMapoInPreveriDovoljenjeZaKreiranje
     */
    public function dodajJozaDodaMapoKjerLahko(\ApiTester $I)
    {

        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vinko, \IfiTest\AuthPage::$vinkoPass);
        $dataM = [
            'ime'         => "rootx",
            'komentar'    => null,
            'javniDostop' => 'R',
            'parent'      => $this->root['id']
        ];

        $mapa = $I->successfullyCreate($this->mapaUrl, $dataM);

        $dataM['ime'] = 'xxxxxx';

        $this->pod2 = $I->successfullyCreate($this->mapaUrl, $dataM);

        $dataM['parent'] = $this->pod1['id'];
        $I->failToCreate($this->mapaUrl, $dataM);

        // uporabnik lahko briše mapo, ki je njegova
        $I->successfullyDelete($this->mapaUrl, $mapa['id']);

        $I->failToDelete($this->mapaUrl, $this->pod1['id']);
        $I->assertTrue(false, "$$ začasno");
    }

    /**
     * 
     * @depends dodajJozaDodaMapoKjerLahko
     */
    public function jozeUrejaAcl(\ApiTester $I)
    {

        $I->amHttpAuthenticated('joza', 'geslo1234');
        $data = [
            'mapa'   => $this->pod1['id'],
            'perm'   => $this->lookPermission1['id'],
            'dostop' => 'RAW'
        ];
        // na root mapi nima dovoljenja 
        $I->failToCreate($this->aclUrl, $data);

        // na podmapi sem lastnik in bi moralo 
        // biti dovolj za dostop
        $data['mapa'] = $this->pod2['id'];
        $mapaAcl      = $I->successfullyCreate($this->aclUrl, $data);

        $mapa = $I->successfullyGet($this->mapaUrl, $this->pod2['id']);

        $I->assertEquals($mapa['acl'][0]['id'], $mapaAcl['id']);
    }

}
