<?php

$I = new AcceptanceTester($scenario);
$I->wantTo('Dodaj pakiranje');
$I->loginAsAdmin();

$I->amOnPage('#t!teh/Pakiranje/index');
$I->waitForFragmentLoad();
$I->waitForToolbarButton('Dodaj');
$I->click('a[href$="dodaj"]');

$I->waitForFragmentLoad();

$id = uniqid();
$name = 'Pak_' . $id;

//Pakiranje
$I->fillToOneEditor('uredi[fieldset][maticna]', '0229080003');
$I->selectOption('uredi[fieldset][status]', 'Aktiven');
$I->fillField('uredi[fieldset][naziv]', $name);

$I->fillToOneEditor('uredi[fieldset][etiketa]', 'ETIDZ');
$I->waitForAjax();

$I->click('Shrani');
$I->waitForSporociloSuccess();