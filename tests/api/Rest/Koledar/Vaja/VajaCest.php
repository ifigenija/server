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
    private $obj;
    private $obj2;
    private $obj3;
    private $obj4;
    private $objDogodek;
    private $objUprizoritev;
    private $lookUprizoritev1;
    private $lookUprizoritev2;
    private $lookUprizoritev3;

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
    }

    /**
     *  kreiramo zapis
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'zaporedna'   => 6,
            'porocilo'    => 'zz',
            'dogodek'     => null, // najprej mora biti kreirana vaja, šele potem dogodek.
            'uprizoritev' => $this->lookUprizoritev1['id'],
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['porocilo'], 'zz');

        // kreiramo še en zapis
        $data       = [
            'zaporedna'   => 2,
            'porocilo'    => 'aa',
            'dogodek'     => null, //najprej mora biti kreirana vaja, šele potem dogodek.
            'uprizoritev' => $this->lookUprizoritev1['id'],
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['porocilo'], 'aa');
    }

    /**
     *  kreiramo zapisa vaja in dogodek
     * 
     * če je začetek naveden, se kreira zraven tudi dogodek
     * 
     * @param ApiTester $I
     */
    public function createZDogodkom(ApiTester $I)
    {
        $zacetek    = '2014-05-07T00:00:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $data       = [
            'zacetek'     => $zacetek,
            'konec'       => null, // prazno, da ga sam doda zraven
            'zaporedna'   => 9,
            'porocilo'    => 'dd',
            'uprizoritev' => $this->lookUprizoritev3['id'],
        ];
        $this->obj3 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['dogodek']['zacetek'], $zacetek);
        $I->assertEquals($ent['dogodek']['konec'], '2014-05-07T04:00:00+0200'); // začetek + 4h

        /**
         * preveri dogodek
         */
        $dogodek = $I->successfullyGet($this->dogodekUrl, $ent['dogodek']['id']);
        codecept_debug($dogodek);
        $I->assertGuid($dogodek['id']);
        $I->assertEquals($dogodek['zacetek'], $zacetek, "začetek");
        $I->assertEquals($dogodek['konec'], '2014-05-07T04:00:00+0200', "konec"); // začetek + 4h
    }

    /**
     *  kreiramo zapis
     * 
     * najprej mora biti generirana vaja, šele potem lahko generiramo dogodek
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function createDogodekZVajo(ApiTester $I)
    {
        $data             = [
            'planiranZacetek' => '2011-02-01T00:00:00+0100',
            'zacetek'         => '2012-02-01T00:00:00+0100',
            'konec'           => '2013-02-01T00:00:00+0100',
            'status'          => '200s',
            'razred'          => '200s',
            'termin'          => 'zz',
            'ime'             => 'zz',
            'predstava'       => null,
            'zasedenost'      => null,
            'vaja'            => $this->obj['id'],
            'gostovanje'      => null,
            'splosni'         => null,
            'prostor'         => null,
            'sezona'          => null,
        ];
        $this->objDogodek = $ent              = $I->successfullyCreate($this->dogodekUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals("200s", $ent['status']);

        //kreiramo še en zapis
        $data = [
            'planiranZacetek' => '2011-02-01T00:00:00+0100',
            'zacetek'         => '2012-02-01T00:00:00+0100',
            'konec'           => '2013-02-01T00:00:00+0100',
            'status'          => "100s",
            'razred'          => '200s',
            'termin'          => 'aa',
            'ime'             => 'aa',
            'predstava'       => null,
            'zasedenost'      => null,
            'vaja'            => $this->obj2['id'],
            'gostovanje'      => null,
            'splosni'         => null,
            'prostor'         => null,
            'sezona'          => null,
        ];
        $ent  = $I->successfullyCreate($this->dogodekUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals("100s", $ent['status']);
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
        $I->assertEquals(6, $list[$totRec - 1]['zaporedna']);      //  odvisno od sortiranja
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent             = $this->obj;
        $ent['porocilo'] = 'yy';

        $this->obj = $entR      = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['porocilo'], 'yy');
    }

    /**
     * Preberem zapis in preverim vsa polja
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function read(\ApiTester $I)
    {
        $ent = $I->successfullyGet($this->restUrl, $this->obj['id']);

        codecept_debug($ent);
        $I->assertGuid($ent['id']);
        $I->assertEquals($ent['zaporedna'], 6);
        $I->assertEquals($ent['porocilo'], 'yy');
        $I->assertEquals($ent['dogodek']['id'], $this->objDogodek['id']);
        $I->assertEquals($ent['uprizoritev'], $this->lookUprizoritev1['id']);
    }

    /**
     * brisanje zapisa
     * 
     * @depends create
     */
    public function deleteDogodek(ApiTester $I)
    {
        $I->successfullyDelete($this->dogodekUrl, $this->objDogodek['id']);
        $I->failToGet($this->dogodekUrl, $this->objDogodek['id']);
    }

    /**
     * brisanje zapisa
     * @depends deleteDogodek
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $I->successfullyDelete($this->restUrl, $this->obj['id']);
        $I->failToGet($this->restUrl, $this->obj['id']);
    }

    /**
     * poskusi brisanje vaje z dogodkom
     * 
     * @depends createZDogodkom
     */
    public function deleteVajeZDogodkom(ApiTester $I)
    {
        /**
         * ne gre izbrisati, ker je dogodek referenciran
         */
        $resp = $I->failToDelete($this->restUrl, $this->obj3['id']);
        codecept_debug($resp);
        $I->assertEquals(23503, $resp[1]['code'], " Foreign key violation - brisanje  vaje ni mogoček, ker se uporablja v dogodku");
    }

}
