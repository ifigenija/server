<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\ProgramDela;

use ApiTester;

/**
 * Description of ProgramDelaCest
 * 
 * 
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto
 *      relacije z drugimi entitetami (to many relacije)
 *      - pri many to many relacijah testiraj : update, get (list+id), delete
 *      - pri one to many relacijah testiraj : get (list+id)
 *          - premiere
 *          - ponovitve
 *          - izjemni
 *          - programFestival
 *          - gostujoci
 *          - gostovanje        
 *      getlist različne variante relacij
 *      - vse
 *      - default
 *      zaklepanje
 *      kloniranje
 *
 * @author rado
 */
class ProgramDelaCest
{

    private $restUrl                      = '/rest/programdela';
    private $obj1;
    private $obj2;
    private $programPremieraUrl           = '/rest/programpremiera';
    private $programPonovitevPremiereUrl  = '/rest/programponovitevpremiere';
    private $programPonovitevPrejsnjihUrl = '/rest/programponovitevprejsnjih';
    private $objProgramPremiera1;
    private $objProgramPremiera2;
    private $objProgramPremiera3;
    private $objProgramPonovitevPremiere1;
    private $objProgramPonovitevPremiere2;
    private $objProgramPonovitevPrejsnjih1;
    private $objProgramPonovitevPrejsnjih2;
    private $programIzjemniUrl            = '/rest/programizjemni';
    private $programGostujocaUrl          = '/rest/programgostujoca';
    private $programGostovanjaUrl         = '/rest/programgostovanje';
    private $programFestivalUrl           = '/rest/programfestival';
    private $programRaznoUrl              = '/rest/programrazno';
    private $objProgramIzjemni1;
    private $objProgramGostujoca1;
    private $objProgramGostovanj1;
    private $objProgramGostovanj2;
    private $objProgramFestival1;
    private $objProgramFestival2;
    private $objProgramRazno1;
    private $objProgramRazno2;
    private $uprizoritevUrl               = '/rest/uprizoritev';
    private $lookUprizoritev1;
    private $lookUprizoritev2;
    private $lookUprizoritev3;
    private $lookUprizoritev4;
    private $lookUprizoritev5;
    private $tipProgramskeEnoteUrl        = '/rest/tipprogramskeenote';
    private $lookTipProgramskeEnote1;
    private $lookTipProgramskeEnote2;
    private $lookTipProgramskeEnote3;
    private $lookTipProgramskeEnote4;
    private $lookTipProgramskeEnote5;
    private $drugiVirUrl                  = '/rest/drugivir';
    private $produkcijaDelitevUrl         = '/rest/produkcijadelitev';
    private $lookupProdukcijskaHisa       = '/lookup/produkcijskahisa';
    private $lookProdukcijskaHisa1;
    private $lookProdukcijskaHisa2;
    private $lookProdukcijskaHisa3;
    private $lookProdukcijskaHisa4;
    private $lookProdukcijskaHisa5;
    private $rpcUrl                       = '/rpc/programdela/programdela';
    private $objDrugiVir1;
    private $objDrugiVir2;
    private $objKoprodukcija1;
    private $objKoprodukcija2;
    private $objKoprodukcija3;
    private $programskaEnotaSklopaUrl     = '/rest/programskaenotasklopa';
    private $objPESklopa1;
    private $objPESklopa2;
    private $lookPopa1;
    private $drzavaUrl                    = '/rest/drzava';
    private $objDrzava1;
    private $objDrzava2;
    private $rpcOptionsUrl                = '/rpc/app/options';
    private $maticnoGledalisce;
    private $popaUrl                      = '/rest/popa';

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
        $popaId = $I->successfullyCallRpc($this->rpcOptionsUrl, 'getOptions', ["name" => "application.tenant.maticnopodjetje"]);
        codecept_debug($popaId);

        $popa                    = $I->successfullyGet($this->popaUrl, $popaId);
        $this->maticnoGledalisce = $popa['sifra'];
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupUprizoritev(ApiTester $I)
    {
        $this->lookUprizoritev1 = $look                   = $I->lookupEntity("uprizoritev", "0001", false);
        $I->assertNotEmpty($look);

        $this->lookUprizoritev2 = $look                   = $I->lookupEntity("uprizoritev", "0002", false);
        $I->assertNotEmpty($look);

        $this->lookUprizoritev3 = $look                   = $I->lookupEntity("uprizoritev", "0003", false);
        $I->assertNotEmpty($look);

        $this->lookUprizoritev4 = $look                   = $I->lookupEntity("uprizoritev", "0004", false);
        $I->assertNotEmpty($look);

        $this->lookUprizoritev5 = $look                   = $I->lookupEntity("uprizoritev", "0005", false);
        $I->assertNotEmpty($look);
    }

    /**
     * najde državo
     * 
     * @param ApiTester $I
     */
    public function getListDrzava(ApiTester $I)
    {
        $resp             = $I->successfullyGetList($this->drzavaUrl, []);
        $list             = $resp['data'];
        $I->assertNotEmpty($list);
        $this->objDrzava1 = $drzava           = array_pop($list);
        $I->assertNotEmpty($drzava);
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
     * 
     * @param ApiTester $I
     */
    public function lookupPopa(ApiTester $I)
    {
        $this->lookPopa1 = $ent             = $I->lookupEntity("popa", "0988", false);
        $I->assertNotEmpty($ent);

        $this->lookPopa2 = $ent             = $I->lookupEntity("popa", "0986", false);
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
     *  kreiramo zapis
     * 
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data       = [
//            'sifra'            => 'ZZ',
            'naziv'            => 'zz',
            'zacetek'          => '2015-02-01T00:00:00+01:00',
            'konec'            => '2016-02-01T00:00:00+0100',
            'potrjenProgram'   => false,
//            'avgZasedDvoran'   => 7.89,
            'avgCenaVstopnice' => 7.89,
            'stProdVstopnic'   => 7,
            'stZaposlenih'     => 7,
            'stZaposIgralcev'  => 7,
//            'avgStNastopovIgr' => 7.89,
//            'vrPS1Mat'         => 7.89,
//            'vrPS1GostovSZ'    => 7.89,
//            'stHonorarnihZun'         => 7,
//            'stHonorarnihZunIgr'      => 7,
//            'stHonorarnihZunIgrTujJZ' => 7,
//            'sredstvaInt'          => 7.89,
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
        $I->assertEquals($ent['naziv'], 'zz');

// kreiramo še en zapis
        $data       = [
//            'sifra'          => 'BB',
            'naziv'            => 'bb',
            'zacetek'          => '2016-01-01T00:00:00+0100',
            'konec'            => '2017-02-01T00:00:00+0100',
            'potrjenProgram'   => TRUE,
            'avgCenaVstopnice' => 7.89,
            'stProdVstopnic'   => 7,
            'stZaposlenih'     => 7,
            'stZaposIgralcev'  => 7,
//            'vrPS1Mat'       => 7.89,
//            'vrPS1GostovSZ'  => 7.89,
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
        $I->assertEquals($ent['naziv'], 'bb');

        /**
         * kreiramo še nekaj zapisov za sort
         */
        $data = [
            'sifra'            => '99',
            'naziv'            => 'gg',
            'zacetek'          => '2016-01-01T00:00:00+0100',
            'konec'            => '2017-02-01T00:00:00+0100',
            'potrjenProgram'   => TRUE,
            'avgCenaVstopnice' => 7.89,
            'stProdVstopnic'   => 7,
            'stZaposlenih'     => 7,
            'stZaposIgralcev'  => 7,
//            'vrPS1Mat'       => 7.89,
//            'vrPS1GostovSZ'  => 7.89,
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);

        $data = [
            'sifra'            => '00',
            'naziv'            => 'hh',
            'zacetek'          => '2016-01-01T00:00:00+0100',
            'konec'            => '2017-02-01T00:00:00+0100',
            'potrjenProgram'   => TRUE,
            'avgCenaVstopnice' => 7.89,
            'stProdVstopnic'   => 7,
            'stZaposlenih'     => 7,
            'stZaposIgralcev'  => 7,
//            'vrPS1Mat'       => 7.89,
//            'vrPS1GostovSZ'  => 7.89,
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
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
        $ent['naziv'] = 'yy';

        $this->obj1 = $entR       = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['naziv'], 'yy');
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

        $I->assertGuid($ent['id']);
        codecept_debug($ent['sifra']);
        $I->assertEquals(substr($ent['sifra'], 0, 2), '20', "šifra 0-1");
        $I->assertEquals(substr($ent['sifra'], 4, 1), '-', "šifra 0-1");
        $I->assertEquals($ent['naziv'], 'yy');
        $I->assertEquals($ent['zacetek'], '2015-02-01T00:00:00+0100');
        $I->assertEquals($ent['konec'], '2016-02-01T00:00:00+0100');
        $I->assertEquals($ent['potrjenProgram'], false);
//        $I->assertEquals($ent['avgZasedDvoran'], 7.89);
        $I->assertEquals($ent['avgCenaVstopnice'], 7.89);
        $I->assertEquals($ent['stProdVstopnic'], 7);
        $I->assertEquals($ent['stZaposlenih'], 7);
        $I->assertEquals($ent['stZaposIgralcev'], 7);
//        $I->assertEquals($ent['avgStNastopovIgr'], 7.89);
//        $I->assertEquals($ent['vrPS1Mat'], 7.89);
//        $I->assertEquals($ent['vrPS1GostovSZ'], 7.89);
//        $I->assertEquals($ent['stHonorarnihZun'], 7);
//        $I->assertEquals($ent['stHonorarnihZunIgr'], 7);
//        $I->assertEquals($ent['stHonorarnihZunIgrTujJZ'], 7);
//        $I->assertEquals($ent['sredstvaInt'], 7.89);
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
        codecept_debug($list);
        $totRec  = $resp['state']['totalRecords'];
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
        $I->assertEquals("00", $list[0]['sifra']);
        $I->assertEquals("99", $list[$totRec - 1]['sifra']);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListSeznam(ApiTester $I)
    {
        $listUrl = $this->restUrl . "/seznam";
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
    public function createVecEnotPrograma(ApiTester $I)
    {
        //premiera
        $data                      = [
//            'celotnaVrednost'      => 1.24,
            'nasDelez'                => 100.24,
            'zaproseno'               => 1.24,
//            'lastnaSredstva'       => 1.24,
            'avtorskiHonorarji'       => 1.24,
            'avtorskiHonorarjiSamoz'  => 1.24,
            'tantieme'                => 1.24,
            'materialni'              => 1.24,
            'avtorskePravice'         => 1.24,
            'drugiViri'               => 1.24,
            'opredelitevDrugiViri'    => "zz",
//            'vlozekGostitelja'     => 1.24,
            'drugiJavni'              => 1.24,
            'obiskDoma'               => 22,
            'obiskKopr'               => 0,
//            'obiskGost'          => 1,
//            'obiskZamejo'        => 1,
//            'obiskInt'           => 1,
//            'ponoviDoma'         => 1,
//            'ponoviZamejo'       => 1,
//            'ponoviGost'         => 1,
//            'ponoviInt'          => 1,
            'tipProgramskeEnote'      => $this->lookTipProgramskeEnote5['id'],
            'kpe'                     => 0.1,
//            'tip'                => 'premiera', // ali to polje potrebujemo - ne. Ne rabimo vnašati, samo se nastavi
            'sort'                    => 1,
            'stZaposUmet'             => 1,
            'stZaposDrug'             => 1,
            'stHonorarnihZun'         => 10,
            'stHonorarnihZunIgr'      => 7,
            'stHonorarnihZunIgrTujJZ' => 5,
            'stHonorarnihZunSamoz'    => 5,
            'uprizoritev'             => $this->lookUprizoritev2['id'],
            'dokument'                => $this->obj2['id'],
        ];
        $this->objProgramPremiera1 = $ent                       = $I->successfullyCreate($this->programPremieraUrl, $data);
        $I->assertGuid($ent['id']);

        // še ena premiera
        $data                      = [
//            'celotnaVrednost'      => 2.22,
            'nasDelez'                => 200.22,
            'zaproseno'               => 1.24,
//            'lastnaSredstva'       => 2.22,
            'avtorskiHonorarji'       => 2.22,
            'avtorskiHonorarjiSamoz'  => 2.22,
            'tantieme'                => 2.22,
            'materialni'              => 2.22,
            'avtorskePravice'         => 2.22,
            'drugiViri'               => 2.22,
            'opredelitevDrugiViri'    => "zz",
//            'vlozekGostitelja'     => 2.22,
            'drugiJavni'              => 2.22,
            'obiskDoma'               => 1,
            'obiskKopr'               => 0,
//            'obiskGost'          => 1,
//            'obiskZamejo'        => 1,
//            'obiskInt'           => 1,
//            'ponoviDoma'         => 1,
//            'ponoviZamejo'       => 1,
//            'ponoviGost'         => 1,
//            'ponoviInt'          => 1,
            'tipProgramskeEnote'      => $this->lookTipProgramskeEnote1['id'],
            'kpe'                     => 0.1,
//            'tip'                => 'premiera', // ali to polje potrebujemo - ne. Ne rabimo vnašati, samo se nastavi
            'sort'                    => 2,
            'stZaposUmet'             => 2,
            'stZaposDrug'             => 2,
            'stHonorarnihZun'         => 9,
            'stHonorarnihZunIgr'      => 6,
            'stHonorarnihZunIgrTujJZ' => 2,
            'stHonorarnihZunSamoz'    => 2,
            'uprizoritev'             => $this->lookUprizoritev1['id'],
            'dokument'                => $this->obj2['id'],
        ];
        $this->objProgramPremiera2 = $ent                       = $I->successfullyCreate($this->programPremieraUrl, $data);
        $I->assertGuid($ent['id']);

        //ponovitev premiere
        $data                               = [
//            'celotnaVrednost'         => 1.24,
//            'celotnaVrednostMat'      => 1.02,
            'celotnaVrednostGostovSZ' => 0.11,
            'nasDelez'                => 100.24,
            'zaproseno'               => 1.24,
//            'lastnaSredstva'          => 1.24,
            'avtorskiHonorarji'       => 33.22,
            'avtorskiHonorarjiSamoz'  => 33.22,
            'tantieme'                => 1.24,
            'materialni'              => 1.24,
            'avtorskePravice'         => 1.24,
            'drugiViri'               => 1.24,
            'drugiJavni'              => 1.24,
            'obiskDoma'               => 21,
            'obiskGost'               => 31,
            'obiskKoprGost'           => 31,
            'obiskKopr'               => 31,
            'obiskZamejo'             => 7,
            'obiskKoprZamejo'         => 7,
            'obiskInt'                => 3,
            'obiskKoprInt'            => 3,
            'ponoviDoma'              => 2,
            'ponoviZamejo'            => 3,
            'ponoviKoprZamejo'        => 3,
            'ponoviGost'              => 4,
            'ponoviKoprGost'          => 4,
            'ponoviKopr'              => 4,
            'ponoviInt'               => 5,
            'ponoviKoprInt'           => 5,
            'uprizoritev'             => $this->lookUprizoritev2['id'],
            'vlozekGostitelja'        => 1.24,
            'tipProgramskeEnote'      => $this->lookTipProgramskeEnote1['id'],
            'dokument'                => $this->obj2['id'],
        ];
        $this->objProgramPonovitevPremiere1 = $ent                                = $I->successfullyCreate($this->programPonovitevPremiereUrl, $data);
        $I->assertGuid($ent['id']);

        //ponovitev prejšnjih sezon 
        $data                                = [
//            'celotnaVrednost'         => 1.24,
//            'celotnaVrednostMat'      => 1.02,
            'celotnaVrednostGostovSZ' => 0.11,
            'nasDelez'                => 100.24,
            'zaproseno'               => 1.24,
//            'lastnaSredstva'          => 1.24,
            'avtorskiHonorarji'       => 63.21,
            'avtorskiHonorarjiSamoz'  => 63.21,
            'tantieme'                => 1.24,
            'materialni'              => 1.24,
            'avtorskePravice'         => 1.24,
            'drugiViri'               => 1.24,
            'drugiJavni'              => 1.24,
            'obiskDoma'               => 2,
            'obiskGost'               => 3,
            'obiskKoprGost'           => 3,
            'obiskKopr'               => 3,
            'obiskZamejo'             => 11,
            'obiskKoprZamejo'         => 11,
            'obiskInt'                => 12,
            'obiskKoprInt'            => 12,
            'ponoviDoma'              => 6,
            'ponoviZamejo'            => 7,
            'ponoviKoprZamejo'        => 7,
            'ponoviGost'              => 8,
            'ponoviKoprGost'          => 8,
            'ponoviKopr'              => 8,
            'ponoviInt'               => 9,
            'ponoviKoprInt'           => 9,
            'stZaposUmet'             => 1,
            'stZaposDrug'             => 1,
            'vlozekGostitelja'        => 1.24,
            'uprizoritev'             => $this->lookUprizoritev4['id'],
            'tipProgramskeEnote'      => $this->lookTipProgramskeEnote3['id'],
            'dokument'                => $this->obj2['id'],
        ];
        $this->objProgramPonovitevPrejsnjih1 = $ent                                 = $I->successfullyCreate($this->programPonovitevPrejsnjihUrl, $data);
        $I->assertGuid($ent['id']);

        //izjemni 
        $data                     = [
            'naziv'                   => "zz",
//            'celotnaVrednost'      => 1.24,
            'nasDelez'                => 131,
            'zaproseno'               => 1.24,
//            'lastnaSredstva'       => 1.24,
            'avtorskiHonorarji'       => 127.22,
            'avtorskiHonorarjiSamoz'  => 127.22,
            'tantieme'                => 1.24,
            'materialni'              => 1.24,
            'avtorskePravice'         => 1.24,
            'drugiViri'               => 1.24,
            'opredelitevDrugiViri'    => "zz",
//            'vlozekGostitelja'     => 1.24,
            'drugiJavni'              => 1.24,
            'obiskDoma'               => 14,
            'obiskGost'               => 1,
            'obiskKoprGost'           => 1,
            'obiskKopr'               => 1,
            'obiskZamejo'             => 1,
            'obiskKoprZamejo'         => 1,
            'obiskInt'                => 1,
            'obiskKoprInt'            => 1,
            'ponoviDoma'              => 5,
            'ponoviZamejo'            => 4,
            'ponoviKoprZamejo'        => 4,
            'ponoviGost'              => 5,
            'ponoviKoprGost'          => 5,
            'ponoviKopr'              => 5,
            'ponoviInt'               => 1,
            'ponoviKoprInt'           => 1,
//            'uprizoritev'          => NULL,
//            'tipProgramskeEnote'   => $this->lookTipProgramskeEnote1['id'],
            'sort'                    => 1,
            'stZaposlenih'            => 1,
//            'stZaposDrug'             => 1,
            'stHonorarnihZun'         => 5,
            'stHonorarnihZunIgr'      => 3,
            'stHonorarnihZunIgrTujJZ' => 1,
            'stHonorarnihZunSamoz'    => 1,
            'dokument'                => $this->obj2['id'],
            'trajanje'                => "avgust-oktober",
            'prizorisce'              => "samostan",
            'zvrst'                   => "zz",
            'avtor'                   => "zz",
            'reziser'                 => "zz",
            'soustvarjalci'           => "zz",
            'datum'                   => "2012-02-01T00:00:00+0100",
        ];
        $this->objProgramIzjemni1 = $ent                      = $I->successfullyCreate($this->programIzjemniUrl, $data);
        $I->assertGuid($ent['id']);

        //gostujoca 
        $data                       = [
//            'celotnaVrednost'    => 1.24,
//            'nasDelez'               => 131,
            'strosekOdkPred'         => 95,
            'stroskiOstali'          => 36,
            'zaproseno'              => 40,
//            'lastnaSredstva'     => 1.24,
            'avtorskiHonorarji'      => 26.12,
            'avtorskiHonorarjiSamoz' => 26.12,
            'tantieme'               => 1.24,
            'materialni'             => 1.24,
            'avtorskePravice'        => 1.24,
            'drugiViri'              => 1.24,
            'drugiJavni'             => 1.24,
            'obiskDoma'              => 4,
            'obiskGost'              => 1,
            'obiskKoprGost'          => 1,
            'obiskKopr'              => 1,
            'obiskZamejo'            => 1,
            'obiskKoprZamejo'        => 1,
            'obiskInt'               => 1,
            'obiskKoprInt'           => 1,
            'ponoviDoma'             => 2,
            'ponoviZamejo'           => 3,
            'ponoviKoprZamejo'       => 3,
            'ponoviGost'             => 2,
            'ponoviKoprGost'         => 2,
            'ponoviKopr'             => 2,
            'ponoviInt'              => 3,
            'ponoviKoprInt'          => 3,
            'uprizoritev'            => $this->lookUprizoritev2['id'],
            'tipProgramskeEnote'     => $this->lookTipProgramskeEnote1['id'],
            'dokument'               => $this->obj2['id'],
        ];
        $this->objProgramGostujoca1 = $ent                        = $I->successfullyCreate($this->programGostujocaUrl, $data);
        $I->assertGuid($ent['id']);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
//    public function podatkiPrilogaC2Zacasno(ApiTester $I)
//    {
//        $resp = $I->successfullyCallRpc($this->rpcUrl, 'podatkiPrilogaC2', ["programDelaId" => $this->obj2['id']]);
//        codecept_debug($resp);
//        $I->assertNotEmpty($resp);
//        $I->seeResponseIsJson();
////        $I->assertGreaterThanOrEqual(9999, $resp['Do']['avtorskiHonorarji'], "avtorski do");
//        $I->assertGreaterThanOrEqual(0, $resp['H.1']['vrednost']['premiere'],"['premiere']['H.1']");
//        $I->assertGreaterThanOrEqual(0, $resp['2.0']['vrednost']['premiere'],"['premiere']['2.0']");
//        $I->assertGreaterThanOrEqual(0, $resp['2.1']['vrednost']['premiere'],"['premiere']['2.1']");
//        $I->assertGreaterThanOrEqual(0, $resp['T.0']['vrednost']['premiere'],"['premiere']['T.0']");
//        $I->assertGreaterThanOrEqual(0, $resp['T.1']['vrednost']['premiere'],"['premiere']['T.1']");
//        $I->assertGreaterThanOrEqual(0, $resp['T.2']['vrednost']['premiere'],"['premiere']['T.2']");
//        $I->assertGreaterThanOrEqual(0, $resp['Skupaj']['vrednost']['premiere'],"['premiere']['Skupaj']");
//        $I->assertGreaterThanOrEqual(0, $resp['Skupaj']['vrednost']['ponovitvePremier'],"['ponovitvePremier']['Skupaj']");
//        $I->assertGreaterThanOrEqual(0, $resp['Skupaj']['vrednost']['ponovitvePrejsnjih'],"['ponovitvePrejsnjih']['Skupaj']");
//
//        $I->assertTrue(false, "začasno");
//    }
    /**
     *  kreiramo zapis
     * 
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function createVecProgramovFestivala(ApiTester $I)
    {
        $data                      = [
            'naziv'                => 'zz',
            'zvrst'                => 'zz',
            'stPredstav'           => 1,
            'stOkroglihMiz'        => 1,
            'stPredstavitev'       => 1,
            'stDelavnic'           => 1,
            'stDrugiDogodki'       => 1,
            'stProdukcij'          => 1,
            'obiskDoma'            => 133,
            'casPriprave'          => 'zz',
            'casIzvedbe'           => 'zz',
            'prizorisca'           => 'zz',
            'umetVodja'            => 'zz',
            'programskoTelo'       => 'zz',
            'stTujihSelektorjev'   => 1,
            'stZaposlenih'         => 1,
            'stHonorarnihZun'      => 22,
            'zaproseno'            => 1.24,
            'celotnaVrednost'      => 1.24,
            'nasDelez'             => 100.24,
//            'lastnaSredstva'          => 1.24,
            'drugiViri'            => 1.24,
            'opredelitevDrugiViri' => 'zz',
            'drugiJavni'           => 1.24,
            'sort'                 => 1,
            'programDela'          => $this->obj2['id'],
        ];
        $this->objProgramFestival1 = $ent                       = $I->successfullyCreate($this->programFestivalUrl, $data);
        $I->assertGuid($ent['id']);

        // kreiramo še en zapis
        $data                      = [
            'naziv'                => 'zz',
            'zvrst'                => 'zz',
            'stPredstav'           => 1,
            'stOkroglihMiz'        => 1,
            'stPredstavitev'       => 1,
            'stDelavnic'           => 1,
            'stDrugiDogodki'       => 1,
            'stProdukcij'          => 1,
            'obiskDoma'            => 92,
            'casPriprave'          => 'zz',
            'casIzvedbe'           => 'zz',
            'prizorisca'           => 'zz',
            'umetVodja'            => 'zz',
            'programskoTelo'       => 'zz',
            'stTujihSelektorjev'   => 1,
            'stZaposlenih'         => 1,
            'stHonorarnihZun'      => 30,
            'zaproseno'            => 1.24,
            'celotnaVrednost'      => 1.24,
            'nasDelez'             => 100.24,
//            'lastnaSredstva'          => 1.24,
            'drugiViri'            => 1.24,
            'opredelitevDrugiViri' => 'zz',
            'drugiJavni'           => 1.24,
            'sort'                 => 1,
            'programDela'          => $this->obj2['id'],
        ];
        $this->objProgramFestival2 = $ent                       = $I->successfullyCreate($this->programFestivalUrl, $data);
        $I->assertGuid($ent['id']);
    }

    /**
     *  kreiramo zapis
     * 
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function createVecProgramovGostovanj(ApiTester $I)
    {
        $data                       = [
            'dokument'               => $this->obj2['id'],
//            'uprizoritev'        => $this->lookUprizoritev['id'],
            'uprizoritev'            => $this->lookUprizoritev1['id'],
            'krajGostovanja'         => 'zz',
            'drzavaGostovanja'       => $this->objDrzava1['id'],
            'ustanova'               => 'zz',
            'datumGostovanja'        => '2011-02-01T00:00:00+0100',
            'ponoviInt'              => 9,
            'ponoviKoprInt'          => 9,
            'obiskInt'               => 9,
            'obiskKoprInt'           => 9,
            'zaproseno'              => 1.24,
            'nasDelez'               => 94.12,
            'transportniStroski'     => 9.12,
            'dnevPrvZad'             => 9.12,
            'tantieme'               => 9.12,
            'materialni'             => 9.12,
            'avtorskePravice'        => 9.12,
            'avtorskiHonorarji'      => 9.12,
            'avtorskiHonorarjiSamoz' => 9.12,
            'vlozekGostitelja'       => 9.12,
//            'lastnaSredstva'     => 9.12,
            'drugiViri'              => 9.12,
            'drugiJavni'             => 9.12,
            'gostitelj'              => $this->lookPopa1['id'],
            'sort'                   => 1,
        ];
        $this->objProgramGostovanj1 = $ent                        = $I->successfullyCreate($this->programGostovanjaUrl, $data);
        $I->assertGuid($ent['id']);

        // kreiramo še en zapis
        $data                       = [
            'dokument'               => $this->obj2['id'],
            'uprizoritev'            => $this->lookUprizoritev4['id'],
            'krajGostovanja'         => 'zz',
            'drzavaGostovanja'       => $this->objDrzava1['id'],
            'ustanova'               => 'zz',
            'datumGostovanja'        => '2011-02-01T00:00:00+0100',
            'ponoviInt'              => 11,
            'ponoviKoprInt'          => 11,
            'obiskInt'               => 9,
            'obiskKoprInt'           => 9,
            'zaproseno'              => 1.24,
            'nasDelez'               => 94.12,
            'transportniStroski'     => 9.12,
            'dnevPrvZad'             => 9.12,
            'tantieme'               => 9.12,
            'materialni'             => 9.12,
            'avtorskePravice'        => 9.12,
            'avtorskiHonorarji'      => 48.33,
            'avtorskiHonorarjiSamoz' => 48.33,
            'vlozekGostitelja'       => 9.12,
//            'lastnaSredstva'     => 9.12,
            'drugiViri'              => 9.12,
            'drugiJavni'             => 9.12,
            'gostitelj'              => $this->lookPopa1['id'],
            'sort'                   => 1,
        ];
        $this->objProgramGostovanj2 = $ent                        = $I->successfullyCreate($this->programGostovanjaUrl, $data);
        $I->assertGuid($ent['id']);
    }

    /**
     *  kreiramo zapis
     * 
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function createVecProgramovRazno(ApiTester $I)
    {
        $data                   = [
            'dokument'        => $this->obj2['id'],
            'naziv'           => 'zz',
//            'stPE'            => 1,
            'obiskDoma'       => 6,
            'stZaposlenih'    => 1,
            'stHonorarnihZun' => 18,
            'zaproseno'       => 0,
//            'nasDelez'      => 100.24,
//            'lastnaSredstva'  => 1.24,
            'drugiViri'       => 1.24,
            'drugiJavni'      => 1.24,
            'sort'            => 1,
        ];
        $this->objProgramRazno1 = $ent                    = $I->successfullyCreate($this->programRaznoUrl, $data);
        $I->assertGuid($ent['id']);

        // kreiramo še en zapis
        $data                   = [
            'dokument'        => $this->obj2['id'],
            'naziv'           => 'zz',
//            'stPE'            => 1,
            'obiskDoma'       => 22,
            'stZaposlenih'    => 1,
            'stHonorarnihZun' => 14,
            'zaproseno'       => 0,
//            'nasDelez'      => 100.24,
//            'lastnaSredstva'  => 1.24,
            'drugiViri'       => 1.24,
            'drugiJavni'      => 1.24,
            'sort'            => 1,
        ];
        $this->objProgramRazno2 = $ent                    = $I->successfullyCreate($this->programRaznoUrl, $data);
        $I->assertGuid($ent['id']);
    }

    /**
     * preberemo relacije
     * 
     * @depends createVecEnotPrograma
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeZEnotamiPrograma(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "premiere", "");
        $I->assertGreaterThanOrEqual(1, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "premiere", $this->objProgramPremiera1['id']);
        $I->assertGreaterThanOrEqual(1, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "ponovitvePremiere", "");
        $I->assertGreaterThanOrEqual(1, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "ponovitvePremiere", $this->objProgramPonovitevPremiere1['id']);
        $I->assertGreaterThanOrEqual(1, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "ponovitvePrejsnjih", "");
        $I->assertGreaterThanOrEqual(1, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "ponovitvePrejsnjih", $this->objProgramPonovitevPrejsnjih1['id']);
        $I->assertGreaterThanOrEqual(1, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "izjemni", "");
        $I->assertGreaterThanOrEqual(1, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "izjemni", $this->objProgramIzjemni1['id']);
        $I->assertGreaterThanOrEqual(1, count($resp));


        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "gostujoci", "");
        $I->assertGreaterThanOrEqual(1, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "gostujoci", $this->objProgramGostujoca1['id']);
        $I->assertGreaterThanOrEqual(1, count($resp));
    }

    /**
     * preberemo relacije
     * 
     * @depends createVecProgramovFestivala
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeSProgramiFestivala(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "programiFestival", "");
        $I->assertGreaterThanOrEqual(2, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "programiFestival", $this->objProgramFestival1['id']);
        $I->assertGreaterThanOrEqual(1, count($resp));
    }

    /**
     * preberemo relacije
     * 
     * @depends createVecProgramovGostovanj
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeSProgramiGostovanj(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "gostovanja", "");
        $I->assertGreaterThanOrEqual(2, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "gostovanja", $this->objProgramGostovanj1['id']);
        $I->assertGreaterThanOrEqual(1, count($resp));
    }

    /**
     * preberemo relacije
     * 
     * @depends createVecProgramovRazno
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeSProgramiRazno(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "programiRazno", "");
        $I->assertGreaterThanOrEqual(2, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "programiRazno", $this->objProgramRazno1['id']);
        $I->assertGreaterThanOrEqual(1, count($resp));
    }

    /**
     *  Testiramo ali dovoli le 1 programpremiere z isto uprizoritvijo
     * 
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function createVecProgramovPremierZIstoUprizoritvijo(ApiTester $I)
    {
        codecept_debug($this->lookUprizoritev1);
        //premiera
        $data = [
            'celotnaVrednost'         => 1.24,
            'nasDelez'                => 100.24,
            'zaproseno'               => 1.24,
//            'lastnaSredstva'       => 1.24,
            'avtorskiHonorarji'       => 41.24,
            'avtorskiHonorarjiSamoz'  => 41.24,
            'tantieme'                => 1.24,
            'materialni'              => 1.24,
            'avtorskePravice'         => 1.24,
            'drugiViri'               => 1.24,
            'opredelitevDrugiViri'    => "zz",
//            'vlozekGostitelja'     => 1.24,
            'drugiJavni'              => 1.24,
            'obiskDoma'               => 1,
            'obiskKopr'               => 0,
//            'obiskGost'          => 1,
//            'obiskZamejo'        => 1,
//            'obiskInt'           => 1,
//            'ponoviDoma'         => 1,
//            'ponoviZamejo'       => 1,
//            'ponoviGost'         => 1,
//            'ponoviInt'          => 1,
//            'tip'                => 'premiera', // ali to polje potrebujemo - ne. Ne rabimo vnašati, samo se nastavi
            'sort'                    => 1,
            'stZaposUmet'             => 1,
            'stZaposDrug'             => 1,
            'stHonorarnihZun'         => 1,
            'stHonorarnihZunIgr'      => 1,
            'stHonorarnihZunIgrTujJZ' => 1,
            'stHonorarnihZunSamoz'    => 1,
            'tipProgramskeEnote'      => $this->lookTipProgramskeEnote1['id'],
            'kpe'                     => 0.1,
            'dokument'                => $this->obj2['id'],
            'uprizoritev'             => $this->lookUprizoritev3['id'], // ista uprizoritev
        ];
        $ent  = $I->successfullyCreate($this->programPremieraUrl, $data);
        $I->assertGuid($ent['id']);

        // poizkusimo kreirati še en zapis z isto uprizoritvijo
        $data = [
            'uprizoritev'             => $this->lookUprizoritev3['id'], // ista uprizoritev
            'celotnaVrednost'         => 1.24,
            'nasDelez'                => 100.24,
            'zaproseno'               => 1.24,
//            'lastnaSredstva'       => 1.24,
            'avtorskiHonorarji'       => 1.24,
            'avtorskiHonorarjiSamoz'  => 1.24,
            'tantieme'                => 1.24,
            'materialni'              => 1.24,
            'avtorskePravice'         => 1.24,
            'drugiViri'               => 1.24,
            'opredelitevDrugiViri'    => "zz",
//            'vlozekGostitelja'     => 1.24,
            'drugiJavni'              => 1.24,
            'obiskDoma'               => 1,
            'obiskKopr'               => 0,
//            'obiskGost'          => 1,
//            'obiskZamejo'        => 1,
//            'obiskInt'           => 1,
//            'ponoviDoma'         => 1,
//            'ponoviZamejo'       => 1,
//            'ponoviGost'         => 1,
//            'ponoviInt'          => 1,
//            'tip'                => 'premiera', // ali to polje potrebujemo - ne. Ne rabimo vnašati, samo se nastavi
            'sort'                    => 1,
            'stZaposUmet'             => 1,
            'stZaposDrug'             => 1,
            'stHonorarnihZun'         => 1,
            'stHonorarnihZunIgr'      => 1,
            'stHonorarnihZunIgrTujJZ' => 1,
            'stHonorarnihZunSamoz'    => 1,
            'tipProgramskeEnote'      => $this->lookTipProgramskeEnote1['id'],
            'kpe'                     => 0.1,
            'dokument'                => $this->obj2['id'],
        ];
        $resp = $I->failToCreate($this->programPremieraUrl, $data);
        $I->assertEquals(1000440, $resp[0]['code']);

        // kreiranje zapisa z drugo uprizoritvijo mora uspeti:
        $data = [
            'uprizoritev'             => $this->lookUprizoritev4['id'], // druga uprizoritev
            'celotnaVrednost'         => 1.24,
            'nasDelez'                => 100.24,
            'zaproseno'               => 1.24,
//            'lastnaSredstva'       => 1.24,
            'avtorskiHonorarji'       => 55.25,
            'avtorskiHonorarjiSamoz'  => 55.25,
            'tantieme'                => 1.24,
            'materialni'              => 1.24,
            'avtorskePravice'         => 1.24,
            'drugiViri'               => 1.24,
            'opredelitevDrugiViri'    => "zz",
//            'vlozekGostitelja'     => 1.24,
            'drugiJavni'              => 1.24,
            'obiskDoma'               => 1,
            'obiskKopr'               => 0,
//            'obiskGost'          => 1,
//            'obiskZamejo'        => 1,
//            'obiskInt'           => 1,
//            'ponoviDoma'         => 1,
//            'ponoviZamejo'       => 1,
//            'ponoviGost'         => 1,
//            'ponoviInt'          => 1,
//            'tip'                => 'premiera', // ali to polje potrebujemo - ne. Ne rabimo vnašati, samo se nastavi
            'sort'                    => 1,
            'stZaposUmet'             => 1,
            'stZaposDrug'             => 1,
            'stHonorarnihZun'         => 1,
            'stHonorarnihZunIgr'      => 1,
            'stHonorarnihZunIgrTujJZ' => 1,
            'stHonorarnihZunSamoz'    => 1,
            'tipProgramskeEnote'      => $this->lookTipProgramskeEnote1['id'],
            'kpe'                     => 0.1,
            'dokument'                => $this->obj2['id'],
        ];
        $ent  = $I->successfullyCreate($this->programPremieraUrl, $data);
        $I->assertGuid($ent['id']);
    }

    /**
     *  Testiramo ali dovoli le 1 program ponov. premiere z isto uprizoritvijo
     * 
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function createVecProgramovPonovitevPremierZIstoUprizoritvijo(ApiTester $I)
    {
        codecept_debug($this->lookUprizoritev1);
        $data = [
            'celotnaVrednost'         => 1.24,
            'celotnaVrednostMat'      => 1.02,
            'celotnaVrednostGostovSZ' => 0.11,
            'nasDelez'                => 100.24,
            'zaproseno'               => 1.24,
//            'lastnaSredstva'          => 1.24,
            'avtorskiHonorarji'       => 74.22,
            'avtorskiHonorarjiSamoz'  => 74.22,
            'tantieme'                => 1.24,
            'materialni'              => 1.24,
            'avtorskePravice'         => 1.24,
            'drugiViri'               => 1.24,
            'opredelitevDrugiViri'    => "zz",
            'vlozekGostitelja'        => 1.24,
            'drugiJavni'              => 1.24,
            'obiskDoma'               => 1,
            'obiskGost'               => 1,
            'obiskKoprGost'           => 1,
            'obiskKopr'               => 1,
            'obiskZamejo'             => 1,
            'obiskKoprZamejo'         => 1,
            'obiskInt'                => 1,
            'obiskKoprInt'            => 1,
            'ponoviDoma'              => 4,
            'ponoviZamejo'            => 4,
            'ponoviKoprZamejo'        => 4,
            'ponoviGost'              => 4,
            'ponoviKoprGost'          => 4,
            'ponoviKopr'              => 4,
            'ponoviInt'               => 4,
            'ponoviKoprInt'           => 4,
            'sort'                    => 1,
            'tipProgramskeEnote'      => $this->lookTipProgramskeEnote1['id'],
            'dokument'                => $this->obj2['id'],
            'uprizoritev'             => $this->lookUprizoritev1['id'], // ista uprizoritev
        ];
        $ent  = $I->successfullyCreate($this->programPonovitevPremiereUrl, $data);
        $I->assertGuid($ent['id']);

        // poizkusimo kreirati še en zapis z isto uprizoritvijo
        $data = [
            'celotnaVrednost'         => 1.24,
            'celotnaVrednostMat'      => 1.02,
            'celotnaVrednostGostovSZ' => 0.11,
            'nasDelez'                => 100.24,
            'zaproseno'               => 1.24,
//            'lastnaSredstva'          => 1.24,
            'avtorskiHonorarji'       => 1.24,
            'avtorskiHonorarjiSamoz'  => 1.24,
            'tantieme'                => 1.24,
            'materialni'              => 1.24,
            'avtorskePravice'         => 1.24,
            'drugiViri'               => 1.24,
            'opredelitevDrugiViri'    => "zz",
            'vlozekGostitelja'        => 1.24,
            'drugiJavni'              => 1.24,
            'obiskDoma'               => 1,
            'obiskGost'               => 1,
            'obiskKoprGost'           => 1,
            'obiskKopr'               => 1,
            'obiskZamejo'             => 1,
            'obiskKoprZamejo'         => 1,
            'obiskInt'                => 1,
            'obiskKoprInt'            => 1,
            'ponoviDoma'              => 5,
            'ponoviZamejo'            => 5,
            'ponoviKoprZamejo'        => 5,
            'ponoviGost'              => 5,
            'ponoviKoprGost'          => 5,
            'ponoviKopr'              => 5,
            'ponoviInt'               => 5,
            'ponoviKoprInt'           => 5,
            'sort'                    => 1,
            'tipProgramskeEnote'      => $this->lookTipProgramskeEnote1['id'],
            'dokument'                => $this->obj2['id'],
            'uprizoritev'             => $this->lookUprizoritev1['id'], // ista uprizoritev
        ];
        $resp = $I->failToCreate($this->programPonovitevPremiereUrl, $data);
        $I->assertEquals(1000450, $resp[0]['code']);

        // kreiranje zapisa z drugo uprizoritvijo mora uspeti:
        $data = [
            'celotnaVrednost'         => 1.24,
            'celotnaVrednostMat'      => 1.02,
            'celotnaVrednostGostovSZ' => 0.11,
            'nasDelez'                => 100.24,
            'zaproseno'               => 1.24,
//            'lastnaSredstva'          => 1.24,
            'avtorskiHonorarji'       => 4.3,
            'avtorskiHonorarjiSamoz'  => 4.3,
            'tantieme'                => 1.24,
            'materialni'              => 1.24,
            'avtorskePravice'         => 1.24,
            'drugiViri'               => 1.24,
            'opredelitevDrugiViri'    => "zz",
            'vlozekGostitelja'        => 1.24,
            'drugiJavni'              => 1.24,
            'obiskDoma'               => 1,
            'obiskGost'               => 1,
            'obiskKoprGost'           => 1,
            'obiskKopr'               => 1,
            'obiskZamejo'             => 1,
            'obiskKoprZamejo'         => 1,
            'obiskInt'                => 1,
            'obiskKoprInt'            => 1,
            'ponoviDoma'              => 6,
            'ponoviZamejo'            => 6,
            'ponoviKoprZamejo'        => 6,
            'ponoviGost'              => 6,
            'ponoviKoprGost'          => 6,
            'ponoviKopr'              => 6,
            'ponoviInt'               => 6,
            'ponoviKoprInt'           => 6,
            'sort'                    => 1,
            'tipProgramskeEnote'      => $this->lookTipProgramskeEnote1['id'],
            'dokument'                => $this->obj2['id'],
            'uprizoritev'             => $this->lookUprizoritev3['id'], // druga uprizoritev
        ];
        $ent  = $I->successfullyCreate($this->programPonovitevPremiereUrl, $data);
        $I->assertGuid($ent['id']);
    }

    /**
     *  Testiramo ali dovoli le 1 program ponov. prejšnjih z isto uprizoritvijo
     * 
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function createVecProgramovPonovitevPrejšnjihZIstoUprizoritvijo(ApiTester $I)
    {
        codecept_debug($this->lookUprizoritev1);
        $data = [
            'celotnaVrednost'         => 1.24,
            'celotnaVrednostMat'      => 1.02,
            'celotnaVrednostGostovSZ' => 0.11,
            'nasDelez'                => 100.24,
            'zaproseno'               => 1.24,
//            'lastnaSredstva'          => 1.24,
            'avtorskiHonorarji'       => 83.33,
            'avtorskiHonorarjiSamoz'  => 83.33,
            'tantieme'                => 1.24,
            'materialni'              => 1.24,
            'avtorskePravice'         => 1.24,
            'drugiViri'               => 1.24,
            'opredelitevDrugiViri'    => "zz",
            'vlozekGostitelja'        => 1.24,
            'drugiJavni'              => 1.24,
            'obiskDoma'               => 1,
            'obiskGost'               => 1,
            'obiskKoprGost'           => 1,
            'obiskKopr'               => 1,
            'obiskZamejo'             => 1,
            'obiskKoprZamejo'         => 1,
            'obiskInt'                => 1,
            'obiskKoprInt'            => 1,
            'ponoviDoma'              => 3,
            'ponoviZamejo'            => 2,
            'ponoviKoprZamejo'        => 2,
            'ponoviGost'              => 3,
            'ponoviKoprGost'          => 3,
            'ponoviKopr'              => 3,
//            'ponoviInt'            => 1,
            'sort'                    => 1,
            'stZaposUmet'             => 1,
            'stZaposDrug'             => 1,
            'stHonorarnihZun'         => 11,
            'stHonorarnihZunIgr'      => 5,
            'stHonorarnihZunIgrTujJZ' => 3,
            'stHonorarnihZunSamoz'    => 3,
            'tipProgramskeEnote'      => $this->lookTipProgramskeEnote2['id'],
            'dokument'                => $this->obj2['id'],
            'uprizoritev'             => $this->lookUprizoritev5['id'], // ista uprizoritev
        ];
        $ent  = $I->successfullyCreate($this->programPonovitevPrejsnjihUrl, $data);
        $I->assertGuid($ent['id']);

        // poizkusimo kreirati še en zapis z isto uprizoritvijo
        $data = [
            'celotnaVrednost'         => 1.24,
            'celotnaVrednostMat'      => 1.02,
            'celotnaVrednostGostovSZ' => 0.11,
            'nasDelez'                => 100.24,
            'zaproseno'               => 1.24,
//            'lastnaSredstva'          => 1.24,
            'avtorskiHonorarji'       => 1.24,
            'avtorskiHonorarjiSamoz'  => 1.24,
            'tantieme'                => 1.24,
            'materialni'              => 1.24,
            'avtorskePravice'         => 1.24,
            'drugiViri'               => 1.24,
            'opredelitevDrugiViri'    => "zz",
            'vlozekGostitelja'        => 1.24,
            'drugiJavni'              => 1.24,
            'obiskDoma'               => 1,
            'obiskGost'               => 1,
            'obiskKoprGost'           => 1,
            'obiskKopr'               => 1,
            'obiskZamejo'             => 1,
            'obiskKoprZamejo'         => 1,
            'obiskInt'                => 1,
            'obiskKoprInt'            => 1,
            'ponoviDoma'              => 6,
            'ponoviZamejo'            => 5,
            'ponoviKoprZamejo'        => 5,
            'ponoviGost'              => 5,
            'ponoviKoprGost'          => 5,
            'ponoviKopr'              => 5,
//            'ponoviInt'            => 1,
            'sort'                    => 1,
            'stZaposUmet'             => 1,
            'stZaposDrug'             => 1,
            'stHonorarnihZun'         => 1,
            'stHonorarnihZunIgr'      => 1,
            'stHonorarnihZunIgrTujJZ' => 1,
            'stHonorarnihZunSamoz'    => 1,
            'tipProgramskeEnote'      => $this->lookTipProgramskeEnote2['id'],
            'dokument'                => $this->obj2['id'],
            'uprizoritev'             => $this->lookUprizoritev5['id'], // ista uprizoritev
        ];
        $resp = $I->failToCreate($this->programPonovitevPrejsnjihUrl, $data);
        $I->assertEquals(1000560, $resp[0]['code']);

        // kreiranje zapisa z drugo uprizoritvijo mora uspeti:
        $data = [
            'celotnaVrednost'         => 1.24,
            'celotnaVrednostMat'      => 1.02,
            'celotnaVrednostGostovSZ' => 0.11,
            'nasDelez'                => 100.24,
            'zaproseno'               => 1.24,
//            'lastnaSredstva'          => 1.24,
            'avtorskiHonorarji'       => 5.22,
            'avtorskiHonorarjiSamoz'  => 5.22,
            'tantieme'                => 1.24,
            'materialni'              => 1.24,
            'avtorskePravice'         => 1.24,
            'drugiViri'               => 1.24,
            'opredelitevDrugiViri'    => "zz",
            'vlozekGostitelja'        => 1.24,
            'drugiJavni'              => 1.24,
            'obiskDoma'               => 1,
            'obiskGost'               => 1,
            'obiskKoprGost'           => 1,
            'obiskKopr'               => 1,
            'obiskZamejo'             => 1,
            'obiskKoprZamejo'         => 1,
            'obiskInt'                => 1,
            'obiskKoprInt'            => 1,
            'ponoviDoma'              => 2,
            'ponoviZamejo'            => 4,
            'ponoviKoprZamejo'        => 4,
            'ponoviGost'              => 2,
            'ponoviKoprGost'          => 2,
            'ponoviKopr'              => 2,
//            'ponoviInt'            => 1,
            'sort'                    => 1,
            'stZaposUmet'             => 1,
            'stZaposDrug'             => 1,
            'stHonorarnihZun'         => 25,
            'stHonorarnihZunIgr'      => 8,
            'stHonorarnihZunIgrTujJZ' => 8,
            'stHonorarnihZunSamoz'    => 8,
            'tipProgramskeEnote'      => $this->lookTipProgramskeEnote5['id'],
            'dokument'                => $this->obj2['id'],
            'uprizoritev'             => $this->lookUprizoritev2['id'], // ista uprizoritev
        ];
        $ent  = $I->successfullyCreate($this->programPonovitevPrejsnjihUrl, $data);
        $I->assertGuid($ent['id']);
    }

    /**
     *  Testiramo ali dovoli le 1 program gostujoča z isto uprizoritvijo
     * 
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function createVecProgramovGostujocaZIstoUprizoritvijo(ApiTester $I)
    {
        //gostujoca 
        $data = [
//            'celotnaVrednost'      => 1.24,
//            'nasDelez'             => 100.24,
            'strosekOdkPred'       => 100.24,
            'stroskiOstali'        => 0,
            'zaproseno'            => 1.24,
//            'lastnaSredstva'       => 1.24,
//            'avtorskiHonorarji'  => 1.24,
//            'avtorskiHonorarjiSamoz'  => 1.24,
//            'tantieme'           => 1.24,
//            'materialni'           => 1.24,
            'drugiViri'            => 1.24,
            'opredelitevDrugiViri' => "zz",
//            'vlozekGostitelja'     => 1.24,
            'drugiJavni'           => 1.24,
            'obiskDoma'            => 1,
//            'obiskGost'          => 1,
//            'obiskZamejo'        => 1,
//            'obiskInt'           => 1,
            'ponoviDoma'           => 1,
//            'ponoviZamejo'       => 1,
//            'ponoviGost'         => 1,
//            'ponoviInt'          => 1,
//            'tipProgramskeEnote' => NULL,
//            'tip'                => 'gostujoci', 
            'sort'                 => 1,
            'dokument'             => $this->obj2['id'],
            'uprizoritev'          => $this->lookUprizoritev1['id'], // ista uprizoritev
        ];
        $ent  = $I->successfullyCreate($this->programGostujocaUrl, $data);
        $I->assertGuid($ent['id']);

        // poizkusimo kreirati še en zapis z isto uprizoritvijo
        $data = [
//            'celotnaVrednost'      => 1.24,
//            'nasDelez'             => 100.24,
            'strosekOdkPred'       => 100.24,
            'stroskiOstali'        => 0,
            'zaproseno'            => 1.24,
//            'lastnaSredstva'       => 1.24,
//            'avtorskiHonorarji'  => 1.24,
//            'avtorskiHonorarjiSamoz'  => 1.24,
//            'tantieme'           => 1.24,
//            'materialni'           => 1.24,
            'drugiViri'            => 1.24,
            'opredelitevDrugiViri' => "zz",
//            'vlozekGostitelja'     => 1.24,
            'drugiJavni'           => 1.24,
            'obiskDoma'            => 1,
//            'obiskGost'          => 1,
//            'obiskZamejo'        => 1,
//            'obiskInt'           => 1,
            'ponoviDoma'           => 1,
//            'ponoviZamejo'       => 1,
//            'ponoviGost'         => 1,
//            'ponoviInt'          => 1,
//            'tipProgramskeEnote' => NULL,
//            'tip'                => 'gostujoci', 
            'sort'                 => 1,
            'dokument'             => $this->obj2['id'],
            'uprizoritev'          => $this->lookUprizoritev1['id'], // ista uprizoritev
        ];
        $resp = $I->failToCreate($this->programGostujocaUrl, $data);
        $I->assertEquals(1000430, $resp[0]['code']);

        // kreiranje zapisa z drugo uprizoritvijo mora uspeti:
        $data = [
//            'celotnaVrednost'      => 1.24,
//            'nasDelez'             => 100.24,
            'strosekOdkPred'       => 100.24,
            'stroskiOstali'        => 0,
            'zaproseno'            => 1.24,
//            'lastnaSredstva'       => 1.24,
//            'avtorskiHonorarji'  => 1.24,
//            'avtorskiHonorarjiSamoz'  => 1.24,
//            'tantieme'           => 1.24,
//            'materialni'           => 1.24,
            'drugiViri'            => 1.24,
            'opredelitevDrugiViri' => "zz",
//            'vlozekGostitelja'     => 1.24,
            'drugiJavni'           => 1.24,
            'obiskDoma'            => 1,
//            'obiskGost'          => 1,
//            'obiskZamejo'        => 1,
//            'obiskInt'           => 1,
            'ponoviDoma'           => 1,
//            'ponoviZamejo'       => 1,
//            'ponoviGost'         => 1,
//            'ponoviInt'          => 1,
//            'tipProgramskeEnote' => NULL,
//            'tip'                => 'gostujoci', 
            'sort'                 => 1,
            'dokument'             => $this->obj2['id'],
            'uprizoritev'          => $this->lookUprizoritev3['id'], // druga uprizoritev
        ];
        $ent  = $I->successfullyCreate($this->programGostujocaUrl, $data);
        $I->assertGuid($ent['id']);
    }

    /**
     * test validacije programa premiere - update mora uspeti
     *  
     * @param ApiTester $I
     */
    public function updateProgramPremiera(ApiTester $I)
    {
        //pri validaciji ne bi smel najti samega sebe
        $data         = $this->objProgramPremiera1;
        $data['sort'] = 3;

        $ent = $I->successfullyUpdate($this->programPremieraUrl, $data['id'], $data);
        codecept_debug($ent);

        $I->assertEquals($ent['sort'], 3);
    }

    /**
     * test validacije programa premiere - update mora uspeti
     *  
     * @param ApiTester $I
     */
    public function updateProgramPonovitevPremiere(ApiTester $I)
    {
        //pri validaciji ne bi smel najti samega sebe
        $data         = $this->objProgramPonovitevPremiere1;
        $data['sort'] = 3;

        $ent = $I->successfullyUpdate($this->programPonovitevPremiereUrl, $data['id'], $data);
        codecept_debug($ent);

        $I->assertEquals($ent['sort'], 3);
    }

    /**
     * test validacije programa premiere - update mora uspeti
     *  
     * @param ApiTester $I
     */
    public function updateProgramPonovitevPrejsnjih(ApiTester $I)
    {
        //pri validaciji ne bi smel najti samega sebe
        $data         = $this->objProgramPonovitevPrejsnjih1;
        $data['sort'] = 3;

        $ent = $I->successfullyUpdate($this->programPonovitevPrejsnjihUrl, $data['id'], $data);
        codecept_debug($ent);

        $I->assertEquals($ent['sort'], 3);
    }

    /**
     * test validacije programa premiere - update mora uspeti
     *  
     * @param ApiTester $I
     */
    public function updateProgramGostujoca(ApiTester $I)
    {
        //pri validaciji ne bi smel najti samega sebe
        $data         = $this->objProgramGostujoca1;
        $data['sort'] = 3;

        $ent = $I->successfullyUpdate($this->programGostujocaUrl, $data['id'], $data);
        codecept_debug($ent);

        $I->assertEquals($ent['sort'], 3);
    }

    /**
     *  kreiramo Koprodukcije za več enot programa
     * 
     * 
     * @param ApiTester $I
     */
    public function createVecKoprodukcij(ApiTester $I)
    {
        $data                   = [
            'delez'         => 0.49,
            'enotaPrograma' => $this->objProgramPremiera1['id'],
            'koproducent'   => $this->lookProdukcijskaHisa3['id'],
        ];
        $this->objKoprodukcija1 = $ent                    = $I->successfullyCreate($this->produkcijaDelitevUrl, $data);
        $I->assertGuid($ent['id']);

        $data = [
            'delez'         => 37.1,
            'enotaPrograma' => $this->objProgramPremiera1['id'],
            'koproducent'   => $this->lookProdukcijskaHisa2['id'],
        ];
        $ent  = $I->successfullyCreate($this->produkcijaDelitevUrl, $data);
        $I->assertGuid($ent['id']);

        $data                   = [
            'delez'         => 11.2,
            'enotaPrograma' => $this->objProgramPremiera1['id'],
            'koproducent'   => $this->lookProdukcijskaHisa4['id'],
        ];
        $this->objKoprodukcija3 = $ent                    = $I->successfullyCreate($this->produkcijaDelitevUrl, $data);
        $I->assertGuid($ent['id']);

//        $data = [
//            'delez'         => 0.12,
//            'zaproseno'     => 0.012,
//            'enotaPrograma' => $this->objProgramPonovitevPrejsnjih1['id'],
//            'koproducent'   => $this->lookProdukcijskaHisa1['id'],
//        ];
//        $ent  = $I->successfullyCreate($this->produkcijaDelitevUrl, $data);
//        $I->assertGuid($ent['id']);

        $data = [
            'delez'         => 20.22,
            'zaproseno'     => 8,
            'enotaPrograma' => $this->objProgramPonovitevPrejsnjih1['id'],
            'koproducent'   => $this->lookProdukcijskaHisa3['id'],
        ];
        $ent  = $I->successfullyCreate($this->produkcijaDelitevUrl, $data);
        $I->assertGuid($ent['id']);

        $data = [
            'delez'         => 112,
            'zaproseno'     => 16.3,
            'enotaPrograma' => $this->objProgramIzjemni1['id'],
            'koproducent'   => $this->lookProdukcijskaHisa1['id'],
        ];
        $ent  = $I->successfullyCreate($this->produkcijaDelitevUrl, $data);

        $I->assertGuid($ent['id']);
        $data = [
            'delez'         => 30,
            'zaproseno'     => 16,
            'enotaPrograma' => $this->objProgramIzjemni1['id'],
            'koproducent'   => $this->lookProdukcijskaHisa4['id'],
        ];
        $ent  = $I->successfullyCreate($this->produkcijaDelitevUrl, $data);
        $I->assertGuid($ent['id']);

        $data = [
            'delez'         => 0.17,
            'zaproseno'     => 0.04,
            'enotaPrograma' => $this->objProgramIzjemni1['id'],
            'koproducent'   => $this->lookProdukcijskaHisa5['id'],
        ];
        $ent  = $I->successfullyCreate($this->produkcijaDelitevUrl, $data);
        $I->assertGuid($ent['id']);

        $data                   = [
            'delez'         => 0.17,
            'zaproseno'     => 0.04,
            'enotaPrograma' => $this->objProgramFestival1['id'],
            'koproducent'   => $this->lookProdukcijskaHisa1['id'],
        ];
        $this->objKoprodukcija2 = $ent                    = $I->successfullyCreate($this->produkcijaDelitevUrl, $data);
        $I->assertGuid($ent['id']);
    }

    /**
     *  kreiramo druge vire za več enot programa
     * 
     * @param ApiTester $I
     */
    public function createVecDrugihVirov(ApiTester $I)
    {
        $data               = [
            'znesek'        => 1.24,
            'opis'          => "zz",
            'enotaPrograma' => $this->objProgramPremiera1['id'],
            'mednarodni'    => FALSE,
        ];
        $this->objDrugiVir1 = $ent                = $I->successfullyCreate($this->drugiVirUrl, $data);
        $I->assertGuid($ent['id']);

        // kreiramo še en zapis
        $data = [
            'znesek'        => 2.34,
            'opis'          => "aa",
            'enotaPrograma' => $this->objProgramPremiera1['id'],
            'mednarodni'    => true,
        ];
        $ent  = $I->successfullyCreate($this->drugiVirUrl, $data);
        $I->assertGuid($ent['id']);

        $data = [
            'znesek'        => 5.67,
            'opis'          => "pp2",
            'enotaPrograma' => $this->objProgramPonovitevPrejsnjih1['id'],
            'mednarodni'    => FALSE,
        ];
        $ent  = $I->successfullyCreate($this->drugiVirUrl, $data);
        $I->assertGuid($ent['id']);

        // kreiramo še en zapis
        $data = [
            'znesek'        => 92.34,
            'opis'          => "pp2b",
            'enotaPrograma' => $this->objProgramPonovitevPrejsnjih1['id'],
            'mednarodni'    => true,
        ];
        $ent  = $I->successfullyCreate($this->drugiVirUrl, $data);
        $I->assertGuid($ent['id']);

        // kreiramo še en zapis
        $data               = [
            'znesek'        => 15.3,
            'opis'          => "f1",
            'enotaPrograma' => $this->objProgramFestival1['id'],
            'mednarodni'    => true,
        ];
        $this->objDrugiVir2 = $ent                = $I->successfullyCreate($this->drugiVirUrl, $data);
        $I->assertGuid($ent['id']);

        // kreiramo še en zapis
        $data = [
            'znesek'        => 50.2,
            'opis'          => "f2",
            'enotaPrograma' => $this->objProgramGostovanj1['id'],
            'mednarodni'    => FALSE,
        ];
        $ent  = $I->successfullyCreate($this->drugiVirUrl, $data);
        $I->assertGuid($ent['id']);
    }

    /**
     * @depends createVecProgramovRazno
     * 
     * @param ApiTester $I
     */
    public function createVecProgramskihEnotSklopa(ApiTester $I)
    {
        $data               = [
            'naslovPE'     => 'zz',
            'avtorPE'      => 'zz',
            'obsegPE'      => 'zz',
            'mesecPE'      => 'zz',
            'vrednostPE'   => 100.11,
            'obiskDoma'    => 22,
            'programRazno' => $this->objProgramRazno1['id']
        ];
        $this->objPESklopa1 = $ent                = $I->successfullyCreate($this->programskaEnotaSklopaUrl, $data);
        $I->assertGuid($ent['id']);

        // kreiramo še en zapis
        $data               = [
            'naslovPE'     => 'aa',
            'avtorPE'      => 'aa',
            'obsegPE'      => 'aa',
            'mesecPE'      => 'aa',
            'vrednostPE'   => 200.22,
            'obiskDoma'    => 22,
            'programRazno' => $this->objProgramRazno1['id']
        ];
        $this->objPESklopa2 = $ent                = $I->successfullyCreate($this->programskaEnotaSklopaUrl, $data);
        $I->assertGuid($ent['id']);
    }

    /**
     * pri update-u se kliče preracun metoda, kjer je preračun kazalnikov
     * 
     * @depends createVecEnotPrograma
     * @depends createVecProgramovPonovitevPrejšnjihZIstoUprizoritvijo
     * @param ApiTester $I
     */
    public function updateZaPreracunKazalnikov(ApiTester $I)
    {

        $ent  = $I->successfullyGet($this->restUrl, $this->obj2['id']);
        codecept_debug($ent);
//        $I->assertTrue(false,"začasno $$");
        // pri update preračuna kazalnike
        $entR = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        codecept_debug($entR);

        $I->assertNotEmpty($entR['id']);
        $I->assertGreaterThanOrEqual(4, $entR['stPremier'], "št. premier");
        $I->assertGreaterThanOrEqual(3, $entR['stPonPrem'], "št. ponovitev premiere");
        $I->assertGreaterThanOrEqual(3, $entR['stPonPrej'], "št. ponovitev prejšnjih sezon");
        $I->assertGreaterThanOrEqual(0, $entR['stPonPrejVelikih']);
        $I->assertGreaterThanOrEqual(1, $entR['stPonPrejMalih']);
        $I->assertGreaterThanOrEqual(1, $entR['stPonPrejMalihKopr']);
        $I->assertGreaterThanOrEqual(0, $entR['stPonPrejSredKopr']);
        $I->assertGreaterThanOrEqual(1, $entR['stPonPrejVelikihKopr']);
        $I->assertGreaterThanOrEqual(3, $entR['stGostujo'], "št. gostujočih");
        $I->assertGreaterThanOrEqual(2, $entR['stInt'], "štev. Mednarodna gostovanja:");
        $I->assertGreaterThanOrEqual(2, $entR['stFest'], "štev. Festivali:");
        $I->assertGreaterThanOrEqual(2, $entR['stRazno'], "štev. Razno: ");
        $I->assertGreaterThanOrEqual(1, $entR['stIzjem'], "štev. Izjemni dogodki:");
        $I->assertGreaterThanOrEqual(396.15, $entR['vrPS1'], "vrednost PS1");
        $I->assertGreaterThanOrEqual(277.72, $entR['vrPS1Mat'], "vr PS1 mat");
        $I->assertGreaterThanOrEqual(0.66, $entR['vrPS1GostovSZ'], "vr ps1 gostov slo zam");
        $I->assertGreaterThanOrEqual(117.77, $entR['vrPS1Do']);
        $I->assertGreaterThanOrEqual(112, $entR['stIzvNekomerc'], "št nekomerc");
        $I->assertEquals($entR['stIzvPrem'] + $entR['stIzvPonPrem'] + $entR['stIzvPonPrej'] + $entR['stIzvGostuj'] + $entR['stIzvOstalihNek'], $entR['stIzvNekomerc'], "št nekomerc kot vsota a+b+c+d");
        $I->assertGreaterThanOrEqual(4, $entR['stIzvPrem'], "št. izvedb premier");
        $I->assertGreaterThanOrEqual(48, $entR['stIzvPonPrem'], "št. izvedb pon premier");
        $I->assertGreaterThanOrEqual(12, $entR['stIzvPonPremDoma'], "stIzvPonPremDoma  ");
        $I->assertGreaterThanOrEqual(13, $entR['stIzvPonPremZamejo'], "stIzvPonPremZamejo");
        $I->assertGreaterThanOrEqual(14, $entR['stIzvPonPremGost'], "stIzvPonPremGost");
        $I->assertGreaterThanOrEqual(0, $entR['stIzvPonPremInt'], "stIzvPonPremInt");
        $I->assertGreaterThanOrEqual(4, $entR['stIzvPonPremKopr'], "stIzvPonPremKopr");
        $I->assertGreaterThanOrEqual(0, $entR['stIzvPonPremKoprInt'], "stIzvPonPremKoprInt");
        $I->assertGreaterThanOrEqual(37, $entR['stIzvPonPrej'], "št. izvedb prejšnjih");
        $I->assertGreaterThanOrEqual(11, $entR['stIzvPonPrejDoma'], "stIzvPonPrejDoma  ");
        $I->assertGreaterThanOrEqual(12, $entR['stIzvPonPrejZamejo'], "stIzvPonPrejZamejo");
        $I->assertGreaterThanOrEqual(13, $entR['stIzvPonPrejGost'], "stIzvPonPrejGost");
        $I->assertGreaterThanOrEqual(8, $entR['stIzvPonPrejKopr'], "stIzvPonPrejKopr");
        $I->assertGreaterThanOrEqual(0, $entR['stIzvPonPrejInt'], "stIzvPonPrejInt");
        $I->assertGreaterThanOrEqual(0, $entR['stIzvPonPrejKoprInt'], "stIzvPonPrejKoprInt");
        $I->assertGreaterThanOrEqual(4, $entR['stIzvGostuj'], "št. izvedb gostujočih");
        $I->assertGreaterThanOrEqual(9, $entR['stIzvOstalihNek'], "št. izvedb ostalih nekom");
        $I->assertGreaterThanOrEqual(27, $entR['stIzvGostovanjSlo'], "");
        $I->assertGreaterThanOrEqual(25, $entR['stIzvGostovanjZam'], "");
        $I->assertGreaterThanOrEqual(20, $entR['stIzvGostovanjInt'], "");
        $I->assertGreaterThanOrEqual(378, $entR['stObiskNekom'], "Obisk vseh nekom.");
        $I->assertGreaterThanOrEqual(300, $entR['stObiskNekomMat'], "");
        $I->assertGreaterThanOrEqual(38, $entR['stObiskNekomGostSlo'], "");
        $I->assertGreaterThanOrEqual(22, $entR['stObiskNekomGostZam'], "");
        $I->assertGreaterThanOrEqual(18, $entR['stObiskNekomGostInt'], "");
        $I->assertGreaterThanOrEqual(25, $entR['stObiskPrem'], "stObiskPrem");
        $I->assertGreaterThanOrEqual(65, $entR['stObiskPonPrem'], "stObiskPonPrem");
        $I->assertGreaterThanOrEqual(23, $entR['stObiskPonPremDoma'], "stObiskPonPremDoma");
        $I->assertGreaterThanOrEqual(33, $entR['stObiskPonPremKopr'], "stObiskPonPremKopr");
        $I->assertGreaterThanOrEqual(9, $entR['stObiskPonPremKoprInt'], "stObiskPonPremKoprInt");
        $I->assertGreaterThanOrEqual(33, $entR['stObiskPonPremGost'], 'stObiskPonPremGost');
        $I->assertGreaterThanOrEqual(9, $entR['stObiskPonPremZamejo'], 'stObiskPonPremZamejo');
        $I->assertGreaterThanOrEqual(9, $entR['stObiskPonPremInt'], 'stObiskPonPremInt');
        $I->assertEquals($entR['avgObiskPrired'], round($entR['stObiskNekom'] / $entR['stIzvNekomerc'], 2), "povprečno št. obiskovalcev");     //kvocient drugih dveh števil
        $I->assertGreaterThanOrEqual(141, $entR['stHonorarnihZun'], "");
        $I->assertGreaterThanOrEqual(28, $entR['stHonorarnihZunIgr'], "");
        $I->assertGreaterThanOrEqual(20, $entR['stHonorarnihZunIgrTujJZ'], "");
        $I->assertGreaterThanOrEqual(20, $entR['stHonorarnihZunSamoz'], "");
        $I->assertGreaterThanOrEqual(548.12, $entR['sredstvaAvt'], "sredstvaAvt");
        $I->assertGreaterThanOrEqual(548.12, $entR['sredstvaAvtSamoz'], "sredstvaAvtSamoz");
        $I->assertGreaterThanOrEqual(4.96, $entR['sredstvaZaprosenoPrem'], "sredstvaZaprosenoPrem");
        $I->assertGreaterThanOrEqual(3.72, $entR['sredstvaZaprosenoPonPrem'], "sredstvaZaprosenoPonPrem");
        $I->assertGreaterThanOrEqual(3.72, $entR['sredstvaZaprosenoPonPrej'], "sredstvaZaprosenoPonPrej");
        $I->assertGreaterThanOrEqual(42.48, $entR['sredstvaZaprosenoGostujo'], "sredstvaZaprosenoGostujo");
        $I->assertGreaterThanOrEqual(2.48, $entR['sredstvaZaprosenoInt'], "sredstvaZaprosenoInt");
        $I->assertGreaterThanOrEqual(2.48, $entR['sredstvaZaprosenoFest'], "sredstvaZaprosenoFest");
        $I->assertGreaterThanOrEqual(0, $entR['sredstvaZaprosenoRazno'], "sredstvaZaprosenoRazno");
        $I->assertGreaterThanOrEqual(1.24, $entR['sredstvaZaprosenoIzjem'], "sredstvaZaprosenoIzjem");
        $I->assertGreaterThanOrEqual(5.94, $entR['sredstvaDrugiJavniPrem'], "sredstvaDrugiJavniPrem");
        $I->assertGreaterThanOrEqual(3.72, $entR['sredstvaDrugiJavniPonPrem'], "sredstvaDrugiJavniPonPrem");
        $I->assertGreaterThanOrEqual(3.72, $entR['sredstvaDrugiJavniPonPrej'], "sredstvaDrugiJavniPonPrej");
        $I->assertGreaterThanOrEqual(3.72, $entR['sredstvaDrugiJavniGostujo'], "sredstvaDrugiJavniGostujo");
        $I->assertGreaterThanOrEqual(18.24, $entR['sredstvaDrugiJavniInt'], "sredstvaDrugiJavniInt");
        $I->assertGreaterThanOrEqual(2.48, $entR['sredstvaDrugiJavniFest'], "sredstvaDrugiJavniFest");
        $I->assertGreaterThanOrEqual(2.48, $entR['sredstvaDrugiJavniRazno'], "sredstvaDrugiJavniRazno");
        $I->assertGreaterThanOrEqual(1.24, $entR['sredstvaDrugiJavniIzjem'], "sredstvaDrugiJavniIzjem");
        $I->assertGreaterThanOrEqual(3.58, $entR['sredstvaDrugiViriPrem'], "sredstvaDrugiViriPrem");
        $I->assertGreaterThanOrEqual(0, $entR['sredstvaDrugiViriPonPrem'], "sredstvaDrugiViriPonPrem");
        $I->assertGreaterThanOrEqual(98.01, $entR['sredstvaDrugiViriPonPrej'], "sredstvaDrugiViriPonPrej");
        $I->assertGreaterThanOrEqual(0, $entR['sredstvaDrugiViriGostujo'], "sredstvaDrugiViriGostujo");
        $I->assertGreaterThanOrEqual(50.2, $entR['sredstvaDrugiViriInt'], "sredstvaDrugiViriInt");
        $I->assertGreaterThanOrEqual(15.3, $entR['sredstvaDrugiViriFest'], "sredstvaDrugiViriFest");
        $I->assertGreaterThanOrEqual(0, $entR['sredstvaDrugiViriRazno'], "sredstvaDrugiViriRazno");
        $I->assertGreaterThanOrEqual(0, $entR['sredstvaDrugiViriIzjem'], "sredstvaDrugiViriIzjem");

        $I->assertGreaterThanOrEqual(0, $entR['sredstvaVlozekGostiteljaPrem'], "sredstvaVlozekGostiteljaPrem");
        $I->assertGreaterThanOrEqual(103.29, $entR['sredstvaLastnaPrem'], "sredstvaLastnaPrem");
        $I->assertGreaterThanOrEqual(3.72, $entR['sredstvaVlozekGostiteljaPonPrem'], "sredstvaVlozekGostiteljaPonPrem");
        $I->assertGreaterThanOrEqual(108.02, $entR['sredstvaLastnaPonPrem'], "sredstvaLastnaPonPrem");
        $I->assertGreaterThanOrEqual(3.72, $entR['sredstvaVlozekGostiteljaPonPrej'], "sredstvaVlozekGostiteljaPonPrej");
        $I->assertGreaterThanOrEqual(50.03, $entR['sredstvaLastnaPonPrej'], "sredstvaLastnaPonPrej");
        $I->assertGreaterThanOrEqual(0, $entR['sredstvaVlozekGostiteljaGostujo'], "sredstvaVlozekGostiteljaGostujo");
        $I->assertGreaterThanOrEqual(285.28, $entR['sredstvaLastnaGostujo'], "sredstvaLastnaGostujo");
        $I->assertGreaterThanOrEqual(18.24, $entR['sredstvaVlozekGostiteljaInt'], "sredstvaVlozekGostiteljaInt");
        $I->assertGreaterThanOrEqual(41.25, $entR['sredstvaLastnaInt'], "sredstvaLastnaInt");
        $I->assertGreaterThanOrEqual(0, $entR['sredstvaVlozekGostiteljaFest'], "sredstvaVlozekGostiteljaFest");
        $I->assertGreaterThanOrEqual(180.22, $entR['sredstvaLastnaFest'], "sredstvaLastnaFest");
        $I->assertGreaterThanOrEqual(0, $entR['sredstvaVlozekGostiteljaRazno'], "sredstvaVlozekGostiteljaRazno");
        $I->assertGreaterThanOrEqual(297.85, $entR['sredstvaLastnaRazno'], "sredstvaLastnaRazno");
        $I->assertGreaterThanOrEqual(0, $entR['sredstvaVlozekGostiteljaIzjem'], "sredstvaVlozekGostiteljaIzjem");
        $I->assertGreaterThanOrEqual(128.46, $entR['sredstvaLastnaIzjem'], "sredstvaLastnaIzjem");

        $I->assertGreaterThanOrEqual(109.98, $entR['sredstvaInt'], "mednarodni viri");
        $I->assertEquals(3, $entR['stKoprodukcij'], "");
        $I->assertEquals(2, $entR['stKoprodukcijInt'], "število mednarodnih koprodukcij");
        $I->assertEquals(1, $entR['stKoprodukcijNVO'], "");
        $I->assertEquals(1, $entR['stKoprodukcijNVO'], "");

        $I->assertEquals(1.51, $entR['avgZasedDvoran'], "% povprečna zasedenost dvoran");
        $I->assertEquals(5.57, $entR['avgStNastopovIgr'], "povprečno število nastopov zaposlenih igralcev");
    }

    /**
     * creatu se kliče preracun metoda, kjer se kliče tudi preračun v programu dela
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function createEnoteProgramaZaPreracunKazalnikov(ApiTester $I)
    {
        //premiera
        $data                      = [
//            'celotnaVrednost'      => 26.2,
            'nasDelez'                => 26.2,
            'zaproseno'               => 1.24,
//            'lastnaSredstva'       => 11,
            'avtorskiHonorarji'       => 4.23,
            'avtorskiHonorarjiSamoz'  => 4.23,
            'tantieme'                => 5.23,
            'materialni'              => 5.23,
            'avtorskePravice'         => 5.23,
            'drugiViri'               => 1.24,
            'opredelitevDrugiViri'    => "zz",
//            'vlozekGostitelja'     => 1.24,
            'drugiJavni'              => 1.24,
//  
//            'drugiJavni'           => 1.24,
            'obiskDoma'               => 1,
            'obiskKopr'               => 0,
//            'obiskGost'          => 1,
//            'obiskZamejo'        => 1,
//            'obiskInt'           => 1,
//            'ponoviDoma'         => 1,
//            'ponoviZamejo'       => 1,
//            'ponoviGost'         => 1,
//            'ponoviInt'          => 1,
            'tipProgramskeEnote'      => $this->lookTipProgramskeEnote5['id'],
            'kpe'                     => 0.1,
//            'tip'                => 'premiera', // ali to polje potrebujemo - ne. Ne rabimo vnašati, samo se nastavi
            'sort'                    => 8,
            'stZaposUmet'             => 9,
            'stZaposDrug'             => 6,
            'stHonorarnihZun'         => 11,
            'stHonorarnihZunIgr'      => 3,
            'stHonorarnihZunIgrTujJZ' => 2,
            'stHonorarnihZunSamoz'    => 2,
            'uprizoritev'             => $this->lookUprizoritev5['id'],
            'dokument'                => $this->obj2['id'],
        ];
        // pri create bi moral preračunati kazalnike tudi v programu dela
        $this->objProgramPremiera3 = $ent                       = $I->successfullyCreate($this->programPremieraUrl, $data);
        $I->assertGuid($ent['id']);


        //ponovitev prejšnjih sezon 
        $data = [
//            'celotnaVrednost'         => 1.24,
//            'celotnaVrednostMat'      => 1.02,
            'celotnaVrednostGostovSZ' => 0.11,
            'nasDelez'                => 100.24,
            'zaproseno'               => 1.24,
//            'lastnaSredstva'          => 1.24,
            'avtorskiHonorarji'       => 63.21,
            'avtorskiHonorarjiSamoz'  => 63.21,
            'tantieme'                => 1.24,
            'materialni'              => 1.24,
            'avtorskePravice'         => 1.24,
            'drugiViri'               => 1.24,
            'drugiJavni'              => 1.24,
            'obiskDoma'               => 2,
            'obiskGost'               => 3,
            'obiskKoprGost'           => 3,
            'obiskKopr'               => 3,
            'obiskZamejo'             => 11,
            'obiskKoprZamejo'         => 11,
            'obiskInt'                => 12,
            'obiskKoprInt'            => 12,
            'ponoviDoma'              => 6,
            'ponoviZamejo'            => 7,
            'ponoviKoprZamejo'        => 7,
            'ponoviGost'              => 8,
            'ponoviKoprGost'          => 8,
            'ponoviKopr'              => 8,
            'ponoviInt'               => 9,
            'ponoviKoprInt'           => 9,
            'stZaposUmet'             => 1,
            'stZaposDrug'             => 1,
            'vlozekGostitelja'        => 1.24,
            'uprizoritev'             => $this->lookUprizoritev1['id'],
            'tipProgramskeEnote'      => $this->lookTipProgramskeEnote2['id'],
            'dokument'                => $this->obj2['id'],
        ];
        // pri create bi moral preračunati kazalnike tudi v programu dela
        $ent  = $I->successfullyCreate($this->programPonovitevPrejsnjihUrl, $data);
        $I->assertGuid($ent['id']);

        // ali so kazalniki pravilno preračunani?
        $entR = $I->successfullyGet($this->restUrl, $this->obj2['id']);
        codecept_debug($ent);
        $I->assertNotEmpty($entR['id']);
        $I->assertGreaterThanOrEqual(5, $entR['stPremier'], "št. premier");     // ena premiera bi morala biti sedaj več
        $I->assertGreaterThanOrEqual(0, $entR['stPremierVelikih'], "stPremierVelikih");
        $I->assertGreaterThanOrEqual(0, $entR['stPremierMalih'], "stPremierMalih");
        $I->assertGreaterThanOrEqual(0, $entR['stPremierMalihKopr'], "stPremierMalihKopr");
        $I->assertGreaterThanOrEqual(0, $entR['stPremierSredKopr'], "stPremierSredKopr");
        $I->assertGreaterThanOrEqual(0, $entR['stPremierVelikihKopr'], "stPremierVelikihKopr");
        $I->assertGreaterThanOrEqual(3, $entR['stPonPrem'], "št. ponovitev premiere");
        $I->assertGreaterThanOrEqual(4, $entR['stPonPrej'], "št. ponovitev prejšnjih sezon"); // ena ponovitev prejšnjih več
        $I->assertGreaterThanOrEqual(3, $entR['stGostujo'], "stGostujo");
    }

    /**
     *  kreiramo druge vire za več enot programa
     * 
     * 
     * @param ApiTester $I
     */
    public function createDrugeVireZaPreracunKazalnikov(ApiTester $I)
    {
        $data = [
            'znesek'        => 20.0,
            'opis'          => "dv 20",
            'enotaPrograma' => $this->objProgramPremiera1['id'],
            'mednarodni'    => TRUE,
        ];
        $ent  = $I->successfullyCreate($this->drugiVirUrl, $data);
        $I->assertGuid($ent['id']);

        // ali so kazalniki pravilno preračunani?
        $entR = $I->successfullyGet($this->restUrl, $this->obj2['id']);
        $I->assertNotEmpty($entR['id']);
        $I->assertGreaterThanOrEqual(129.98, $entR['sredstvaInt'], "mednarodni viri");     // za 20 € več
    }

    /**
     *  kreiramo Koprodukcije za več enot programa
     * 
     * 
     * @param ApiTester $I
     */
    public function createKoprodukcijeZaPreracunKazalnikov(ApiTester $I)
    {
        $data = [
            'delez'         => 0.06,
            'zaproseno'     => 0.01,
            'enotaPrograma' => $this->objProgramPonovitevPrejsnjih1['id'],
            'koproducent'   => $this->lookProdukcijskaHisa4['id'],
        ];

        $ent = $I->successfullyCreate($this->produkcijaDelitevUrl, $data);
        $I->assertGuid($ent['id']);

        // ali so kazalniki pravilno preračunani?
        $entR = $I->successfullyGet($this->restUrl, $this->obj2['id']);
        $I->assertNotEmpty($entR['id']);
        $I->assertEquals(3, $entR['stKoprodukcijInt'], "število mednarodnih koprodukcij");      // se poveča za 1
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updateSKoncemPredZacetkom(ApiTester $I)
    {
        $ent            = $this->obj2;
        $ent['zacetek'] = '2015-02-01T00:00:00+0100';
        $ent['konec']   = '2010-02-01T00:00:00+0100';             // prej kot začetek

        $resp = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertEquals(1000500, $resp[0]['code']);

        // če je enak čas
        $ent            = $this->obj2;
        $ent['zacetek'] = '2015-02-01T00:00:00+0100';
        $ent['konec']   = $ent['zacetek'];

        $entR = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertNotEmpty($entR['id']);

        // vrnemo nazaj čase
        $ent            = $this->obj2;
        $ent['zacetek'] = '2016-01-01T00:00:00+0100';
        $ent['konec']   = '2017-01-01T00:00:00+0100';

        $entR = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertNotEmpty($entR['id']);
    }

    /**
     * test validacij  
     *  
     * @param ApiTester $I
     */
    public function updateProgramPremieraValidacije(ApiTester $I)
    {
//        $this->expect($zaproseno <= $maxZaproseno, "Zaprošeno (" . $zaproseno . ") je lahko največ 70% deleža mat. JZ(" . $maxZaproseno . ")", 1000442);
        $data              = $this->objProgramPremiera1;
        $data['zaproseno'] = 3.47;
        $ent               = $I->successfullyUpdate($this->programPremieraUrl, $data['id'], $data);
        $I->assertGuid($ent['id']);

        $data              = $this->objProgramPremiera1;
        $data['zaproseno'] = 3.48;
        $resp              = $I->failToUpdate($this->programPremieraUrl, $data['id'], $data);
        $I->assertNotEmpty($resp);
        $I->assertEquals(1000442, $resp[0]['code']);
    }

    /**
     * test preračunov
     *  
     * @param ApiTester $I
     */
    public function deleteKoprodukcijaAliManjsaCelotnaVrednost(ApiTester $I)
    {
        $ep       = $I->successfullyGet($this->programPremieraUrl, $this->objProgramPremiera1['id']);
        $oldCelVr = $ep['celotnaVrednost'];
        $delezKop = 100;
        $newCelVr = $oldCelVr + $delezKop;

        // najprej dodano koprodukcijo
        $data = [
            'delez'         => $delezKop,
            'zaproseno'     => 5,
            'enotaPrograma' => $this->objProgramPremiera1['id'],
            'koproducent'   => $this->lookProdukcijskaHisa5['id'],
        ];
        $kopr = $I->successfullyCreate($this->produkcijaDelitevUrl, $data);
        $I->assertNotEmpty($kopr['id']);
        // ali se je vrednost popravila v EP?
        $ep   = $I->successfullyGet($this->programPremieraUrl, $this->objProgramPremiera1['id']);
        $ep   = $I->successfullyGet($this->programPremieraUrl, $this->objProgramPremiera1['id']);
        $I->assertEquals($newCelVr, $ep['celotnaVrednost'], "nova celotna vrednost v enoti programa");

        // zbrišemo koprodukcijo
        $ent = $I->successfullyDelete($this->produkcijaDelitevUrl, $kopr['id']);
        // ali se je vrednost popravila nazaj v EP?
        $ep  = $I->successfullyGet($this->programPremieraUrl, $this->objProgramPremiera1['id']);
        $I->assertEquals($oldCelVr, $ep['celotnaVrednost'], "stara celotna vrednost v enoti programa");
    }

    /**
     * test preračunov
     *  
     * @param ApiTester $I
     */
    public function deleteEnotaProgramaAliSpremenjenProgramDela(ApiTester $I)
    {
        $pd           = $I->successfullyGet($this->restUrl, $this->obj2['id']);
        $oldStPremier = $pd['stPremier'];
        $oldStPremier = $pd['stPremier'];
        codecept_debug($oldStPremier);

        // zbrišemo premiero
        $ent = $I->successfullyDelete($this->programPremieraUrl, $this->objProgramPremiera3['id']);
        // ali se je vrednost popravila nazaj v EP?
        $pd  = $I->successfullyGet($this->restUrl, $this->obj2['id']);
        $I->assertEquals($oldStPremier - 1, $pd['stPremier']);

//        Še zbrišemo en festival $$
    }

    /**
     * ta test smo ukinili le zato, ker zaenkrat nimamo priponk v enotah
     * programa in javi napako. Bi pa bilo dobro ta test imeti.
     */
    /**
     * zaklenemo program dela in testiramo, če so še možne spremembe
     * 
     * @depends create
     * @depends createVecProgramovFestivala
     * @depends createVecEnotPrograma
     * @depends createVecProgramovGostovanj
     * ...
     * @param ApiTester $I
     */
//    public function zakleniProgramDelaInPoskusSprememb(ApiTester $I)
//    {
//        // najprej zaklenemo program dela
//        $resp = $I->successfullyCallRpc($this->rpcUrl, 'zakleni', ["programDelaId" => $this->obj2['id']]);
//        $I->assertNotEmpty($resp);
//        $I->seeResponseIsJson();
//        $I->assertTrue($resp, "ali uspešno");
//
//        // probamo spremeniti program dela
//        $ent  = $I->successfullyGet($this->restUrl, $this->obj2['id']);
//        $I->assertTrue($ent['zakljuceno'], "ali zaključeno");
//        $resp = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
////                $this->expect(!zaklenjenProgramDela($object), "Program dela je že zaklenjen/zaključen. Spremembe niso več mogoče", 1000511);
//        $I->assertEquals(1000511, $resp[0]['code']);
//
//        // probamo spremeniti program premiere
//        $ent  = $I->successfullyGet($this->programPremieraUrl, $this->objProgramPremiera1['id']);
//        $I->assertGuid($ent['id']);
//        $resp = $I->failToUpdate($this->programPremieraUrl, $ent['id'], $ent);
//        $I->assertEquals(1000521, $resp[0]['code']);
//
//        // probamo spremeniti program ponovitve premiere
//        $ent  = $I->successfullyGet($this->programPonovitevPremiereUrl, $this->objProgramPonovitevPremiere1['id']);
//        $I->assertGuid($ent['id']);
//        $resp = $I->failToUpdate($this->programPonovitevPremiereUrl, $ent['id'], $ent);
//        $I->assertEquals(1000521, $resp[0]['code']);
//
//        // probamo spremeniti program ponovitve prejšnjih
//        $ent  = $I->successfullyGet($this->programPonovitevPrejsnjihUrl, $this->objProgramPonovitevPrejsnjih1['id']);
//        $I->assertGuid($ent['id']);
//        $resp = $I->failToUpdate($this->programPonovitevPrejsnjihUrl, $ent['id'], $ent);
//        $I->assertEquals(1000521, $resp[0]['code']);
//
//        // probamo spremeniti program gostujočih
//        $ent  = $I->successfullyGet($this->programGostujocaUrl, $this->objProgramGostujoca1['id']);
//        $I->assertGuid($ent['id']);
//        $resp = $I->failToUpdate($this->programGostujocaUrl, $ent['id'], $ent);
//        $I->assertEquals(1000521, $resp[0]['code']);
//
//        // probamo spremeniti program gostovanj
//        $ent  = $I->successfullyGet($this->programGostovanjaUrl, $this->objProgramGostovanj1['id']);
//        $I->assertGuid($ent['id']);
//        $resp = $I->failToUpdate($this->programGostovanjaUrl, $ent['id'], $ent);
//        $I->assertEquals(1000521, $resp[0]['code']);
//
//        // probamo spremeniti program festival
//        $ent  = $I->successfullyGet($this->programFestivalUrl, $this->objProgramFestival1['id']);
//        $I->assertGuid($ent['id']);
//        $resp = $I->failToUpdate($this->programFestivalUrl, $ent['id'], $ent);
//        $I->assertEquals(1000521, $resp[0]['code']);
//
//        // probamo spremeniti program izjemni
//        $ent  = $I->successfullyGet($this->programIzjemniUrl, $this->objProgramIzjemni1['id']);
//        $I->assertGuid($ent['id']);
//        $resp = $I->failToUpdate($this->programIzjemniUrl, $ent['id'], $ent);
//        $I->assertEquals(1000521, $resp[0]['code']);
//
//        // probamo spremeniti program razno
//        $ent  = $I->successfullyGet($this->programRaznoUrl, $this->objProgramRazno1['id']);
//        $I->assertGuid($ent['id']);
//        $resp = $I->failToUpdate($this->programRaznoUrl, $ent['id'], $ent);
//        $I->assertEquals(1000521, $resp[0]['code']);
//
//        // probamo spremeniti drugi vir od premiere
//        $ent  = $I->successfullyGet($this->drugiVirUrl, $this->objDrugiVir1['id']);
//        $I->assertGuid($ent['id']);
//        $resp = $I->failToUpdate($this->drugiVirUrl, $ent['id'], $ent);
//        $I->assertEquals(1000601, $resp[0]['code']);
//
//        // probamo spremeniti drugi vir od festivala
//        $ent  = $I->successfullyGet($this->drugiVirUrl, $this->objDrugiVir2['id']);
//        $I->assertGuid($ent['id']);
//        $resp = $I->failToUpdate($this->drugiVirUrl, $ent['id'], $ent);
//        $I->assertEquals(1000601, $resp[0]['code']);
//
//        // probamo spremeniti koprodukcijo od premiere
//        $ent  = $I->successfullyGet($this->produkcijaDelitevUrl, $this->objKoprodukcija1['id']);
//        $I->assertGuid($ent['id']);
//        $resp = $I->failToUpdate($this->produkcijaDelitevUrl, $ent['id'], $ent);
//        $I->assertEquals(1000611, $resp[0]['code']);
//
//        // probamo spremeniti koprodukcijo od festivala
//        $ent  = $I->successfullyGet($this->produkcijaDelitevUrl, $this->objKoprodukcija2['id']);
//        $I->assertGuid($ent['id']);
//        $resp = $I->failToUpdate($this->produkcijaDelitevUrl, $ent['id'], $ent);
//        $I->assertEquals(1000611, $resp[0]['code']);
//
//        // probamo spremeniti programsko enoto sklopa programa razno
//        $ent  = $I->successfullyGet($this->programskaEnotaSklopaUrl, $this->objPESklopa1['id']);
//        $I->assertGuid($ent['id']);
//        $resp = $I->failToUpdate($this->programskaEnotaSklopaUrl, $ent['id'], $ent);
//        $I->assertEquals(1000661, $resp[0]['code']);
//    }

    /**
     * 
     * @depends createVecEnotPrograma
     * @depends create
     * @param ApiTester $I
     */
    public function kloniraj(ApiTester $I)
    {
        // preberemo star program dela
        $oldPD = $I->successfullyGet($this->restUrl, $this->obj2['id']);
        $I->assertNotEmpty($oldPD);
//   
        // kloniramo program dela
        $resp  = $I->successfullyCallRpc($this->rpcUrl, 'kloniraj', ["programDelaId" => $this->obj2['id']]);
        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->assertGuid($resp);

        $ent  = $I->successfullyGet($this->restUrl, $resp);
//        codecept_debug($ent);
        // pri update preračuna kazalnike
        $entR = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertNotEmpty($entR['id']);
        $I->assertNotEquals($oldPD['id'], $entR['id'], " id");
        $I->assertNotEquals($oldPD['sifra'], $entR['sifra'], " id");
        $I->assertEquals($oldPD['stPremier'], $entR['stPremier'], "št. premier");
        $I->assertEquals($oldPD['stPremierVelikih'], $entR['stPremierVelikih'], "št. premier velikih predstav");
        $I->assertEquals($oldPD['stPremierMalih'], $entR['stPremierMalih'], "št. premier malih predstav");
        $I->assertEquals($oldPD['stPremierMalihKopr'], $entR['stPremierMalihKopr'], "št. premier predstav mallih kopr");
        $I->assertEquals($oldPD['stPremierSredKopr'], $entR['stPremierSredKopr'], "št. premier predstav srednjih koprodukcij");
        $I->assertEquals($oldPD['stPremierVelikihKopr'], $entR['stPremierVelikihKopr'], "št. premier predstav velikih koprodukcij");
        $I->assertEquals($oldPD['stPonPrem'], $entR['stPonPrem'], "št. ponovitev premiere");
        $I->assertEquals($oldPD['stPonPrej'], $entR['stPonPrej'], "št. ponovitev prejšnjih sezon");
        $I->assertEquals($oldPD['stPonPrejVelikih'], $entR['stPonPrejVelikih']);
        $I->assertEquals($oldPD['stPonPrejMalih'], $entR['stPonPrejMalih']);
        $I->assertEquals($oldPD['stPonPrejMalihKopr'], $entR['stPonPrejMalihKopr']);
        $I->assertEquals($oldPD['stPonPrejSredKopr'], $entR['stPonPrejSredKopr']);
        $I->assertEquals($oldPD['stPonPrejVelikihKopr'], $entR['stPonPrejVelikihKopr']);
        $I->assertEquals($oldPD['stGostujo'], $entR['stGostujo'], "št. ponovitev premiere");
        $I->assertEquals($oldPD['vrPS1'], $entR['vrPS1'], "vrednost PS1");
        $I->assertEquals($oldPD['vrPS1Mat'], $entR['vrPS1Mat'], "vr PS1 mat");
        $I->assertEquals($oldPD['vrPS1GostovSZ'], $entR['vrPS1GostovSZ'], "vr ps1 gostov slo zam");
        $I->assertEquals($oldPD['vrPS1Do'], $entR['vrPS1Do']);
        $I->assertEquals($oldPD['stIzvNekomerc'], $entR['stIzvNekomerc'], "št nekomerc");
        $I->assertEquals($oldPD['stIzvPrem'], $entR['stIzvPrem'], "št. izvedb premier");
        $I->assertEquals($oldPD['stIzvPonPrem'], $entR['stIzvPonPrem'], "št. izvedb pon premier");
        $I->assertEquals($oldPD['stIzvPonPremDoma'], $entR['stIzvPonPremDoma'], "stIzvPonPremDoma");
        $I->assertEquals($oldPD['stIzvPonPremZamejo'], $entR['stIzvPonPremZamejo'], "stIzvPonPremZamejo");
        $I->assertEquals($oldPD['stIzvPonPremGost'], $entR['stIzvPonPremGost'], "stIzvPonPremGost");
        $I->assertEquals($oldPD['stIzvPonPremKopr'], $entR['stIzvPonPremKopr'], "stIzvPonPremKopr");
        $I->assertEquals($oldPD['stIzvPonPremKoprInt'], $entR['stIzvPonPremKoprInt'], "stIzvPonPremKoprInt");
        $I->assertEquals($oldPD['stIzvPonPremInt'], $entR['stIzvPonPremInt'], "stIzvPonPremInt");
        $I->assertEquals($oldPD['stIzvPonPrej'], $entR['stIzvPonPrej'], "št. izvedb prejšnjih");
        $I->assertEquals($oldPD['stIzvPonPrejDoma'], $entR['stIzvPonPrejDoma'], "stIzvPonPrejDoma");
        $I->assertEquals($oldPD['stIzvPonPrejZamejo'], $entR['stIzvPonPrejZamejo'], "stIzvPonPrejZamejo");
        $I->assertEquals($oldPD['stIzvPonPrejGost'], $entR['stIzvPonPrejGost'], "stIzvPonPrejGost");
        $I->assertEquals($oldPD['stIzvPonPrejKopr'], $entR['stIzvPonPrejKopr'], "stIzvPonPrejKopr");
        $I->assertEquals($oldPD['stIzvPonPrejKoprInt'], $entR['stIzvPonPrejKoprInt'], "stIzvPonPrejKoprInt");
        $I->assertEquals($oldPD['stIzvPonPrejInt'], $entR['stIzvPonPrejInt'], "stIzvPonPrejInt");
        $I->assertEquals($oldPD['stIzvGostuj'], $entR['stIzvGostuj'], "št. izvedb gostujočih");
        $I->assertEquals($oldPD['stIzvOstalihNek'], $entR['stIzvOstalihNek'], "št. izvedb ostalih nekom");
        $I->assertEquals($oldPD['stIzvGostovanjSlo'], $entR['stIzvGostovanjSlo'], "");
        $I->assertEquals($oldPD['stIzvGostovanjZam'], $entR['stIzvGostovanjZam'], "");
        $I->assertEquals($oldPD['stIzvGostovanjInt'], $entR['stIzvGostovanjInt'], "");
        $I->assertEquals($oldPD['stObiskNekom'], $entR['stObiskNekom'], "Obisk vseh nekom.");
        $I->assertEquals($oldPD['stObiskNekomMat'], $entR['stObiskNekomMat'], "");
        $I->assertEquals($oldPD['stObiskNekomGostSlo'], $entR['stObiskNekomGostSlo'], "");
        $I->assertEquals($oldPD['stObiskNekomGostZam'], $entR['stObiskNekomGostZam'], "");
        $I->assertEquals($oldPD['stObiskNekomGostInt'], $entR['stObiskNekomGostInt'], "");
        $I->assertEquals($oldPD['stObiskPrem'], $entR['stObiskPrem'], "stObiskPrem");
        $I->assertEquals($oldPD['stObiskPonPrem'], $entR['stObiskPonPrem'], "stObiskPonPrem");
        $I->assertEquals($oldPD['stObiskPonPremDoma'], $entR['stObiskPonPremDoma'], "stObiskPonPremDoma");
        $I->assertEquals($oldPD['stObiskPonPremKopr'], $entR['stObiskPonPremKopr'], "stObiskPonPremKopr");
        $I->assertEquals($oldPD['stObiskPonPremKoprInt'], $entR['stObiskPonPremKoprInt'], "stObiskPonPremKoprInt");
        $I->assertEquals($oldPD['avgObiskPrired'], $entR['avgObiskPrired'], "povprečno št. obiskovalcev");     //kvocient drugih dveh števil
        $I->assertEquals($oldPD['stHonorarnihZun'], $entR['stHonorarnihZun'], "");
        $I->assertEquals($oldPD['stHonorarnihZunIgr'], $entR['stHonorarnihZunIgr'], "");
        $I->assertEquals($oldPD['stHonorarnihZunIgrTujJZ'], $entR['stHonorarnihZunIgrTujJZ'], "");
        $I->assertEquals($oldPD['stHonorarnihZunSamoz'], $entR['stHonorarnihZunSamoz'], "");
        $I->assertEquals($oldPD['sredstvaAvt'], $entR['sredstvaAvt'], "sredstvaAvt");
        $I->assertEquals($oldPD['sredstvaAvtSamoz'], $entR['sredstvaAvtSamoz'], "sredstvaAvtSamoz");
        $I->assertEquals($oldPD['sredstvaZaprosenoPrem'], $entR['sredstvaZaprosenoPrem'], "sredstvaZaprosenoPrem");
        $I->assertEquals($oldPD['sredstvaZaprosenoPonPrem'], $entR['sredstvaZaprosenoPonPrem'], "sredstvaZaprosenoPonPrem");
        $I->assertEquals($oldPD['sredstvaZaprosenoPonPrej'], $entR['sredstvaZaprosenoPonPrej'], "sredstvaZaprosenoPonPrej");
        $I->assertEquals($oldPD['sredstvaZaprosenoGostujo'], $entR['sredstvaZaprosenoGostujo'], "sredstvaZaprosenoGostujo");
        $I->assertEquals($oldPD['sredstvaZaprosenoInt'], $entR['sredstvaZaprosenoInt'], "sredstvaZaprosenoInt");
        $I->assertEquals($oldPD['sredstvaZaprosenoFest'], $entR['sredstvaZaprosenoFest'], "sredstvaZaprosenoFest");
        $I->assertEquals($oldPD['sredstvaZaprosenoRazno'], $entR['sredstvaZaprosenoRazno'], "sredstvaZaprosenoRazno");
        $I->assertEquals($oldPD['sredstvaZaprosenoIzjem'], $entR['sredstvaZaprosenoIzjem'], "sredstvaZaprosenoIzjem");
        $I->assertEquals($oldPD['sredstvaDrugiJavniPrem'], $entR['sredstvaDrugiJavniPrem'], "sredstvaDrugiJavniPrem");
        $I->assertEquals($oldPD['sredstvaDrugiJavniPonPrem'], $entR['sredstvaDrugiJavniPonPrem'], "sredstvaDrugiJavniPonPrem");
        $I->assertEquals($oldPD['sredstvaDrugiJavniPonPrej'], $entR['sredstvaDrugiJavniPonPrej'], "sredstvaDrugiJavniPonPrej");
        $I->assertEquals($oldPD['sredstvaDrugiJavniGostujo'], $entR['sredstvaDrugiJavniGostujo'], "sredstvaDrugiJavniGostujo");
        $I->assertEquals($oldPD['sredstvaDrugiJavniInt'], $entR['sredstvaDrugiJavniInt'], "sredstvaDrugiJavniInt");
        $I->assertEquals($oldPD['sredstvaDrugiJavniFest'], $entR['sredstvaDrugiJavniFest'], "sredstvaDrugiJavniFest");
        $I->assertEquals($oldPD['sredstvaDrugiJavniRazno'], $entR['sredstvaDrugiJavniRazno'], "sredstvaDrugiJavniRazno");
        $I->assertEquals($oldPD['sredstvaDrugiJavniIzjem'], $entR['sredstvaDrugiJavniIzjem'], "sredstvaDrugiJavniIzjem");
        $I->assertEquals($oldPD['sredstvaDrugiViriPrem'], $entR['sredstvaDrugiViriPrem'], "sredstvaDrugiViriPrem");
        $I->assertEquals($oldPD['sredstvaDrugiViriPonPrem'], $entR['sredstvaDrugiViriPonPrem'], "sredstvaDrugiViriPonPrem");
        $I->assertEquals($oldPD['sredstvaDrugiViriPonPrej'], $entR['sredstvaDrugiViriPonPrej'], "sredstvaDrugiViriPonPrej");
        $I->assertEquals($oldPD['sredstvaDrugiViriGostujo'], $entR['sredstvaDrugiViriGostujo'], "sredstvaDrugiViriGostujo");
        $I->assertEquals($oldPD['sredstvaDrugiViriInt'], $entR['sredstvaDrugiViriInt'], "sredstvaDrugiViriInt");
        $I->assertEquals($oldPD['sredstvaDrugiViriFest'], $entR['sredstvaDrugiViriFest'], "sredstvaDrugiViriFest");
        $I->assertEquals($oldPD['sredstvaDrugiViriRazno'], $entR['sredstvaDrugiViriRazno'], "sredstvaDrugiViriRazno");
        $I->assertEquals($oldPD['sredstvaDrugiViriIzjem'], $entR['sredstvaDrugiViriIzjem'], "sredstvaDrugiViriIzjem");
        $I->assertEquals($oldPD['sredstvaInt'], $entR['sredstvaInt'], "mednarodni viri");
        $I->assertEquals($oldPD['stKoprodukcij'], $entR['stKoprodukcij'], "");
        $I->assertEquals($oldPD['stKoprodukcijInt'], $entR['stKoprodukcijInt'], "število mednarodnih koprodukcij");
        $I->assertEquals($oldPD['stKoprodukcijNVO'], $entR['stKoprodukcijNVO'], "");
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function podatkiPrilogaC2(ApiTester $I)
    {
        $resp = $I->successfullyCallRpc($this->rpcUrl, 'podatkiPrilogaC2', ["programDelaId" => $this->obj2['id']]);
        codecept_debug($resp);
        $I->assertNotEmpty($resp);
        $I->seeResponseIsJson();
        $I->assertGreaterThanOrEqual(726.2, $resp['2.0']['vrednost']['premiere'], "['premiere']['2.0']");
        $I->assertGreaterThanOrEqual(726.2, $resp['2.1']['vrednost']['premiere'], "['premiere']['2.1']");
        $I->assertGreaterThanOrEqual(40, $resp['H.1']['vrednost']['premiere'], "['premiere']['H.1']");
        $I->assertGreaterThanOrEqual(330, $resp['T.0']['vrednost']['premiere'], "['premiere']['T.0']");
        $I->assertGreaterThanOrEqual(300, $resp['T.1']['vrednost']['premiere'], "['premiere']['T.1']");
        $I->assertGreaterThanOrEqual(30, $resp['T.2']['vrednost']['premiere'], "['premiere']['T.2']");
        $I->assertGreaterThanOrEqual(1096.2, $resp['Skupaj']['vrednost']['premiere'], "['premiere']['Skupaj']");
//        $I->assertGreaterThanOrEqual(1080, $resp['ponovitvePremier']['Skupaj']['vrednost'],"['ponovitvePremier']['Skupaj']");
//        $I->assertGreaterThanOrEqual(747.9, $resp['ponovitvePrejsnjih']['Skupaj']['vrednost'],"['ponovitvePremier']['Skupaj']");
        $I->assertGreaterThanOrEqual(841, $resp['Skupaj']['vrednost']['ponovitvePremier'], "['ponovitvePremier']['Skupaj']");
        $I->assertGreaterThanOrEqual(610, $resp['H.1']['vrednost']['ponovitvePremier'], "['ponovitvePremier']['H.1']");
        $I->assertGreaterThanOrEqual(504.6, $resp['Skupaj']['vrednost']['ponovitvePrejsnjih'], "['ponovitvePrejsnjih']['Skupaj']");
        $I->assertGreaterThanOrEqual(366, $resp['H.1']['vrednost']['ponovitvePrejsnjih'], "['ponovitvePrejsnjih']['H.1']");
        $I->assertGreaterThanOrEqual(888.7, $resp['Skupaj']['vrednost']['gostovanjaZamejstvo'], "['gostovanjaZamejstvo']['Skupaj']");
        $I->assertGreaterThanOrEqual(427, $resp['H.1']['vrednost']['gostovanjaZamejstvo'], "['gostovanjaZamejstvo']['H.1']");
    }

    /**
     * osvežim/kreiram tabelo C2 ¸
     * 
     * @param ApiTester $I
     */
    public function osveziTabeloC2(ApiTester $I)
    {
        // pričakujemo, da bo zgeneriral/osvežil postavke C2 za dotičen program dela
        $resp = $I->successfullyCallRpc($this->rpcUrl, 'osveziTabeloC2', ["programDelaId" => $this->obj2['id']]);
        $I->assertNotEmpty($resp);
        $I->seeResponseIsJson();
        $I->assertTrue($resp, "ali uspešno");
    }

    /**
     * brisanje programa dela z vsemi podentitetami
     * 
     * @depends create
     */
    public function deletePDSPodentitetami(ApiTester $I)
    {
        $I->successfullyDelete($this->restUrl, $this->obj2['id']);
        $I->failToGet($this->restUrl, $this->obj2['id']);
    }

}
