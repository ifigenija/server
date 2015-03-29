<?php

namespace Proizvodnja\Pakiranje;

use \AcceptanceTester;
use \ProizvodnjaPakiranjePage as Page;

/**


 */
class PakiranjeOperacijaCest
{


    public function _before(AcceptanceTester $I)
    {
        $I->loginAsAdmin();
    }

    public function _after(AcceptanceTester $I)
    {
        
    }

    /**
     * Testiram pakiranje paketa. Scenarij:
     * 1. Pregledam odprte pakirne operacije
     *    - izberem status "brez" poiščem in najdem operacijo
     * 2. sprožim nadaljevanje operacije 
     * 3. vpišem barkodo za paket
     * 4. dodam nadpaket
     * 5. vpišem kodo za naslednji paket
     * 6. prekinem pakirno operacijo 
     * 
     * @param AcceptanceTester $I
     */
    public function pakirajStandardno(AcceptanceTester $I)
    {
        $I->gremNaStran(Page::$operUrl);
        $I->checkOption(Page::$status100);
        $I->click('Išči');
        $I->waitForFragmentLoad();
        $I->seeElementInDOM(Page::$operacija);

        // Začni pakirno operacijo
        $I->click('Nadaljuj');
        $I->waitForFragmentLoad();
        $I->canSeeElement(Page::$barcodeField);

        // Vpišem barkodo paketa za skeniranje
        $I->fillField(Page::$barcodeField, Page::$paket1);
        $I->click('OK');
        $I->waitForFragmentLoad();


        // Napolnim polje za nadpaket
        $I->click('Nadpaket');
        $I->waitForFragmentLoad();
        $I->see('Določi nadpaket');
        $I->fillField(Page::$barcodeField, Page::$nadpaket1);
        $I->click('OK');
        $I->waitForFragmentLoad();

        // Dodam še en osnovni paket
        $I->see('Vsebovan v:');
        $I->see('Sestavljen iz:');
        $I->fillField(Page::$barcodeField, Page::$paket2);
        $I->click('OK');

        // vidim da je sestvljen iz prvega in drugega paketa
        $I->waitForFragmentLoad();
        $I->see(Page::$paket1);
        $I->see(Page::$paket2);

        //prekinem pakirno operacijo 
        $I->click('Končaj pakirno operacijo');
    }

    /**
     *
     * Scenarij:
     * - odprem strran s pakirnimi operacijami
     * - poskeniram novi paket
     * - kliknem spremeni paket
     * - spremenim količino 
     * - shranim spremenjeno količino 
     * - potem prekličem paket 
     *  
     * @param AcceptanceTester $I
     * 
     */
    public function spremeniPaket(\AcceptanceTester $I)
    {
        $I->gremNaStran(Page::$operUrl);
        $I->checkOption(Page::$status100);
        $I->click('Išči');
        $I->waitForFragmentLoad();
        $I->seeElementInDOM(Page::$operacija);

        // Začni pakirno operacijo
        $I->click('Nadaljuj');
        $I->waitForFragmentLoad();
        $I->canSeeElement(Page::$barcodeField);

        // Vpišem barkodo paketa za skeniranje
        $I->fillField(Page::$barcodeField, Page::$paket5);
        $I->click('OK');
        $I->waitForFragmentLoad();
        $I->wait(0.5);


        // Spremenimo količino v paketu 
        $I->click('Spremeni');
        $I->waitForFragmentLoad();
        $I->click(Page::$dn);
        $I->waitForFragmentLoad();
        $I->waitForAjax();
        $I->pressKey(Page::$urediKolicinoElement, array('ctrl', 'a'));
        for ($i = 0; $i < 5; $i++) {
            $I->pressKey(Page::$urediKolicinoElement, \WebDriverKeys::BACKSPACE);
            $I->pressKey(Page::$urediKolicinoElement, \WebDriverKeys::DELETE);
        }
        $I->pressKey(Page::$urediKolicinoElement, \WebDriverKeys::NUMPAD2);
        $I->click('Shrani');
        $I->waitForFragmentLoad();
        $I->waitForSporociloSuccess();

        // Preverim da smo na strani za vnos paketa 
        $I->see('(2/5)');
        $I->see(Page::$paket5);
        $I->see('Osnovno pakiranje');
        $I->canSeeElement(Page::$barcodeField);


        // prekličem paket 
        $I->click('Prekliči pakiranje');
        $I->waitForFragmentLoad();
        $I->click(Page::$radioBrisiPoreklo);
        $I->wait(1);
        $I->click('Shrani');
        $I->waitForFragmentLoad();

        // Preverim da sem prišel na stran s paketom 
        $I->see('(0/5)');
        $I->see(Page::$paket5);
        $I->see('Osnovno pakiranje');
        $I->canSeeElement(Page::$barcodeField);

        // brišem paket 
        $I->click('Prekliči pakiranje');
        $I->waitForFragmentLoad();
        $I->click(Page::$radioBrisiPaket);
        $I->click('Shrani');
        $I->waitForFragmentLoad();
        $I->waitForSporocilo('info');

        $I->dontSee(Page::$paket5);
        $I->dontSee('Spremeni');
    }

    /**
     * 
     * 
     * Scenarij:
     * - grem na info stran paketa in preverim, da je vse pristorno 
     * - pogledam za nadpaket 
     * - pogledam za osnovni paket
     * 
     * @depends pakirajStandardno 
     */
    public function infoPaketa(\AcceptanceTester $I)
    {

        // grem na info stran vpišem barkodo in počakam da se tran naloži
        $I->gremNaStran(Page::$URL . '/info');
        $I->seeElementInDOM(Page::$infoFilterForm);
        $I->fillField(Page::$barcodeField, Page::$nadpaket1);
        $I->click('OK');
        $I->waitForFragmentLoad();


        // Preverim, da so informacije točne 

        $I->see(Page::$paket1);
        $I->see(Page::$paket2);
        $I->see(Page::$nadpaket1);
        $I->see('Nepredano: 10');
        $I->wait(1);
        $I->see('Razstavi pakiranje');
        // info še za drugi paket 
        $I->fillField(Page::$barcodeField, Page::$paket1);
        $I->click('OK');
        $I->waitForFragmentLoad();
        $I->see(Page::$paket1);
        $I->see(Page::$nadpaket1);
        $I->see('Nepredano: 5');
        $I->wait(1);
        $I->see('Spremeni');
        $I->see('Razstavi starša');
    }

  
  
    /**
     * Scenarij:
     * 0. Naprej poskusim pakirati nepakirane pakete 
     * 1. popišem tri pakete na strani za pakiranje
     * 2. Grem na stran za sestavljanje paketov
     * 3. Poskeniram tri pakete 
     * 3. Odstranim en paket iz seznama ( klik na -)
     * 4. Odstranim vse pakete iz seznama ( klik v toolbaru ) 
     * 5. Ponovno  poskeniram tri pakete 
     * 6. jih dodam v nadpaket 2 
     * 
     * @param AcceptanceTester $I
     */
    public function sestaviPaket(\AcceptanceTester $I)
    {

        // nepakiranih paketov ne gre sestavljati 
        // grem na stran za sestavljanje paketov 
        $I->gremNaStran(Page::$URL . '/sestavljanje');

        $I->canSeeElement('form[name="pak"]');
        // Vpišem barkodo paketa za skeniranje
        $I->fillField(Page::$barcodeField, Page::$paket4);
        $I->click('OK');
        $I->waitForFragmentLoad();
        $I->waitForSporocilo('danger');


        // grem na operacijo pakiranja         
        $I->gremNaStran(Page::$operUrl);
        $I->wait(2);
        
        $I->checkOption(Page::$status100);
        $I->click('Išči');
        $I->waitForFragmentLoad();
        $I->seeElementInDOM(Page::$operacija);
        $I->click('Nadaljuj');
        $I->waitForFragmentLoad();


        // Vpišem barkodo paketa za skeniranje
        $I->fillField(Page::$barcodeField, Page::$paket4);
        $I->click('OK');
        $I->waitForFragmentLoad();
        // Vpišem barkodo paketa za skeniranje
        $I->fillField(Page::$barcodeField, Page::$paket6);
        $I->click('OK');
        $I->waitForFragmentLoad();
        // Vpišem barkodo paketa za skeniranje
        $I->fillField(Page::$barcodeField, Page::$paket7);
        $I->click('OK');
        $I->waitForFragmentLoad();

        // odstranjevanje paketov 
        $this->sestaviPaketeHelper($I);
        $I->wait(1);
        $I->click('.icon-minus');
        $I->waitForFragmentLoad();
        $I->dontSee(Page::$paket4);
        $I->click('Počisti seznam');        
        $I->dontSee(Page::$paket6);
        $I->dontSee(Page::$paket7);
        
        // onovno začnem sestavljati paket 
        $this->sestaviPaketeHelper($I);
        
        $I->click('Izberi nadpaket');
        $I->waitForFragmentLoad();

        // ostranim en paket iz seznama
        $I->see('Nadpaket');
        $I->see('Seznam paketov:');
        $I->see(Page::$paket4);       
        $I->see(Page::$paket6);
        $I->see(Page::$paket7);

        $I->waitForFragmentLoad();
        $I->fillField(Page::$barcodeField, Page::$nadpaket2);
        $I->click('OK');
        $I->waitForFragmentLoad();
    }

    /**
     * 
     * @param AcceptanceTester $I
     */
    protected function sestaviPaketeHelper(\AcceptanceTester $I)
    {

        // grem na stran za sestavljanje paketov 
        $I->gremNaStran(Page::$URL . '/sestavljanje');

        $I->canSeeElement('form[name="pak"]');
        // Vpišem barkodo paketa za skeniranje
        $I->fillField(Page::$barcodeField, Page::$paket4);
        $I->click('OK');
        $I->waitForFragmentLoad();
        $I->see('Polnost: 5/60');
        // Vpišem barkodo paketa za skeniranje
        $I->fillField(Page::$barcodeField, Page::$paket6);
        $I->click('OK');
        $I->waitForFragmentLoad();
        $I->see('Polnost: 10/60');
        // Vpišem barkodo paketa za skeniranje
        $I->fillField(Page::$barcodeField, Page::$paket7);
        $I->click('OK');
        $I->waitForFragmentLoad();
        $I->see('Polnost: 15/60');
    }
    
    

    /**
     * 
     *  1. pogledam seznam nepredanih paketov in  jih dam v predajo,
     *  2. naredim predajnico  
     * @depends pakirajStandardno
     * @param AcceptanceTester $I
     */
    public function predajPaketeNaSkladisce(\AcceptanceTester $I)
    {

        $I->gremNaStran(Page::$URL . '/nepredani');
        $I->click('.icon-check');
        $I->click('Predaj');

        $I->wait(3);
    }

}
