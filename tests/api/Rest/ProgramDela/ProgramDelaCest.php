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

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
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
    public function lookupProdukcijskaHisa(ApiTester $I)
    {

        $resp = $I->successfullyGetList($this->lookupProdukcijskaHisa, []);
        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->assertTrue(array_key_exists('data', $resp), "ima data");
        $I->assertGreaterThanOrEqual(1, $resp['state']['totalRecords'], "total records");

        $ind                         = array_search("0900", array_column($resp['data'], 'ident'));
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
            'zacetek'          => '2015-02-01T00:00:00+0100',
            'konec'            => '2016-02-01T00:00:00+0100',
            'potrjenProgram'   => false,
            'sezona'           => null,
            'avgZasedDvoran'   => 7.89,
            'avgCenaVstopnice' => 7.89,
            'stProdVstopnic'   => 7,
            'stZaposlenih'     => 7,
            'stZaposIgralcev'  => 7,
            'avgStNastopovIgr' => 7.89,
//            'vrPS1Mat'         => 7.89,
//            'vrPS1GostovSZ'    => 7.89,
//            'stHonorarnih'         => 7,
//            'stHonorarnihIgr'      => 7,
//            'stHonorarnihIgrTujJZ' => 7,
//            'sredstvaInt'          => 7.89,
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['naziv'], 'zz');

// kreiramo še en zapis
        $data       = [
//            'sifra'          => 'BB',
            'naziv'          => 'bb',
            'zacetek'        => '2016-02-01T00:00:00+0100',
            'konec'          => '2017-02-01T00:00:00+0100',
            'potrjenProgram' => TRUE,
            'sezona'         => null,
//            'vrPS1Mat'       => 7.89,
//            'vrPS1GostovSZ'  => 7.89,
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['naziv'], 'bb');
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

        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent['sifra']);
        $I->assertEquals(substr($ent['sifra'], 0, 2), '20', "šifra 0-1");
        $I->assertEquals(substr($ent['sifra'], 4, 1), '-', "šifra 0-1");
        $I->assertEquals($ent['naziv'], 'yy');
        $I->assertEquals($ent['zacetek'], '2015-02-01T00:00:00+0100');
        $I->assertEquals($ent['konec'], '2016-02-01T00:00:00+0100');
        $I->assertEquals($ent['potrjenProgram'], false);
        $I->assertEquals($ent['sezona'], null);
        $I->assertEquals($ent['avgZasedDvoran'], 7.89);
        $I->assertEquals($ent['avgCenaVstopnice'], 7.89);
        $I->assertEquals($ent['stProdVstopnic'], 7);
        $I->assertEquals($ent['stZaposlenih'], 7);
        $I->assertEquals($ent['stZaposIgralcev'], 7);
        $I->assertEquals($ent['avgStNastopovIgr'], 7.89);
//        $I->assertEquals($ent['vrPS1Mat'], 7.89);
//        $I->assertEquals($ent['vrPS1GostovSZ'], 7.89);
//        $I->assertEquals($ent['stHonorarnih'], 7);
//        $I->assertEquals($ent['stHonorarnihIgr'], 7);
//        $I->assertEquals($ent['stHonorarnihIgrTujJZ'], 7);
//        $I->assertEquals($ent['sredstvaInt'], 7.89);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListVse(ApiTester $I)
    {
        $listUrl = $this->restUrl . "/vse";
        codecept_debug($listUrl);
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];

        $I->assertNotEmpty($list);
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
    }

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
        codecept_debug($this->obj2);
        //premiera
        $data                      = [
            'celotnaVrednost'      => 1.24,
            'nasDelez'             => 100.24,
            'zaprosenProcent'      => 30,
//            'zaproseno'            =>1.24,
            'lastnaSredstva'       => 1.24,
            'avtorskiHonorarji'    => 1.24,
            'tantieme'             => 1.24,
            'drugiViri'            => 1.24,
            'opredelitevDrugiViri' => "zz",
//            'vlozekGostitelja'     => 1.24,
            'vlozekKoproducenta'   => 1.24,
            'drugiJavni'           => 1.24,
//            'obiskDoma'          => 1,
//            'obiskGost'          => 1,
//            'obiskZamejo'        => 1,
//            'obiskInt'           => 1,
//            'ponoviDoma'         => 1,
//            'ponoviZamejo'       => 1,
//            'ponoviGost'         => 1,
//            'ponoviInt'          => 1,
            'utemeljitev'          => 'zz',
            'tipProgramskeEnote'   => $this->lookTipProgramskeEnote1['id'],
//            'tip'                => 'premiera', // ali to polje potrebujemo - ne. Ne rabimo vnašati, samo se nastavi
            'sort'                 => 1,
            'stZaposUmet'          => 1,
            'stZaposDrug'          => 1,
            'stHonorarnih'         => 10,
            'stHonorarnihIgr'      => 7,
            'stHonorarnihIgrTujJZ' => 5,
            'uprizoritev'          => NULL,
            'dokument'             => $this->obj2['id'],
        ];
        $this->objProgramPremiera1 = $ent                       = $I->successfullyCreate($this->programPremieraUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['utemeljitev'], 'zz');

        // še ena premiera
        $data                      = [
            'celotnaVrednost'      => 2.22,
            'nasDelez'             => 200.22,
            'zaprosenProcent'      => 30,
//            'zaproseno'            =>1.24,
            'lastnaSredstva'       => 2.22,
            'avtorskiHonorarji'    => 2.22,
            'tantieme'             => 2.22,
            'drugiViri'            => 2.22,
            'opredelitevDrugiViri' => "zz",
//            'vlozekGostitelja'     => 2.22,
            'vlozekKoproducenta'   => 2.22,
            'drugiJavni'           => 2.22,
//            'obiskDoma'          => 1,
//            'obiskGost'          => 1,
//            'obiskZamejo'        => 1,
//            'obiskInt'           => 1,
//            'ponoviDoma'         => 1,
//            'ponoviZamejo'       => 1,
//            'ponoviGost'         => 1,
//            'ponoviInt'          => 1,
            'utemeljitev'          => 'zz2',
            'tipProgramskeEnote'   => $this->lookTipProgramskeEnote1['id'],
//            'tip'                => 'premiera', // ali to polje potrebujemo - ne. Ne rabimo vnašati, samo se nastavi
            'sort'                 => 2,
            'stZaposUmet'          => 2,
            'stZaposDrug'          => 2,
            'stHonorarnih'         => 9,
            'stHonorarnihIgr'      => 6,
            'stHonorarnihIgrTujJZ' => 2,
            'uprizoritev'          => NULL,
            'dokument'             => $this->obj2['id'],
        ];
        $this->objProgramPremiera2 = $ent                       = $I->successfullyCreate($this->programPremieraUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['utemeljitev'], 'zz2');

        //ponovitev premiere
        $data                               = [
            'celotnaVrednost'         => 1.24,
            'celotnaVrednostMat'      => 1.02,
            'celotnaVrednostGostovSZ' => 0.11,
            'nasDelez'                => 100.24,
            'zaprosenProcent'         => 30,
//            'zaproseno'            =>1.24,
            'lastnaSredstva'          => 1.24,
            'avtorskiHonorarji'       => 33.22,
            'tantieme'                => 1.24,
            'drugiViri'               => 1.24,
            'drugiJavni'              => 1.24,
            'obiskDoma'               => 21,
            'obiskGost'               => 31,
            'obiskZamejo'             => 7,
            'obiskInt'                => 3,
            'ponoviDoma'              => 2,
            'ponoviZamejo'            => 3,
            'ponoviGost'              => 4,
            'ponoviInt'               => 5,
            'utemeljitev'             => 'zz',
            'uprizoritev'             => $this->lookUprizoritev2['id'],
            'vlozekGostitelja'        => 1.24,
            'vlozekKoproducenta'      => 1.24,
            'tipProgramskeEnote'      => $this->lookTipProgramskeEnote1['id'],
            'dokument'                => $this->obj2['id'],
        ];
        $this->objProgramPonovitevPremiere1 = $ent                                = $I->successfullyCreate($this->programPonovitevPremiereUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['utemeljitev'], 'zz');

        //ponovitev prejšnjih sezon 
        $data                                = [
            'celotnaVrednost'         => 1.24,
            'celotnaVrednostMat'      => 1.02,
            'celotnaVrednostGostovSZ' => 0.11,
            'nasDelez'                => 100.24,
            'zaprosenProcent'         => 30,
//            'zaproseno'            =>1.24,
            'lastnaSredstva'          => 1.24,
            'avtorskiHonorarji'       => 63.21,
            'tantieme'                => 1.24,
            'drugiViri'               => 1.24,
            'drugiJavni'              => 1.24,
            'obiskDoma'               => 2,
            'obiskGost'               => 3,
            'obiskZamejo'             => 11,
            'obiskInt'                => 12,
            'ponoviDoma'              => 6,
            'ponoviZamejo'            => 7,
            'ponoviGost'              => 8,
            'ponoviInt'               => 9,
            'stZaposUmet'             => 1,
            'stZaposDrug'             => 1,
            'utemeljitev'             => 'pon prej 1',
            'vlozekKoproducenta'      => 1.24,
            'vlozekGostitelja'        => 1.24,
            'uprizoritev'             => $this->lookUprizoritev4['id'],
            'tipProgramskeEnote'      => $this->lookTipProgramskeEnote3['id'],
            'dokument'                => $this->obj2['id'],
        ];
        $this->objProgramPonovitevPrejsnjih1 = $ent                                 = $I->successfullyCreate($this->programPonovitevPrejsnjihUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['utemeljitev'], 'pon prej 1');

        //izjemni 
        $data                     = [
            'naziv'                => "zz",
            'celotnaVrednost'      => 1.24,
            'nasDelez'             => 100.24,
            'zaprosenProcent'      => 30,
//            'zaproseno'            =>1.24,
            'lastnaSredstva'       => 1.24,
            'avtorskiHonorarji'    => 127.22,
            'tantieme'             => 1.24,
            'drugiViri'            => 1.24,
            'opredelitevDrugiViri' => "zz",
//            'vlozekGostitelja'     => 1.24,
//            'vlozekKoproducenta'   => 1.24,
            'drugiJavni'           => 1.24,
            'obiskDoma'            => 14,
//            'obiskGost'            => 1,
//            'obiskZamejo'          => 1,
//            'obiskInt'             => 1,
            'ponoviDoma'           => 5,
            'ponoviZamejo'         => 4,
            'ponoviGost'           => 5,
//            'ponoviInt'            => 1,
            'utemeljitev'          => 'zz',
//            'uprizoritev'          => NULL,
//            'tipProgramskeEnote'   => $this->lookTipProgramskeEnote1['id'],
            'sort'                 => 1,
            'stZaposlenih'         => 1,
//            'stZaposDrug'             => 1,
            'stHonorarnih'         => 5,
            'stHonorarnihIgr'      => 3,
            'stHonorarnihIgrTujJZ' => 1,
            'dokument'             => $this->obj2['id'],
        ];
        $this->objProgramIzjemni1 = $ent                      = $I->successfullyCreate($this->programIzjemniUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['utemeljitev'], 'zz');

        //gostujoca 
        $data                       = [
            'celotnaVrednost'    => 1.24,
            'nasDelez'           => 100.24,
            'zaprosenProcent'    => 30,
//            'zaproseno'            =>1.24,
            'lastnaSredstva'     => 1.24,
            'avtorskiHonorarji'  => 26.12,
            'tantieme'           => 1.24,
            'drugiViri'          => 1.24,
            'drugiJavni'         => 1.24,
            'obiskDoma'          => 4,
            'obiskGost'          => 1,
            'obiskZamejo'        => 1,
            'obiskInt'           => 1,
            'ponoviDoma'         => 2,
            'ponoviZamejo'       => 3,
            'ponoviGost'         => 2,
            'ponoviInt'          => 3,
            'utemeljitev'        => 'zz',
            'uprizoritev'        => NULL,
            'tipProgramskeEnote' => $this->lookTipProgramskeEnote1['id'],
            'dokument'           => $this->obj2['id'],
        ];
        $this->objProgramGostujoca1 = $ent                        = $I->successfullyCreate($this->programGostujocaUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['utemeljitev'], 'zz');
    }

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
            'naziv'                   => 'zz',
            'zvrst'                   => 'zz',
            'stPredstav'              => 1,
            'stPredavanj'             => 1,
            'stPredstavitev'          => 1,
            'stDelavnic'              => 1,
            'stDrugiDogodki'          => 1,
            'opredelitevDrugiDogodki' => 'zz',
            'stProdukcij'             => 1,
            'obiskDoma'               => 133,
            'casPriprave'             => 'zz',
            'casIzvedbe'              => 'zz',
            'prizorisca'              => 'zz',
            'umetVodja'               => 'zz',
            'programskoTelo'          => 'zz',
            'soorganizatorji'         => 'zz',
            'stTujihSelektorjev'      => 1,
            'stZaposlenih'            => 1,
            'stHonorarnih'            => 22,
            'zaprosenProcent'         => 30,
//            'zaproseno'            =>1.24,
            'celotnaVrednost'         => 1.24,
            'nasDelez'                => 100.24,
            'lastnaSredstva'          => 1.24,
            'drugiViri'               => 1.24,
            'opredelitevDrugiViri'    => 'zz',
            'vlozekKoproducenta'      => 1.24,
            'drugiJavni'              => 1.24,
            'sort'                    => 1,
            'programDela'             => $this->obj2['id'],
        ];
        $this->objProgramFestival1 = $ent                       = $I->successfullyCreate($this->programFestivalUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // kreiramo še en zapis
        $data                      = [
            'naziv'                   => 'zz',
            'zvrst'                   => 'zz',
            'stPredstav'              => 1,
            'stPredavanj'             => 1,
            'stPredstavitev'          => 1,
            'stDelavnic'              => 1,
            'stDrugiDogodki'          => 1,
            'opredelitevDrugiDogodki' => 'zz',
            'stProdukcij'             => 1,
            'obiskDoma'               => 92,
            'casPriprave'             => 'zz',
            'casIzvedbe'              => 'zz',
            'prizorisca'              => 'zz',
            'umetVodja'               => 'zz',
            'programskoTelo'          => 'zz',
            'soorganizatorji'         => 'zz',
            'stTujihSelektorjev'      => 1,
            'stZaposlenih'            => 1,
            'stHonorarnih'            => 30,
            'zaprosenProcent'         => 30,
//            'zaproseno'            =>1.24,
            'celotnaVrednost'         => 1.24,
            'nasDelez'                => 100.24,
            'lastnaSredstva'          => 1.24,
            'drugiViri'               => 1.24,
            'opredelitevDrugiViri'    => 'zz',
            'vlozekKoproducenta'      => 1.24,
            'drugiJavni'              => 1.24,
            'sort'                    => 1,
            'programDela'             => $this->obj2['id'],
        ];
        $this->objProgramFestival2 = $ent                       = $I->successfullyCreate($this->programFestivalUrl, $data);
        $I->assertNotEmpty($ent['id']);
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
            'dokument'           => $this->obj2['id'],
//            'uprizoritev'        => $this->lookUprizoritev['id'],
            'uprizoritev'        => $this->lookUprizoritev1['id'],
            'krajGostovanja'     => 'zz',
            'ustanova'           => 'zz',
            'datumGostovanja'    => '2011-02-01T00:00:00+0100',
            'ponoviInt'          => 9,
            'obiskInt'           => 9,
            'zaprosenProcent'    => 30,
//            'zaproseno'            =>1.24,
            'nasDelez'           => 90.12,
            'transportniStroski' => 9.12,
            'avtorskiHonorarji'  => 9.12,
            'odkup'              => 9.12,
            'lastnaSredstva'     => 9.12,
            'drugiViri'          => 9.12,
            'drugiJavni'         => 9.12,
            'gostitelj'          => null,
            'sort'               => 1,
        ];
        $this->objProgramGostovanj1 = $ent                        = $I->successfullyCreate($this->programGostovanjaUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // kreiramo še en zapis
        $data                       = [
            'dokument'           => $this->obj2['id'],
            'uprizoritev'        => $this->lookUprizoritev4['id'],
            'krajGostovanja'     => 'zz',
            'ustanova'           => 'zz',
            'datumGostovanja'    => '2011-02-01T00:00:00+0100',
            'ponoviInt'          => 11,
            'obiskInt'           => 9,
            'zaprosenProcent'    => 30,
//            'zaproseno'            =>1.24,
            'nasDelez'           => 90.12,
            'transportniStroski' => 9.12,
            'avtorskiHonorarji'  => 48.33,
            'odkup'              => 9.12,
            'lastnaSredstva'     => 9.12,
            'drugiViri'          => 9.12,
            'drugiJavni'         => 9.12,
            'gostitelj'          => null,
            'sort'               => 1,
        ];
        $this->objProgramGostovanj2 = $ent                        = $I->successfullyCreate($this->programGostovanjaUrl, $data);
        $I->assertNotEmpty($ent['id']);
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
            'naslovPE'        => 'zz',
            'avtorPE'         => 'zz',
            'obsegPE'         => 'zz',
            'mesecPE'         => 'zz',
            'vrednostPE'      => 1.24,
            'stPE'            => 1,
            'soorganizator'   => null,
            'obiskDoma'       => 6,
            'stZaposlenih'    => 1,
            'stHonorarnih'    => 18,
            'zaprosenProcent' => 30,
//            'zaproseno'            =>1.24,
            'nasDelez'        => 100.24,
            'lastnaSredstva'  => 1.24,
            'drugiViri'       => 1.24,
            'drugiJavni'      => 1.24,
            'sort'            => 1,
        ];
        $this->objProgramRazno1 = $ent                    = $I->successfullyCreate($this->programRaznoUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // kreiramo še en zapis
        $data                   = [
            'dokument'        => $this->obj2['id'],
            'naziv'           => 'zz',
            'naslovPE'        => 'zz',
            'avtorPE'         => 'zz',
            'obsegPE'         => 'zz',
            'mesecPE'         => 'zz',
            'vrednostPE'      => 1.24,
            'stPE'            => 1,
            'soorganizator'   => null,
            'obiskDoma'       => 22,
            'stZaposlenih'    => 1,
            'stHonorarnih'    => 14,
            'zaprosenProcent' => 30,
//            'zaproseno'            =>1.24,
            'nasDelez'        => 100.24,
            'lastnaSredstva'  => 1.24,
            'drugiViri'       => 1.24,
            'drugiJavni'      => 1.24,
            'sort'            => 1,
        ];
        $this->objProgramRazno2 = $ent                    = $I->successfullyCreate($this->programRaznoUrl, $data);
        $I->assertNotEmpty($ent['id']);
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
            'celotnaVrednost'      => 1.24,
            'nasDelez'             => 100.24,
            'zaprosenProcent'      => 30,
//            'zaproseno'            =>1.24,
            'lastnaSredstva'       => 1.24,
            'avtorskiHonorarji'    => 41.24,
            'tantieme'             => 1.24,
            'drugiViri'            => 1.24,
            'opredelitevDrugiViri' => "zz",
//            'vlozekGostitelja'     => 1.24,
            'vlozekKoproducenta'   => 1.24,
            'drugiJavni'           => 1.24,
//            'obiskDoma'          => 1,
//            'obiskGost'          => 1,
//            'obiskZamejo'        => 1,
//            'obiskInt'           => 1,
//            'ponoviDoma'         => 1,
//            'ponoviZamejo'       => 1,
//            'ponoviGost'         => 1,
//            'ponoviInt'          => 1,
            'utemeljitev'          => 'zz',
//            'tip'                => 'premiera', // ali to polje potrebujemo - ne. Ne rabimo vnašati, samo se nastavi
            'sort'                 => 1,
            'stZaposUmet'          => 1,
            'stZaposDrug'          => 1,
            'stHonorarnih'         => 1,
            'stHonorarnihIgr'      => 1,
            'stHonorarnihIgrTujJZ' => 1,
            'tipProgramskeEnote'   => $this->lookTipProgramskeEnote1['id'],
            'dokument'             => $this->obj2['id'],
            'uprizoritev'          => $this->lookUprizoritev1['id'], // ista uprizoritev
        ];
        $ent  = $I->successfullyCreate($this->programPremieraUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // poizkusimo kreirati še en zapis z isto uprizoritvijo
        $data = [
            'celotnaVrednost'      => 1.24,
            'nasDelez'             => 100.24,
            'zaprosenProcent'      => 30,
//            'zaproseno'            =>1.24,
            'lastnaSredstva'       => 1.24,
            'avtorskiHonorarji'    => 1.24,
            'tantieme'             => 1.24,
            'drugiViri'            => 1.24,
            'opredelitevDrugiViri' => "zz",
//            'vlozekGostitelja'     => 1.24,
            'vlozekKoproducenta'   => 1.24,
            'drugiJavni'           => 1.24,
//            'obiskDoma'          => 1,
//            'obiskGost'          => 1,
//            'obiskZamejo'        => 1,
//            'obiskInt'           => 1,
//            'ponoviDoma'         => 1,
//            'ponoviZamejo'       => 1,
//            'ponoviGost'         => 1,
//            'ponoviInt'          => 1,
            'utemeljitev'          => 'zz',
//            'tip'                => 'premiera', // ali to polje potrebujemo - ne. Ne rabimo vnašati, samo se nastavi
            'sort'                 => 1,
            'stZaposUmet'          => 1,
            'stZaposDrug'          => 1,
            'stHonorarnih'         => 1,
            'stHonorarnihIgr'      => 1,
            'stHonorarnihIgrTujJZ' => 1,
            'tipProgramskeEnote'   => $this->lookTipProgramskeEnote1['id'],
            'dokument'             => $this->obj2['id'],
            'uprizoritev'          => $this->lookUprizoritev1['id'], // ista uprizoritev
        ];
        $resp = $I->failToCreate($this->programPremieraUrl, $data);
        $I->assertEquals(1000440, $resp[0]['code']);

        // kreiranje zapisa z drugo uprizoritvijo mora uspeti:
        $data = [
            'celotnaVrednost'      => 1.24,
            'nasDelez'             => 100.24,
            'zaprosenProcent'      => 30,
//            'zaproseno'            =>1.24,
            'lastnaSredstva'       => 1.24,
            'avtorskiHonorarji'    => 55.25,
            'tantieme'             => 1.24,
            'drugiViri'            => 1.24,
            'opredelitevDrugiViri' => "zz",
//            'vlozekGostitelja'     => 1.24,
            'vlozekKoproducenta'   => 1.24,
            'drugiJavni'           => 1.24,
//            'obiskDoma'          => 1,
//            'obiskGost'          => 1,
//            'obiskZamejo'        => 1,
//            'obiskInt'           => 1,
//            'ponoviDoma'         => 1,
//            'ponoviZamejo'       => 1,
//            'ponoviGost'         => 1,
//            'ponoviInt'          => 1,
            'utemeljitev'          => 'zz',
//            'tip'                => 'premiera', // ali to polje potrebujemo - ne. Ne rabimo vnašati, samo se nastavi
            'sort'                 => 1,
            'stZaposUmet'          => 1,
            'stZaposDrug'          => 1,
            'stHonorarnih'         => 1,
            'stHonorarnihIgr'      => 1,
            'stHonorarnihIgrTujJZ' => 1,
            'tipProgramskeEnote'   => $this->lookTipProgramskeEnote1['id'],
            'dokument'             => $this->obj2['id'],
            'uprizoritev'          => $this->lookUprizoritev2['id'], // druga uprizoritev
        ];
        $ent  = $I->successfullyCreate($this->programPremieraUrl, $data);
        $I->assertNotEmpty($ent['id']);
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
            'zaprosenProcent'         => 30,
//            'zaproseno'            =>1.24,
            'lastnaSredstva'          => 1.24,
            'avtorskiHonorarji'       => 74.22,
            'tantieme'                => 1.24,
            'drugiViri'               => 1.24,
            'opredelitevDrugiViri'    => "zz",
            'vlozekGostitelja'        => 1.24,
            'vlozekKoproducenta'      => 1.24,
            'drugiJavni'              => 1.24,
            'obiskDoma'               => 1,
            'obiskGost'               => 1,
            'obiskZamejo'             => 1,
            'obiskInt'                => 1,
            'ponoviDoma'              => 4,
            'ponoviZamejo'            => 4,
            'ponoviGost'              => 4,
            'ponoviInt'               => 4,
            'utemeljitev'             => 'zz',
            'sort'                    => 1,
            'tipProgramskeEnote'      => $this->lookTipProgramskeEnote1['id'],
            'dokument'                => $this->obj2['id'],
            'uprizoritev'             => $this->lookUprizoritev1['id'], // ista uprizoritev
        ];
        $ent  = $I->successfullyCreate($this->programPonovitevPremiereUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // poizkusimo kreirati še en zapis z isto uprizoritvijo
        $data = [
            'celotnaVrednost'         => 1.24,
            'celotnaVrednostMat'      => 1.02,
            'celotnaVrednostGostovSZ' => 0.11,
            'nasDelez'                => 100.24,
            'zaprosenProcent'         => 30,
//            'zaproseno'            =>1.24,
            'lastnaSredstva'          => 1.24,
            'avtorskiHonorarji'       => 1.24,
            'tantieme'                => 1.24,
            'drugiViri'               => 1.24,
            'opredelitevDrugiViri'    => "zz",
            'vlozekGostitelja'        => 1.24,
            'vlozekKoproducenta'      => 1.24,
            'drugiJavni'              => 1.24,
            'obiskDoma'               => 1,
            'obiskGost'               => 1,
            'obiskZamejo'             => 1,
            'obiskInt'                => 1,
            'ponoviDoma'              => 5,
            'ponoviZamejo'            => 5,
            'ponoviGost'              => 5,
            'ponoviInt'               => 5,
            'utemeljitev'             => 'zz',
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
            'zaprosenProcent'         => 30,
//            'zaproseno'            =>1.24,
            'lastnaSredstva'          => 1.24,
            'avtorskiHonorarji'       => 4.3,
            'tantieme'                => 1.24,
            'drugiViri'               => 1.24,
            'opredelitevDrugiViri'    => "zz",
            'vlozekGostitelja'        => 1.24,
            'vlozekKoproducenta'      => 1.24,
            'drugiJavni'              => 1.24,
            'obiskDoma'               => 1,
            'obiskGost'               => 1,
            'obiskZamejo'             => 1,
            'obiskInt'                => 1,
            'ponoviDoma'              => 6,
            'ponoviZamejo'            => 6,
            'ponoviGost'              => 6,
            'ponoviInt'               => 6,
            'utemeljitev'             => 'zz',
            'sort'                    => 1,
            'tipProgramskeEnote'      => $this->lookTipProgramskeEnote1['id'],
            'dokument'                => $this->obj2['id'],
            'uprizoritev'             => $this->lookUprizoritev3['id'], // druga uprizoritev
        ];
        $ent  = $I->successfullyCreate($this->programPonovitevPremiereUrl, $data);
        $I->assertNotEmpty($ent['id']);
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
            'zaprosenProcent'         => 30,
//            'zaproseno'            =>1.24,
            'lastnaSredstva'          => 1.24,
            'avtorskiHonorarji'       => 83.33,
            'tantieme'                => 1.24,
            'drugiViri'               => 1.24,
            'opredelitevDrugiViri'    => "zz",
            'vlozekGostitelja'        => 1.24,
            'vlozekKoproducenta'      => 1.24,
            'drugiJavni'              => 1.24,
            'obiskDoma'               => 1,
            'obiskGost'               => 1,
            'obiskZamejo'             => 1,
            'obiskInt'                => 1,
            'ponoviDoma'              => 3,
            'ponoviZamejo'            => 2,
            'ponoviGost'              => 3,
//            'ponoviInt'            => 1,
            'utemeljitev'             => 'zz',
            'sort'                    => 1,
            'stZaposUmet'             => 1,
            'stZaposDrug'             => 1,
            'stHonorarnih'            => 11,
            'stHonorarnihIgr'         => 5,
            'stHonorarnihIgrTujJZ'    => 3,
            'tipProgramskeEnote'      => $this->lookTipProgramskeEnote2['id'],
            'dokument'                => $this->obj2['id'],
            'uprizoritev'             => $this->lookUprizoritev5['id'], // ista uprizoritev
        ];
        $ent  = $I->successfullyCreate($this->programPonovitevPrejsnjihUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // poizkusimo kreirati še en zapis z isto uprizoritvijo
        $data = [
            'celotnaVrednost'         => 1.24,
            'celotnaVrednostMat'      => 1.02,
            'celotnaVrednostGostovSZ' => 0.11,
            'nasDelez'                => 100.24,
            'zaprosenProcent'         => 30,
//            'zaproseno'            =>1.24,
            'lastnaSredstva'          => 1.24,
            'avtorskiHonorarji'       => 1.24,
            'tantieme'                => 1.24,
            'drugiViri'               => 1.24,
            'opredelitevDrugiViri'    => "zz",
            'vlozekGostitelja'        => 1.24,
            'vlozekKoproducenta'      => 1.24,
            'drugiJavni'              => 1.24,
            'obiskDoma'               => 1,
            'obiskGost'               => 1,
            'obiskZamejo'             => 1,
            'obiskInt'                => 1,
            'ponoviDoma'              => 6,
            'ponoviZamejo'            => 5,
            'ponoviGost'              => 5,
//            'ponoviInt'            => 1,
            'utemeljitev'             => 'zz',
            'sort'                    => 1,
            'stZaposUmet'             => 1,
            'stZaposDrug'             => 1,
            'stHonorarnih'            => 1,
            'stHonorarnihIgr'         => 1,
            'stHonorarnihIgrTujJZ'    => 1,
            'tipProgramskeEnote'      => $this->lookTipProgramskeEnote2['id'],
            'dokument'                => $this->obj2['id'],
            'uprizoritev'             => $this->lookUprizoritev5['id'], // ista uprizoritev
        ];
        $resp = $I->failToCreate($this->programPonovitevPrejsnjihUrl, $data);
        $I->assertEquals(1000460, $resp[0]['code']);

        // kreiranje zapisa z drugo uprizoritvijo mora uspeti:
        $data = [
            'celotnaVrednost'         => 1.24,
            'celotnaVrednostMat'      => 1.02,
            'celotnaVrednostGostovSZ' => 0.11,
            'nasDelez'                => 100.24,
            'zaprosenProcent'         => 30,
//            'zaproseno'            =>1.24,
            'lastnaSredstva'          => 1.24,
            'avtorskiHonorarji'       => 5.22,
            'tantieme'                => 1.24,
            'drugiViri'               => 1.24,
            'opredelitevDrugiViri'    => "zz",
            'vlozekGostitelja'        => 1.24,
            'vlozekKoproducenta'      => 1.24,
            'drugiJavni'              => 1.24,
            'obiskDoma'               => 1,
            'obiskGost'               => 1,
            'obiskZamejo'             => 1,
            'obiskInt'                => 1,
            'ponoviDoma'              => 2,
            'ponoviZamejo'            => 3,
            'ponoviGost'              => 2,
//            'ponoviInt'            => 1,
            'utemeljitev'             => 'zz',
            'sort'                    => 1,
            'stZaposUmet'             => 1,
            'stZaposDrug'             => 1,
            'stHonorarnih'            => 25,
            'stHonorarnihIgr'         => 8,
            'stHonorarnihIgrTujJZ'    => 8,
            'tipProgramskeEnote'      => $this->lookTipProgramskeEnote5['id'],
            'dokument'                => $this->obj2['id'],
            'uprizoritev'             => $this->lookUprizoritev2['id'], // ista uprizoritev
        ];
        $ent  = $I->successfullyCreate($this->programPonovitevPrejsnjihUrl, $data);
        $I->assertNotEmpty($ent['id']);
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
        codecept_debug($this->lookUprizoritev1);
        //gostujoca 
        $data = [
            'celotnaVrednost'      => 1.24,
            'nasDelez'             => 100.24,
            'zaprosenProcent'      => 30,
//            'zaproseno'            =>1.24,
            'lastnaSredstva'       => 1.24,
//            'avtorskiHonorarji'  => 1.24,
//            'tantieme'           => 1.24,
            'drugiViri'            => 1.24,
            'opredelitevDrugiViri' => "zz",
//            'vlozekGostitelja'     => 1.24,
//            'vlozekKoproducenta'   => 1.24,
            'drugiJavni'           => 1.24,
            'obiskDoma'            => 1,
//            'obiskGost'          => 1,
//            'obiskZamejo'        => 1,
//            'obiskInt'           => 1,
            'ponoviDoma'           => 1,
//            'ponoviZamejo'       => 1,
//            'ponoviGost'         => 1,
//            'ponoviInt'          => 1,
            'utemeljitev'          => 'zz',
//            'tipProgramskeEnote' => NULL,
//            'tip'                => 'gostujoci', 
            'sort'                 => 1,
            'dokument'             => $this->obj2['id'],
            'uprizoritev'          => $this->lookUprizoritev1['id'], // ista uprizoritev
        ];
        $ent  = $I->successfullyCreate($this->programGostujocaUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['utemeljitev'], 'zz');

        // poizkusimo kreirati še en zapis z isto uprizoritvijo
        $data = [
            'celotnaVrednost'      => 1.24,
            'nasDelez'             => 100.24,
            'zaprosenProcent'      => 30,
//            'zaproseno'            =>1.24,
            'lastnaSredstva'       => 1.24,
//            'avtorskiHonorarji'  => 1.24,
//            'tantieme'           => 1.24,
            'drugiViri'            => 1.24,
            'opredelitevDrugiViri' => "zz",
//            'vlozekGostitelja'     => 1.24,
//            'vlozekKoproducenta'   => 1.24,
            'drugiJavni'           => 1.24,
            'obiskDoma'            => 1,
//            'obiskGost'          => 1,
//            'obiskZamejo'        => 1,
//            'obiskInt'           => 1,
            'ponoviDoma'           => 1,
//            'ponoviZamejo'       => 1,
//            'ponoviGost'         => 1,
//            'ponoviInt'          => 1,
            'utemeljitev'          => 'zz',
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
            'celotnaVrednost'      => 1.24,
            'nasDelez'             => 100.24,
            'zaprosenProcent'      => 30,
//            'zaproseno'            =>1.24,
            'lastnaSredstva'       => 1.24,
//            'avtorskiHonorarji'  => 1.24,
//            'tantieme'           => 1.24,
            'drugiViri'            => 1.24,
            'opredelitevDrugiViri' => "zz",
//            'vlozekGostitelja'     => 1.24,
//            'vlozekKoproducenta'   => 1.24,
            'drugiJavni'           => 1.24,
            'obiskDoma'            => 1,
//            'obiskGost'          => 1,
//            'obiskZamejo'        => 1,
//            'obiskInt'           => 1,
            'ponoviDoma'           => 1,
//            'ponoviZamejo'       => 1,
//            'ponoviGost'         => 1,
//            'ponoviInt'          => 1,
            'utemeljitev'          => 'zz',
//            'tipProgramskeEnote' => NULL,
//            'tip'                => 'gostujoci', 
            'sort'                 => 1,
            'dokument'             => $this->obj2['id'],
            'uprizoritev'          => $this->lookUprizoritev2['id'], // druga uprizoritev
        ];
        $ent  = $I->successfullyCreate($this->programGostujocaUrl, $data);
        $I->assertNotEmpty($ent['id']);
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
            'delez'           => 0.49,
            'zaprosenProcent' => 50,
            'enotaPrograma'   => $this->objProgramPremiera1['id'],
            'koproducent'     => $this->lookProdukcijskaHisa1['id'],
        ];
        $this->objKoprodukcija1 = $ent                    = $I->successfullyCreate($this->produkcijaDelitevUrl, $data);
        $I->assertNotEmpty($ent['id']);

        $data = [
            'delez'           => 37.1,
            'zaprosenProcent' => 40,
            'enotaPrograma'   => $this->objProgramPremiera1['id'],
            'koproducent'     => $this->lookProdukcijskaHisa2['id'],
        ];
        $ent  = $I->successfullyCreate($this->produkcijaDelitevUrl, $data);
        $I->assertNotEmpty($ent['id']);

        $data                   = [
            'delez'           => 11.2,
            'zaprosenProcent' => 20,
            'enotaPrograma'   => $this->objProgramPremiera1['id'],
            'koproducent'     => $this->lookProdukcijskaHisa4['id'],
        ];
        $this->objKoprodukcija3 = $ent                    = $I->successfullyCreate($this->produkcijaDelitevUrl, $data);
        $I->assertNotEmpty($ent['id']);

        $data = [
            'delez'           => 0.12,
            'zaprosenProcent' => 10,
            'enotaPrograma'   => $this->objProgramPonovitevPrejsnjih1['id'],
            'koproducent'     => $this->lookProdukcijskaHisa1['id'],
        ];
        $ent  = $I->successfullyCreate($this->produkcijaDelitevUrl, $data);
        $I->assertNotEmpty($ent['id']);

        $data = [
            'delez'           => 20.22,
            'zaprosenProcent' => 40,
            'enotaPrograma'   => $this->objProgramPonovitevPrejsnjih1['id'],
            'koproducent'     => $this->lookProdukcijskaHisa3['id'],
        ];
        $ent  = $I->successfullyCreate($this->produkcijaDelitevUrl, $data);
        $I->assertNotEmpty($ent['id']);

        $data = [
            'delez'           => 112,
            'zaprosenProcent' => 16.3,
            'enotaPrograma'   => $this->objProgramIzjemni1['id'],
            'koproducent'     => $this->lookProdukcijskaHisa1['id'],
        ];
        $ent  = $I->successfullyCreate($this->produkcijaDelitevUrl, $data);

        $I->assertNotEmpty($ent['id']);
        $data = [
            'delez'           => 30,
            'zaprosenProcent' => 56.2,
            'enotaPrograma'   => $this->objProgramIzjemni1['id'],
            'koproducent'     => $this->lookProdukcijskaHisa4['id'],
        ];
        $ent  = $I->successfullyCreate($this->produkcijaDelitevUrl, $data);
        $I->assertNotEmpty($ent['id']);

        $data = [
            'delez'           => 0.17,
            'zaprosenProcent' => 3.2,
            'enotaPrograma'   => $this->objProgramIzjemni1['id'],
            'koproducent'     => $this->lookProdukcijskaHisa5['id'],
        ];
        $ent  = $I->successfullyCreate($this->produkcijaDelitevUrl, $data);
        $I->assertNotEmpty($ent['id']);

        $data                   = [
            'delez'           => 0.17,
            'zaprosenProcent' => 3.2,
            'enotaPrograma'   => $this->objProgramFestival1['id'],
            'koproducent'     => $this->lookProdukcijskaHisa1['id'],
        ];
        $this->objKoprodukcija2 = $ent                    = $I->successfullyCreate($this->produkcijaDelitevUrl, $data);
        $I->assertNotEmpty($ent['id']);
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
        $I->assertNotEmpty($ent['id']);

        // kreiramo še en zapis
        $data = [
            'znesek'        => 2.34,
            'opis'          => "aa",
            'enotaPrograma' => $this->objProgramPremiera1['id'],
            'mednarodni'    => true,
        ];
        $ent  = $I->successfullyCreate($this->drugiVirUrl, $data);
        $I->assertNotEmpty($ent['id']);

        $data = [
            'znesek'        => 5.67,
            'opis'          => "pp2",
            'enotaPrograma' => $this->objProgramPonovitevPrejsnjih1['id'],
            'mednarodni'    => FALSE,
        ];
        $ent  = $I->successfullyCreate($this->drugiVirUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // kreiramo še en zapis
        $data = [
            'znesek'        => 92.34,
            'opis'          => "pp2b",
            'enotaPrograma' => $this->objProgramPonovitevPrejsnjih1['id'],
            'mednarodni'    => true,
        ];
        $ent  = $I->successfullyCreate($this->drugiVirUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // kreiramo še en zapis
        $data               = [
            'znesek'        => 15.3,
            'opis'          => "f1",
            'enotaPrograma' => $this->objProgramFestival1['id'],
            'mednarodni'    => true,
        ];
        $this->objDrugiVir2 = $ent                = $I->successfullyCreate($this->drugiVirUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // kreiramo še en zapis
        $data = [
            'znesek'        => 50.2,
            'opis'          => "f2",
            'enotaPrograma' => $this->objProgramGostovanj1['id'],
            'mednarodni'    => FALSE,
        ];
        $ent  = $I->successfullyCreate($this->drugiVirUrl, $data);
        $I->assertNotEmpty($ent['id']);
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
//        codecept_debug($ent);
        // pri update preračuna kazalnike
        $entR = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertNotEmpty($entR['id']);
        $I->assertGreaterThanOrEqual(4, $entR['stPremier'], "št. premier");
        $I->assertGreaterThanOrEqual(3, $entR['stPonPrej'], "št. ponovitev prejšnjih sezon");
        $I->assertGreaterThanOrEqual(0, $entR['stPonPrejVelikih']);
        $I->assertGreaterThanOrEqual(1, $entR['stPonPrejMalih']);
        $I->assertGreaterThanOrEqual(1, $entR['stPonPrejMalihKopr']);
        $I->assertGreaterThanOrEqual(0, $entR['stPonPrejSredKopr']);
        $I->assertGreaterThanOrEqual(1, $entR['stPonPrejVelikihKopr']);
        $I->assertGreaterThanOrEqual(1170.90, $entR['vrPS1'], "vrednost PS1");
        $I->assertGreaterThanOrEqual(6.12, $entR['vrPS1Mat'], "vr PS1 mat");
        $I->assertGreaterThanOrEqual(0.66, $entR['vrPS1GostovSZ'], "vr ps1 gostov slo zam");
        $I->assertGreaterThanOrEqual(549.24, $entR['vrPS1Do']);
        $I->assertGreaterThanOrEqual(108, $entR['stNekomerc'], "št nekomerc");
        $I->assertGreaterThanOrEqual(48, $entR['stIzvPonPrem'], "št. izvedb pon premier");
        $I->assertGreaterThanOrEqual(47, $entR['stIzvPrej'], "št. izvedb prejšnjih");
        $I->assertGreaterThanOrEqual(4, $entR['stIzvGostuj'], "št. izvedb gostujočih");
        $I->assertGreaterThanOrEqual(9, $entR['stIzvOstalihNek'], "št. izvedb ostalih nekom");
        $I->assertGreaterThanOrEqual(27, $entR['stGostovanjSlo'], "");
        $I->assertGreaterThanOrEqual(25, $entR['stGostovanjZam'], "");
        $I->assertGreaterThanOrEqual(20, $entR['stGostovanjInt'], "");
        $I->assertGreaterThanOrEqual(378, $entR['stObiskNekom'], "Obisk vseh nekom.");
        $I->assertGreaterThanOrEqual(300, $entR['stObiskNekomMat'], "");
        $I->assertGreaterThanOrEqual(38, $entR['stObiskNekomGostSlo'], "");
        $I->assertGreaterThanOrEqual(22, $entR['stObiskNekomGostZam'], "");
        $I->assertGreaterThanOrEqual(18, $entR['stObiskNekomGostInt'], "");
        $I->assertEquals(3.5, $entR['avgObiskPrired'], "povprečno št. obiskovalcev");     //kvocient drugih dveh števil
        $I->assertGreaterThanOrEqual(141, $entR['stHonorarnih'], "");
        $I->assertGreaterThanOrEqual(28, $entR['stHonorarnihIgr'], "");
        $I->assertGreaterThanOrEqual(20, $entR['stHonorarnihIgrTujJZ'], "");
        $I->assertGreaterThanOrEqual(420.88, $entR['sredstvaAvt'], "");
        $I->assertGreaterThanOrEqual(109.98, $entR['sredstvaInt'], "mednarodni viri");
        $I->assertEquals(3, $entR['stKoprodukcij'], "");
        $I->assertEquals(2, $entR['stKoprodukcijInt'], "število mednarodnih koprodukcij");
        $I->assertEquals(1, $entR['stKoprodukcijNVO'], "");
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
            'celotnaVrednost'      => 26.2,
            'nasDelez'             => 26.2,
            'zaprosenProcent'      => 30,
//            'zaproseno'            =>1.24,
            'lastnaSredstva'       => 11,
            'avtorskiHonorarji'    => 4.23,
            'tantieme'             => 5.23,
            'drugiViri'            => 1.24,
            'opredelitevDrugiViri' => "zz",
//            'vlozekGostitelja'     => 1.24,
            'vlozekKoproducenta'   => 1.24,
            'drugiJavni'           => 1.24,
//  
//            'vlozekKoproducenta'   => 1.24,
//            'drugiJavni'           => 1.24,
//            'obiskDoma'          => 1,
//            'obiskGost'          => 1,
//            'obiskZamejo'        => 1,
//            'obiskInt'           => 1,
//            'ponoviDoma'         => 1,
//            'ponoviZamejo'       => 1,
//            'ponoviGost'         => 1,
//            'ponoviInt'          => 1,
            'utemeljitev'          => 'pm7',
            'tipProgramskeEnote'   => $this->lookTipProgramskeEnote5['id'],
//            'tip'                => 'premiera', // ali to polje potrebujemo - ne. Ne rabimo vnašati, samo se nastavi
            'sort'                 => 8,
            'stZaposUmet'          => 9,
            'stZaposDrug'          => 6,
            'stHonorarnih'         => 11,
            'stHonorarnihIgr'      => 3,
            'stHonorarnihIgrTujJZ' => 2,
            'uprizoritev'          => NULL,
            'dokument'             => $this->obj2['id'],
        ];
        // pri create bi moral preračunati kazalnike tudi v programu dela
        $this->objProgramPremiera3 = $ent                       = $I->successfullyCreate($this->programPremieraUrl, $data);
        $I->assertNotEmpty($ent['id']);


        //ponovitev prejšnjih sezon 
        $data = [
            'celotnaVrednost'         => 1.24,
            'celotnaVrednostMat'      => 1.02,
            'celotnaVrednostGostovSZ' => 0.11,
            'nasDelez'                => 100.24,
            'zaprosenProcent'         => 30,
//            'zaproseno'            =>1.24,
            'lastnaSredstva'          => 1.24,
            'avtorskiHonorarji'       => 63.21,
            'tantieme'                => 1.24,
            'drugiViri'               => 1.24,
            'drugiJavni'              => 1.24,
            'obiskDoma'               => 2,
            'obiskGost'               => 3,
            'obiskZamejo'             => 11,
            'obiskInt'                => 12,
            'ponoviDoma'              => 6,
            'ponoviZamejo'            => 7,
            'ponoviGost'              => 8,
            'ponoviInt'               => 9,
            'stZaposUmet'             => 1,
            'stZaposDrug'             => 1,
            'utemeljitev'             => 'ppj8',
            'vlozekKoproducenta'      => 1.24,
            'vlozekGostitelja'        => 1.24,
            'uprizoritev'             => NULL,
            'tipProgramskeEnote'      => $this->lookTipProgramskeEnote2['id'],
            'dokument'                => $this->obj2['id'],
        ];
        // pri create bi moral preračunati kazalnike tudi v programu dela
        $ent  = $I->successfullyCreate($this->programPonovitevPrejsnjihUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // ali so kazalniki pravilno preračunani?
        $entR = $I->successfullyGet($this->restUrl, $this->obj2['id']);
        codecept_debug($ent);
        $I->assertNotEmpty($entR['id']);
        $I->assertGreaterThanOrEqual(5, $entR['stPremier'], "št. premier");     // ena premiera bi morala biti sedaj več
        $I->assertGreaterThanOrEqual(4, $entR['stPonPrej'], "št. ponovitev prejšnjih sezon"); // ena ponovitev prejšnjih več
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
        $I->assertNotEmpty($ent['id']);

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
            'delez'           => 0.06,
            'zaprosenProcent' => 5,
            'enotaPrograma'   => $this->objProgramPonovitevPrejsnjih1['id'],
            'koproducent'     => $this->lookProdukcijskaHisa4['id'],
        ];

        $ent = $I->successfullyCreate($this->produkcijaDelitevUrl, $data);
        $I->assertNotEmpty($ent['id']);

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
    }

    /**
     * test validacij  
     *  
     * @param ApiTester $I
     */
    public function updateProgramPremieraValidacije(ApiTester $I)
    {
        //pri validaciji ne bi smel najti samega sebe
        $data                       = $this->objProgramPremiera1;
        $data['tipProgramskeEnote'] = $this->lookTipProgramskeEnote3['id']; // mala  koprodukcija
        $data['zaprosenProcent']    = 40;
        $ent                        = $I->successfullyUpdate($this->programPremieraUrl, $data['id'], $data);
        $I->assertNotEmpty($ent['id']);

        $data['zaprosenProcent'] = 100.01;
        $resp                    = $I->failToUpdate($this->programPremieraUrl, $data['id'], $data);
        $I->assertNotEmpty($resp);
        $I->assertEquals(1000622, $resp[0]['code']);

        // več kot koeficient PE
        $data['zaprosenProcent'] = 40.01;
        $resp                    = $I->failToUpdate($this->programPremieraUrl, $data['id'], $data);
        $I->assertNotEmpty($resp);
        $I->assertEquals(1000623, $resp[0]['code']);

        $dataKop                    = $this->objKoprodukcija3;
        $dataKop['zaprosenProcent'] = 20.01; //spremenimo za toliko, da bo več kot skupni koeficient 1.0
        codecept_debug($dataKop);
        $resp                       = $I->failToUpdate($this->produkcijaDelitevUrl, $dataKop['id'], $dataKop);
        $I->assertNotEmpty($resp);
        $I->assertEquals(1000624, $resp[0]['code']);

        $data['lastnaSredstva'] = 32.1;
        $data['nasDelez']       = 32.0;
        $resp                   = $I->failToUpdate($this->programPremieraUrl, $data['id'], $data);
        $I->assertNotEmpty($resp);
        $I->assertEquals(1000620, $resp[0]['code']);
    }

    /**
     * test validacij  
     *  
     * @param ApiTester $I
     */
    public function updateProgramPremieraAliPropagacijaProcenta(ApiTester $I)
    {
        $noviProcent             = 11.22;
        $novDelez                = 98.7;
        //pri validaciji ne bi smel najti samega sebe
        $data                    = $this->objProgramPremiera1;
        $data['zaprosenProcent'] = $noviProcent;
        $data['nasDelez']        = $novDelez;
        $ent                     = $I->successfullyUpdate($this->programPremieraUrl, $data['id'], $data);
        $I->assertNotEmpty($ent['id']);

        $dataKop = $this->objKoprodukcija1;
        $ent     = $I->successfullyGet($this->produkcijaDelitevUrl, $this->objKoprodukcija1['id']);
        $I->assertNotEmpty($ent);
        $I->assertEquals($noviProcent, $ent['zaprosenProcent'], "zaprošen procent pri matični koprodukciji");
        $I->assertEquals($novDelez, $ent['delez'], "delež pri matični koprodukciji");
    }

    /**
     * test preračunov
     *  
     * @param ApiTester $I
     */
    public function deleteKoprodukcijaAliManjšaCelotnaVrednost(ApiTester $I)
    {
        $ep       = $I->successfullyGet($this->programPremieraUrl, $this->objProgramPremiera1['id']);
        $oldCelVr = $ep['celotnaVrednost'];
        $delezKop = 100;
        $newCelVr = $oldCelVr + $delezKop;

        // najprej dodano koprodukcijo
        $data = [
            'delez'           => $delezKop,
            'zaprosenProcent' => 5,
            'enotaPrograma'   => $this->objProgramPremiera1['id'],
            'koproducent'     => $this->lookProdukcijskaHisa5['id'],
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
     * zaklenemo program dela in testiramo, če so še možne spremembe
     * 
     * @depends create
     * @depends createVecProgramovFestivala
     * @depends createVecEnotPrograma
     * @depends createVecProgramovGostovanj
     * ...
     * @param ApiTester $I
     */
    public function zakleniProgramDelaInPoskusSprememb(ApiTester $I)
    {
        // najprej zaklenemo program dela
        $resp = $I->successfullyCallRpc($this->rpcUrl, 'zakleni', ["programDelaId" => $this->obj2['id']]);
        $I->assertNotEmpty($resp);
        $I->seeResponseIsJson();
        $I->assertTrue($resp, "ali uspešno");

        // probamo spremeniti program dela
        $ent  = $I->successfullyGet($this->restUrl, $this->obj2['id']);
        $I->assertTrue($ent['zakljuceno'], "ali zaključeno");
        $resp = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
//                $this->expect(!zaklenjenProgramDela($object), "Program dela je že zaklenjen/zaključen. Spremembe niso več mogoče", 1000511);
        $I->assertEquals(1000511, $resp[0]['code']);

        // probamo spremeniti program premiere
        $ent  = $I->successfullyGet($this->programPremieraUrl, $this->objProgramPremiera1['id']);
        $I->assertNotEmpty($ent['id']);
        $resp = $I->failToUpdate($this->programPremieraUrl, $ent['id'], $ent);
        $I->assertEquals(1000521, $resp[0]['code']);

        // probamo spremeniti program ponovitve premiere
        $ent  = $I->successfullyGet($this->programPonovitevPremiereUrl, $this->objProgramPonovitevPremiere1['id']);
        $I->assertNotEmpty($ent['id']);
        $resp = $I->failToUpdate($this->programPonovitevPremiereUrl, $ent['id'], $ent);
        $I->assertEquals(1000521, $resp[0]['code']);

        // probamo spremeniti program ponovitve prejšnjih
        $ent  = $I->successfullyGet($this->programPonovitevPrejsnjihUrl, $this->objProgramPonovitevPrejsnjih1['id']);
        $I->assertNotEmpty($ent['id']);
        $resp = $I->failToUpdate($this->programPonovitevPrejsnjihUrl, $ent['id'], $ent);
        $I->assertEquals(1000521, $resp[0]['code']);

        // probamo spremeniti program gostujočih
        $ent  = $I->successfullyGet($this->programGostujocaUrl, $this->objProgramGostujoca1['id']);
        $I->assertNotEmpty($ent['id']);
        $resp = $I->failToUpdate($this->programGostujocaUrl, $ent['id'], $ent);
        $I->assertEquals(1000521, $resp[0]['code']);

        // probamo spremeniti program gostovanj
        $ent  = $I->successfullyGet($this->programGostovanjaUrl, $this->objProgramGostovanj1['id']);
        $I->assertNotEmpty($ent['id']);
        $resp = $I->failToUpdate($this->programGostovanjaUrl, $ent['id'], $ent);
        $I->assertEquals(1000521, $resp[0]['code']);

        // probamo spremeniti program festival
        $ent  = $I->successfullyGet($this->programFestivalUrl, $this->objProgramFestival1['id']);
        $I->assertNotEmpty($ent['id']);
        $resp = $I->failToUpdate($this->programFestivalUrl, $ent['id'], $ent);
        $I->assertEquals(1000521, $resp[0]['code']);

        // probamo spremeniti program izjemni
        $ent  = $I->successfullyGet($this->programIzjemniUrl, $this->objProgramIzjemni1['id']);
        $I->assertNotEmpty($ent['id']);
        $resp = $I->failToUpdate($this->programIzjemniUrl, $ent['id'], $ent);
        $I->assertEquals(1000521, $resp[0]['code']);

        // probamo spremeniti program razno
        $ent  = $I->successfullyGet($this->programRaznoUrl, $this->objProgramRazno1['id']);
        $I->assertNotEmpty($ent['id']);
        $resp = $I->failToUpdate($this->programRaznoUrl, $ent['id'], $ent);
        $I->assertEquals(1000521, $resp[0]['code']);

        // probamo spremeniti drugi vir od premiere
        $ent  = $I->successfullyGet($this->drugiVirUrl, $this->objDrugiVir1['id']);
        $I->assertNotEmpty($ent['id']);
        $resp = $I->failToUpdate($this->drugiVirUrl, $ent['id'], $ent);
        $I->assertEquals(1000601, $resp[0]['code']);

        // probamo spremeniti drugi vir od festivala
        $ent  = $I->successfullyGet($this->drugiVirUrl, $this->objDrugiVir2['id']);
        $I->assertNotEmpty($ent['id']);
        $resp = $I->failToUpdate($this->drugiVirUrl, $ent['id'], $ent);
        $I->assertEquals(1000601, $resp[0]['code']);

        // probamo spremeniti koprodukcijo od premiere
        $ent  = $I->successfullyGet($this->produkcijaDelitevUrl, $this->objKoprodukcija1['id']);
        $I->assertNotEmpty($ent['id']);
        $resp = $I->failToUpdate($this->produkcijaDelitevUrl, $ent['id'], $ent);
        $I->assertEquals(1000611, $resp[0]['code']);

        // probamo spremeniti koprodukcijo od festivala
        $ent  = $I->successfullyGet($this->produkcijaDelitevUrl, $this->objKoprodukcija2['id']);
        $I->assertNotEmpty($ent['id']);
        $resp = $I->failToUpdate($this->produkcijaDelitevUrl, $ent['id'], $ent);
        $I->assertEquals(1000611, $resp[0]['code']);
    }

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
        $I->assertEquals($oldPD['stPonPrej'], $entR['stPonPrej'], "št. ponovitev prejšnjih sezon");
        $I->assertEquals($oldPD['stPonPrejVelikih'], $entR['stPonPrejVelikih']);
        $I->assertEquals($oldPD['stPonPrejMalih'], $entR['stPonPrejMalih']);
        $I->assertEquals($oldPD['stPonPrejMalihKopr'], $entR['stPonPrejMalihKopr']);
        $I->assertEquals($oldPD['stPonPrejSredKopr'], $entR['stPonPrejSredKopr']);
        $I->assertEquals($oldPD['stPonPrejVelikihKopr'], $entR['stPonPrejVelikihKopr']);
        $I->assertEquals($oldPD['vrPS1'], $entR['vrPS1'], "vrednost PS1");
        $I->assertEquals($oldPD['vrPS1Mat'], $entR['vrPS1Mat'], "vr PS1 mat");
        $I->assertEquals($oldPD['vrPS1GostovSZ'], $entR['vrPS1GostovSZ'], "vr ps1 gostov slo zam");
        $I->assertEquals($oldPD['vrPS1Do'], $entR['vrPS1Do']);
        $I->assertEquals($oldPD['stNekomerc'], $entR['stNekomerc'], "št nekomerc");
        $I->assertEquals($oldPD['stIzvPonPrem'], $entR['stIzvPonPrem'], "št. izvedb pon premier");
        $I->assertEquals($oldPD['stIzvPrej'], $entR['stIzvPrej'], "št. izvedb prejšnjih");
        $I->assertEquals($oldPD['stIzvGostuj'], $entR['stIzvGostuj'], "št. izvedb gostujočih");
        $I->assertEquals($oldPD['stIzvOstalihNek'], $entR['stIzvOstalihNek'], "št. izvedb ostalih nekom");
        $I->assertEquals($oldPD['stGostovanjSlo'], $entR['stGostovanjSlo'], "");
        $I->assertEquals($oldPD['stGostovanjZam'], $entR['stGostovanjZam'], "");
        $I->assertEquals($oldPD['stGostovanjInt'], $entR['stGostovanjInt'], "");
        $I->assertEquals($oldPD['stObiskNekom'], $entR['stObiskNekom'], "Obisk vseh nekom.");
        $I->assertEquals($oldPD['stObiskNekomMat'], $entR['stObiskNekomMat'], "");
        $I->assertEquals($oldPD['stObiskNekomGostSlo'], $entR['stObiskNekomGostSlo'], "");
        $I->assertEquals($oldPD['stObiskNekomGostZam'], $entR['stObiskNekomGostZam'], "");
        $I->assertEquals($oldPD['stObiskNekomGostInt'], $entR['stObiskNekomGostInt'], "");
        $I->assertEquals($oldPD['avgObiskPrired'], $entR['avgObiskPrired'], "povprečno št. obiskovalcev");     //kvocient drugih dveh števil
        $I->assertEquals($oldPD['stHonorarnih'], $entR['stHonorarnih'], "");
        $I->assertEquals($oldPD['stHonorarnihIgr'], $entR['stHonorarnihIgr'], "");
        $I->assertEquals($oldPD['stHonorarnihIgrTujJZ'], $entR['stHonorarnihIgrTujJZ'], "");
        $I->assertEquals($oldPD['sredstvaAvt'], $entR['sredstvaAvt'], "");
        $I->assertEquals($oldPD['sredstvaInt'], $entR['sredstvaInt'], "mednarodni viri");
        $I->assertEquals($oldPD['stKoprodukcij'], $entR['stKoprodukcij'], "");
        $I->assertEquals($oldPD['stKoprodukcijInt'], $entR['stKoprodukcijInt'], "število mednarodnih koprodukcij");
        $I->assertEquals($oldPD['stKoprodukcijNVO'], $entR['stKoprodukcijNVO'], "");
    }

}
