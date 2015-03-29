<?php

use \AcceptanceTester;

class PopaCest
    extends BasicCest
{

    protected function zapolni(AcceptanceTester $I)
    {
        //pri dodajanju je validacija vnosov nezadostna
        //osnovni podatki
        $I->fillField(PopaPage::$sifra, $I->genRandStr('', 4));
        $I->selectOption(PopaPage::$tipKlienta, 'Kupec');
        $I->selectOption(PopaPage::$statusKlienta, 'Aktiven');
        $I->fillToOneEditor(PopaPage::$klasifikacija, '0');
        $I->fillField(PopaPage::$naziv, $I->genRandStr('Popa_', 11));
        $I->fillField(PopaPage::$dodatniNaziv, $I->genRandStr('Popa_', 11));
        $I->fillField(PopaPage::$panoga, $I->genRandStr('Popa_', 11));

        //Kontaktni podatki
        $I->fillField(PopaPage::$telefon, $I->genRandStr('Popa_', 11));
        $I->fillField(PopaPage::$telefax, $I->genRandStr('Popa_', 11));
        $I->fillField(PopaPage::$ePosta, 'test@test.si'); //samo za email se preverja formating
        $I->fillField(PopaPage::$spletnaStran, $I->genRandStr('Popa_', 11));
        $I->fillToOneEditor(PopaPage::$drzava, 'AD');

        //Računi
        $I->fillField(PopaPage::$trr1, $I->genRandStr('Popa_', 11));
        $I->fillField(PopaPage::$trr2, $I->genRandStr('Popa_', 11));
        $I->fillField(PopaPage::$trr3, $I->genRandStr('Popa_', 11));
        $I->fillField(PopaPage::$trr4, $I->genRandStr('Popa_', 11));

        //Komercialni pogoji
        $I->fillField(PopaPage::$rokPlacilaKupca, $I->genRandStr('Popa_', 11));
        $I->fillField(PopaPage::$rokPlacilaDobavitelja, $I->genRandStr('Popa_', 11));
        $I->fillField(PopaPage::$dniPotrditve, $I->genRandStr('Popa_', 11));
        $I->fillField(PopaPage::$rabat, $I->genRandStr('Popa_', 11));
        $I->fillField(PopaPage::$izjava, $I->genRandStr('Popa_', 11));

        //Davčni Podatki
        $I->fillField(PopaPage::$idZaDDV, $I->genRandStr('Popa_', 11));
        $I->fillField(PopaPage::$maticnaStevilka, $I->genRandStr('Popa_', 11));
        $I->checkOption(PopaPage::$zavezanecZaDVCSS); //css
        $I->checkOption(PopaPage::$jeEUCSS); //css
        $I->fillField(PopaPage::$zavezanecZaDDVOd, $I->genRandStr('Popa_', 11));
        $I->pressKey(PopaPage::$zavezanecZaDDVOdCSS, \WebDriverKeys::TAB); //css
        $I->fillField(PopaPage::$zavezanecZaDDVDo, $I->genRandStr('Popa_', 11));
        $I->pressKey(PopaPage::$zavezanecZaDDVDoCSS, \WebDriverKeys::TAB); //css
    }

    // tests
    public function testiranjeDodajanjaPoslovnegaPartnerja(AcceptanceTester $I)
    {
        $this->testiranjeDodajanja($I, PopaPage::$URL, PopaPage::$sifra);
    }

    public function testiranjePregledaPoslovnegaPartnerja(AcceptanceTester $I)
    {
        $this->testiranjePregleda($I, PopaPage::$URL);
    }

    public function testiranjeUrejanjaPoslovnegaPartnerja(AcceptanceTester $I)
    {
        $this->testiranjeurejanja($I, PopaPage::$URL, PopaPage::$sifra);
    }

    public function testiranjeOdstranjevanjaPoslovnegaPartnerja(AcceptanceTester $I)
    {
        $this->testiranjeOdstranjevanja($I, PopaPage::$URL);
    }

}
