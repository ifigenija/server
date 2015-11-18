<?php

/*
 *  Licenca GPLv3
 */

namespace Zapisi\Datoteka;

use ApiTester;

/**
 * Description of DatotekaCest
 * 
 * 
 * @author rado
 */
class DatotekaCest
{

    private $restUrl     = '/rest/datoteka/default';
    private $restUrlVse  = '/rest/datoteka/vse';
    private $uploadUrl   = '/fs/nalozi/zapisi';
    private $downloadUrl = '/fs/prenesi/zapisi';
    private $obj1;
    private $obj2;
    private $lookUser1;
    private $lookUser2;
    private $lookUser3;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupUser(ApiTester $I)
    {
        $this->lookUser1 = $ent             = $I->lookupEntity("user", \IfiTest\AuthPage::$rikard, false);
        $I->assertGuid($ent['id']);

        $this->lookUser2 = $ent             = $I->lookupEntity("user", \IfiTest\AuthPage::$irena, false);
        $I->assertGuid($ent['id']);

        $this->lookUser3 = $ent             = $I->lookupEntity("user", \IfiTest\AuthPage::$breznik, false);
        $I->assertGuid($ent['id']);
    }

    /**
     *  kreiramo zapis
     * 
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data       = [
            'filename' => 'aa',
            'owner'    => $this->lookUser2['id'],
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);

        // kreiramo še en zapis
        $data       = [
            'filename' => 'bb',
            'owner'    => $this->lookUser1['id'],
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent          = $this->obj1;
        $ent['owner'] = $this->lookUser3['id'];

        $this->obj1 = $entR       = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['owner']['id'], $ent['owner']);
    }

    /**
     * Preberem zapis in preverim vsa polja
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function read(\ApiTester $I)
    {
        $ent = $I->successfullyGet($this->restUrl, $this->obj1['id']);
        codecept_debug($ent);
        
        $I->assertGuid($ent['id']);
        $I->assertEquals($ent['filename'], 'aa');
        $I->assertEquals($ent['owner']['id'], $this->lookUser3['id']);
    }

    /**
     * get list je nalašč disablean
     * 
     * @depends create
     * @param ApiTester $I  
     */
    public function getListDefault(ApiTester $I)
    {
        $resp = $I->failToGetList($this->restUrl, []);
        codecept_debug($resp);
        $I->assertEquals('list disabled', $resp[0]['message']);
    }

    /**
     * get list je nalašč disablean
     * 
     * @depends create
     * @param ApiTester $I  
     */
    public function getListVse(ApiTester $I)
    {
        $resp = $I->failToGetList($this->restUrlVse, []);
        codecept_debug($resp);
        $I->assertEquals('list disabled', $resp[0]['message']);
        $I->assertEquals(404, $resp[0]['code']);
    }

    /**
     * brisanje zapisa
     * 
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $I->successfullyDelete($this->restUrl, $this->obj1['id']);
        $I->failToGet($this->restUrl, $this->obj1['id']);
    }

    /**
     * test validacij v datoteke kontrolerju
     * 
     * @param ApiTester $I
     */
    public function downloadNeobstojeceDatoteke(ApiTester $I)
    {
        /**
         * datoteka še ni bila uploadana 
         */
        $resp = $I->failToGetAttachment($this->downloadUrl, $this->obj2['id']);
        codecept_debug($resp);
        $I->assertEquals(1007079, $resp[0][0]['code']);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function uploadDatoteke(ApiTester $I)
    {
        $urlcel   = $this->uploadUrl . "/" . $this->obj2['id'];
        $base_url = $I->getPhpBrowserUrl();

        $filePath = 'data/fileexamples/b.txt';
        $body     = fopen($filePath, 'r');

        $client   = new \GuzzleHttp\Client(['base_uri' => $base_url
            /* pri guzzle-u se je potreno še enkrat (posebaj) avtenticirati */
            , 'auth'     => [ \IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass]
        ]);
        $response = $client->request('POST', $urlcel, [
            'multipart' => [
                [
                    'name'     => 'fileupload',
                    'contents' => fopen($filePath, 'r'),
                ],
            ]
        ]);
        codecept_debug($response);

        /**
         * prikaži vsebino Datoteke
         */
        $this->obj2 = $dat        = $I->successfullyGet($this->restUrl, $this->obj2['id']);
        codecept_debug($dat);
    }

    /**
     * @depends uploadDatoteke
     * @param ApiTester $I
     */
    public function downloadDatoteke(ApiTester $I)
    {
        $resp = $I->successfullyGetAttachment($this->downloadUrl, $this->obj2['id']);
        codecept_debug($resp);

        /**
         * prikaži vsebino Datoteke
         */
        $this->obj2['id'] = $dat              = $I->successfullyGet($this->restUrl, $this->obj2['id']);
        codecept_debug($dat);
    }

}
