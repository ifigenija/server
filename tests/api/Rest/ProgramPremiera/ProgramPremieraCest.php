<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\ProgramPremiera;

use ApiTester;

/**
 * Description of ProgramPremieraCest
 * 
 * 
 * metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *       - delete
 *      validate metodo za entiteto
 *      relacije z drugimi entitetami (to many relacije)
 *      -(ni) pri many to many relacijah testiraj : update, get (list+id), delete
 *      - pri one to many relacijah testiraj : get (list+id)
 *         . drugiViri
 *         . koprodukcije
 *      getlist različne variante relacij
 *      - vse
 *      - default
 * 
 * @author rado
 */
class ProgramPremieraCest
{

    private $restUrl                      = '/rest/programpremiera';
    private $obj1;
    private $obj2;
    private $obj3;
    private $obj4;
    private $uprizoritevUrl               = '/rest/uprizoritev';
    private $lookUprizoritev;
    private $tipProgramskeEnoteUrl        = '/rest/tipprogramskeenote';
    private $rpcOptionsUrl                = '/rpc/app/options';
    private $maticnoGledalisce;
    private $lookTipProgramskeEnote1;
    private $lookTipProgramskeEnote2;
    private $lookTipProgramskeEnote3;
    private $lookTipProgramskeEnote4;
    private $lookTipProgramskeEnote5;
    private $drugiVirUrl                  = '/rest/drugivir';
    private $objDrugiVir1;
    private $objDrugiVir2;
    private $produkcijaDelitevUrl         = '/rest/produkcijadelitev';
    private $produkcijaDelitevUrlPremiera = '/rest/produkcijadelitev/premiera';
    private $objProdukcijaDelitev1;
    private $objProdukcijaDelitev2;
    private $produkcijskaHisaUrl          = '/rest/produkcijskahisa';
    private $lookupProdukcijskaHisa       = '/lookup/produkcijskahisa';
    private $lookProdukcijskaHisa1;
    private $lookProdukcijskaHisa2;
    private $lookProdukcijskaHisa3;
    private $lookProdukcijskaHisa4;
    private $lookProdukcijskaHisa5;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     * - getOptions  globalna vrednost
     * 
     * @param ApiTester $I
     */
    public function preberiOpcijoMaticno(ApiTester $I)
    {
        $opt                     = $I->successfullyCallRpc($this->rpcOptionsUrl, 'getOptions', ["name" => "application.tenant.maticnopodjetje"]);
        $I->assertNotEmpty($opt);
        $this->maticnoGledalisce = $opt;
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupProdukcijskaHisa(ApiTester $I)
    {

        $resp = $I->successfullyGetList($this->lookupProdukcijskaHisa, []);
        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->assertTrue(array_key_exists('data', $resp), "ima data");
        $I->assertGreaterThanOrEqual(1, $resp['state']['totalRecords'], "total records");

        $ind                         = array_search($this->maticnoGledalisce, array_column($resp['data'], 'ident'));
        $this->lookProdukcijskaHisa1 = $lookPH                      = $resp['data'][$ind];
        codecept_debug($lookPH);

        $ind                         = array_search("0989", array_column($resp['data'], 'ident'));
        $this->lookProdukcijskaHisa2 = $lookPH                      = $resp['data'][$ind];
        codecept_debug($lookPH);

        $ind                         = array_search("0986", array_column($resp['data'], 'ident'));
        $this->lookProdukcijskaHisa3 = $lookPH                      = $resp['data'][$ind];
        codecept_debug($lookPH);

        $ind                         = array_search("0982", array_column($resp['data'], 'ident'));
        $this->lookProdukcijskaHisa4 = $lookPH                      = $resp['data'][$ind];
        codecept_debug($lookPH);

        $ind                         = array_search("0984", array_column($resp['data'], 'ident'));
        $this->lookProdukcijskaHisa5 = $lookPH                      = $resp['data'][$ind];
        codecept_debug($lookPH);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupUprizoritev(ApiTester $I)
    {
        $this->lookUprizoritev = $look                  = $I->lookupEntity("uprizoritev", "0001", false);
        $I->assertNotEmpty($look);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookuptipProgramskeEnote(ApiTester $I)
    {
        $this->lookTipProgramskeEnote1 = $look                          = $I->lookupEntity("tipProgramskeEnote", "01", false);
        $I->assertNotEmpty($look);

        $this->lookTipProgramskeEnote2 = $look                          = $I->lookupEntity("tipProgramskeEnote", "02", false);
        $I->assertNotEmpty($look);

        $this->lookTipProgramskeEnote3 = $look                          = $I->lookupEntity("tipProgramskeEnote", "03", false);
        $I->assertNotEmpty($look);

        $this->lookTipProgramskeEnote4 = $look                          = $I->lookupEntity("tipProgramskeEnote", "04", false);
        $I->assertNotEmpty($look);

        $this->lookTipProgramskeEnote5 = $look                          = $I->lookupEntity("tipProgramskeEnote", "05", false);
        $I->assertNotEmpty($look);
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
//            'celotnaVrednost'      => 1.24,
//            'nasDelez'               => 5,
            'zaproseno'              => 0.66,
//            'lastnaSredstva'       => 1.24,
            'avtorskiHonorarji'      => 1.24,
            'avtorskiHonorarjiSamoz' => 1.24,
            'tantieme'               => 1.24,
            'materialni'             => 1.24,
            'avtorskePravice'        => 1.24,
            'drugiViri'              => 1.24,
//            'vlozekGostitelja'     =>1.24,
            'drugiJavni'             => 1.24,
            'obiskDoma'              => 1,
//            'obiskGost'          => 1,
//            'obiskZamejo'        => 1,
//            'obiskInt'           => 1,
//            'ponoviDoma'         => 1,
//            'ponoviZamejo'       => 1,
//            'ponoviGost'         => 1,
//            'ponoviInt'          => 1,
            'uprizoritev'            => $this->lookUprizoritev['id'],
            'tipProgramskeEnote'     => $this->lookTipProgramskeEnote1['id'],
            'kpe'                    => 0.4,
//            'tip'                => 'premiera', // ali to polje potrebujemo - ne. Ne rabimo vnašati, samo se nastavi
            'dokument'               => null,
            'sort'                   => 1,
            'stZaposUmet'            => 1,
            'stZaposDrug'            => 1,
            'stHonorarnih'           => 1,
            'stHonorarnihIgr'        => 1,
            'stHonorarnihIgrTujJZ'   => 1,
            'stHonorarnihIgrSamoz'   => 1,
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);

        // kreiramo še en zapis
        $data       = [
//            'celotnaVrednost'      => 4.56,
//            'nasDelez'               => 19,
            'zaproseno'              => 0.66,
//            'lastnaSredstva'       => 4.56,
            'avtorskiHonorarji'      => 4.56,
            'avtorskiHonorarjiSamoz' => 4.56,
            'tantieme'               => 4.56,
            'materialni'             => 4.56,
            'avtorskePravice'        => 4.56,
//            'vlozekGostitelja'     => 4.56,
            'drugiJavni'             => 4.56,
            'obiskDoma'              => 4,
//            'obiskGost'          => 4,
//            'obiskZamejo'        => 4,
//            'obiskInt'           => 4,
//            'ponoviDoma'         => 4,
//            'ponoviZamejo'       => 4,
//            'ponoviGost'         => 4,
//            'ponoviInt'          => 4,
            'uprizoritev'            => $this->lookUprizoritev['id'],
            'tipProgramskeEnote'     => $this->lookTipProgramskeEnote1['id'],
            'kpe'                    => 0.4,
            'dokument'               => null,
            'sort'                   => 2,
            'stZaposUmet'            => 2,
            'stZaposDrug'            => 2,
            'stHonorarnih'           => 2,
            'stHonorarnihIgr'        => 2,
            'stHonorarnihIgrTujJZ'   => 2,
            'stHonorarnihIgrSamoz'   => 2,
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
        $ent             = $this->obj1;
        $ent['tantieme'] = 1.22;

        $this->obj1 = $entR       = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['tantieme'], 1.22);
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
        $I->assertEquals($ent['celotnaVrednost'], 4.94, "celotna vrednost");
        $I->assertEquals($ent['nasDelez'], 4.94, "naš delež");
        $I->assertEquals($ent['zaproseno'], 0.66, "zaprošeno");
        $I->assertEquals($ent['avtorskiHonorarji'], 1.24);
        $I->assertEquals($ent['avtorskiHonorarjiSamoz'], 1.24);
        $I->assertEquals($ent['tantieme'], 1.22, "tantieme");
        $I->assertEquals($ent['materialni'], 1.24, "materialni");
        $I->assertEquals($ent['avtorskePravice'], 1.24);
        $I->assertEquals($ent['drugiJavni'], 1.24);
        $I->assertEquals($ent['vlozekGostitelja'], 0);
        $I->assertEquals($ent['lastnaSredstva'], $ent['nasDelez'] - $ent['zaproseno'] - $ent['drugiJavni'] - $ent['vlozekGostitelja'], " lastna sredstva (ni nejavnih virov)");
//        $I->assertEquals($ent['vlozekGostitelja'],1.24);
        $I->assertEquals($ent['obiskDoma'], 1);
//        $I->assertEquals($ent['obiskGost'          ],1 );
//        $I->assertEquals($ent['obiskZamejo'        ],1 );
//        $I->assertEquals($ent['obiskInt'           ],1 );
//        $I->assertEquals($ent['ponoviDoma'         ],1 );
//        $I->assertEquals($ent['ponoviZamejo'       ],1 );
//        $I->assertEquals($ent['ponoviGost'         ],1 );
//        $I->assertEquals($ent['ponoviInt'          ],1 );
        $I->assertEquals($ent['uprizoritev']['id'], $this->lookUprizoritev['id']);
        $I->assertEquals($ent['tipProgramskeEnote'], $this->lookTipProgramskeEnote1['id']);
        $I->assertEquals($ent['kpe'], 0.4);
        $I->assertEquals($ent['dokument'], null);
        $I->assertEquals($ent['sort'], 1, "sort");
        $I->assertEquals($ent['stZaposUmet'], 1);
        $I->assertEquals($ent['stZaposDrug'], 1);
        $I->assertEquals($ent['stHonorarnih'], 1);
        $I->assertEquals($ent['stHonorarnihIgr'], 1);
        $I->assertEquals($ent['stHonorarnihIgrTujJZ'], 1, "honor. igralec tuj JZ");
        $I->assertEquals($ent['stHonorarnihIgrSamoz'], 1, "samozaposlen igralec");
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
//    public function getListVse(ApiTester $I)
//    {
//        $listUrl = $this->restUrl . "/vse";
//        codecept_debug($listUrl);
//        $resp    = $I->successfullyGetList($listUrl, []);
//        $list    = $resp['data'];
//
//        $I->assertNotEmpty($list);
//        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
//    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListDefault(ApiTester $I)
    {
        $listUrl = $this->restUrl;
        codecept_debug($listUrl);
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];

        $I->assertNotEmpty($list);
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
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
     *  kreiramo zapis
     * 
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function createVecDrugihVirov(ApiTester $I)
    {
        $data               = [
            'znesek'        => 1.24,
            'opis'          => "zz",
            'enotaPrograma' => $this->obj2['id'],
            'mednarodni'    => FALSE,
        ];
        $this->objDrugiVir1 = $ent                = $I->successfullyCreate($this->drugiVirUrl, $data);
        $I->assertGuid($ent['id']);

        // kreiramo še en zapis
        $data               = [
            'znesek'        => 1.24,
            'opis'          => "dd",
            'enotaPrograma' => $this->obj2['id'],
            'mednarodni'    => true,
        ];
        $this->objDrugiVir2 = $ent                = $I->successfullyCreate($this->drugiVirUrl, $data);
        $I->assertGuid($ent['id']);
    }

    /**
     * preberemo relacije
     * 
     * @depends createVecDrugihVirov
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeZDrugimiViri(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "drugiViri", "");
        $I->assertGreaterThanOrEqual(2, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "drugiViri", $this->objDrugiVir1['id']);
        $I->assertGreaterThanOrEqual(1, count($resp));
    }

    /**
     *  kreiramo zapis
     * 
     * @depends create
     * @depends lookupProdukcijskaHisa
     * 
     * @param ApiTester $I
     */
    public function createVecKoprodukcij(ApiTester $I)
    {
        $data                        = [
            'odstotekFinanciranja' => 40,
            'delez'                => 2.6,
            'zaproseno'            => 2.1,
            'kpe'                  => 0.1,
            'enotaPrograma'        => $this->obj2['id'],
            'koproducent'          => $this->lookProdukcijskaHisa1['id'],
        ];
        $this->objProdukcijaDelitev1 = $ent                         = $I->successfullyCreate($this->produkcijaDelitevUrlPremiera, $data);
        $I->assertGuid($ent['id']);

        // kreiramo še en zapis
        $data                        = [
            'odstotekFinanciranja' => 20,
            'delez'                => 1.1,
            'kpe'                  => 0.1,
            'zaproseno'            => 1.02,
            'enotaPrograma'        => $this->obj2['id'],
            'koproducent'          => $this->lookProdukcijskaHisa2['id'],
        ];
        $this->objProdukcijaDelitev2 = $ent                         = $I->successfullyCreate($this->produkcijaDelitevUrlPremiera, $data);
        $I->assertGuid($ent['id']);
    }

    /**
     * preberemo relacije
     * 
     * @depends createVecKoprodukcij
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeSKoprodukcijami(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "koprodukcije", "");
        $I->assertGreaterThanOrEqual(2, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "koprodukcije", $this->objProdukcijaDelitev1['id']);
        $I->assertGreaterThanOrEqual(1, count($resp));
    }

    /**
     *  kreiramo zapis brez tipa programske enote
     * 
     * @depends delete
     * 
     * @param ApiTester $I
     */
    public function createBrezTipaProgramskeEnote(ApiTester $I)
    {
//                $this->expect(($this->getTipProgramskeEnote()), "Tip programske enote ne obstaja", 1000443);
        $data                        = $this->obj1;
        $data ['tipProgramskeEnote'] = NULL;
        $resp                        = $I->failToCreate($this->restUrl, $data);
//        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->assertContains("required", $resp[0]['message']);
    }

    /**
     *  kreiramo zapis s tipom koprodukcije
     * 
     * pričakujemo, da bo kreiral matično koprodukcijo avtomatsko
     * 
     * @depends delete
     * 
     * @param ApiTester $I
     */
    public function createZImaKoprodukcijo(ApiTester $I)
    {
        $data                       = $this->obj1;
        $data['tipProgramskeEnote'] = $this->lookTipProgramskeEnote3['id']; //tip PE s koprodukcijo
        codecept_debug($data);
        $this->obj3                 = $ent                        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);

        $resp       = $I->successfullyGetRelation($this->restUrl, $this->obj3['id'], "koprodukcije", "");
        codecept_debug($resp);
        $I->assertEquals(1, count($resp));      // mora biti le 1 - t.j. matični
        // vse skupaj ponovimo z update-om:
        $this->obj3 = $ent        = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertGuid($ent['id']);

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj3['id'], "koprodukcije", "");
        codecept_debug($resp);
        $I->assertEquals(1, count($resp));      // mora biti le 1 - t.j. matični
    }

    /**
     *  probamo izbrisati koprodukcijo, katerega enota programa je označena z ima koprodukcijo
     * 
     * pričakujemo, da ne uspe
     * 
     * @depends createZImaKoprodukcijo
     * 
     * @param ApiTester $I
     */
    public function deleteKoprodukcijeZImaKopr(ApiTester $I)
    {
        $kopId = $this->obj3['koprodukcije'][0]['id'];   //predvidevamo, da je matični v 1. polju 
        $resp  = $I->failToDelete($this->produkcijaDelitevUrl, $kopId);
        codecept_debug($resp);
        $I->assertEquals(1000613, $resp[0]['code']);
    }


    /**
     *  osvežimo zapis s tipom  brez koprodukcije
     * 
     * pričakujemo, da bo izbrisal vse koprodukcije matično koprodukcijo avtomatsko
     * 
     * @depends createZImaKoprodukcijo
     * 
     * @param ApiTester $I
     */
    public function updateZNimaKoprodukcije(ApiTester $I)
    {
        $data                       = $this->obj3;
        $data['tipProgramskeEnote'] = $this->lookTipProgramskeEnote1['id']; //tip PE brez! koprodukcije
        $this->obj3                 = $ent                        = $I->successfullyUpdate($this->restUrl, $data['id'], $data);
        codecept_debug($data);
        $I->assertGuid($ent['id']);
        // pričakujemo izbris vseh koproducentov
        $resp                       = $I->successfullyGetRelation($this->restUrl, $this->obj3['id'], "koprodukcije", "");
        codecept_debug($resp);
        $I->assertEquals(0, count($resp));      // mora biti brez koproducentov
    }

    /**
     *  osvežimo zapis s tipom  brez koprodukcije
     * 
     * pričakujemo, da bo izbrisal vse koprodukcije matično koprodukcijo avtomatsko
     * @depends createVecKoprodukcij
     * 
     * @param ApiTester $I
     */
    public function updateZNimaKoprodukcijePrejVečKoprodukcij(ApiTester $I)
    {
        // najprej preverimo, če je več koprodukcij
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "koprodukcije", "");
        codecept_debug($resp);
        $I->assertGreaterThanOrEqual(2, count($resp));

        $data                       = $this->obj2;
        $data['tipProgramskeEnote'] = $this->lookTipProgramskeEnote1['id']; //tip PE brez! koprodukcije
        $ent                        = $I->successfullyUpdate($this->restUrl, $data['id'], $data);
        $I->assertGuid($ent['id']);
        // pričakujemo izbris vseh koproducentov
        $resp                       = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "koprodukcije", "");
        codecept_debug($resp);
        $I->assertEquals(0, count($resp));      // mora biti brez koproducentov
    }

    /**
     * spremenim zapis za kontrolo zaokroževanja
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updateKontrolaValidacijeZaokrozevanj(ApiTester $I)
    {
        $ent                      = $this->obj2;
        $ent['avtorskiHonorarji'] = 10;      // v praksi bo že klient zaokrožil na 2 mesti
        $ent['tantieme']          = 8.01;
        $ent['avtorskePravice']   = 0;
        $ent['materialni']        = 0;
        $ent['zaproseno']         = 12.61;

        $ent = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);

        // ali sedaj napaka pri zaprošeno?
        $ent = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);

        $ent['zaproseno'] = 12.62;
        $resp             = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertEquals(1000442, $resp[0]['code']);
    }

    /**
     * spremenim zapis za kontrolo zaokroževanja
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updateKontrolaValidacijeKpe(ApiTester $I)
    {
        $ent                       = $this->obj2;
        $ent['tipProgramskeEnote'] = $this->lookTipProgramskeEnote3['id'];
        $ent['kpe']                = 0.4;   // v praksi bo že klient zaokrožil na 2 mesti

        $ent = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);

        /**
         * $$ še:
         *  <= maxfaktor, 
         *  <= maxvsi faktor
         */
        $ent['kpe'] = 0.41;   // v praksi bo že klient zaokrožil na 2 mesti
        $resp       = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertEquals(1000446, $resp[0]['code']);

        $ent['kpe'] = -0.01;   // v praksi bo že klient zaokrožil na 2 mesti
        $resp       = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertEquals(1000445, $resp[0]['code']);

        /**
         * kontrola vsot kpe koprodukcij
         */
        $kopr = [
            'kpe'                  => 0.6,
            'odstotekFinanciranja' => 20,
            'delez'                => 1.1,
            'enotaPrograma'        => $this->obj2['id'],
            'koproducent'          => $this->lookProdukcijskaHisa2['id'],
        ];
        codecept_debug($kopr);
        $kopr = $I->successfullyCreate($this->produkcijaDelitevUrlPremiera, $kopr);


        $kopr['kpe'] = 0.61;
        $resp        = $I->failToUpdate($this->produkcijaDelitevUrlPremiera, $kopr['id'], $kopr);
        $I->assertEquals(1000415, $resp[0]['code']);

        $kopr['kpe'] = -0.01;
        $resp        = $I->failToUpdate($this->produkcijaDelitevUrlPremiera, $kopr['id'], $kopr);
        $I->assertEquals(1000417, $resp[0]['code']);
    }

    /**
     * test validacije
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function createBrezUprizoritve(ApiTester $I)
    {
        // brez uprizoritve
        $data = [
            'uprizoritev'            => null,
//            'celotnaVrednost'      => 1.24,
//            'nasDelez'               => 5,
            'zaproseno'              => 0.66,
//            'lastnaSredstva'       => 1.24,
            'avtorskiHonorarji'      => 1.24,
            'avtorskiHonorarjiSamoz' => 1.24,
            'tantieme'               => 1.24,
            'materialni'             => 1.24,
            'avtorskePravice'        => 1.24,
            'drugiViri'              => 1.24,
//            'vlozekGostitelja'     =>1.24,
            'drugiJavni'             => 1.24,
            'obiskDoma'              => 1,
//            'obiskGost'          => 1,
//            'obiskZamejo'        => 1,
//            'obiskInt'           => 1,
//            'ponoviDoma'         => 1,
//            'ponoviZamejo'       => 1,
//            'ponoviGost'         => 1,
//            'ponoviInt'          => 1,
            'tipProgramskeEnote'     => $this->lookTipProgramskeEnote1['id'],
            'kpe'                    => 0.4,
//            'tip'                => 'premiera', // ali to polje potrebujemo - ne. Ne rabimo vnašati, samo se nastavi
            'dokument'               => null,
            'sort'                   => 1,
            'stZaposUmet'            => 1,
            'stZaposDrug'            => 1,
            'stHonorarnih'           => 1,
            'stHonorarnihIgr'        => 1,
            'stHonorarnihIgrTujJZ'   => 1,
            'stHonorarnihIgrSamoz'   => 1,
        ];

        $resp = $I->failToCreate($this->restUrl, $data);
        codecept_debug($resp);
        $I->assertEquals(1000444, $resp[0]['code']);
    }

    /**
     * spremenim zapis za kontrolo avtorskih honorarjev samozaposlenih
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updateKontrolaValidacijeAHSamoz(ApiTester $I)
    {
        $ent                           = $this->obj2;
        $ent['avtorskiHonorarji']      = 4.56;
        $ent['avtorskiHonorarjiSamoz'] = 4.56;
        $ent                           = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);

        $ent['avtorskiHonorarjiSamoz'] = 4.57;   // v praksi bo že klient zaokrožil na 2 mesti
        $resp                          = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertEquals(10001201, $resp[0]['code']);

        $ent['avtorskiHonorarjiSamoz'] = -0.01;   // v praksi bo že klient zaokrožil na 2 mesti
        $resp                          = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertEquals(1000629, $resp[0]['code']);
    }
    /**
     * test negativnih integer vrednosti
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updateZNegativnimObiskom(ApiTester $I)
    {
        // negativni obisk:
        $ent              = $this->obj2;
        $ent['obiskDoma'] = -11;
        $resp             = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        codecept_debug($resp);
//        $I->assertEquals(1000999, $resp[0]['code']);
        // že v validate javi napako:
        $I->assertContains("not greater", $resp[0]['message']);
        
    }

}
