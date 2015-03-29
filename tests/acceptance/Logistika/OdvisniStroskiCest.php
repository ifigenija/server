<?php

use \AcceptanceTester;

class OdvisniStroskiCest
    extends BasicCest
{

    protected function zapolni(AcceptanceTester $I)
    {
        $I->fillField(OdvisniStroskiPage::$kodaStoritve, $I->genRandStr('', 3));
        $I->fillField(OdvisniStroskiPage::$naziv, $I->genRandStr('Sfr_', 11));
    }

    // tests
    public function testiranjeDodajanjaSifranta(AcceptanceTester $I)
    {
        $this->testiranjeDodajanja($I, OdvisniStroskiPage::$URL, OdvisniStroskiPage::$kodaStoritve);
    }

    public function testiranjePregledaSifranta(AcceptanceTester $I)
    {
        $this->testiranjePregleda($I, OdvisniStroskiPage::$URL);
    }

    public function testiranjeUrejanjaSifranta(AcceptanceTester $I)
    {
        $this->testiranjeUrejanja($I, OdvisniStroskiPage::$URL, OdvisniStroskiPage::$kodaStoritve);
    }

    public function testiranjeOdstranjevanjaSifranta(AcceptanceTester $I)
    {
        $this->testiranjeOdstranjevanja($I, OdvisniStroskiPage::$URL);
    }

}
