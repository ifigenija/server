<?php

use \AcceptanceTester;

class TiskalnikCest
    extends BasicCest
{

    protected function zapolni(AcceptanceTester $I)
    {
        $I->fillField(TiskalnikPage::$imeTiskalnika, $I->genRandStr('Tisk_', 11));
        $I->selectOption(TiskalnikPage::$vrstaTiskalnika, 'CUPS');
        $I->selectOption(TiskalnikPage::$razredTiskalnika, 'Tiskalnik za nalepke');
        $I->fillField(TiskalnikPage::$naslovTiskalnika, $I->genRandStr('Tisk_', 11));
        $I->fillField(TiskalnikPage::$fizicnaLokacija, $I->genRandStr('Tisk_', 11));
    }

    // tests
    public function testiranjeDodajanjaTiskalnika(AcceptanceTester $I)
    {
        $this->testiranjeDodajanja($I, TiskalnikPage::$URL, TiskalnikPage::$imeTiskalnika);
    }

    public function testiranjePregledaTiskalnika(AcceptanceTester $I)
    {
        $this->testiranjePregleda($I, TiskalnikPage::$URL);
    }

    public function testiranjeUrejanjaTiskalnika(AcceptanceTester $I)
    {
        $this->testiranjeUrejanja($I, TiskalnikPage::$URL, TiskalnikPage::$imeTiskalnika);
    }

    public function testiranjeOdstranjevanjaTiskalnika(AcceptanceTester $I)
    {
        $this->testiranjeOdstranjevanja($I, TiskalnikPage::$URL);
    }

}
