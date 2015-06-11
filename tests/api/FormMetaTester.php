<?php

use \ApiTester;

class FormMetaTester
{

    /**
     *
     * @var ApiTester 
     */
    protected $I;

    public function _before(ApiTester $I)
    {
        $this->I = $I;
    }

    public function _after(ApiTester $I)
    {
        
    }


    protected function testFormOptions($entity, $fieldset = null)
    {
        $I        = $this->I;
        $I->sendOPTIONS('/rest/' . $entity . ($fieldset ? "/$fieldset" : ""));
        $I->seeResponseCodeIs('200');
        $I->seeResponseIsJson();
        $formMeta = $I->grabDataFromJsonResponse();

        $I->assertNotEmpty($formMeta, 'Prazni metapodatki za ' . $entity);
        foreach ($formMeta as $field) {
            $I->assertTrue(array_key_exists('name', $field), "Ima name");
            $I->assertTrue(array_key_exists('type', $field), "Ima type");
                        $I->assertNotEmpty($field['type']);
                        $I->assertNotNull($field['type']);

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
