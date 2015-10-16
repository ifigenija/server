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
    private $objUprizoritev;
    private $lookUprizoritev1;
    private $lookUprizoritev2;
    private $lookUprizoritev3;
    private $lookTipVaje1;
    private $lookTipVaje2;
    private $lookTipVaje3;
    private $lookProstor1;
    private $lookProstor2;
    private $lookProstor3;

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
        $I->assertGuid($look['id']);
        $this->lookUprizoritev2 = $look                   = $I->lookupEntity("uprizoritev", "0002", false);
        $I->assertGuid($look['id']);
        $this->lookUprizoritev3 = $look                   = $I->lookupEntity("uprizoritev", "0003", false);
        $I->assertGuid($look['id']);
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
     *  kreiramo zapisa vaja in dogodek
     * 
     * če je začetek naveden, se kreira zraven tudi dogodek
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $zacetek    = '2014-05-07T10:00:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $data       = [
            'tipvaje'     => $this->lookTipVaje1['id'],
            'zaporedna'   => 9,
            'porocilo'    => 'dd',
            'uprizoritev' => $this->lookUprizoritev1['id'],
            'title'       => "Vaja $zacetek",
            'status'      => '100s',
            'zacetek'     => $zacetek,
            'konec'       => '2014-05-07T14:00:00+0200',
            'prostor'     => $this->lookProstor1['id'],
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);
        codecept_debug($data);
        $I->assertEquals($ent['zacetek'], $data['zacetek']);
        $I->assertEquals($ent['konec'], $data['konec']);

        /**
         * preveri dogodek
         */
        $this->objDogodek = $dogodek          = $I->successfullyGet($this->dogodekUrl, $ent['dogodek']);
        codecept_debug($dogodek);
        $I->assertGuid($dogodek['id']);
        $I->assertEquals($dogodek['zacetek'], $data['zacetek'], "začetek");
        $I->assertEquals($dogodek['konec'], $data['konec'], "konec");

        /**
         * kreiramo še eno vajo
         */
        $zacetek    = '2014-05-08T10:00:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $data       = [
            'tipvaje'     => NULL,
            'zaporedna'   => 2,
            'porocilo'    => 'ee',
            'uprizoritev' => $this->lookUprizoritev1['id'],
            'title'       => "Vaja $zacetek",
            'status'      => '200s',
            'zacetek'     => $zacetek,
            'konec'       => '2014-05-08T14:00:00+0200',
            'prostor'     => null,
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
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
        $I->assertEquals(2, $list[0]['zaporedna']);      //  odvisno od sortiranja
        $I->assertEquals(9, $list[$totRec - 1]['zaporedna']);      //  odvisno od sortiranja
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
        $ent['porocilo'] = 'yy';

        $this->obj1 = $entR       = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['porocilo'], $ent['porocilo']);
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
        $I->assertEquals($ent['tipvaje'], $this->lookTipVaje1['id']);
        $I->assertEquals($ent['zaporedna'], 9);
        $I->assertEquals($ent['porocilo'], 'yy');
        $I->assertEquals($ent['uprizoritev'], $this->lookUprizoritev1['id']);
        $I->assertEquals($ent['title'], "Vaja $zacetek");
        $I->assertEquals($ent['status'], '100s');
        $I->assertEquals($ent['zacetek'], $zacetek);
        $I->assertEquals($ent['konec'], '2014-05-07T14:00:00+0200');
        $I->assertEquals($ent['prostor'], $this->lookProstor1['id']);
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
        $I->failToGet($this->dogodekUrl, $this->obj1['dogodek']);
    }

}
