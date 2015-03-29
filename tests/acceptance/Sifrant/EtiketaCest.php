<?php

use \AcceptanceTester;

class EtiketaCest
    extends BasicCest
{

    protected function zapolni(AcceptanceTester $I)
    {
        $I->selectOption(EtiketaPage::$vrstaEtikete, 'Logistična');
        $I->fillField(EtiketaPage::$kratkiNaziv, $I->genRandStr('Eti_', 6));
        $I->fillField(EtiketaPage::$imeEtikete, $I->genRandStr('Eti_', 6));
        $I->selectOption(EtiketaPage::$vrstaEtikete, 'zebra');
        $I->fillField(EtiketaPage::$kolon, $I->genRandStr('Eti_', 6));
        $I->fillField(EtiketaPage::$vrstic, $I->genRandStr('Eti_', 6));
        $I->fillField(EtiketaPage::$stil, $I->genRandStr('Eti_', 6));
        $I->fillField(EtiketaPage::$predlogaEtikete, $I->genRandStr('Eti_', 6));
    }

    // tests
    public function testiranjeDodajanjaEtikete(AcceptanceTester $I)
    {
        $this->testiranjeDodajanja($I, EtiketaPage::$URL, EtiketaPage::$kratkiNaziv);
    }

    public function testiranjePregledaEtikete(AcceptanceTester $I)
    {
        $this->testiranjePregleda($I, EtiketaPage::$URL);
    }

    public function testiranjeUrejanjaEtikete(AcceptanceTester $I)
    {
        $this->testiranjeUrejanja($I, EtiketaPage::$URL, EtiketaPage::$kratkiNaziv);
    }

    public function testiranjeOdstranjevanjaEtikete(AcceptanceTester $I)
    {
        $this->testiranjeOdstranjevanja($I, EtiketaPage::$URL);
    }

}
