<?php

namespace Rpc\Dogodek;

use ApiTester;

/**
 * Plan testov:
 * 
 *      Testiranje metod DogodekRpcService-a
 * Klic RPC funkcij:
 *  - azurirajTSDogodka
 * Preveri če naredi:
 *  - briše odvečne termine storitve
 *  - update-ira obsoječe TS
 *  - kreira nove termine storitve
 */
class DogodekCest
{

    private $rpcUrl            = '/rpc/koledar/dogodek';
    private $dogodekUrl        = '/rest/dogodek';
    private $terminStoritveUrl = '/rest/terminstoritve';
    private $lookDogVaja1Id;
    private $lookDogVaja2Id;
    private $lookDogVaja3Id;
    private $lookDogPredstava1Id;
    private $lookDogPredstava2Id;
    private $lookDogPredstava3Id;
    private $lookDogSplosDog1Id;
    private $lookDogSplosDog2Id;
    private $lookDogSplosDog3Id;
    private $lookDogTehnicniDog1Id;
    private $lookDogTehnicniDog2Id;
    private $objTSDog1A;
    private $objTSDog1B;
    private $objTSDog1C;
    private $objTSDog1D;
    private $objTSDog1E;

    public function _before(ApiTester $I)
    {
// da testiramo vsa posamezna dovoljenja brez shortCurcuit
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vesna, \IfiTest\AuthPage::$vesnaPass);
    }

    /**
     * metoda, ki se večkrat kliče zaradi preverjanja rezultatov rpc klica kopirajDogodek
     * 
     * @param ApiTester $I
     * @param type $dogodekId
     * @param type $zacetek
     * @param type $newId           id novega dogodka
     * @param type $konec
     */
    private function kontroleRezultatovKopirajDogodek(ApiTester $I, $dogodekId, $zacetek, $newId)
    {
        codecept_debug(__FUNCTION__);

        /*
         * ali je v novem dogodku pravi začetek 
         */
        $ent = $I->successfullyGet($this->dogodekUrl, $newId);
        codecept_debug($ent);
        $I->assertEquals($zacetek, $ent['zacetek'], "nov začetek");
        $I->assertEquals('200s', $ent['status'], "nov začetek");

        /*
         * ali število terminov storitev v starem in novem dogodku enako
         */
        $resp       = $I->successfullyGetList($this->terminStoritveUrl . "?dogodek=" . $dogodekId, []);
        $listOld    = $resp['data'];
        codecept_debug($listOld);
        $countTSold = $resp['state']['totalRecords'];

        $resp       = $I->successfullyGetList($this->terminStoritveUrl . "?dogodek=" . $newId, []);
        $listNew    = $resp['data'];
        codecept_debug($listNew);
        $countTSnew = $resp['state']['totalRecords'];

        $I->assertEquals($countTSold, $countTSnew, "število terminov storitev");

        /*
         * ali imajo stari in novi termini storitve enake delte kot stari
         */
        foreach ($listNew as $tsNew) {
            $I->assertContains($tsNew['deltaPlaniranKonec'], array_column($listOld, "deltaPlaniranKonec"), "deltaPlaniranKonec");
            $I->assertContains($tsNew['deltaPlaniranZacetek'], array_column($listOld, "deltaPlaniranZacetek"), "deltaPlaniranZacetek");
        }
    }

    /**
     * metoda, ki se večkrat kliče zaradi preverjanja rezultatov rpc klica azurirajTSDogodka
     * 
     * @param ApiTester $I
     * @param type $dogodekId
     * @param array $terminiStoritev
     */
    private function kontroleRezultatovAzurirajTs(ApiTester $I, $dogodekId, array $terminiStoritev)
    {
        codecept_debug(__FUNCTION__);

        $resp = $I->successfullyGetList($this->terminStoritveUrl . "?dogodek=" . $dogodekId, []);
        $list = $resp['data'];
        $I->assertEquals(count($terminiStoritev), $resp['state']['totalRecords']);

        /*
         * kontrola, če so vsi termini storitve shranjeni
         */
        foreach ($terminiStoritev as $ts) {
            $I->assertContains($ts['oseba']['id'], array_column(array_column($list, "oseba"), "id"), "oseba id");
            $I->assertContains($ts['planiranZacetek'], array_column($list, "planiranZacetek"), "planiranZacetek");
            $I->assertContains($ts['planiranKonec'], array_column($list, "planiranKonec"), "planiranKonec");
        }
    }

    /**
     * @param ApiTester $I
     */
    public function getListDogodek(ApiTester $I)
    {
        /*
         * dogodki, ki so vaje
         */
        $resp = $I->successfullyGetList($this->dogodekUrl
                . "?q=dogodek 1&zacetek=2000-01-01&konec=2200-05-05&razred[]=200s", []);
        $list = $resp['data'];
        codecept_debug($list);
        $I->assertEquals(1, $resp['state']['totalRecords']);


        $ent                  = array_pop($list);
        $this->lookDogVaja1Id = $look                 = $ent['id'];
        codecept_debug($look);


        /*
         * dogodki, ki so predstave
         */
        $resp                      = $I->successfullyGetList($this->dogodekUrl
                . "?q=Predstava 1&zacetek=2000-01-01&konec=2200-05-05&razred[]=100s", []);
        $list                      = $resp['data'];
        codecept_debug($list);
        $I->assertEquals(1, $resp['state']['totalRecords']);
        $ent                       = array_pop($list);
        $this->lookDogPredstava1Id = $look                      = $ent['id'];
        codecept_debug($look);

        /*
         * splošni dogodki
         */
        $resp                     = $I->successfullyGetList($this->dogodekUrl
                . "?q=DogodekSplosni 1&zacetek=2000-01-01&konec=2200-05-05&razred[]=400s", []);
        $list                     = $resp['data'];
        codecept_debug($list);
        $I->assertEquals(1, $resp['state']['totalRecords']);
        $ent                      = array_pop($list);
        $this->lookDogSplosDog1Id = $look                     = $ent['id'];
        codecept_debug($look);

        /*
         * tehnični dogodki
         */
        $resp                        = $I->successfullyGetList($this->dogodekUrl
                . "?q=DogodekTehnicni 1&zacetek=2000-01-01&konec=2200-05-05&razred[]=600s", []);
        $list                        = $resp['data'];
        codecept_debug($list);
        $I->assertEquals(1, $resp['state']['totalRecords']);
        $ent                         = array_pop($list);
        $this->lookDogTehnicniDog1Id = $look                        = $ent['id'];
        codecept_debug($look);


        /*
         * tehnični dogodek - ni več planiran
         */
        $resp                        = $I->successfullyGetList($this->dogodekUrl
                . "?q=DogodekTehnicni 2&zacetek=2000-01-01&konec=2200-05-05&razred[]=600s", []);
        $list                        = $resp['data'];
        codecept_debug($list);
        $I->assertEquals(1, $resp['state']['totalRecords']);
        $ent                         = array_pop($list);
        $this->lookDogTehnicniDog2Id = $look                        = $ent['id'];
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

        $this->objTSDog1A      = $ts                    = $list[0];
        $this->objTSDog1B      = $ts                    = $list[1];
        $ts                    = $list[5];
        $ts['planiranZacetek'] = '2012-05-20T08:30:00+0200';
        $ts['planiranKonec']   = '2012-05-20T09:00:00+0200';
        $this->objTSDog1C      = $ts;
        codecept_debug($ts);

        /*
         * naredimo enega, ki še ne obstaja
         */
        $ts                    = $this->objTSDog1A;
        $I->assertNotEmpty($ts['alternacija']);     // z alternacijo
        $ts['id']              = null;    // ker bo novi dogodek
        $ts['planiranZacetek'] = '2012-05-20T09:30:00+0200';
        $ts['planiranKonec']   = '2012-05-20T14:00:00+0200';
        $this->objTSDog1D      = $ts;
        codecept_debug($ts);

        /*
         * naredimo  še enega, ki še ne obstaja
         */
        $ts                    = $this->objTSDog1C;
        $I->assertEmpty($ts['alternacija']);    //brez alternacije
        $ts['id']              = null;    // ker bo novi dogodek
        $ts['planiranZacetek'] = '2012-05-20T09:30:00+0200';
        $ts['planiranKonec']   = '2012-05-20T14:00:00+0200';
        $this->objTSDog1E      = $ts;
        codecept_debug($ts);
    }

    /**
     * kliče RPC metodo azurirajTSDogodka¸
     *
     * @depends getListTerminiStoritev  
     * @param ApiTester $I
     */
    public function azurirajTSDogodka(ApiTester $I)
    {
        /*
         * -> A,B
         */
        $dogodekId       = $this->lookDogVaja1Id;
        $terminiStoritev = [$this->objTSDog1A, $this->objTSDog1B];
        $resp            = $I->successfullyCallRpc($this->rpcUrl, 'azurirajTSDogodka', [
            "dogodekId"       => $dogodekId
            , "terminiStoritev" => $terminiStoritev]);
        codecept_debug($resp);
        
        $this->kontroleRezultatovAzurirajTs($I, $dogodekId, $terminiStoritev);

        
        /*
         * A,B -> B,C,D,E   - dva nova kreiramo, 1 zbrišemo
         */
        $dogodekId       = $this->lookDogVaja1Id;
        $terminiStoritev = [$this->objTSDog1B, $this->objTSDog1C, $this->objTSDog1D, $this->objTSDog1E];
        $resp            = $I->successfullyCallRpc($this->rpcUrl, 'azurirajTSDogodka', [
            "dogodekId"       => $dogodekId
            , "terminiStoritev" => $terminiStoritev]);
        codecept_debug($resp);
        $resp            = $I->successfullyGetList($this->terminStoritveUrl . "?dogodek=" . $this->lookDogVaja1Id, []);
        $list            = $resp['data'];
        codecept_debug($list);
        $this->kontroleRezultatovAzurirajTs($I, $dogodekId, $terminiStoritev);
    }

    /**
     * kliče RPC metodo kopirajDogodek¸
     * 
     * @depends getListDogodek
     * @param ApiTester $I
     */
    public function kopirajDogodek(ApiTester $I)
    {
        /*
         * kopija vaje
         */
        $dogodekId = $this->lookDogVaja1Id;
        $zacetek   = '2012-06-01T10:10:00+0200';
        $newId     = $I->successfullyCallRpc($this->rpcUrl, 'kopirajDogodek', [
            "dogodekId" => $dogodekId
            , "zacetek"   => $zacetek
        ]);
        codecept_debug($newId);
        $this->kontroleRezultatovKopirajDogodek($I, $dogodekId, $zacetek, $newId);

        /*
         * kopija predstave
         */
        $dogodekId = $this->lookDogPredstava1Id;
        $zacetek   = '2012-06-02T10:10:00+0200';
        $newId     = $I->successfullyCallRpc($this->rpcUrl, 'kopirajDogodek', [
            "dogodekId" => $dogodekId
            , "zacetek"   => $zacetek
        ]);
        codecept_debug($newId);
        $this->kontroleRezultatovKopirajDogodek($I, $dogodekId, $zacetek, $newId);

        /*
         * kopija splošnega dogodka
         */
        $dogodekId = $this->lookDogSplosDog1Id;
        $zacetek   = '2012-06-03T10:10:00+0200';
        $newId     = $I->successfullyCallRpc($this->rpcUrl, 'kopirajDogodek', [
            "dogodekId" => $dogodekId
            , "zacetek"   => $zacetek
        ]);
        codecept_debug($newId);
        $this->kontroleRezultatovKopirajDogodek($I, $dogodekId, $zacetek, $newId);

        /*
         * kopija tehničnega dogodka
         */
        $dogodekId = $this->lookDogTehnicniDog1Id;
        $zacetek   = '2012-06-04T10:10:00+0200';
        $newId     = $I->successfullyCallRpc($this->rpcUrl, 'kopirajDogodek', [
            "dogodekId" => $dogodekId
            , "zacetek"   => $zacetek
        ]);
        codecept_debug($newId);
        $this->kontroleRezultatovKopirajDogodek($I, $dogodekId, $zacetek, $newId);

        /*
         * dogodek ki ni v statusu planiran, pregledan ali potrjen
         */
        $dogodekId = $this->lookDogTehnicniDog2Id;
        $zacetek   = '2012-06-05T10:10:00+0200';
        $resp      = $I->failCallRpc($this->rpcUrl, 'kopirajDogodek', [
            "dogodekId" => $dogodekId
            , "zacetek"   => $zacetek
        ]);
        codecept_debug($resp);
        $I->assertEquals(1001261, $resp['code']);

        /*
         * neveljavni parameter dogodekId
         */
        $dogodekId = 'Neveljavni id';
        $zacetek   = '2012-06-05T10:10:00+0200';
        $resp      = $I->failCallRpc($this->rpcUrl, 'kopirajDogodek', [
            "dogodekId" => $dogodekId
            , "zacetek"   => $zacetek
        ]);
        codecept_debug($resp);

        /*
         * neveljavni parameter začetek
         */
        $dogodekId = $this->lookDogPredstava1Id;
        $zacetek   = '2012-06-05T10:10:00+0200to ni datum';
        $resp      = $I->failCallRpc($this->rpcUrl, 'kopirajDogodek', [
            "dogodekId" => $dogodekId
            , "zacetek"   => $zacetek
        ]);
        codecept_debug($resp);
        $I->assertEquals(1001243, $resp['code']);
    }

}
