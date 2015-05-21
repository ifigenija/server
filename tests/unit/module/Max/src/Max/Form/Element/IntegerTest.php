<?php

namespace module\Max\src\Max\Form\Element;

/**
 * Testiram boolcheckbox vnosno polje
 * 
 * Preverim, katere vrednosti gredo skozi in katere ne 
 */
class IntegerTest
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
    public function testIntRequired()
    {

        $this->form->add([
            'name'    => 'v',
            'type'    => 'integer',
            'options' => [
                'required' => true
            ]
        ]);

        // preverim, da forma ni valid, čeje vrednosti ni
        $this->form->setData([
            'vx' => '12'
        ]);
        $this->assertFalse($this->form->isValid());

        // preverim, če je null ni valid
        $this->form->setData([
            'v' => null
        ]);
        $this->assertFalse($this->form->isValid());
        // ni valid za prazen string 
        $this->form->setData([
            'v' => ''
        ]);
        $this->assertFalse($this->form->isValid());


        // string oblika integer
        $this->form->setData([
            'v' => '12'
        ]);
        $this->assertTrue($this->form->isValid());
        $v = $this->form->getData();
        $this->assertEquals(12, $v['v']);


        // valid za 0 
        $this->form->setData([
            'v' => 0
        ]);

        $this->assertTrue($this->form->isValid());
        $v = $this->form->getData();
        $this->assertEquals(0, $v['v']);


        // valid za INTEGER  1
        $this->form->setData([
            'v' => 1
        ]);
        $this->assertTrue($this->form->isValid());
        $v = $this->form->getData();
        $this->assertEquals(1, $v['v']);

        // valid za INTEGER 0
        $this->form->setData([
            'v' => 0
        ]);
        $this->assertTrue($this->form->isValid());
        $v = $this->form->getData();
        $this->assertEquals(0, $v['v']);



// ni valid za vse ostalo
        $this->form->setData([
            'v' => 'asd123123dsda'
        ]);
        $this->assertFalse($this->form->isValid());

        $this->form->setData([
            'v' => '123xxx'
        ]);
        $this->assertFalse($this->form->isValid());
    }

    /**
     * Test boolean vnosnega polja.
     * 
     */
    public function testNullable()
    {

        $this->form->add([
            'name'    => 'v',
            'type'    => 'integer',
            'options' => [
                'required' => false
            ]
        ]);

        // preverim, da forma ni valid, čeje vrednosti ni
        $this->form->setData([
            'v' => '12'
        ]);
        $this->assertTRue($this->form->isValid());
        $v = $this->form->getData();
        $this->assertEquals(12, $v['v']);
        
        // preverim, da forma ni valid, čeje vrednosti ni
        $this->form->setData([
            'v' => 'x12'
        ]);
        $this->assertFalse($this->form->isValid());      
        
        // preverim, če je null ni valid
        $this->form->setData([
            'v' => null
        ]);
        $this->assertTrue($this->form->isValid());
        $v = $this->form->getData();
        $this->assertEquals(null, $v['v']);

        // ni valid za prazen string 
        $this->form->setData([
            'v' => ''
        ]);
        $this->assertTrue($this->form->isValid());
        $v = $this->form->getData();
        $this->assertEquals(null, $v['v']);
        
    }

    
    
    
}
