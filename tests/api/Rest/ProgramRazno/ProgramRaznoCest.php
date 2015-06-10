<?php

/*
 *  Licenca GPLv3
 */

namespace  Rest\ProgramRazno;

use ApiTester;

/**
 * Description of ProgramRazno
 * 
 * 
 * metode, ki jo podpira API
 * - create
 * - getlist
 * - update  - ne delam, ker ima le 2 polji
 * - get - kontrola vseh polj te entitete
 * - delete
 * validate metodo za entiteto
 * relacije z drugimi entitetami (to many relacije)
 * getlist različne variante relacij
 * 
 *
 * @author rado
 */
class ProgramRaznoCest
{

    private $restUrl = '/rest/programrazno';
    private $obj1;
    private $obj2;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
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
            'dokument'        => NULL,
            'nazivSklopa'     => 'zz',
            'naslovPE'        => 'zz',
            'avtorPE'         => 'zz',
            'obsegPE'         => 'zz',
            'mesecPE'         => 'zz',
            'vrednostPE'      => 1.23,
            'stPE'            => 1,
            'soorganizator'   => 'zz',
            'stObiskovalcev'  => 1,
            'stZaposlenih'    => 1,
            'stHonoranih'     => 1,
            'zaproseno'       => 1.23,
            'celotnaVrednost' => 1.23,
            'lastnaSredstva'  => 1.23,
            'drugiViri'       => 1.23,
            'viriDMinLok'     => 1.23,
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['soorganizator'], 'zz');

        // kreiramo še en zapis
        $data       = [
            'dokument'        => NULL,
            'nazivSklopa'     => 'aa',
            'naslovPE'        => 'aa',
            'avtorPE'         => 'aa',
            'obsegPE'         => 'aa',
            'mesecPE'         => 'aa',
            'vrednostPE'      => 2.23,
            'stPE'            => 2,
            'soorganizator'   => 'aa',
            'stObiskovalcev'  => 2,
            'stZaposlenih'    => 2,
            'stHonoranih'     => 2,
            'zaproseno'       => 2.23,
            'celotnaVrednost' => 2.23,
            'lastnaSredstva'  => 2.23,
            'drugiViri'       => 2.23,
            'viriDMinLok'     => 2.23,
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['soorganizator'], 'aa');
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
        $ent['zaproseno'] = 2.34;

        $this->obj1 = $entR       = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['zaproseno'], 2.34);
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
        $I->assertEquals($ent['dokument'       ], NULL);
        $I->assertEquals($ent['nazivSklopa'    ], 'zz');
        $I->assertEquals($ent['naslovPE'       ], 'zz');
        $I->assertEquals($ent['avtorPE'        ], 'zz');
        $I->assertEquals($ent['obsegPE'        ], 'zz');
        $I->assertEquals($ent['mesecPE'        ], 'zz');
        $I->assertEquals($ent['vrednostPE'     ], 1.23);
        $I->assertEquals($ent['stPE'           ], 1);
        $I->assertEquals($ent['soorganizator'  ], 'zz');
        $I->assertEquals($ent['stObiskovalcev' ], 1);
        $I->assertEquals($ent['stZaposlenih'   ], 1);
        $I->assertEquals($ent['stHonoranih'    ], 1);
        $I->assertEquals($ent['zaproseno'      ], 2.34);
        $I->assertEquals($ent['celotnaVrednost'], 1.23);
        $I->assertEquals($ent['lastnaSredstva' ], 1.23);
        $I->assertEquals($ent['drugiViri'      ], 1.23);
        $I->assertEquals($ent['viriDMinLok'    ], 1.23);
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
     * brisanje zapisa
     * 
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $I->successfullyDelete($this->restUrl, $this->obj1['id']);
        $I->failToGet($this->restUrl, $this->obj1['id']);
    }

}
