<?php

use \AcceptanceTester;

class DrzavaCest
    extends BasicCest
{

    protected function zapolni(AcceptanceTester $I)
    {
        $I->fillField(DrzavaPage::$sifra, $I->genRandStr('Drz_', 11));
        $I->fillField(DrzavaPage::$trimestnaKoda, $I->genRandStr('', 3));
        $I->fillField(DrzavaPage::$stevilcnaKoda, $I->genRandStr('', 3));
        $I->fillField(DrzavaPage::$isoNaziv, $I->genRandStr('Drz_', 11));
        $I->fillField(DrzavaPage::$naziv, $I->genRandStr('Drz_', 11));
        $I->fillField(DrzavaPage::$opomba, $I->genRandStr('Drz_', 11));
    }

    // tests
    public function testiranjeDodajanjaDrzave(AcceptanceTester $I)
    {
        $this->testiranjeDodajanja($I, DrzavaPage::$URL, DrzavaPage::$sifra);
    }

    public function testiranjePregledaDrzave(AcceptanceTester $I)
    {
        $this->testiranjePregleda($I, DrzavaPage::$URL);
    }

    public function testiranjeUrejanjaDrzave(AcceptanceTester $I)
    {
        $this->testiranjeUrejanja($I, DrzavaPage::$URL, DrzavaPage::$sifra);
    }

    public function testiranjeOdstranjevanjaDrzave(AcceptanceTester $I)
    {
        $this->testiranjeOdstranjevanja($I, DrzavaPage::$URL);
    }

}
