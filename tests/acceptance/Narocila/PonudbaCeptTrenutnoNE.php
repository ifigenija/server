<?php

$I = new AcceptanceTester($scenario);
$I->wantTo("Dodaj novo ponudbo");
$I->loginAsAdmin();

/*
 * 
 * Dodajanje ponudbe
 * 
 */
$I->amOnDocumentEditorPage('/#nar/ponudba/dodaj');
$I->dontSee('Postavke', '.region-postavke');

// Preverimo obvezna 
$I->click('Shrani');

//$I->seeFieldError('dok');
$I->seeFieldError('klient');
$I->seeFieldError('naslovKlienta');
$I->seeFieldError('prejemnik');
$I->seeFieldError('naslovPrejemnika');
$I->seeFieldError('kontaktna');
$I->seeFieldError('valuta');
$I->closeSporocila();

// Izpolni obvezna polja
$I->selectOption('dok', '210');
$I->selectOption('statusPonudbe', 'Ponudba odprta');

$I->selectToOneEditorOption('klient', 'TELEKOM');
$I->selectOption('naslovKlienta', 'Privzeti');
$I->selectOption('kontaktna', 'G. Boris');

$I->selectToOneEditorOption('prejemnik', 'LP MYCRON');
$I->selectOption('naslovPrejemnika', 'Puhova');

$I->selectToOneEditorOption('valuta', 'EUR');


// Shrani dokument
$I->pressKey('body', \WebDriverKeys::HOME);
$I->click('Shrani');
$I->waitForSporociloSuccess();
$I->closeSporocila();

$I->dontSeeInCurrentUrl('/dodaj');
$I->cantSee('Nova ponudba', '.page-active');
$I->cantSee('<brez>', '.doc-stevilka dd');
$I->seeNumberOfElements('#layout-tabs li', 2);
$I->see('Postavke', '.region-postavke');

// Preveri vsebino polj
$I->seeToOneEditorValue('dok', ['ident' => '210']);
$I->seeOptionIsSelected('statusPonudbe', 'Ponudba odprta');

$I->seeToOneEditorValue('klient', ['ident' => '0019']);
$I->seeToOneEditorValue('naslovKlienta', ['label' => 'Cigaletova 15']);
$I->seeToOneEditorValue('kontaktna', ['label' => 'G. Boris FAKIN-PE PTUJ']);

$I->seeToOneEditorValue('prejemnik', ['ident' => '0001']);
$I->seeToOneEditorValue('naslovPrejemnika', ['label' => 'Puhova ulica 7']);

$I->seeToOneEditorValue('valuta', ['ident' => '978']);

$now = new \DateTime('first day of last month');
$I->seeInField('datumPonudbe', $now->format('d.m.Y'));


/*
 * 
 * Urejanje ponudbe
 * 
 */
$I->refreshPage();
$I->waitForDocumentForm();
$I->fillField('text', 'neke');

// Shrani
$I->pressKey('body', \WebDriverKeys::HOME);
$I->click('Shrani');
$I->waitForSporociloSuccess();
$I->closeSporocila();

$I->seeInCurrentUrl('nar/d/ponudba/pregled/id/');

$I->waitForElement('.dokument-text');
$I->see('neke', '.dokument-text');

/*
 * 
 * Dodajanje postavk
 * 
 */
$I->click('Uredi');
$I->waitForElement('.region-postavke');
$I->click('Dodaj');

$I->click('Shrani', '.region-postavke');
$I->seeFieldError('naziv');
$I->seeFieldError('enotaMere');
$I->closeSporocila();

// Testiraj polnjenje naziva in enote mere iz maticne
$I->selectToOneEditorOption('maticna', '165-84-36-30 K');
$I->seeInField('naziv', '165-84-36-30 K');
$I->seeInField('enotaMere', 'KOM');

// Testiraj ali se ob spremembi naziva in kom izprazni matična
$I->clearField('naziv');
$I->seeInField('maticna', '');

$I->selectToOneEditorOption('maticna', '165-84-36-30 K');
$I->clearField('enotaMere');
$I->seeInField('maticna', '');

$I->selectOption('statusProdukta', 'Brez posebnosti');
$I->selectToOneEditorOption('maticna', '165-84-36-30 K');

// Testiranje vnosa kalkulacij
$I->click('Kalkulacija');
$I->selectToOneEditorOption('kalkulacija', '000001');
$I->seeInField('cenaDela', '1,08');
$I->seeInField('cenaMateriala', '1,56');
$I->seeInField('cenaPrevoza', '0');

// iz fiksnega dodatka v dodatek odstotkov
$I->fillField('dodatekDela', '10');
$I->checkOption('[name=checkboxDela]');
$I->seeInField('odstotekDela', '925,93');
$I->seeInField('cenaDela', '11,08');

// iz dodatka odstotkov v fiksni dodatek
$I->checkOption('[name=checkboxMateriala]');
$I->fillField('odstotekMateriala', '10');
$I->checkOption('[name=checkboxMateriala]');
$I->seeInField('dodatekMateriala', '0,16');
$I->seeInField('cenaMateriala', '1,72');

$I->fillField('kolicina', '10');
$I->fillField('setup', '10');
$I->fillField('provizija', '2');
$I->fillField('tk', '20');

$I->click('Shrani', '.region-postavke');
$I->waitForSporociloSuccess();
$I->closeSporocila();

$I->see('0000.97.0001', '.region-postavke-grid');
$I->see('165-84-36-30 K', '.region-postavke-grid');
$I->see('10,00', '.region-postavke-grid');
$I->see('KOM', '.region-postavke-grid');
$I->see('161,16', '.region-postavke-grid');

$I->refreshPage();
$I->waitForDocumentForm();

$I->see('0000.97.0001', '.region-postavke-grid');

/*
 * 
 * Uredi postavko
 * 
 */

$I->click('.icon-edit', '.region-postavke-grid');
$I->click('Kalkulacija');
$I->fillField('kolicina', '20');

$I->click('Shrani', '.region-postavke');
$I->waitForSporociloSuccess();
$I->closeSporocila();

$I->see('20,00', '.region-postavke-grid');
$I->see('291,72', '.region-postavke-grid');

/*
 * 
 * Dodaj cenovni razpon
 * 
 */
$I->click('.icon-edit', '.region-postavke-grid');
$I->click('Dodaj', '.region-razponi');
$I->pressKey('body', \WebDriverKeys::END);
$I->selectToOneEditorOption('kalkulacija', '000001', '.region-razponi');

$I->click('Shrani', '.region-razponi');
$I->waitForSporociloSuccess();
$I->closeSporocila();

/*
 * 
 * Uredi cenovni razpon
 * 
 */
$I->click('.icon-edit', '.region-razponi');
$I->pressKey('body', \WebDriverKeys::END);
$I->selectToOneEditorOption('kalkulacija', '000002', '.region-razponi');

$I->click('Shrani', '.region-razponi');
$I->waitForSporociloSuccess();
$I->closeSporocila();

/*
 * 
 * Briši cenovni razpon
 * 
 */
$I->click('.icon-trash', '.region-razponi');
$I->waitForAjax();
$I->dontSeeElement('.region-razponi .icon-trash');
$I->click('Prekliči');

/*
 * 
 * Briši postavko
 * 
 */
$I->click('.icon-trash', '.region-postavke');
$I->waitForAjax();
$I->dontSee('0000.97.0001', '.region-postavke-grid');