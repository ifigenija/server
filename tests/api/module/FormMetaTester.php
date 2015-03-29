<?php

use \ApiTester;

class FormMetaTester
{

    public static $url = '/tip/formMeta/';
    public static $filterUrl = '/tip/filterFormMeta/';

    /**
     *
     * @var ApiTester 
     */
    protected $I;

    public function _before(ApiTester $I)
    {
        $this->I = $I;
        $I->wantTo('Test Rest Form meta collection ' . static::$url);
        $I->amHttpAuthenticated('admin', 'Admin1234');
    }

    public function _after(ApiTester $I)
    {
        
    }

    protected function testFilterForm($formName)
    {
        $I = $this->I;
        $I->sendGET(static::$filterUrl . $formName);
        $I->seeResponseCodeIs('200');
        $I->seeResponseIsJson();
        $formMeta = $I->grabDataFromJsonResponse();

        $I->assertTrue(array_key_exists('schema', $formMeta), "Filter fima polje  schema");
        $I->assertTrue(array_key_exists('defaults', $formMeta), "Filter ima polje  defaults");

        foreach ($formMeta['schema'] as $field) {
            $I->assertTrue(array_key_exists('name', $field), "Ima name");
            $I->assertTrue(array_key_exists('type', $field), "Ima type");
            $I->assertTrue(array_key_exists('editorAttrs', $field), "ima editorAttrs");
            $I->assertTrue(array_key_exists('help', $field), "Ima help");
            $I->assertTrue(array_key_exists('validators', $field), "Ima validators");
        }
    }

    protected function testFormMeta($entity, $fieldset = null)
    {
        $I = $this->I;
        $I->sendGET(static::$url . $entity . ($fieldset ? "/$fieldset" : ""));
        $I->seeResponseCodeIs('200');
        $I->seeResponseIsJson();
        $formMeta = $I->grabDataFromJsonResponse();

        $I->assertNotEmpty($formMeta, 'Prazni metapodatki za ' . $entity);
        foreach ($formMeta as $field) {
            $I->assertTrue(array_key_exists('name', $field), "Ima name");
            $I->assertTrue(array_key_exists('type', $field), "Ima type");
            $I->assertTrue(array_key_exists('editorAttrs', $field), "ima editorAttrs");
            $I->assertTrue(array_key_exists('help', $field), "Ima help");
            $I->assertTrue(array_key_exists('validators', $field), "Ima validators");
        }
    }

    protected function filterHasField($name)
    {
        $this->hasField($name, $this->I->grabDataFromJsonResponse()['schema']);
    }

    protected function hasField($name, $fields = [])
    {
        $I = $this->I;
        if (empty($fields)) {
            $fields = $I->grabDataFromJsonResponse();
        }
        if (is_string($name)) {
            $name = [$name];
        }
        foreach ($name as $fld) {
            $I->assertTrue($this->containsName($fld, $fields), 'Ima polje z imenom ' . $fld);
        }
    }

    protected function containsName($fld, $fields)
    {
        foreach ($fields as $f) {
            if ($f['name'] == $fld) {
                return true;
            }
        }
        return false;
    }

}
