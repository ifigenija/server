<?php

namespace module\Zapisi;

use \ApiTester;

class MapeCest
{

    protected $mapaUrl = '/rest/mapa/default';
    protected $aclUrl = '/rest/mapaacl/default';
    protected $root;
    protected $pod;
    protected $pod2;
    protected $aclId;

// tests
    public function ustvariDrevoMap(ApiTester $I)
    {

        $I->amHttpAuthenticated('admin', 'Admin1234');
        $data = [
            'ime' => "root",
            'komentar' => null,
            'javniDostop' => 'R'
        ];

        $this->root = $m = $I->successfullyCreate($this->mapaUrl, $data);

        $x = $I->failToCreate($this->mapaUrl, $data);

        $data['ime'] = 'podmapa';
        $data['parent'] = $m['id'];
        $I->successfullyCreate($this->mapaUrl, $data);

        $data['ime'] = 'podmapa2';
        $this->pod = $I->successfullyCreate($this->mapaUrl, $data);

        $data['ime'] = 'podmapa';
        $data['parent'] = $this->pod['id'];
        $this->pod2 = $I->successfullyCreate($this->mapaUrl, $data);
        
        $this->aclId = $I->lookupEntity('Aaa-Permission','Tehen-write');
    }

    /**
     * @depends ustvariDrevoMap
     */
    public function brisiMapo(ApiTester $I)
    {
        $I->amHttpAuthenticated('admin', 'Admin1234');
        $I->successfullyDelete($this->mapaUrl, $this->pod2['id']);
        $I->failToDelete($this->mapaUrl, $this->root['id']);
    }

    /**
     * @depends ustvariDrevoMap
     */
    public function dodajBrezPrivilegija(ApiTester $I)
    {
        $I->amHttpAuthenticated('joza', 'geslo1234');
        $data = [
            'ime' => "rootx",
            'komentar' => null,
            'javniDostop' => 'R',
            'parent' => $this->root['id']
        ];

        $I->failToCreate($this->mapaUrl, $data);
    }

    /**
     * 
     * @depends ustvariDrevoMap
     */
    public function dodajAclNaMapoInPreveriDovoljenjeZaKreiranje(\ApiTester $I)
    {

        $I->amHttpAuthenticated('admin', 'Admin1234');
        $data = [
            'mapa' => $this->root['id'],
            'perm' => $this->aclId,
            'dostop' => 'RAW'
        ];

        $mapaAcl = $I->successfullyCreate($this->aclUrl, $data);

        $mapa = $I->successfullyGet($this->mapaUrl, $this->root['id']);

        $I->assertEquals($mapa['acl'][0]['id'], $mapaAcl['id']);
    }

    /**
     * 
     * 
     * @depends dodajAclNaMapoInPreveriDovoljenjeZaKreiranje
     */
    public function dodajJozaDodaMapoKjerLahko(\ApiTester $I)
    {

        $I->amHttpAuthenticated('joza', 'geslo1234');
        $dataM = [
            'ime' => "rootx",
            'komentar' => null,
            'javniDostop' => 'R',
            'parent' => $this->root['id']
        ];

        $mapa = $I->successfullyCreate($this->mapaUrl, $dataM);

        $dataM['ime'] = 'xxxxxx';

        $this->pod2 = $I->successfullyCreate($this->mapaUrl, $dataM);

        $dataM['parent'] = $this->pod['id'];
        $I->failToCreate($this->mapaUrl, $dataM);

        // joža briše mapo, ki je njegova
        $I->successfullyDelete($this->mapaUrl, $mapa['id']);

        $I->failToDelete($this->mapaUrl, $this->pod['id']);
    }

    /**
     * 
     * @depends dodajJozaDodaMapoKjerLahko
     */
    public function jozeUrejaAcl(\ApiTester $I)
    {

        $I->amHttpAuthenticated('joza', 'geslo1234');
        $data = [
            'mapa' => $this->pod['id'],
            'perm' => $this->aclId,
            'dostop' => 'RAW'
        ];
        // na root mapi nima dovoljenja 
        $I->failToCreate($this->aclUrl, $data);

        // na podmapi sem lastnik in bi moralo 
        // biti dovolj za dostop
        $data['mapa'] =  $this->pod2['id'];
        $mapaAcl = $I->successfullyCreate($this->aclUrl, $data);
                
        $mapa = $I->successfullyGet($this->mapaUrl, $this->pod2['id']);

        $I->assertEquals($mapa['acl'][0]['id'], $mapaAcl['id']);
    }

}
