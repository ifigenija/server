<?php 
$I = new AcceptanceTester($scenario);
$I->wantTo('Popisati Paket');
$I->loginAsAdmin();
$I->waitForText('Domov');

$I->amOnTipPage('#t!pak/popis');

$barcode = uniqid();

$I->fillField('barcode', $barcode);

$I->click('OK');
$I->waitForAjax();

$I->canSee('Dodaj paket ' . $barcode );
$I->click('.dodaj-paket');
$I->waitForFragmentLoad();
//$I->canSeeElement('//input[@name="artikel_text"]');

$I->fillField('artikel_text', '0229080003');
$I->pressKey('//input[@name="artikel_text"]', \WebDriverKeys::TAB);
$I->waitForAjax();

$I->click('Naprej');

$I->waitForFragmentLoad();

$I->canSee('Privzeto pakiranje');

$I->click('//input[@type="radio" and position() = 1]');
$I->click('Naprej');
$I->waitForFragmentLoad();
$I->see('Paket: O: ' . strtoupper($barcode));
$I->click('Uredi sestavo');
$I->waitForFragmentLoad();

$I->see("Paket " . $barcode);
$I->see("Količina");
$I->see("Nalog");

$I->fillField('uredi[fieldset][kolicina]', "20");
$I->fillField('uredi[fieldset][nalog]_text', "14-122-1");

$I->pressKey('input[name="uredi[fieldset][nalog]_text"]', \WebDriverKeys::TAB);
$I->waitForAjax();
$I->click('Dodaj');
$I->waitForSporociloSuccess();
$I->closeActiveTab();
$I->selectTab('Popis');
$I->click("Osveži");
$I->waitForFragmentLoad();
$I->canSee('14-122-1');
$name = $I->grabAttributeFrom('//form[@name="popis"]//select', 'name');
$I->selectOption($name, '14-15 0229.08.0003');

$I->click('Shrani');
$I->waitForSporociloSuccess();

$I->closeActiveTab();
$I->amOnPage("#t!pak/info");
$I->waitForFragmentLoad();


$I->fillField('barcode', $barcode);
$I->click('OK');
$I->waitForFragmentLoad();
$I->seeLink('14-15');





