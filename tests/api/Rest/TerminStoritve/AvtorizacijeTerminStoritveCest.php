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
    private $obj;

    public function _before(ApiTester $I)
    {
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     * @param ApiTester $I
     */
    public function lookupFunkcijo(ApiTester $I)
    {
        $this->lookFunkcija = $look               = $I->lookupEntity("funkcija", "Tezej", false);
        codecept_debug($look);
        $I->assertNotEmpty($look);
    }

}
