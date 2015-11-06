<?php

/*
 *  Licenca GPLv3
 */

namespace Zapisi\ZapisLastnik;

use ApiTester;

/**
 * Description 
 * 
 * avtorizacije na entiteti zapislastnik
 * 
 * imamo različne uporabnike
 *  . z -read,
 *  . z -write
 *  . z -read in -write
 *  . brez 
 * 
 * 
 * @author rado
 */
class AvtorizacijeCest
{

//    private $restUrl            = '/rest/zapislastnik/default';
    private $restUrl            = '/rest/zapislastnik';
    private $obj1;
    private $obj2;
    private $programPremieraUrl = '/rest/programpremiera';
    private $objProgramPremiera1;
    private $objProgramPremiera2;
    private $objProgramPremiera3;
    private $lookUprizoritev1;
    private $lookUprizoritev2;
    private $lookUprizoritev3;

    public function _before(ApiTester $I)
    {
        
    }

    public function _after(ApiTester $I)
    {
        
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
        $this->lookUprizoritev4 = $look                   = $I->lookupEntity("uprizoritev", "0004", false);
        codecept_debug($look);
        $this->lookUprizoritev5 = $look                   = $I->lookupEntity("uprizoritev", "0005", false);
        codecept_debug($look);
    }

    /**
     *  kreiramo zapis
     * 
     * 
     * @param ApiTester $I
     */
    public function createBrezDovoljenj(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$breznik, \IfiTest\AuthPage::$breznikPass);
        $data = [
            'lastnik'       => $this->lookUprizoritev4['id'],
            'classLastnika' => 'Uprizoritev',
            'zapis'         => null,
        ];

        $resp = $I->failToCreate($this->restUrl, $data);
        codecept_debug($resp);
        $I->assertEquals(1000008, $resp[0]['code']);
    }

    /**
     *  kreiramo zapis
     * 
     * 
     * @param ApiTester $I
     */
    public function createZRead(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$rudi, \IfiTest\AuthPage::$rudiPass);

        $data = [
            'lastnik'       => $this->lookUprizoritev4['id'],
            'classLastnika' => 'Uprizoritev',
            'zapis'         => null,
        ];

        $resp = $I->failToCreate($this->restUrl, $data);
        codecept_debug($resp);
        $I->assertEquals(1000008, $resp[0]['code']);
    }

    /**
     *  kreiramo zapis
     * 
     * 
     * @param ApiTester $I
     */
    public function createZWriteBrezWriteZaEntitetoLasnika(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vinko, \IfiTest\AuthPage::$vinkoPass);

        $data = [
            'lastnik'       => $this->lookUprizoritev4['id'],
            'classLastnika' => 'Uprizoritev',
            'zapis'         => null,
        ];

        $resp = $I->failToCreate($this->restUrl, $data);
        codecept_debug($resp);
        $I->assertEquals(1000009, $resp[0]['code']);    //v napaki sicer izpiše, da manjka ZapisLastnik-write, 
        //vendar manjka PostniNaslov-write (kontrola v ZapisLastnikAccess
    }

    /**
     *  kreiramo zapis
     * 
     * 
     * @param ApiTester $I
     */
    public function createZWriteZWriteZaEntitetoLasnika(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vlado, \IfiTest\AuthPage::$vladoPass);

        $data = [
            'lastnik'       => $this->lookUprizoritev4['id'],
            'classLastnika' => 'Uprizoritev',
            'zapis'         => null,
        ];

        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        codecept_debug($ent);
        $I->assertGuid($ent['id']);
    }

    /**
     * spremenim zapis
     * 
     * @depends createZWriteZWriteZaEntitetoLasnika
     * @param ApiTester $I
     */
    public function updateZWriteBrezWriteZaEntitetoLasnika(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vinko, \IfiTest\AuthPage::$vinkoPass);

        $ent            = $this->obj1;
        $ent['lastnik'] = $this->lookUprizoritev5['id'];

        $resp = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        codecept_debug($resp);
        $I->assertEquals(1000101, $resp[0]['code']);
    }

    /**
     * spremenim zapis
     * 
     * @depends createZWriteZWriteZaEntitetoLasnika
     * @param ApiTester $I
     */
    public function updateZWriteZWriteZaEntitetoLasnika(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vlado, \IfiTest\AuthPage::$vladoPass);

        $ent            = $this->obj1;
        $ent['lastnik'] = $this->lookUprizoritev5['id'];

        $this->obj1 = $ent        = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        codecept_debug($ent);
        $I->assertGuid($ent['id']);
    }

    /**
     * Preberem zapis in preverim vsa polja
     * 
     * @depends createZWriteZWriteZaEntitetoLasnika
     * @param ApiTester $I
     */
    public function readBrezDovoljenj(\ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$breznik, \IfiTest\AuthPage::$breznikPass);

        $resp = $I->failToGet($this->restUrl, $this->obj1['id']);
        codecept_debug($resp);
        $I->assertEquals(100099, $resp[0][0]['code']);

        $resp = $I->failToGetList($this->restUrl . "?lastnik=" . $this->lookUprizoritev5['id'], []);
        codecept_debug($resp);
        $I->assertEquals(1000012, $resp[0]['code']);
    }

    /**
     * Preberem zapis in preverim vsa polja
     * 
     * @depends createZWriteZWriteZaEntitetoLasnika
     * @param ApiTester $I
     */
    public function readZReadBrezReadZaEntitetoLasnika(\ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$rudi, \IfiTest\AuthPage::$rudiPass);

        $resp = $I->failToGet($this->restUrl, $this->obj1['id']);
        codecept_debug($resp);
        $I->assertEquals(100099, $resp[0][0]['code']);

        $resp = $I->failToGetList($this->restUrl . "?lastnik=" . $this->lookUprizoritev5['id'], []);
        codecept_debug($resp);
        $I->assertEquals(1001140, $resp[0]['code']);
    }

    /**
     * Preberem zapis in preverim vsa polja
     * 
     * @depends createZWriteZWriteZaEntitetoLasnika
     * @param ApiTester $I
     */
    public function readZReadZReadZaEntitetoLasnika(\ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$rikard, \IfiTest\AuthPage::$rikardPass);

        $ent = $I->successfullyGet($this->restUrl, $this->obj1['id']);
        $I->assertGuid($ent['id']);

        $resp = $I->successfullyGetList($this->restUrl . "?lastnik=" . $this->lookUprizoritev5['id'], []);
        $list = $resp['data'];
        $I->assertNotEmpty($list);
    }

    /**
     * brisanje zapisa
     * 
     * @depends createZWriteZWriteZaEntitetoLasnika
     */
    public function deleteBrezDovoljenj(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$breznik, \IfiTest\AuthPage::$breznikPass);

        $resp = $I->failToDelete($this->restUrl, $this->obj1['id']);
        codecept_debug($resp);
        $I->assertEquals(100201, $resp[0]['code']);
    }

    /**
     * brisanje zapisa
     * 
     * @depends createZWriteZWriteZaEntitetoLasnika
     */
    public function deleteZWriteBrezWriteZaEntitetoLasnika(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vinko, \IfiTest\AuthPage::$vinkoPass);

        $resp = $I->failToDelete($this->restUrl, $this->obj1['id']);
        codecept_debug($resp);
        $I->assertEquals(100201, $resp[0]['code']);
    }

    /**
     * brisanje zapisa
     * 
     * @depends createZWriteZWriteZaEntitetoLasnika
     */
    public function deleteZWriteZWriteZaEntitetoLasnika(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vlado, \IfiTest\AuthPage::$vladoPass);

        $I->successfullyDelete($this->restUrl, $this->obj1['id']);
        $I->failToGet($this->restUrl, $this->obj1['id']);
    }

}
