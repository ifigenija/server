<?php

namespace module\Aaa;

use \UnitTester;

class UserTest
        extends \AbstractTest
{

    /**
     * @var \UnitTester
     */
    protected $tester;

    public function _before()
    {
        
    }

    public function _after()
    {
        
    }

    /**
     * 
     */
    public function testMocnoGeslo()
    {
        $u = new \Aaa\Entity\User();

        $a = $u->preveriGeslo('Abcd1234');

        $this->assertTrue($a);
        $a = $u->preveriGeslo('acb1888#');

        $this->assertTrue($a);
        $a = $u->preveriGeslo('Šalabajz12');

        $this->assertTrue($a);
        $a = $u->preveriGeslo('br0k0li!');

        $this->assertTrue($a);
        $a = $u->preveriGeslo('Ab1#11111');

        $this->assertTrue($a);
        $a = $u->preveriGeslo('Ab!!1fg1');

        $this->assertTrue($a);
        $a = $u->preveriGeslo('');

        $this->assertTrue($a);
        $a = $u->preveriGeslo('Abcd1234');

        $this->assertTrue($a);
    }

    /**
     * @expectedException \Max\Exception\MaxException
     */
    public function testSibkaGesla()
    {
        $u = new \Aaa\Entity\User();
        $a = $u->preveriGeslo('12345678');
    }

    /**
     * @expectedException \Max\Exception\MaxException
     */
    public function testSibkaGesla1()
    {
        $u = new \Aaa\Entity\User();
        $a = $u->preveriGeslo('1234567');
    }
    /**
     * @expectedException \Max\Exception\MaxException
     */
    public function testSibkaGesla2()
    {
        $u = new \Aaa\Entity\User();
        $a = $u->preveriGeslo('AberijAS');
    }
    /**
     * @expectedException \Max\Exception\MaxException
     */
    public function testSibkaGesla3()
    {
        $u = new \Aaa\Entity\User();
        $a = $u->preveriGeslo('A!ABJDILČČ');
    }
    /**
     * @expectedException \Max\Exception\MaxException
     */
    public function testSibkaGesla4()
    {
        $u = new \Aaa\Entity\User();
        $a = $u->preveriGeslo('A1234567');
    }

}
