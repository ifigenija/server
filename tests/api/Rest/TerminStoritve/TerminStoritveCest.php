<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\TerminStoritve;

use ApiTester;

/**
 * Description of TerminStoritveCest
 *
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto - je ni
 *      relacije z drugimi entitetami
 *      - dogodek
 *      - alternacija
 *      - oseba
 *      getlist različne variante relacij
 *      - vse
 *      - alternacija
 * 
 * @author rado
 */
class TerminStoritveCest
{

    private $restUrl              = '/rest/terminstoritve/zasedenost';
    private $restUrlDefault       = '/rest/terminstoritve';
    private $osebaUrl             = '/rest/oseba';
    private $uraUrl               = '/rest/ura';
    private $alternacijaUrl       = '/rest/alternacija';
    private $predstavaUrl         = '/rest/predstava';
    private $vajaUrl              = '/rest/vaja';
    private $obj1;
    private $obj2;
    private $objOseba;
    private $lookOseba1;
    private $lookOseba2;
    private $lookPredstava2Id;
    private $lookPredstava3Id;
    private $objVaja;
    private $objDogodek;
    private $objAlternacija;
    private $lookAlternacija;
    private $funkcijaUrl          = '/rest/funkcija';
    private $lookFunkcija;
    private $lookupAlternacijaUrl = '/lookup/alternacija';
    private $objTSDog1A;
    private $objTSDog1B;
    private $objTSDog1C;
    private $lookDogVaja1Id;
    private $lookDogVaja2Id;
    private $lookDogVaja3Id;
    private $lookDogPredstava1Id;
    private $dogodekUrl           = '/rest/dogodek';
    private $terminStoritveUrl    = '/rest/terminstoritve';

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     * metoda, ki se večkrat kliče zaradi preverjanja rezultatov get list
     * 
     */
    private function kontroleRezultatovGetList(ApiTester $I, array $osebeIds, array $list)
    {
        codecept_debug(__FUNCTION__);

        foreach ($osebeIds as $oId) {
            $I->assertContains($oId, array_column(array_column($list, "oseba"), "id"), "oseba id");
        }
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupOsebo(ApiTester $I)
    {
        $this->lookOseba1 = $ent              = $I->lookupEntity("oseba", "0006", false);
        $I->assertNotEmpty($ent);
        $this->lookOseba2 = $ent              = $I->lookupEntity("oseba", "0007", false);
        $I->assertNotEmpty($ent);
        $this->lookOseba3 = $ent              = $I->lookupEntity("oseba", "0003", false);
        $I->assertNotEmpty($ent);
    }

    /**
     * @param ApiTester $I
     */
    public function getListDogodek(ApiTester $I)
    {
        /*
         * dogodki, ki so vaje
         */
        $resp = $I->successfullyGetList($this->dogodekUrl . "?q=dogodek 1&zacetek=2000-01-01&konec=2200-05-05&razred[]=200s", []);
        $list = $resp['data'];
        codecept_debug($list);
        $I->assertEquals(1, $resp['state']['totalRecords']);


        $ent                  = array_pop($list);
        $this->lookDogVaja1Id = $look                 = $ent['id'];
        codecept_debug($look);


        /*
         * dogodki, ki so predstave
         */
        $resp                      = $I->successfullyGetList($this->dogodekUrl . "?q=Predstava 1&zacetek=2000-01-01&konec=2200-05-05&razred[]=100s", []);
        $list                      = $resp['data'];
        codecept_debug($list);
        $I->assertEquals(1, $resp['state']['totalRecords']);
        $ent                       = array_pop($list);
        $this->lookDogPredstava1Id = $look                      = $ent['id'];
        codecept_debug($look);
    }

    /**
     * poišče obstoječe termine storitev
     * 
     * @depends getListDogodek
     * @param ApiTester $I
     */
    public function getListTerminiStoritev(ApiTester $I)
    {
        $resp = $I->successfullyGetList($this->terminStoritveUrl . "?dogodek=" . $this->lookDogVaja1Id, []);
        $list = $resp['data'];
        codecept_debug($list);
        $I->assertGreaterThanOrEqual(6, $resp['state']['totalRecords']);

        $this->objTSDog1A = $ts               = $list[0];
        $this->objTSDog1B = $ts               = $list[1];
        $this->objTSDog1C = $ts               = $list[5];
        codecept_debug($ts);
    }

    /**
     *  kreiramo zapis
     * 
     * @depends lookupOsebo
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data       = [
            'planiranZacetek' => '2012-08-01T19:00:00+0200',
            'planiranKonec'   => '2012-08-01T23:30:00+0200',
            'oseba'           => $this->lookOseba1['id'],
            'zasedenost'      => TRUE,
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);

        // kreiramo še en zapis
        $data       = [
            'planiranZacetek' => '2005-02-01T00:00:00+0100',
            'planiranKonec'   => '2006-02-01T00:00:00+0100',
            'oseba'           => $this->lookOseba2['id'],
            'zasedenost'      => TRUE,
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);
    }

    /**
     * preberi vse zapise od osebe
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getList(ApiTester $I)
    {
        $resp      = $I->successfullyGetList($this->restUrlDefault, []);
        $list      = $resp['data'];
        codecept_debug($resp);
        $totRecVsi = $totRec    = $resp['state']['totalRecords'];
        codecept_debug($totRec);
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
//        $I->assertEquals("2005-02-01T00:00:00+0100", $list[0]['planiranZacetek']);
//        $I->assertEquals("2021-02-01T00:00:00+0100", $list[$totRec - 1]['planiranZacetek']);


        /**
         * get list po osebi
         */
        $osebeIds = [$this->lookOseba1['id'],];
        $parOsebe = ""; //init
        foreach ($osebeIds as $oId) {
            $parOsebe .= "oseba[]=" . $oId . "&";
        }
        $resp   = $I->successfullyGetList($this->restUrlDefault . "?" . $parOsebe, []);
        $list   = $resp['data'];
        codecept_debug($resp);
        $totRec = $resp['state']['totalRecords'];
        codecept_debug($totRec);
        $I->assertLessThan($totRecVsi, $resp['state']['totalRecords']);
        $I->assertGreaterThanOrEqual(1, $resp['state']['totalRecords']);
        $this->kontroleRezultatovGetList($I, $osebeIds, $list);

        /**
         * get list po 2 osebah
         */
        $osebeIds = [
            $this->lookOseba1['id'],
            $this->lookOseba3['id'],
        ];
        $parOsebe = ""; //init
        foreach ($osebeIds as $oId) {
            $parOsebe .= "oseba[]=" . $oId . "&";
        }
        $resp        = $I->successfullyGetList($this->restUrlDefault . "?" . $parOsebe, []);
        $list        = $resp['data'];
        codecept_debug($resp);
        $totRecOsebe = $totRec      = $resp['state']['totalRecords'];
        codecept_debug($totRec);
        $I->assertLessThan($totRecVsi, $resp['state']['totalRecords']);
        $I->assertGreaterThanOrEqual(1, $resp['state']['totalRecords']);
        $this->kontroleRezultatovGetList($I, $osebeIds, $list);


        /**
         * get list po 2 osebah z začetkom in koncem
         */
        $resp   = $I->successfullyGetList($this->restUrlDefault . "?" . $parOsebe
                . "zacetek=" . urlencode("2012-08-01T00:00:00+0200") . "&"
                . "konec=" . urlencode("2012-08-01T23:59:59+0200")
                , []);
        $list   = $resp['data'];
        codecept_debug($resp);
        $totRec = $resp['state']['totalRecords'];
        codecept_debug($totRec);
        $I->assertLessThan($totRecOsebe, $resp['state']['totalRecords'], "manj zaradi začetka in konca");
        $I->assertGreaterThanOrEqual(1, $resp['state']['totalRecords']);
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $data                    = $this->obj1;
        $data['planiranZacetek'] = '2012-08-01T18:00:00+0200';

        $this->obj1 = $ent        = $I->successfullyUpdate($this->restUrl, $data['id'], $data);

        $I->assertEquals($data['planiranZacetek'], $ent['planiranZacetek']);
    }

    /**
     * Preberem zapis in preverim vsa polja
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function read(\ApiTester $I)
    {
        $ent = $I->successfullyGet($this->restUrlDefault, $this->obj1['id']);
        codecept_debug($ent);

        $I->assertGuid($ent['id']);
        $I->assertEquals($ent['planiranZacetek'], '2012-08-01T18:00:00+0200');
        $I->assertEquals($ent['planiranKonec'], '2012-08-01T23:30:00+0200');
        $I->assertEquals($ent['zasedenost'], TRUE, 'zasedenost');
        $I->assertEquals($ent['oseba']['id'], $this->lookOseba1['id']);
        $I->assertEquals($ent['deltaPlaniranZacetek'], null);
        $I->assertEquals($ent['deltaPlaniranKonec'], null);
        $I->assertEquals($ent['dogodek'], null);
        $I->assertEquals($ent['alternacija'], null);
        $I->assertEquals($ent['dezurni'], false);
        $I->assertEquals($ent['gost'], false);
        $I->assertEquals($ent['virtZasedenost'], false);
    }

    /**
     *  kreiramo zapis ure prisotnosti Termina storitve
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function createUraTS(ApiTester $I)
    {
        $ts = $I->successfullyGet($this->restUrlDefault, $this->objTSDog1A['id']);
        codecept_debug($ts);

        $data = [
            'zacetek'        => $ts['planiranZacetek'],
            'konec'          => $ts['planiranKonec'],
            'oseba'          => $ts['oseba'],
            'terminStoritve' => $ts['id'],
        ];
        $ent  = $I->successfullyCreate($this->uraUrl, $data);
        codecept_debug($ent);
        $I->assertGuid($ent['id']);
    }

    /**
     * spremenim zapis za kontrolo validacije
     * 
     * @depends createUraTS
     * @param ApiTester $I
     */
    public function updateZaValidacijo(ApiTester $I)
    {

        /**
         * če so vnešene ure ni več možno spreminjati termina storitve
         */
        $data = $I->successfullyGet($this->restUrl, $this->objTSDog1A['id']);
        codecept_debug($data);
        $I->assertNotEmpty($data['ura']);

        $resp = $I->failToUpdate($this->restUrl, $data['id'], $data);
        $I->assertEquals(1001088, $resp[0]['code']);
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
     *  kreiramo zapis na default formi
     * 
     * @depends lookupOsebo
     * 
     * @param ApiTester $I
     */
    public function createDefault(ApiTester $I)
    {
        $data = [
            'planiranZacetek' => '2014-09-01T19:00:00+0200',
            'planiranKonec'   => '2014-09-01T23:30:00+0200',
            'oseba'           => $this->lookOseba1['id'],
            'zasedenost'      => TRUE,
        ];
        $resp = $I->failToCreate($this->restUrlDefault, $data);
        codecept_debug($resp);
    }

    /**
     * spremenim zapis
     * 
     * @depends getListTerminiStoritev
     * @param ApiTester $I
     */
    public function updateDefault(ApiTester $I)
    {
        $data                    = $this->objTSDog1C;
        $data['planiranZacetek'] = '2012-08-01T18:00:00+0200';
        $data['planiranKonec']   = '2012-08-01T19:00:00+0200';

        $ent = $I->successfullyUpdate($this->restUrlDefault, $data['id'], $data);

        $I->assertEquals($data['planiranZacetek'], $ent['planiranZacetek']);
        $I->assertEquals($data['planiranKonec'], $ent['planiranKonec']);
    }

    /**
     * brisanje zapisa po default formi
     * 
     * @depends getListTerminiStoritev
     */
    public function deleteDefault(ApiTester $I)
    {
        $I->successfullyDelete($this->restUrlDefault, $this->objTSDog1B['id']);
        $I->failToGet($this->restUrlDefault, $this->objTSDog1B['id']);
    }

}
