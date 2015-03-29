<?php

use \AcceptanceTester;

class KontaktnaCest
    extends BasicCest
{

    protected function zapolni(AcceptanceTester $I)
    {
        //nezadostna validacija vnosov pri dodajanju kontaktne osebe
        $I->fillToOneEditor(KontaktnaPage::$klient, '0441');
        $I->fillField(KontaktnaPage::$zaporednaStevilka, $I->genRandStr('', 3));
        $I->fillField(KontaktnaPage::$naziv, $I->genRandStr('Knt_', 11));
        $I->fillField(KontaktnaPage::$delovnoMesto, $I->genRandStr('Knt_', 11));
        $I->fillField(KontaktnaPage::$telefonskaStevilka, $I->genRandStr('Knt_', 11));

        /*$I->selectToOneEditorOption('uredi[fieldset][naslov]', 'MK TRGOVINA');
        $I->fillToOneEditor('uredi[fieldset][naslov]', 'Privzeti naslov');
        treba najt boljšo rešitev za to ker rabi predolgo da izbere enega*/
        $I->fillField(KontaktnaPage::$fax, $I->genRandStr('Knt_', 11));
        $I->fillField(KontaktnaPage::$mobilnaStevilka, $I->genRandStr('Knt_', 11));
        $I->fillField(KontaktnaPage::$email, 'test@test.si');
    }

    // tests
    public function testiranjeDodajanjaKontaktneosebe(AcceptanceTester $I)
    {
        $this->testiranjeDodajanja($I, KontaktnaPage::$URL, KontaktnaPage::$naziv);
    }

    public function testiranjePregledaKontaktneosebe(AcceptanceTester $I)
    {
        $this->testiranjePregleda($I, KontaktnaPage::$URL);
    }

    public function testiranjeUrejanjaKontaktneosebe(AcceptanceTester $I)
    {
        $this->testiranjeUrejanja($I, KontaktnaPage::$URL, KontaktnaPage::$naziv);
    }

    public function testiranjeOdstranjevanjaKontaktneosebe(AcceptanceTester $I)
    {
        $this->testiranjeOdstranjevanja($I, KontaktnaPage::$URL);
    }

}
