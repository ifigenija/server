<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\TerminStoritve;

use ApiTester;

/**
 * Description of AvtorizacijeTerminStoritveCest
 * 
 * dostop do terminov storitve. Naslanjamo se na testne fixturje
 * Za narediti:
 * - zavrnitve dostopa
 *   . navaden user 
 *   . user, ki ima le TerminStoritve-write  dostop  
 *   . user, ki je tehnični vodja, pa bi rad popravljal ostale zapise
 *   .  user, ki je sicer vodja ekipe (inšpecient), vendar termin storitve ni vezan na neko uprizoritev
 * - omogočanje dostopa
 *   . tehničnemu vodji dostop do ur tehničnega osebja dotične uprizoritve
 *   . inšpicientu dostop do ur vsega osebja v dotični uprizoritvi
 *   . uporabniku s posebnim dovoljenem "TerminStoritve-vse" do vsega
 *      . tudi do tistih , kjer ni uprizoritve
 *      . do vseh ki so v uprizoritvi
 * 
 * @author rado
 */
class AvtorizacijeTerminStoritveCest
{

    private $restUrl        = '/rest/terminstoritve';
    private $alternacijaUrl = '/rest/alternacija';
    private $obj1;
    private $lookAlternacija;

    public function _before(ApiTester $I)
    {
        
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     * @param ApiTester $I
     */
    public function lookupAlternacije(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);

        $this->lookAlternacija = $look                  = $I->lookupEntity("alternacija", "0001", false);
        codecept_debug($look);
        $I->assertNotEmpty($look);
    }

    /**
     * najde nek dogodek
     * 
     * @param ApiTester $I
     */
    public function getListTerminovStoritev(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);

        $resp       = $I->successfullyGetList($this->restUrl . "/vse", []);
        $list       = $resp['data'];
        $I->assertNotEmpty($list);
        $this->obj1 = $ent        = array_pop($list);
        codecept_debug($ent);
        $I->assertNotEmpty($ent);
    }

    /**
     * @param ApiTester $I
     */
    public function updateZAnonymous(ApiTester $I)
    {
        $ent                   = $this->obj1;
        $ent['planiranoTraja'] = 1;

        $resp = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
    }

    /**
     * @param ApiTester $I
     */
    public function updateZAdmin(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);

        $ent                   = $this->obj1;
        $ent['planiranoTraja'] = 3;

        $resp = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertNotEmpty($resp);
    }

    /**
     * @param ApiTester $I
     */
    public function updateZInspicientom(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$ivo, \IfiTest\AuthPage::$ivoPass);

        $ent                   = $this->obj1;
        $ent['planiranoTraja'] = 4;

        $resp = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertNotEmpty($resp);
    }

    /**
     * @param ApiTester $I
     */
    public function updateSTehVodjem(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$tona, \IfiTest\AuthPage::$tonaPass);

        $ent                   = $this->obj1;
        $ent['planiranoTraja'] = 5;

        $resp = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertNotEmpty($resp);
    }

    /**
     * @param ApiTester $I
     */
    public function updateZNavadnimUserjem(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$irena, \IfiTest\AuthPage::$irenaPass);

        $ent                   = $this->obj1;
        $ent['planiranoTraja'] = 6;

        $resp = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertNotEmpty($resp);
    }

}
