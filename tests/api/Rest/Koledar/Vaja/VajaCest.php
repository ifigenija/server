<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\Koledar\Vaja;

use ApiTester;

/**
 * Description of VajaCest
 *
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto - ni validacije
 *      relacije z drugimi entitetami
 *      - uprizoritev
 *      - dogodek
 *      getlist različne variante relacij
 *      - vse
 *      - uprizoritev
 * 
 * @author rado
 */
class VajaCest
{

    private $restUrl        = '/rest/vaja';
    private $dogodekUrl     = '/rest/dogodek';
    private $uprizoritevUrl = '/rest/uprizoritev';
    private $obj1;
    private $obj2;
    private $obj3;
    private $obj4;
    private $objDogodek;
    private $lookUprizoritev2;
    private $lookUprizoritev1;
    private $lookUprizoritev3;
    private $altUpr1Ids;
    private $altUpr2Ids;
    private $altUpr3Ids;
    private $lookTipVaje1;
    private $lookTipVaje2;
    private $lookTipVaje3;
    private $lookProstor1;
    private $lookProstor2;
    private $lookProstor3;
    private $lookSezona1;
    private $lookSezona2;
    private $lookSezona3;
    private $lookOseba1;
    private $lookOseba2;
    private $lookOseba3;
    private $lookOseba4;

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
     * 
     * @param ApiTester $I
     */
    public function lookupUprizoritev(ApiTester $I)
    {
        $this->lookUprizoritev1 = $look                   = $I->lookupEntity("uprizoritev", "0002", false);
        $I->assertGuid($look['id']);
        /*
         * še poiščemo vse pripadajoče alternacije
         */
        $upr                    = $I->successfullyGet($this->uprizoritevUrl, $look ['id']);
        $this->altUpr1Ids       = $altUpr                 = array_column($I->subarrayValuesToArray(array_column($upr['funkcije'], 'alternacije')), 'id');
        codecept_debug($altUpr);

        $this->lookUprizoritev2 = $look                   = $I->lookupEntity("uprizoritev", "0001", false);
        codecept_debug($look);
        $I->assertGuid($look['id']);
        /*
         * še poiščemo vse pripadajoče alternacije
         */
        $upr                    = $I->successfullyGet($this->uprizoritevUrl, $look ['id']);
        $this->altUpr2Ids       = $altUpr                 = array_column($I->subarrayValuesToArray(array_column($upr['funkcije'], 'alternacije')), 'id');
        codecept_debug($altUpr);

        $this->lookUprizoritev3 = $look                   = $I->lookupEntity("uprizoritev", "0003", false);
        $I->assertGuid($look['id']);
        /*
         * še poiščemo vse pripadajoče alternacije
         */
        $upr                    = $I->successfullyGet($this->uprizoritevUrl, $look ['id']);
        $this->altUpr3Ids       = $altUpr                 = array_column($I->subarrayValuesToArray(array_column($upr['funkcije'], 'alternacije')), 'id');
        codecept_debug($altUpr);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupTipVaje(ApiTester $I)
    {
        $this->lookTipVaje1 = $look               = $I->lookupEntity("tipvaje", "0001", false);
        $I->assertGuid($look['id']);

        $this->lookTipVaje2 = $look               = $I->lookupEntity("tipvaje", "0002", false);
        $I->assertGuid($look['id']);

        $this->lookTipVaje3 = $look               = $I->lookupEntity("tipvaje", "0003", false);
        $I->assertGuid($look['id']);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupProstor(ApiTester $I)
    {
        $this->lookProstor1 = $look               = $I->lookupEntity("prostor", "0001", false);
        $I->assertGuid($look['id']);

        $this->lookProstor2 = $look               = $I->lookupEntity("prostor", "0002", false);
        $I->assertGuid($look['id']);

        $this->lookProstor3 = $look               = $I->lookupEntity("prostor", "0003", false);
        $I->assertGuid($look['id']);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupSezona(ApiTester $I)
    {
        $this->lookSezona1 = $look              = $I->lookupEntity("sezona", "2015", false);
        $I->assertGuid($look['id']);

        $this->lookSezona2 = $look              = $I->lookupEntity("sezona", "2016", false);
        $I->assertGuid($look['id']);

        $this->lookSezona3 = $look              = $I->lookupEntity("sezona", "2017", false);
        $I->assertGuid($look['id']);
    }

    /**
     *  kreiramo zapisa vaja in dogodek
     * 
     * če je začetek naveden, se kreira zraven tudi dogodek
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $zacetek        = '2014-05-07T10:00:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $data           = [
            'tipvaje'     => $this->lookTipVaje1['id'],
            'zaporedna'   => 9,
            'uprizoritev' => $this->lookUprizoritev1['id'],
            'title'       => "Vaja $zacetek",
            'status'      => '200s',
            'zacetek'     => $zacetek,
            'konec'       => '2014-05-07T14:00:00+0200',
            'prostor'     => $this->lookProstor1['id'],
            'sezona'      => $this->lookSezona1['id'],
        ];
        /*
         * pripravimo parametre alternacij, npr. prve 3 te uprizoritve
         */
        $parAlternacije = '';   //init
        for ($i = 1; $i <= 3; $i++) {
            $parAlternacije .= 'alternacija[]=' . $this->altUpr1Ids[$i] . '&';
        }
        $parGosti   = 'gost[]=' . $this->lookOseba1['id'] . '&'
                . 'gost[]=' . $this->lookOseba2['id'] . '&'
                . 'gost[]=' . $this->lookOseba3['id'] . '&';
        $parDelte   = 'deltaZacTeh=21&deltaKonTeh=20&';
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl . "?" . $parAlternacije . $parGosti . $parDelte, $data);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);
        codecept_debug($data);
        $I->assertEquals($ent['zacetek'], $data['zacetek']);
        $I->assertEquals($ent['konec'], $data['konec']);
        $I->assertEquals($ent['title'], $data['title']);
        $I->assertEquals($ent['status'], $data['status']);
        $I->assertEquals($ent['prostor'], $data['prostor']);
        $I->assertEquals($ent['sezona'], $data['sezona']);

        /**
         * preveri dogodek
         */
        $this->objDogodek = $dogodek          = $I->successfullyGet($this->dogodekUrl, $ent['dogodek']['id']);
        codecept_debug($dogodek);
        $I->assertGuid($dogodek['id']);
        $I->assertEquals($dogodek['title'], $data['title'], 'title');
        $I->assertEquals($dogodek['status'], $data['status'], 'status');
        $I->assertEquals($dogodek['zacetek'], $data['zacetek'], 'zacetek');
        $I->assertEquals($dogodek['konec'], $data['konec'], 'konec');
        $I->assertEquals($dogodek['prostor']['id'], $data['prostor'], 'prostor');
        $I->assertEquals($dogodek['sezona'], $data['sezona'], 'sezona');


        /**
         * kreiramo še eno vajo
         */
        $zacetek        = '2014-05-08T10:00:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $data           = [
            'tipvaje'     => NULL,
            'zaporedna'   => 2,
            'uprizoritev' => $this->lookUprizoritev1['id'],
            'title'       => "Vaja $zacetek",
            'status'      => '200s',
            'zacetek'     => $zacetek,
            'konec'       => '2014-05-08T14:00:00+0200',
            'prostor'     => null,
            'sezona'      => null,
        ];
        $parAlternacije = '';   //init
        for ($i = 1; $i <= 5; $i++) {
            $parAlternacije .= 'alternacija[]=' . $this->altUpr1Ids[$i] . '&';
        }
        $parGosti   = 'gost[]=' . $this->lookOseba1['id'] . '&'
                . 'gost[]=' . $this->lookOseba2['id'] . '&';
        $parDelte   = 'deltaZacTeh=22&deltaKonTeh=23&';
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl . "?" . $parAlternacije . $parGosti . $parDelte, $data);
        $I->assertGuid($ent['id']);


        /**
         * kreiranje vaje z napačnimi alternacijami
         */
        $zacetek        = '2014-05-08T10:00:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $data           = [
            'tipvaje'     => NULL,
            'zaporedna'   => 2,
            'uprizoritev' => $this->lookUprizoritev2['id'],
            'title'       => "Vaja $zacetek",
            'status'      => '200s',
            'zacetek'     => $zacetek,
            'konec'       => '2014-05-08T14:00:00+0200',
            'prostor'     => null,
            'sezona'      => null,
        ];
        $parAlternacije = '';   //init
        for ($i = 1; $i <= 2; $i++) {
            $parAlternacije .= 'alternacija[]=' . $this->altUpr1Ids[$i] . '&';  // alternacije z druge uprizoritve
        }
        $parGosti   = 'gost[]=' . $this->lookOseba1['id'] . '&'
                . 'gost[]=' . $this->lookOseba2['id'] . '&';
        $parDelte   = 'deltaZacTeh=22&deltaKonTeh=23&';
        $parDezurni = 'dezurni[]=' . $this->lookOseba1['id'];
        $resp       = $I->failToCreate($this->restUrl . "?" . $parAlternacije, $data);
        codecept_debug($resp);
        $I->assertEquals(1001090, $resp[0]['code']);

        /*
         * dežurni ni dovoljen
         */
        $resp = $I->failToCreate($this->restUrl . "?" . $parDezurni, $data);
        codecept_debug($resp);
        $I->assertEquals(1001092, $resp[0]['code']);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListDefaultPoUprizoritvi(ApiTester $I)
    {
        $resp   = $I->successfullyGetList($this->restUrl . "?uprizoritev=" . $this->lookUprizoritev1['id'], []);
        $list   = $resp['data'];
        $totRec = $resp['state']['totalRecords'];
        codecept_debug($list);
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
//        $I->assertEquals(2, $list[0]['zaporedna']);      //  odvisno od sortiranja
//        $I->assertEquals(9, $list[$totRec - 1]['zaporedna']);      //  odvisno od sortiranja
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $data          = $this->obj1;
        $data['title'] = 'yy';
        codecept_debug($data);
        $this->obj1    = $ent           = $I->successfullyUpdate($this->restUrl, $data['id'], $data);
        $I->assertEquals($ent['title'], $data['title']);
        
        /**
         * preveri dogodek
         */
        $dogodek = $I->successfullyGet($this->dogodekUrl, $data['dogodek']['id']);
        codecept_debug($dogodek);
        $I->assertGuid($dogodek['id']);
        $I->assertEquals($dogodek['title'], $data['title'], 'title');


        /*
         * update čas - mora spremeniti čase terminov storitev glede na njihove delte
         */
        $data            = $this->obj2;
        $data['zacetek'] = '2014-06-08T20:20:00+0200';
        $data['konec']   = '2014-06-08T22:20:00+0200';
        $this->obj2      = $ent             = $I->successfullyUpdate($this->restUrl, $data['id'], $data);
        /*
         * $$ tu bi še lahko preveril čase terminov storitev
         */
        
        
        
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
        $zacetek = '2014-05-07T10:00:00+0200';
        $I->assertGuid($ent['id']);
        $I->assertEquals($ent['tipvaje'], $this->lookTipVaje1['id'], 'tipvaje');
        $I->assertEquals($ent['zaporedna'], 9);
        $I->assertEquals($ent['uprizoritev'], $this->lookUprizoritev1['id']);
        $I->assertEquals($ent['title'], "yy");
        $I->assertEquals($ent['status'], '200s');
        $I->assertEquals($ent['zacetek'], $zacetek);
        $I->assertEquals($ent['konec'], '2014-05-07T14:00:00+0200');
        $I->assertEquals($ent['prostor'], $this->lookProstor1['id']);
        $I->assertEquals($ent['sezona'], $this->lookSezona1['id']);
    }

    /**
     * brisanje zapisa
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $I->successfullyDelete($this->restUrl, $this->obj1['id']);
        $I->failToGet($this->restUrl, $this->obj1['id']);
        /**
         * ali je hkrati brisal tudi dogodek
         */
        $I->failToGet($this->dogodekUrl, $this->obj1['dogodek']['id']);
    }

}
