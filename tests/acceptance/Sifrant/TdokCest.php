<?php

use \AcceptanceTester;

class TdokCest
    extends BasicCest
{

    protected function zapolni(AcceptanceTester $I)
    {
        $I->fillField(TdokPage::$sifra, $I->genRandStr('', 11));
        $I->fillField(TdokPage::$kratkiNaziv, $I->genRandStr('Tdok_', 2));
        $I->fillField(TdokPage::$naziv, $I->genRandStr('Tdok_', 11));
        $I->selectOption(TdokPage::$tip, 'Reklamacija');
        $I->checkOption(TdokPage::$stevilcenjePriponk); //css
        $I->fillToOneEditor(TdokPage::$vrstaStevilcenja, 'BCD');
        $I->selectOption(TdokPage::$velikostStrani, 'A4 Pokončno');
        $I->selectOption(TdokPage::$slikaZaGlavo, 'Majhen');
        $I->selectOption(TdokPage::$slikaZaNogo, 'Majhen');
        $I->fillField(TdokPage::$predlogaDokumenta, $I->genRandStr('Tdok_', 11));
        $I->fillField(TdokPage::$stilDokumenta, $I->genRandStr('Tdok_', 11));
    }

    // tests
    public function testiranjeDodajanjaTipDokumenta(AcceptanceTester $I)
    {
        $this->testiranjeDodajanja($I, TdokPage::$URL, TdokPage::$sifra);
    }

    public function testiranjePregledaTipDokumenta(AcceptanceTester $I)
    {
        $this->testiranjePregleda($I, TdokPage::$URL);
    }

    public function testiranjeUrejanjaTipDokumenta(AcceptanceTester $I)
    {
        $this->testiranjeUrejanja($I, TdokPage::$URL, TdokPage::$sifra);
    }

    public function testiranjeOdstranjevanjaTipDokumenta(AcceptanceTester $I)
    {
        $this->testiranjeOdstranjevanja($I, TdokPage::$URL);
    }

}
