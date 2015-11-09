<?php

/*
 *  Licenca GPLv3
 */

namespace Guzzle;

use ApiTester;

/**
 * Description of GuzzleCest
 *
 * testiranje guzzlephp
 * 
 * @author rado
 */
class GuzzleCest
{

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function simpleRequest(ApiTester $I)
    {
        $base_url = $I->getPhpBrowserUrl();
        codecept_debug($base_url);

        /**
         *  Create a client with a base URI
         */
        $client = new \GuzzleHttp\Client(['base_uri' => 'http://demo.ifigenija.si']);
        codecept_debug($client);

        /**
         * send request to http://demo.ifigenija.si/client/index.php
         */
        $response = $client->request('GET', '/client/index.php');
        $I->assertTrue(true, " sedaj izpišemo response: ");
        codecept_debug($response);
        $body     = $response->getBody();
        $I->assertTrue(true, " body: ");
        codecept_debug($body);

        $response = $client->get('http://demo.ifigenija.si/client/index.php');
        $I->assertTrue(true, " sedaj izpišemo response po ->get: ");
        codecept_debug($response);
        $body     = $response->getBody();
        $I->assertTrue(true, " body: ");
        codecept_debug($body);

        $response = $client->get('http://www.henrik.si/');
        $I->assertTrue(true, " sedaj izpišemo response po ->get 2: ");
        codecept_debug($response);
        $body     = $response->getBody();
        $I->assertTrue(true, " body: ");
        codecept_debug($body);
    }

    /**
     * @param ApiTester $I
     */
    public function ifiRequest(ApiTester $I)
    {
        $base_url = $I->getPhpBrowserUrl();
        codecept_debug($base_url);
        $client   = new \GuzzleHttp\Client(['base_uri' => $base_url]);

        $response = $client->request('GET', '/rest/tipfunkcije', ['auth' => [\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass]]);
        $I->assertTrue(true, " sedaj izpišemo response: ");
        codecept_debug($response);
    }

    /**
     * izpis prefix url-ja iz konfiguracijske datoteke.
     */
    public function izpisUrljaOdModulaPhpBrowser(ApiTester $I)
    {
        $url = $I->getPhpBrowserUrl();
        codecept_debug($url);
    }

}
