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
    private $objProgramPonovitevPremiere1;
    private $objProgramPonovitevPrejsnjih1;
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
    private $tipProgramskeEnoteUrl        = '/rest/tipprogramskeenote';
    private $lookTipProgramskeEnote;

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
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookuptipProgramskeEnote(ApiTester $I)
    {
        $this->lookTipProgramskeEnote = $look                         = $I->lookupEntity("tipProgramskeEnote", "01", false);
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
            'sifra'                => 'ZZ',
            'naziv'                => 'zz',
            'zacetek'              => '2015-02-01T00:00:00+0100',
            'konec'                => '2016-02-01T00:00:00+0100',
            'potrjenProgram'       => false,
            'sezona'               => null,
            'avgZasedDvoran'       => 7.89,
            'avgCenaVstopnice'     => 7.89,
            'stProdVstopnic'       => 7,
            'stZaposlenih'         => 7,
            'stZaposIgralcev'      => 7,
            'avgStNastopovIgr'     => 7.89,
//            'stHonorarnih'         => 7,
//            'stHonorarnihIgr'      => 7,
//            'stHonorarnihIgrTujJZ' => 7,
//            'sredstvaInt'          => 7.89,
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['sifra'], 'ZZ');

// kreiramo še en zapis
        $data       = [
            'sifra'          => 'BB',
            'naziv'          => 'bb',
            'zacetek'        => '2016-02-01T00:00:00+0100',
            'konec'          => '2017-02-01T00:00:00+0100',
            'potrjenProgram' => TRUE,
            'sezona'         => null,
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['sifra'], 'BB');
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
        $I->assertEquals($ent['sifra'], 'ZZ');
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
            'celotnaVrednost'      => 1.23,
            'zaproseno'            => 1.23,
            'lastnaSredstva'       => 1.23,
            'avtorskiHonorarji'    => 1.23,
            'tantieme'             => 1.23,
            'drugiViri'            => 1.23,
            'opredelitevDrugiViri' => "zz",
//            'vlozekGostitelja'     => 1.23,
            'vlozekKoproducenta'   => 1.23,
            'drugiJavni'           => 1.23,
//            'obiskDoma'          => 1,
//            'obiskGost'          => 1,
//            'obiskZamejo'        => 1,
//            'obiskInt'           => 1,
//            'ponoviDoma'         => 1,
//            'ponoviZamejo'       => 1,
//            'ponoviGost'         => 1,
//            'ponoviInt'          => 1,
            'utemeljitev'          => 'zz',
            'tipProgramskeEnote'   => $this->lookTipProgramskeEnote['id'],
//            'tip'                => 'premiera', // ali to polje potrebujemo - ne. Ne rabimo vnašati, samo se nastavi
            'sort'                 => 1,
            'stZaposlenih'         => 1,
            'stDrugih'             => 1,
            'stHonorarnih'         => 1,
            'stHonorarnihIgr'      => 1,
            'stHonorarnihIgrTujJZ' => 1,
            'uprizoritev'          => NULL,
            'dokument'             => $this->obj2['id'],
        ];
        $this->objProgramPremiera1 = $ent                       = $I->successfullyCreate($this->programPremieraUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['utemeljitev'], 'zz');

        //ponovitev premiere
        $data                               = [
            'celotnaVrednost'    => 1.23,
            'zaproseno'          => 1.23,
            'lastnaSredstva'     => 1.23,
            'avtorskiHonorarji'  => 1.23,
            'tantieme'           => 1.23,
            'drugiViri'          => 1.23,
            'drugiJavni'         => 1.23,
            'obiskDoma'          => 1,
            'obiskGost'          => 1,
            'obiskZamejo'        => 1,
            'obiskInt'           => 1,
            'ponoviDoma'         => 1,
            'ponoviZamejo'       => 1,
            'ponoviGost'         => 1,
            'ponoviInt'          => 1,
            'utemeljitev'        => 'zz',
            'uprizoritev'        => NULL,
            'vlozekGostitelja'   => 1.23,
            'vlozekKoproducenta' => 1.23,
            'tipProgramskeEnote' => $this->lookTipProgramskeEnote['id'],
            'dokument'           => $this->obj2['id'],
        ];
        $this->objProgramPonovitevPremiere1 = $ent                                = $I->successfullyCreate($this->programPonovitevPremiereUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['utemeljitev'], 'zz');

        //ponovitev prejšnjih sezon 
        $data                                = [
            'celotnaVrednost'    => 1.23,
            'zaproseno'          => 1.23,
            'lastnaSredstva'     => 1.23,
            'avtorskiHonorarji'  => 1.23,
            'tantieme'           => 1.23,
            'drugiViri'          => 1.23,
            'drugiJavni'         => 1.23,
            'obiskDoma'          => 1,
            'obiskGost'          => 1,
            'obiskZamejo'        => 1,
            'obiskInt'           => 1,
            'ponoviDoma'         => 1,
            'ponoviZamejo'       => 1,
            'ponoviGost'         => 1,
            'ponoviInt'          => 1,
            'stZaposlenih'       => 1,
            'stDrugih'           => 1,
            'utemeljitev'        => 'zz',
            'vlozekKoproducenta' => 1.23,
            'vlozekGostitelja'   => 1.23,
            'uprizoritev'        => NULL,
            'tipProgramskeEnote' => $this->lookTipProgramskeEnote['id'],
            'dokument'           => $this->obj2['id'],
        ];
        $this->objProgramPonovitevPrejsnjih1 = $ent                                 = $I->successfullyCreate($this->programPonovitevPrejsnjihUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['utemeljitev'], 'zz');

        //izjemni 
        $data                     = [
            'naziv'                => "zz",
            'celotnaVrednost'      => 1.23,
            'zaproseno'            => 1.23,
            'lastnaSredstva'       => 1.23,
            'avtorskiHonorarji'    => 1.23,
            'tantieme'             => 1.23,
            'drugiViri'            => 1.23,
            'opredelitevDrugiViri' => "zz",
//            'vlozekGostitelja'     => 1.23,
//            'vlozekKoproducenta'   => 1.23,
            'drugiJavni'           => 1.23,
            'obiskDoma'            => 1,
//            'obiskGost'            => 1,
//            'obiskZamejo'          => 1,
//            'obiskInt'             => 1,
            'ponoviDoma'           => 1,
            'ponoviZamejo'         => 1,
            'ponoviGost'           => 1,
//            'ponoviInt'            => 1,
            'utemeljitev'          => 'zz',
//            'uprizoritev'          => NULL,
//            'tipProgramskeEnote'   => $this->lookTipProgramskeEnote['id'],
            'sort'                 => 1,
            'stZaposlenih'         => 1,
//            'stDrugih'             => 1,
            'stHonorarnih'         => 1,
            'stHonorarnihIgr'      => 1,
            'stHonorarnihIgrTujJZ' => 1,
            'dokument'             => $this->obj2['id'],
        ];
        $this->objProgramIzjemni1 = $ent                      = $I->successfullyCreate($this->programIzjemniUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['utemeljitev'], 'zz');

        //gostujoca 
        $data                       = [
            'celotnaVrednost'    => 1.23,
            'zaproseno'          => 1.23,
            'lastnaSredstva'     => 1.23,
            'avtorskiHonorarji'  => 1.23,
            'tantieme'           => 1.23,
            'drugiViri'          => 1.23,
            'drugiJavni'         => 1.23,
            'obiskDoma'          => 1,
            'obiskGost'          => 1,
            'obiskZamejo'        => 1,
            'obiskInt'           => 1,
            'ponoviDoma'         => 1,
            'ponoviZamejo'       => 1,
            'ponoviGost'         => 1,
            'ponoviInt'          => 1,
            'utemeljitev'        => 'zz',
            'uprizoritev'        => NULL,
            'tipProgramskeEnote' => $this->lookTipProgramskeEnote['id'],
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
            'obiskDoma'               => 1,
            'casPriprave'             => 'zz',
            'casIzvedbe'              => 'zz',
            'prizorisca'              => 'zz',
            'umetVodja'               => 'zz',
            'programskoTelo'          => 'zz',
            'soorganizatorji'         => 'zz',
            'stTujihSelektorjev'      => 1,
            'stZaposlenih'            => 1,
            'stHonorarnih'            => 1,
            'zaproseno'               => 1.23,
            'celotnaVrednost'         => 1.23,
            'lastnaSredstva'          => 1.23,
            'drugiViri'               => 1.23,
            'opredelitevDrugiViri'    => 'zz',
            'vlozekKoproducenta'      => 1.23,
            'drugiJavni'              => 1.23,
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
            'obiskDoma'               => 1,
            'casPriprave'             => 'zz',
            'casIzvedbe'              => 'zz',
            'prizorisca'              => 'zz',
            'umetVodja'               => 'zz',
            'programskoTelo'          => 'zz',
            'soorganizatorji'         => 'zz',
            'stTujihSelektorjev'      => 1,
            'stZaposlenih'            => 1,
            'stHonorarnih'            => 1,
            'zaproseno'               => 1.23,
            'celotnaVrednost'         => 1.23,
            'lastnaSredstva'          => 1.23,
            'drugiViri'               => 1.23,
            'opredelitevDrugiViri'    => 'zz',
            'vlozekKoproducenta'      => 1.23,
            'drugiJavni'              => 1.23,
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
            'uprizoritev'        => NULL,
            'krajGostovanja'     => 'zz',
            'ustanova'           => 'zz',
            'datumGostovanja'    => '2011-02-01T00:00:00+0100',
            'ponoviInt'          => 9,
            'obiskInt'           => 9,
            'zaproseno'          => 9.12,
            'celotnaVrednost'    => 9.12,
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
            'uprizoritev'        => NULL,
            'krajGostovanja'     => 'zz',
            'ustanova'           => 'zz',
            'datumGostovanja'    => '2011-02-01T00:00:00+0100',
            'ponoviInt'          => 9,
            'obiskInt'           => 9,
            'zaproseno'          => 9.12,
            'celotnaVrednost'    => 9.12,
            'transportniStroski' => 9.12,
            'avtorskiHonorarji'  => 9.12,
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
            'vrednostPE'      => 1.23,
            'stPE'            => 1,
            'soorganizator'   => null,
            'obiskDoma'       => 1,
            'stZaposlenih'    => 1,
            'stHonorarnih'    => 1,
            'zaproseno'       => 1.23,
            'celotnaVrednost' => 1.23,
            'lastnaSredstva'  => 1.23,
            'drugiViri'       => 1.23,
            'drugiJavni'      => 1.23,
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
            'vrednostPE'      => 1.23,
            'stPE'            => 1,
            'soorganizator'   => null,
            'obiskDoma'       => 1,
            'stZaposlenih'    => 1,
            'stHonorarnih'    => 1,
            'zaproseno'       => 1.23,
            'celotnaVrednost' => 1.23,
            'lastnaSredstva'  => 1.23,
            'drugiViri'       => 1.23,
            'drugiJavni'      => 1.23,
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
            'celotnaVrednost'      => 1.23,
            'zaproseno'            => 1.23,
            'lastnaSredstva'       => 1.23,
            'avtorskiHonorarji'    => 1.23,
            'tantieme'             => 1.23,
            'drugiViri'            => 1.23,
            'opredelitevDrugiViri' => "zz",
//            'vlozekGostitelja'     => 1.23,
            'vlozekKoproducenta'   => 1.23,
            'drugiJavni'           => 1.23,
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
            'stZaposlenih'         => 1,
            'stDrugih'             => 1,
            'stHonorarnih'         => 1,
            'stHonorarnihIgr'      => 1,
            'stHonorarnihIgrTujJZ' => 1,
            'tipProgramskeEnote'   => $this->lookTipProgramskeEnote['id'],
            'dokument'             => $this->obj2['id'],
            'uprizoritev'          => $this->lookUprizoritev1['id'], // ista uprizoritev
        ];
        $ent  = $I->successfullyCreate($this->programPremieraUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // poizkusimo kreirati še en zapis z isto uprizoritvijo
        $data = [
            'celotnaVrednost'      => 1.23,
            'zaproseno'            => 1.23,
            'lastnaSredstva'       => 1.23,
            'avtorskiHonorarji'    => 1.23,
            'tantieme'             => 1.23,
            'drugiViri'            => 1.23,
            'opredelitevDrugiViri' => "zz",
//            'vlozekGostitelja'     => 1.23,
            'vlozekKoproducenta'   => 1.23,
            'drugiJavni'           => 1.23,
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
            'stZaposlenih'         => 1,
            'stDrugih'             => 1,
            'stHonorarnih'         => 1,
            'stHonorarnihIgr'      => 1,
            'stHonorarnihIgrTujJZ' => 1,
            'tipProgramskeEnote'   => $this->lookTipProgramskeEnote['id'],
            'dokument'             => $this->obj2['id'],
            'uprizoritev'          => $this->lookUprizoritev1['id'], // ista uprizoritev
        ];
        $resp = $I->failToCreate($this->programPremieraUrl, $data);
        $I->assertEquals(1000440, $resp[0]['code']);

        // kreiranje zapisa z drugo uprizoritvijo mora uspeti:
        $data = [
            'celotnaVrednost'      => 1.23,
            'zaproseno'            => 1.23,
            'lastnaSredstva'       => 1.23,
            'avtorskiHonorarji'    => 1.23,
            'tantieme'             => 1.23,
            'drugiViri'            => 1.23,
            'opredelitevDrugiViri' => "zz",
//            'vlozekGostitelja'     => 1.23,
            'vlozekKoproducenta'   => 1.23,
            'drugiJavni'           => 1.23,
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
            'stZaposlenih'         => 1,
            'stDrugih'             => 1,
            'stHonorarnih'         => 1,
            'stHonorarnihIgr'      => 1,
            'stHonorarnihIgrTujJZ' => 1,
            'tipProgramskeEnote'   => $this->lookTipProgramskeEnote['id'],
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
            'celotnaVrednost'      => 1.23,
            'zaproseno'            => 1.23,
            'lastnaSredstva'       => 1.23,
            'avtorskiHonorarji'    => 1.23,
            'tantieme'             => 1.23,
            'drugiViri'            => 1.23,
            'opredelitevDrugiViri' => "zz",
            'vlozekGostitelja'     => 1.23,
            'vlozekKoproducenta'   => 1.23,
            'drugiJavni'           => 1.23,
            'obiskDoma'            => 1,
            'obiskGost'            => 1,
            'obiskZamejo'          => 1,
            'obiskInt'             => 1,
            'ponoviDoma'           => 1,
            'ponoviZamejo'         => 1,
            'ponoviGost'           => 1,
            'ponoviInt'            => 1,
            'utemeljitev'          => 'zz',
            'sort'                 => 1,
            'tipProgramskeEnote'   => $this->lookTipProgramskeEnote['id'],
            'dokument'             => $this->obj2['id'],
            'uprizoritev'          => $this->lookUprizoritev1['id'], // ista uprizoritev
        ];
        $ent  = $I->successfullyCreate($this->programPonovitevPremiereUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // poizkusimo kreirati še en zapis z isto uprizoritvijo
        $data = [
            'celotnaVrednost'      => 1.23,
            'zaproseno'            => 1.23,
            'lastnaSredstva'       => 1.23,
            'avtorskiHonorarji'    => 1.23,
            'tantieme'             => 1.23,
            'drugiViri'            => 1.23,
            'opredelitevDrugiViri' => "zz",
            'vlozekGostitelja'     => 1.23,
            'vlozekKoproducenta'   => 1.23,
            'drugiJavni'           => 1.23,
            'obiskDoma'            => 1,
            'obiskGost'            => 1,
            'obiskZamejo'          => 1,
            'obiskInt'             => 1,
            'ponoviDoma'           => 1,
            'ponoviZamejo'         => 1,
            'ponoviGost'           => 1,
            'ponoviInt'            => 1,
            'utemeljitev'          => 'zz',
            'sort'                 => 1,
            'tipProgramskeEnote'   => $this->lookTipProgramskeEnote['id'],
            'dokument'             => $this->obj2['id'],
            'uprizoritev'          => $this->lookUprizoritev1['id'], // ista uprizoritev
        ];
        $resp = $I->failToCreate($this->programPonovitevPremiereUrl, $data);
        $I->assertEquals(1000450, $resp[0]['code']);

        // kreiranje zapisa z drugo uprizoritvijo mora uspeti:
        $data = [
            'celotnaVrednost'      => 1.23,
            'zaproseno'            => 1.23,
            'lastnaSredstva'       => 1.23,
            'avtorskiHonorarji'    => 1.23,
            'tantieme'             => 1.23,
            'drugiViri'            => 1.23,
            'opredelitevDrugiViri' => "zz",
            'vlozekGostitelja'     => 1.23,
            'vlozekKoproducenta'   => 1.23,
            'drugiJavni'           => 1.23,
            'obiskDoma'            => 1,
            'obiskGost'            => 1,
            'obiskZamejo'          => 1,
            'obiskInt'             => 1,
            'ponoviDoma'           => 1,
            'ponoviZamejo'         => 1,
            'ponoviGost'           => 1,
            'ponoviInt'            => 1,
            'utemeljitev'          => 'zz',
            'sort'                 => 1,
            'tipProgramskeEnote'   => $this->lookTipProgramskeEnote['id'],
            'dokument'             => $this->obj2['id'],
            'uprizoritev'          => $this->lookUprizoritev2['id'], // druga uprizoritev
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
            'celotnaVrednost'      => 1.23,
            'zaproseno'            => 1.23,
            'lastnaSredstva'       => 1.23,
            'avtorskiHonorarji'    => 1.23,
            'tantieme'             => 1.23,
            'drugiViri'            => 1.23,
            'opredelitevDrugiViri' => "zz",
            'vlozekGostitelja'     => 1.23,
            'vlozekKoproducenta'   => 1.23,
            'drugiJavni'           => 1.23,
            'obiskDoma'            => 1,
            'obiskGost'            => 1,
            'obiskZamejo'          => 1,
            'obiskInt'             => 1,
            'ponoviDoma'           => 1,
            'ponoviZamejo'         => 1,
            'ponoviGost'           => 1,
//            'ponoviInt'            => 1,
            'utemeljitev'          => 'zz',
            'sort'                 => 1,
            'stZaposlenih'         => 1,
            'stDrugih'             => 1,
            'stHonorarnih'         => 1,
            'stHonorarnihIgr'      => 1,
            'stHonorarnihIgrTujJZ' => 1,
            'tipProgramskeEnote'   => $this->lookTipProgramskeEnote['id'],
            'dokument'             => $this->obj2['id'],
            'uprizoritev'          => $this->lookUprizoritev1['id'], // ista uprizoritev
        ];
        $ent  = $I->successfullyCreate($this->programPonovitevPrejsnjihUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // poizkusimo kreirati še en zapis z isto uprizoritvijo
        $data = [
            'celotnaVrednost'      => 1.23,
            'zaproseno'            => 1.23,
            'lastnaSredstva'       => 1.23,
            'avtorskiHonorarji'    => 1.23,
            'tantieme'             => 1.23,
            'drugiViri'            => 1.23,
            'opredelitevDrugiViri' => "zz",
            'vlozekGostitelja'     => 1.23,
            'vlozekKoproducenta'   => 1.23,
            'drugiJavni'           => 1.23,
            'obiskDoma'            => 1,
            'obiskGost'            => 1,
            'obiskZamejo'          => 1,
            'obiskInt'             => 1,
            'ponoviDoma'           => 1,
            'ponoviZamejo'         => 1,
            'ponoviGost'           => 1,
//            'ponoviInt'            => 1,
            'utemeljitev'          => 'zz',
            'sort'                 => 1,
            'stZaposlenih'         => 1,
            'stDrugih'             => 1,
            'stHonorarnih'         => 1,
            'stHonorarnihIgr'      => 1,
            'stHonorarnihIgrTujJZ' => 1,
            'tipProgramskeEnote'   => $this->lookTipProgramskeEnote['id'],
            'dokument'             => $this->obj2['id'],
            'uprizoritev'          => $this->lookUprizoritev1['id'], // ista uprizoritev
        ];
        $resp = $I->failToCreate($this->programPonovitevPrejsnjihUrl, $data);
        $I->assertEquals(1000460, $resp[0]['code']);

        // kreiranje zapisa z drugo uprizoritvijo mora uspeti:
        $data = [
            'celotnaVrednost'      => 1.23,
            'zaproseno'            => 1.23,
            'lastnaSredstva'       => 1.23,
            'avtorskiHonorarji'    => 1.23,
            'tantieme'             => 1.23,
            'drugiViri'            => 1.23,
            'opredelitevDrugiViri' => "zz",
            'vlozekGostitelja'     => 1.23,
            'vlozekKoproducenta'   => 1.23,
            'drugiJavni'           => 1.23,
            'obiskDoma'            => 1,
            'obiskGost'            => 1,
            'obiskZamejo'          => 1,
            'obiskInt'             => 1,
            'ponoviDoma'           => 1,
            'ponoviZamejo'         => 1,
            'ponoviGost'           => 1,
//            'ponoviInt'            => 1,
            'utemeljitev'          => 'zz',
            'sort'                 => 1,
            'stZaposlenih'         => 1,
            'stDrugih'             => 1,
            'stHonorarnih'         => 1,
            'stHonorarnihIgr'      => 1,
            'stHonorarnihIgrTujJZ' => 1,
            'tipProgramskeEnote'   => $this->lookTipProgramskeEnote['id'],
            'dokument'             => $this->obj2['id'],
            'uprizoritev'          => $this->lookUprizoritev2['id'], // ista uprizoritev
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
            'celotnaVrednost'      => 1.23,
            'zaproseno'            => 1.23,
            'lastnaSredstva'       => 1.23,
//            'avtorskiHonorarji'  => 1.23,
//            'tantieme'           => 1.23,
            'drugiViri'            => 1.23,
            'opredelitevDrugiViri' => "zz",
//            'vlozekGostitelja'     => 1.23,
//            'vlozekKoproducenta'   => 1.23,
            'drugiJavni'           => 1.23,
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
            'celotnaVrednost'      => 1.23,
            'zaproseno'            => 1.23,
            'lastnaSredstva'       => 1.23,
//            'avtorskiHonorarji'  => 1.23,
//            'tantieme'           => 1.23,
            'drugiViri'            => 1.23,
            'opredelitevDrugiViri' => "zz",
//            'vlozekGostitelja'     => 1.23,
//            'vlozekKoproducenta'   => 1.23,
            'drugiJavni'           => 1.23,
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
            'celotnaVrednost'      => 1.23,
            'zaproseno'            => 1.23,
            'lastnaSredstva'       => 1.23,
//            'avtorskiHonorarji'  => 1.23,
//            'tantieme'           => 1.23,
            'drugiViri'            => 1.23,
            'opredelitevDrugiViri' => "zz",
//            'vlozekGostitelja'     => 1.23,
//            'vlozekKoproducenta'   => 1.23,
            'drugiJavni'           => 1.23,
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

}
