<?php
use \AcceptanceTester;

class PoslovniPlanCest
{
    protected $imePlana = "Lovrov testni plan";
    // tests
    public function testiranjeDodajanjaPoslovniplan(AcceptanceTester $I)
    {
        $I->loginAsAdmin();
        $I->amOnPage('/#pp');
        $I->waitForAjax();
        $I->click('div#pp-ustvari-pp');
        $I->waitForFragmentLoad();
        $I->fillField("//*[contains(normalize-space(@class), 'naziv-polje')]", $this->imePlana);
        
        $I->fillField("//*[contains(normalize-space(@class), 'datum-polje') and contains(normalize-space(@id), 'zacetek')]", '01.01.2015');
        $I->executeJS("document.getElementsByName('zacetek')[0].focus();document.getElementsByName('zacetek')[0].select();");
        $I->fillField("//*[contains(normalize-space(@class), 'datum-polje') and contains(normalize-space(@id), 'zacetek')]", '01.01.2015');
        
        $I->fillField("//*[contains(normalize-space(@class), 'datum-polje') and contains(normalize-space(@id), 'konec')]", '31.12.2015');
        $I->executeJS("document.getElementsByName('konec')[0].focus();document.getElementsByName('konec')[0].select();");
        $I->fillField("//*[contains(normalize-space(@class), 'datum-polje') and contains(normalize-space(@id), 'konec')]", '31.12.2015');
        
        $I->click('//*[contains(normalize-space(@class), "pp-generiraj-obdobja")]');
        $I->pritisnemNaGumbVToolbaru('shrani');
        $I->waitForSporociloSuccess();
    }

    public function testiranjePregledaPoslovniplan(AcceptanceTester $I)
    {
        $I->loginAsAdmin();
        $I->amOnPage('/#pp');
        $I->waitForAjax();
        $I->click('div#pp-analiziraj-pp');
        $I->waitForAjax();
        $I->click("//*[text()[contains(.,'$this->imePlana')]]");
    }

    public function testiranjeUrejanjaPoslovniplan(AcceptanceTester $I)
    {
        $I->loginAsAdmin();
        $I->amOnPage('/#pp');
        $I->waitForAjax();
        $I->click('div#pp-uredi-pp');
        $I->waitForAjax();
        $I->click("//*[text()[contains(.,'$this->imePlana')]]");
    }

    public function testiranjeOdstranjevanjaPoslovniplan(AcceptanceTester $I)
    {
        
    }
}