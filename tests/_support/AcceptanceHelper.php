<?php

namespace Codeception\Module;

// here you can define custom actions
// all public methods declared in helper class will be available in $I

class AcceptanceHelper
    extends \Codeception\Module
{

    public function loginWith($username, $password)
    {
        $web = $this->getModule('WebDriver');
        $web->amOnPage('/login');
        $web->submitForm('[name=loginform]', ['username' => $username, 'password' => $password]);
        $web->waitForElement('#glavni-container > div');
        $web->dontSee('table[@class="xdebug-error xe-notice"]');
    }

    public function loginAsAdmin()
    {
        $this->loginWith('admin', 'Admin1234');
    }

    public function amOnTipPage($page, $waitForSelector = 'div')
    {
        $web = $this->getModule('WebDriver');
        $web->amOnPage($page);
        $web->waitForElement('.page-active.loaded');
    }

    public function waitForFragmentLoad()
    {
        $web = $this->getModule('WebDriver');
        $web->waitForElement('.page-active.loaded');
    }

    public function amOnDocumentEditorPage($page)
    {
        $web = $this->getModule('WebDriver');
        $web->amOnPage($page);
        $this->waitForDocumentForm();
    }

    public function selectCalendarDate($name, $steps)
    {
        $web = $this->getModule('WebDriver');
        $web->click(['css' => "input.datepicker[name='{$name}']"]);
        foreach ($steps as $step) {
            if ($step === 'prev') {
                $web->click(['css' => '.datepicker-days .prev']);
            } else if ($step === 'next') {
                $web->click(['css' => '.datepicker-days .next']);
            } else {
                $web->click(['xpath' => "//*[.='{$step}']"], '.datepicker-days .day');
            }
        }
        $web->click(['css' => 'body']);
    }

    public function waitForToolbarButton($text)
    {
        $web = $this->getModule('WebDriver');
        $web->waitForElement('//div[@class="btn-toolbar" and contains(.,  "' . $text . '")]');
    }

    public function seeFieldError($name)
    {
        $web = $this->getModule('WebDriver');
        $web->seeElement(".field-{$name}.has-error");
    }

    public function dontSeeFieldError($name)
    {
        $web = $this->getModule('WebDriver');
        $web->dontSeeElement(".field-{$name}.has-error");
    }

    public function waitForSporociloSuccess()
    {
        $web = $this->getModule('WebDriver');
        $web->waitForElement("#sporocila .alert-success");
    }

    public function waitForSporocilo($class = 'success')
    {
        $web = $this->getModule('WebDriver');
        $web->waitForElement("#sporocila .alert-" . $class);
    }

    public function closeSporocila()
    {
        $web = $this->getModule('WebDriver');
        $web->executeJS("$('#sporocila .alert').hide().find('.close').click()");
    }

    public function closeActiveTab()
    {
        $web = $this->getModule('WebDriver');

        $web->click('.close', '//div[@id="layout-tabs"]//li[@class="active"]');
    }

    public function selectTab($text)
    {
        $web = $this->getModule('WebDriver');
        $web->click('//div[@id="layout-tabs"]//a[(contains(normalize-space(string(.)),  "' . $text . '"))]');
    }

    public function clearField($field)
    {
        $web = $this->getModule('WebDriver');
        $web->pressKey("[name='$field']", array('ctrl', 'a'), \WebDriverKeys::BACKSPACE);
    }

    public function refreshPage()
    {
        $web = $this->getModule('WebDriver');
        $web->executeInSelenium(function(\WebDriver $webdriver) {
            $url = $webdriver->getCurrentURL();
            $webdriver->get('about:blank');
            $webdriver->get($url);
        });
    }

    public function waitForDocumentForm()
    {
        $web = $this->getModule('WebDriver');
        $web->waitForElement('#glavni-container > div');
        $web->waitForJS("return $('.region-form form').length > 0");
    }

    public function waitForAjax()
    {
        $web = $this->getModule('WebDriver');
        $web->waitForJS("return $ && $.active == 0");
    }

    public function gremNaStran($url)
    {
        $web = $this->getModule('WebDriver');
        $web->amOnPage($url);
        $this->waitForFragmentLoad();
        $web->dontSee('table[@class="xdebug-error xe-notice"]');
    }

    public function pritisnemNaGumbVToolbaru($gumb)
    {
        $web = $this->getModule('WebDriver');
        $web->executeJS('window.scrollTo(0,0);');
        $this->waitForToolbarButton(ucfirst($gumb));

        $web->click(ucfirst($gumb));

        $this->waitForFragmentLoad();
        $web->dontSee('table[@class="xdebug-error xe-notice"]');
    }

    public function pritisnemNaLink($gumb, $id)
    {
        $web = $this->getModule('WebDriver');
        $web->click('a[href$="' . "/$gumb/$id" . '"]');

        $this->waitForFragmentLoad();
        $web->dontSee('table[@class="xdebug-error xe-notice"]');
    }

    public function poiscemVnos($niz)
    {
        $web = $this->getModule('WebDriver');
        $web->fillField('text', $niz);
        $web->pressKey('#text', \WebDriverKeys::ENTER);
        $this->waitForFragmentLoad();
        $web->dontSee('table[@class="xdebug-error xe-notice"]');
    }

    public function pridobimID()
    {
        $web = $this->getModule('WebDriver');
        $uri = $web->grabFromCurrentUrl();
        $polje = explode('/', $uri);
        return end($polje);
    }

    public function izberiDatum($name, $datum)
    {
        $vrednosti = explode('.', $datum);
        $web = $this->getModule('WebDriver');
        $web->click(['css' => "input.datepicker[name='{$name}']"]);

        $web->click(['css' => '.datepicker-switch']);
        $web->click(['css' => '.datepicker-switch']);

        $web->click(['css' => "//*[text()[contains(.,'$vrednosti[2]')]]"]);
        $web->click(['css' => "//*[text()[contains(.,'$vrednosti[1]')]]"]);
        $web->click(['css' => "//*[text()[contains(.,'$vrednosti[0]')]]"]);

        $web->click(['css' => 'body']);
    }

    public function vsebuje($atribut, $kljuc)
    {
        return 'contains(concat(" ", normalize-space(@' . $atribut . '), " "), " ' . $kljuc . ' ")';
    }

    public function xPathNiz($tag, $regija, $kljuc)
    {
        $regija1 = 'div[' . $this->vsebuje('class', $regija) . ']';
        return '//' . $tag . '[' . $this->vsebuje('name', $kljuc)
            . 'and ancestor::' . $regija1 . ']';
    }

    public function izpolniInput($tag, $regija, $kljuc, $text)
    {
        $web = $this->getModule('WebDriver');
        $xpath = $this->xPathNiz($tag, $regija, $kljuc);
        $web->fillField($xpath, $text);
    }

    public function gumb($regija, $kljuc, $pritisni)
    {
        $web = $this->getModule('WebDriver');

        $regijaToolbar = 'div[' . $this->vsebuje('class', $regija) . ']';
        $gumbDodaj = '//button[text()[contains(.,"' . ucfirst($kljuc) . '")] and ancestor::' . $regijaToolbar . ']';

        $web->waitForElement($gumbDodaj);
        if ($pritisni) {
            $web->click($gumbDodaj);
        }
    }

}
