<?php

namespace module\Max\src\Max\Form\Element;

/**
 * Testiram boolcheckbox vnosno polje
 * 
 * Preverim, katere vrednosti gredo skozi in katere ne 
 */
class BoolTest
        extends \AbstractTest
{

    /**
     * @var \UnitTester
     */
    protected $tester;
    protected $form;

    protected function _before()
    {

        $fm         = $this->sm->get('formelementmanager');
        $this->form = $fm->get('Max\Form\JsonForm');
    }

    protected function _after()
    {
        
    }

    /**
     * Test boolean vnosnega polja.
     * 
     */
    public function testBoolRequired()
    {
        $this->tester->wantToTest('boolean form field');

        $this->form->add([
            'name'    => 'v',
            'type'    => 'boolcheckbox',
            'options' => [
                'required' => true
            ]
        ]);

        // preverim, da forma ni valid, čeje vrednosti ni
        $this->form->setData([
            'tralla' => '12'
        ]);
        $this->assertFalse($this->form->isValid());


        // preverim, da forma ni valid, čeje vrednosti ni
        $this->form->setData([
            'v' => null
        ]);
        $this->assertFalse($this->form->isValid());

        // valid za true ali false 
        $this->form->setData([
            'v' => true
        ]);
        $this->assertTrue($this->form->isValid());
        $v = $this->form->getData();
        $this->assertTrue($v['v']);

        // valid za 
        $this->form->setData([
            'v' => false
        ]);
        $this->assertTrue($this->form->isValid());
        $v = $this->form->getData();
        $this->assertFalse($v['v']);

        $this->form->setData([
            'v' => ''
        ]);
        $this->assertFalse($this->form->isValid());



        // valid za INTEGER  1
        $this->form->setData([
            'v' => 1
        ]);
        $this->assertTrue($this->form->isValid());
        $v = $this->form->getData();
        $this->assertTrue($v['v']);

        // valid za INTEGER 0
        $this->form->setData([
            'v' => 0
        ]);
        $this->assertTrue($this->form->isValid());
        $v = $this->form->getData();
        $this->assertFalse($v['v']);



// ni valid za vse ostalo
        $this->form->setData([
            'v' => 12
        ]);
        $this->assertFalse($this->form->isValid());

        $this->form->setData([
            'v' => 'false'
        ]);
        $this->assertFalse($this->form->isValid());
    }

    /**
     * Test boolean vnosnega polja.
     * 
     */
    public function testBool()
    {
        $this->tester->wantToTest('boolean form field');

        $this->form->add([
            'name'    => 'v',
            'type'    => 'boolcheckbox',
            'options' => [
                'required' => false
            ]
        ]);

        // preverim, da forma ni valid, čeje vrednosti ni
        $this->form->setData([
            'v' => null
        ]);
        $this->assertTrue($this->form->isValid());
        $this->form->setData([
            'v' => ''
        ]);
        $this->assertTrue($this->form->isValid());
        
        $v = $this->form->getData();
        $this->assertNull($v['v']);

        
    }

}
