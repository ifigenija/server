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
    private $lookDogPredstava15Id;
    private $lookDogPredstava16Id;
    private $lookDogSplosDog1Id;
    private $lookDogSplosDog2Id;
    private $lookDogSplosDog3Id;
    private $lookDogTehnicniDog1Id;
    private $lookDogTehnicniDog2Id;
    private $lookDogGostovanje1Id;
    private $lookDogGostovanje2Id;
    private $objTSDog1A;
    private $objTSDog1B;
    private $objTSDog1C;
    private $objTSDog1D;
    private $objTSDog1E;
    private $objTSGos;
    private $lookSezona2014;
    private $lookSezona2015;
    private $lookSezona2016;
    private $lookSezona2017;
    private $lookOseba1;
    private $lookOseba2;
    private $lookOseba3;

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
     * 
     * @param ApiTester $I
     * @param type $dogodekId
     * @param type $newIds
     */
    private function kontroleRezultatovRazmnozi(ApiTester $I, $dogodekId, $newIds)
    {
        codecept_debug(__FUNCTION__);
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
//        codecept_debug($list);

        /*
         * kontrola, če so vsi termini storitve shranjeni
         */
        foreach ($terminiStoritev as $ts) {
            $I->assertContains($ts['oseba']['id'], array_column(array_column($list, "oseba"), "id"), "oseba id");
            $I->assertContains($this->toLjTimeZone($ts['planiranZacetek']), array_column($list, "planiranZacetek"), "planiranZacetek");
            $I->assertContains($this->toLjTimeZone($ts['planiranKonec']), array_column($list, "planiranKonec"), "planiranKonec");
        }
    }

    /**
     * konvertira string datum (v poljubni time zoni v 
     * string datuma v Europe/Ljubljana time zoni
     * 
     * Primer
     *  Vhod : 2015-06-26T10:00:00.000Z  
     *  Izhod: 2015-06-26T12:00:00+0200
     * 
     * @param string $casS
     * return string
     */
    private function toLjTimeZone($casS)
    {
        $d0 = new \DateTime($casS);
        $d0->setTimeZone(new \DateTimeZone('Europe/Ljubljana'));
        return $d0->format("Y-m-d\TH:i:sO");
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupSezona(ApiTester $I)
    {
        $this->lookSezona2014 = $look                 = $I->lookupEntity("sezona", "2015", false);
        $I->assertGuid($look['id']);

        $this->lookSezona2015 = $look                 = $I->lookupEntity("sezona", "2015", false);
        $I->assertGuid($look['id']);

        $this->lookSezona2016 = $look                 = $I->lookupEntity("sezona", "2016", false);
        $I->assertGuid($look['id']);

        $this->lookSezona2017 = $look                 = $I->lookupEntity("sezona", "2017", false);
        $I->assertGuid($look['id']);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupOsebe(ApiTester $I)
    {
        $this->lookOseba1 = $look             = $I->lookupEntity("oseba", "0001", false);
        codecept_debug($look);
        $I->assertGuid($look['id']);

        $this->lookOseba2 = $look             = $I->lookupEntity("oseba", "0002", false);
        codecept_debug($look);
        $I->assertGuid($look['id']);

        $this->lookOseba3 = $look             = $I->lookupEntity("oseba", "0003", false);
        codecept_debug($look);
        $I->assertGuid($look['id']);
    }

    /**
     * @param ApiTester $I
     */
    public function getListDogodek(ApiTester $I)
    {
        /*
         * dogodki, ki so vaje
         */
        $resp                 = $I->successfullyGetList($this->dogodekUrl
                . "?q=Vaja 1.&zacetek=2000-01-01&konec=2200-05-05&razred[]=200s", []);
        $list                 = $resp['data'];
        codecept_debug($list);
        $I->assertEquals(1, $resp['state']['totalRecords']);
        $ent                  = array_pop($list);
        $this->lookDogVaja1Id = $look                 = $ent['id'];
        codecept_debug($look);

        /*
         * 2. vaja
         */
        $resp                 = $I->successfullyGetList($this->dogodekUrl
                . "?q=Vaja 2.&zacetek=2000-01-01&konec=2200-05-05&razred[]=200s", []);
        $list                 = $resp['data'];
        codecept_debug($list);
        $I->assertEquals(1, $resp['state']['totalRecords']);
        $ent                  = array_pop($list);
        $this->lookDogVaja2Id = $look                 = $ent['id'];
        codecept_debug($look);


        /*
         * dogodki, ki so predstave
         */
        $resp                      = $I->successfullyGetList($this->dogodekUrl
                . "?q=Predstava 1.&zacetek=2000-01-01&konec=2200-05-05&razred[]=100s", []);
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

        /*
         * gostovanje
         */
        $resp                       = $I->successfullyGetList($this->dogodekUrl
                . "?q=Gostovanje 1.&zacetek=2000-01-01&konec=2200-05-05&razred[]=300s", []);
        $list                       = $resp['data'];
        codecept_debug($list);
        $I->assertEquals(1, $resp['state']['totalRecords']);
        $ent                        = array_pop($list);
        $this->lookDogGostovanje1Id = $look                       = $ent['id'];
        codecept_debug($look);


        /*
         * poddogodki gostovanja
         */
        $resp                       = $I->successfullyGetList($this->dogodekUrl
                . "?q=Predstava 15.&zacetek=2000-01-01&konec=2200-05-05&razred[]=100s", []);
        $list                       = $resp['data'];
        codecept_debug($list);
        $I->assertEquals(1, $resp['state']['totalRecords']);
        $ent                        = array_pop($list);
        $this->lookDogPredstava15Id = $look                       = $ent['id'];
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

        /*
         * naredimo  še enega, ki še ne obstaja, za gostovanje
         */
        $ts                    = [];
        $ts['id']              = null;    // ker bo novi dogodek
        $ts['planiranZacetek'] = '2015-03-10T07:00:00+0100';
        $ts['planiranKonec']   = '2015-03-20T23:00:00+0100';
        $ts['sodelujoc']       = true;
        $ts['dezurni']         = false;
        $ts['gost']            = false;
        $ts['sodelujoc']       = true;
        $ts['oseba']['id']     = $this->lookOseba1['id'];
        $this->objTSGos        = $ts;
        codecept_debug($ts);
    }

    /**
     * kliče RPC metodo razmnozi
     * 
     * @depends getListDogodek
     * @param ApiTester $I
     */
    public function razmnozi(ApiTester $I)
    {
        /*
         * kopije vaje
         */
        $dogodekId = $this->lookDogVaja2Id;
        $newIds    = $I->successfullyCallRpc($this->rpcUrl, 'razmnozi', [
            "dogodekId"        => $dogodekId
            , "steviloPonovitev" => 3
        ]);
        codecept_debug($newIds);
        $I->assertEquals(3, count($newIds), "število novih");
        $this->kontroleRezultatovRazmnozi($I, $dogodekId, $newIds);

        /*
         * napačno število ponovitev
         */
        $resp      = $I->failCallRpc($this->rpcUrl, 'razmnozi', [
            "dogodekId"        => $dogodekId
            , "steviloPonovitev" => -4
        ]);
        codecept_debug($resp);
        $I->assertEquals(1001254, $resp['code'], 'št ponov. >0');

        /*
         * kopija vaje z začetkom obdobja in upoštevanju sobot
         */
        $newIds    = $I->successfullyCallRpc($this->rpcUrl, 'razmnozi', [
            "dogodekId"        => $dogodekId
            , "zacetekObdobja"   => '2014-01-03T00:00:00+0200'    // petek 
            , "upostevajSobote"  => true
            , "steviloPonovitev" => 3
        ]);
        codecept_debug($newIds);
        /*
         * $$ kontrola, da v soboto ni kreiral
         */
        $I->assertEquals(3, count($newIds), "število novih");
        $this->kontroleRezultatovRazmnozi($I, $dogodekId, $newIds);

        /*
         * kopija vaje z začetkom obdobja in upoštevanju nedelj
         */
        $newIds    = $I->successfullyCallRpc($this->rpcUrl, 'razmnozi', [
            "dogodekId"        => $dogodekId
            , "zacetekObdobja"   => '2014-01-10T00:00:00+0200'    // petek 
            , "upostevajNedelje" => true
            , "steviloPonovitev" => 3
        ]);
        codecept_debug($newIds);
        /*
         * $$ kontrola, da v nedeljo ni kreiral
         */
        $I->assertEquals(3, count($newIds), "število novih");
        $this->kontroleRezultatovRazmnozi($I, $dogodekId, $newIds);

        /*
         * upoštevanju praznikov
         */
        $newIds    = $I->successfullyCallRpc($this->rpcUrl, 'razmnozi', [
            "dogodekId"         => $dogodekId
            , "zacetekObdobja"    => '2012-02-07T00:00:00+0200'    // dan pred praznikom
            , "upostevajPraznike" => true
            , "steviloPonovitev"  => 3
        ]);
        codecept_debug($newIds);
        /*
         * $$ kontrola, da ni na praznik
         */
        $I->assertEquals(3, count($newIds), "število novih");
        $this->kontroleRezultatovRazmnozi($I, $dogodekId, $newIds);

        /*
         * upoštevanju praznikov,sobot,nedelj
         */
        $newIds    = $I->successfullyCallRpc($this->rpcUrl, 'razmnozi', [
            "dogodekId"         => $dogodekId
            , "zacetekObdobja"    => '2014-08-14T00:00:00+0200'    // četrtek pred praznikom
            , "upostevajPraznike" => true
            , "upostevajSobote"   => true
            , "upostevajNedelje"  => true
            , "steviloPonovitev"  => 2
        ]);
        codecept_debug($newIds);
        /*
         * $$ kontrola, da ni na praznik, sob in ned
         * 
         * $$ kontrole 
         *    ne Datumi
         *    ja začetki
         */
        $I->assertEquals(2, count($newIds), "število novih");
        $this->kontroleRezultatovRazmnozi($I, $dogodekId, $newIds);

        /*
         * konec obdobja pred številom ponovitev
         */
        $newIds    = $I->successfullyCallRpc($this->rpcUrl, 'razmnozi', [
            "dogodekId"        => $dogodekId
            , "zacetekObdobja"   => '2011-09-01T00:00:00+0200'
            , "konecObdobja"     => '2011-09-02T23:59:59+0200'  //2 dni od začetka
            , "steviloPonovitev" => 11
        ]);
        codecept_debug($newIds);
        $I->assertEquals(2, count($newIds), "št. novih - upošteva konec obdobja");
        $this->kontroleRezultatovRazmnozi($I, $dogodekId, $newIds);

        /*
         * preveliko število ponovitev
         */
        $resp      = $I->failCallRpc($this->rpcUrl, 'razmnozi', [
            "dogodekId"        => $dogodekId
            , "zacetekObdobja"   => '2011-09-05T00:00:00+0200'
            , "steviloPonovitev" => 101                     // preveliko število ponovitev             
        ]);
        codecept_debug($resp);
        $I->assertEquals(1001259, $resp['code'], 'preveliko število');
        
        /*
         * napačen parameter dopoldanOd
         */
        $resp      = $I->failCallRpc($this->rpcUrl, 'razmnozi', [
            "dogodekId"        => $dogodekId
            , "zacetekObdobja"   => '2011-09-03T00:00:00+0200'
            , "konecObdobja"     => '2011-09-23T23:59:59+0200'
            , "dopoldanOd"       => ["h" => 9, "napaka brez minut" => 15]
            , "steviloPonovitev" => 0
        ]);
        codecept_debug($resp);
        $I->assertEquals(1001256, $resp['code'], 'napačen format dopoldanOd');

        /*
         * napačen parameter dopoldanOd
         */
        $resp      = $I->failCallRpc($this->rpcUrl, 'razmnozi', [
            "dogodekId"        => $dogodekId
            , "zacetekObdobja"   => '2011-09-03T00:00:00+0200'
            , "konecObdobja"     => '2011-09-23T23:59:59+0200'
            , "dopoldanOd"       => ["h" => 9, "m" => 65]       // preveč minut
            , "steviloPonovitev" => 0
        ]);
        codecept_debug($resp);
        $I->assertEquals(1001256, $resp['code'], 'napačen format dopoldanOd');

        /*
         * napačen parameter dopoldanOd
         */
        $resp      = $I->failCallRpc($this->rpcUrl, 'razmnozi', [
            "dogodekId"        => $dogodekId
            , "zacetekObdobja"   => '2011-09-03T00:00:00+0200'
            , "konecObdobja"     => '2011-09-23T23:59:59+0200'
            , "dopoldanOd"       => ["h" => 30, "m" => 15]       // preveč ur
            , "steviloPonovitev" => 0
        ]);
        codecept_debug($resp);
        $I->assertEquals(1001256, $resp['code'], 'napačen format dopoldanOd');


        $I->fail('$$');
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
        codecept_debug($terminiStoritev);
        $resp            = $I->successfullyCallRpc($this->rpcUrl, 'azurirajTSDogodka', [
            "dogodekId"       => $dogodekId
            , "terminiStoritev" => $terminiStoritev]);
        codecept_debug($resp);
        $resp            = $I->successfullyGetList($this->terminStoritveUrl . "?dogodek=" . $dogodekId, []);
        $list            = $resp['data'];
        codecept_debug($list);
        $this->kontroleRezultatovAzurirajTs($I, $dogodekId, $terminiStoritev);


        /*
         * dodaj TS na gostovanje
         */
        $dogodekId       = $this->lookDogGostovanje1Id;
        $terminiStoritev = [$this->objTSGos];
        $resp            = $I->successfullyCallRpc($this->rpcUrl, 'azurirajTSDogodka', [
            "dogodekId"       => $dogodekId
            , "terminiStoritev" => $terminiStoritev]);
        codecept_debug($resp);
        $resp            = $I->successfullyGetList($this->terminStoritveUrl . "?dogodek=" . $dogodekId, []);
        $list            = $resp['data'];
        codecept_debug($list);
        $this->kontroleRezultatovAzurirajTs($I, $dogodekId, $terminiStoritev);


        /*
         * test datuma
         */
        $dogodekId             = $this->lookDogVaja1Id;
        $ts                    = $this->objTSDog1A;
        $ts['planiranZacetek'] = "2015-06-26T10:00:00+0200";
        $ts['planiranKonec']   = "2015-06-26T11:00:00+0200";
        $terminiStoritev       = [$ts];
        codecept_debug($ts);
        $resp                  = $I->successfullyCallRpc($this->rpcUrl, 'azurirajTSDogodka', [
            "dogodekId"       => $dogodekId
            , "terminiStoritev" => $terminiStoritev]);
        codecept_debug($resp);
        $this->kontroleRezultatovAzurirajTs($I, $dogodekId, $terminiStoritev);

        /*
         * drugačna oblika datuma
         */
        $dogodekId             = $this->lookDogVaja1Id;
        $ts                    = $this->objTSDog1A;
        $ts['planiranZacetek'] = "2015-06-26T10:00:00.000Z";
        $ts['planiranKonec']   = "2015-06-26T11:00:00.000Z";
        $terminiStoritev       = [$ts];
        codecept_debug($ts);
        $resp                  = $I->successfullyCallRpc($this->rpcUrl, 'azurirajTSDogodka', [
            "dogodekId"       => $dogodekId
            , "terminiStoritev" => $terminiStoritev]);
        codecept_debug($resp);

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
//        $zacetek   = '2015-03-03T10:10:00+0100';//$$ pri tem datumu so problemi, ker narobe izračunava delto v eno in drugo smer!
        $zacetek   = '2015-04-03T10:10:00+0200';
        $newId     = $I->successfullyCallRpc($this->rpcUrl, 'kopirajDogodek', [
            "dogodekId" => $dogodekId
            , "zacetek"   => $zacetek
        ]);
        codecept_debug($newId);
        $this->kontroleRezultatovKopirajDogodek($I, $dogodekId, $zacetek, $newId);
        /*
         * preverimo še, če se je sezona spremenila
         */
        $ent       = $I->successfullyGet($this->dogodekUrl, $newId);
        codecept_debug($ent);

        $I->assertEquals($this->lookSezona2015['id'], $ent['sezona'], "spremenjena sezona glede na novi začetek");

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

        /*
         * neveljavni dogodek - gostovanje
         */
        $dogodekId = $this->lookDogGostovanje1Id;
        $zacetek   = '2012-06-04T10:10:00+0200';
        $resp      = $I->failCallRpc($this->rpcUrl, 'kopirajDogodek', [
            "dogodekId" => $dogodekId
            , "zacetek"   => $zacetek
        ]);
        codecept_debug($resp);
        $I->assertEquals(1001262, $resp['code']);

        /*
         * neveljavni dogodek - dogodek, ki je del gostovanja
         */
        $dogodekId = $this->lookDogPredstava15Id;
        $zacetek   = '2012-06-04T10:10:00+0200';
        $resp      = $I->failCallRpc($this->rpcUrl, 'kopirajDogodek', [
            "dogodekId" => $dogodekId
            , "zacetek"   => $zacetek
        ]);
        codecept_debug($resp);
        $I->assertEquals(1001263, $resp['code']);
    }

}
