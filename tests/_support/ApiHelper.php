<?php

namespace Codeception\Module;

// here you can define custom actions
// all public methods declared in helper class will be available in $I

class ApiHelper
        extends \Codeception\Module
{

    const ID_RE = '/^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$/';

    /**
     * Post rest metoda z data v body requesta
     * 
     * @param string $url
     * @param string $method
     * @param array $params
     * @return array
     */
    public function successfullyCallRpc($url, $method, $params)
    {
        /* @var $I Codeception\Module\REST */
        $I = $this->getModule('REST');

        $I->haveHttpHeader('Content-Type', 'application/json');
        $I->sendPOST($url, [
            'jsonrpc' => '2.0',
            'method'  => $method,
            'params'  => $params,
            'id'      => 3
        ]);
        $I->seeResponseCodeIs('200');
        $I->seeResponseIsJson();

        $res = $I->grabDataFromResponseByJsonPath('$')[0];
        $this->assertFalse(array_key_exists('error', $res));

        return $res['result'];
    }

    /**
     * 
     * Post rest metoda z data v body requesta
     * 
     * @param string $url
     * @param string $method
     * @param array $params
     * @return array
     */
    public function failCallRpc($url, $method, $params)
    {
        /* @var $I Codeception\Module\REST */
        $I = $this->getModule('REST');

        $I->haveHttpHeader('Content-Type', 'application/json');
        $I->sendPOST($url, [
            'method'  => $method,
            'params'  => $params,
            'jsonrpc' => '2.0',
            'id'      => 3
        ]);
        $I->seeResponseCodeIs('200');
        $I->seeResponseIsJson();

        $res = $I->grabDataFromResponseByJsonPath('$')[0];
        $this->assertTrue(array_key_exists('error', $res));

        return $res['error'];
    }

    /**
     * 
     * Post rest metoda z data v body requesta
     * 
     * @param string $url
     * @param array $data
     * @return array
     */
    public function successfullyCreate($url, $data)
    {
        $I = $this->getModule('REST');

        $I->haveHttpHeader('Content-Type', 'application/json');
        $I->sendPOST($url, $data);
        $I->seeResponseCodeIs('200');
        $I->seeResponseIsJson();
        return $I->grabDataFromResponseByJsonPath('$')[0];
    }

    /**
     * get rest metoda brez id-ja. za pridobitev seznama
     * filter se doda v query params
     * 
     * @param string $url
     * @param array $filter 
     */
    public function successfullyGetList($url, $filter)
    {
        $I = $this->getModule('REST');

        $I->sendGET($url, $filter);
        $I->seeResponseCodeIs('200');
        $I->seeResponseIsJson();
        $data = $I->grabDataFromResponseByJsonPath('$');
        if (array_key_exists('state', $data)) {
            $I->grabDataFromResponseByJsonPath('$.state.totalRecords');
            return $I->grabDataFromResponseByJsonPath('$.data')[0];
        } else {
            return $I->grabDataFromResponseByJsonPath('$')[0];
        }
    }

    /**
     * Get rest metoda po ID-ju objekta 
     * pričakuje uspeh 
     * 
     * @param string $url
     * @param string $id
     * @return array
     */
    public function successfullyGet($url, $id)
    {
        $I = $this->getModule('REST');

        $I->sendGET($url . '/' . $id);
        $I->seeResponseCodeIs('200');
        $I->seeResponseIsJson();
        $I->seeResponseContainsJson(['id' => $id]);
        return $I->grabDataFromResponseByJsonPath('$')[0];
    }

    /**
     * PUT rest metoda na url + id in data jot json body
     * pričakovan uspeh 
     * 
     * @param type $url
     * @param type $id
     * @param type $data
     * @return type
     */
    public function successfullyUpdate($url, $id, $data)
    {
        $I = $this->getModule('REST');
        $I->haveHttpHeader('Content-Type', 'application/json');
        $I->sendPUT("$url/$id", $data);
        $I->seeResponseCodeIs('200');
        $I->seeResponseIsJson();
        return $I->grabDataFromResponseByJsonPath('$')[0];
    }

    /**
     * delete rest metoda - pričakovan uspeh 
     * @param string $url
     * @param string $id
     */
    public function successfullyDelete($url, $id)
    {
        $I = $this->getModule('REST');
        $I->sendDELETE("$url/$id");
        $I->seeResponseCodeIs('200');
        $I->seeResponseIsJson();
        $I->seeResponseContainsJson(['success' => true]);
    }

    /**
     * POST rest metoda, ki naj ne bi uspela 
     * 
     * @param string $url
     * @param array $data
     */
    public function failToCreate($url, $data)
    {
        $I = $this->getModule('REST');

        $I->haveHttpHeader('Content-Type', 'application/json');
        $I->sendPOST($url, $data);
        $I->dontSeeResponseCodeIs('200');
        $I->seeResponseIsJson();
        $I->seeResponseContainsJson(['success' => false]);
        return $I->grabDataFromResponseByJsonPath('$.errors')[0];
    }

    /**
     * GET list, ki naj ne bi uspel
     * 
     * @param string $url
     * @param array $filter
     */
    public function failToGetList($url, $filter)
    {
        $I = $this->getModule('REST');

        $I->sendGET($url, $filter);
        $I->dontSeeResponseCodeIs('200');
        $I->seeResponseIsJson();
        $I->seeResponseContainsJson(['success' => false]);
        return $I->grabDataFromResponseByJsonPath('$.errors')[0];
    }

    /**
     * Neuspešni get objekta preko id-ja
     * 
     * @param string $url
     * @param string $id
     */
    public function failToGet($url, $id)
    {
        $I = $this->getModule('REST');

        $I->sendGET($url . '/' . $id);
        $I->dontSeeResponseCodeIs('200');
        $I->seeResponseIsJson();
        $I->seeResponseContainsJson(['success' => false]);
        return $I->grabDataFromResponseByJsonPath('$.errors');
    }

    /**
     * 
     * Pričakovana napaka pri PUT metodi 
     * 
     * @param string $url
     * @param string $id
     * @param data $data
     */
    public function failToUpdate($url, $id, $data)
    {
        $I = $this->getModule('REST');
        $I->haveHttpHeader('Content-Type', 'application/json');
        $I->sendPUT($url . '/' . $id, $data);
        $I->dontSeeResponseCodeIs('200');
        $I->seeResponseIsJson();
        $I->seeResponseContainsJson(['success' => false]);
        return $I->grabDataFromResponseByJsonPath('$.errors')[0];
    }

    /**
     * 
     * Neuspešno brisanje preko rest vmesnika 
     * 
     * @param string $url
     * @param string $id
     */
    public function failToDelete($url, $id)
    {
//        $I = $this->getModule('REST');
//        $I->sendDELETE("$url/$id");
        $I = $this->getModule('REST');
        $I->sendDELETE("$url/$id");
//        $I->dontSeeResponseCodeIs('200');
//        $I->seeResponseIsJson();
//        $I->seeResponseContainsJson(['success' => false]);
//        return $I->grabDataFromResponseByJsonPath('$.errors')[0];
// 

        $I->dontSeeResponseCodeIs('200');
        $I->seeResponseIsJson();
        $I->seeResponseContainsJson(['success' => false]);
        return $I->grabDataFromResponseByJsonPath('$.errors')[0];
    }

    /**
     * HELPER METODA, KI PREKO DB MODULA izbriše vrsticd iz tabele
     * @param string $table ime tabele
     * @param array $ids  seznam id-jev za brisanje 
     */
    public function removeInserted($table, $ids, $field = 'id')
    {
        $dbh = $this->getModule('Db')->driver->getDbh();

        if (!is_array($ids)) {
            $ids = [$ids];
        }

        foreach ($ids as $insertId) {
            try {
                $dbh->exec("delete from $table where $field = '$insertId'");
            } catch (\Exception $e) {
                $this->debug("coudn\'t delete record {$insertId} from {$table}");
            }
        }
    }

    /**
     * 
     * Z OPTIONS metodo testira pridobivanje metapodatkov za formo 
     * 
     * 
     * @param string $controler 
     * @param string $view
     * @param array $expected
     */
    public function testFormMeta($controller, $view, $expected = [])
    {
        $I        = $this->getModule('REST');
        $I->sendOPTIONS("/rest/$controller" . ( $view ? "/$view" : ""));
        $I->seeResponseCodeIs('200');
        $I->seeResponseIsJson();
        $formMeta = $I->grabDataFromJsonResponse();

        codecept_debug($formMeta);
        $I->assertNotEmpty($formMeta, "Prazni metapodatki za $controller/$view");


        foreach ($formMeta as $field) {

            if (!empty($expected['field'])) {
                unset($expected['field']);
            }

            $I->assertTrue(array_key_exists('name', $field), "Ima name");
            $I->assertTrue(array_key_exists('type', $field), "Ima type");
            $I->assertTrue(array_key_exists('editorAttrs', $field), "ima editorAttrs");
            $I->assertTrue(array_key_exists('help', $field), "Ima help");
            $I->assertTrue(array_key_exists('validators', $field), "Ima validators");
        }

        $I->assertEmpty($expected);
    }

}
