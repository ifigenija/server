<?php

use Stevilcenje\Entity\Stevilcenje;
use Stevilcenje\Entity\StevilcenjeKonfig;

/**
 * Generated by PHPUnit_SkeletonGenerator 1.2.1 on 2013-07-11 at 10:58:24.
 */
class StevilcenjeServicetest
        extends \AbstractTest
{

    /**
     *
     * @var \Tip\Repository\Tdok
     */
    protected $r;

    /**
     *
     * @var \Tip\Repository\Skladisce
     */
    protected $s;

    /**
     * Nastavim vse potrebno, da lahko produciram repositorije
     * Repositorijem, ki to potrebujejo nastavim service locator
     */
    protected function _before()
    {

        $this->tearDownFixture();
        $this->setupFixture();
    }

    /**
     * Tears down the fixture, for example, closes a network connection.
     * This method is called after a test is executed.
     */
    protected function _after()
    {
        $this->tearDownFixture();
    }

    /**
     * @covers Tip\Numbering\DocNumbering::generate
     * Glej NumberingFixture
     */
    public function testGenerate()
    {
        $object = $this->sm->get('stevilcenje.generator');

        $stev = $object->generate('test.dok1', 2013);

        $this->assertEquals('PON01001-2013-XXX', $stev, "1001");
        $stev = $object->generate('test.dok1', 2013);
        $this->assertEquals('PON01002-2013-XXX', $stev, "1002");
    }

    /**
     * Preverim, da se pravilno vrne exception, ko številčenja na dokumentu ni
     * @expectedException \Stevilcenje\Exception\StevilcenjeNiDefinirano
     *
     */
    public function testNoNumbering()
    {
        $object = $this->sm->get('stevilcenje.generator');

        $stev = $object->generate('neobstoječiXXX"', 2013);
    }

    /**
     * Preveri, če se globalna številčenja obnašajo tako, da gre številka neodvisno od tipa dokumenta
     */
    public function testGlobalnoStevilcenje()
    {

        $object = $this->sm->get('stevilcenje.generator');

        $stev = $object->generate('test.dok3', 2013);
        $this->assertEquals('2013-2001', $stev, "prvic");
        $stev = $object->generate('test.dok4', 2013);
        $this->assertEquals('2013-2002', $stev, "drugic");

        $stev = $object->generate('test.dok3', 2013);
        $this->assertEquals('2013-2003', $stev, "tretjic");
        $stev = $object->generate('test.dok4', 2013);
        $this->assertEquals('2013-2004', $stev, "cetrtic");
    }

    /**
     * Preverim, da številčenje deluje pravilno v primerih,
     * ko številčenje ni razmejeno po letih
     */
    public function testPoLetih()
    {
        $object = $this->sm->get('stevilcenje.generator');

        $stev = $object->generate('test.dok1', 2013);
        $this->assertEquals('PON01001-2013-XXX', $stev);

        $stev = $object->generate('test.dok1', 2014);
        $this->assertEquals('PON01002-2014-XXX', $stev);

        $stev = $object->generate('test.dok1', null);
        $this->assertEquals('PON01003--XXX', $stev);
    }

    /**
     * Če je številčenje razmejeno po letih, potem je leto obvezen podatek.
     * Če ga ni pričakujem exception
     * @expectedException \Stevilcenje\Exception\StevilcenjeNiDefinirano
     */
    public function testNiLetaVstevilcenjuPoLetih()
    {
        $object = $this->sm->get('stevilcenje.generator');

      

        $tren = $object->generate('test.dok2', null);
    }

    /**
     */
    public function testGenerateMultiple()
    {

         $object = $this->sm->get('stevilcenje.generator');       

        $stev = $object->generateMultiple(10, 'test.dok2', 2013);

        $this->assertEquals(count($stev), 10);

        $stv = array_shift($stev);
        $this->assertEquals('2013-2001', $stv);
        $stv = array_shift($stev);
        $this->assertEquals('2013-2002', $stv);
    }

    /**
     */
    public function testGenerateGlobal()
    {
        /* @var $object \Tip\Numbering\DocNumbering */
        $object = $this->sm->get('stevilcenje.generator');

        $stev = $object->generateGlobal('T33', '2015');

        $this->assertEquals('2015-2001', $stev, "prvic");

        $stev = $object->generateGlobal('T33', '2015');
        $this->assertEquals('2015-2002', $stev, "drugic");

        $stev = $object->generateGlobal('T33', '2015');
        $this->assertEquals('2015-2003', $stev, "tretijc");

        $stev = $object->generate('test.dok3', '2015');
        $this->assertEquals('2015-2004', $stev, "cetrtic");
    }

    public function setupFixture()
    {


        // dvoje številčenje - 111 in 222
        $stevilcenje = new Stevilcenje();
        $stevilcenje->setSifra('111')
                ->setNaziv('privzeto')
                ->setDolzina(5)
                ->setFormat('%n-%l-')
                ->setPrefix('PON')
                ->setSuffix('XXX')
                ->setZacetek(1000)
                ->setGlobalno(false)
                ->setPoLetih(false);
        $this->em->persist($stevilcenje);


        $stevilcenje2 = new Stevilcenje();
        $stevilcenje2->setSifra('222')
                ->setNaziv('alternativno')
                ->setDolzina(1)
                ->setFormat('%l-%n')
                ->setPrefix('')
                ->setSuffix('')
                ->setZacetek(2000)
                ->setGlobalno(true)
                ->setPoLetih(true);

        $this->em->persist($stevilcenje2);

        $stevilcenje3 = new Stevilcenje();
        $stevilcenje3->setSifra('T33')
                ->setNaziv('globalno')
                ->setDolzina(1)
                ->setFormat('%l-%n')
                ->setPrefix('')
                ->setSuffix('')
                ->setZacetek(2000)
                ->setGlobalno(true)
                ->setPoLetih(true);

        $this->em->persist($stevilcenje3);

        $konfig = new StevilcenjeKonfig();
        $konfig->setDok('test.dok1');
        $konfig->setStevilcenje($stevilcenje);
        $this->em->persist($konfig);

        $konfig = new StevilcenjeKonfig();
        $konfig->setDok('test.dok2');
        $konfig->setStevilcenje($stevilcenje2);
        $this->em->persist($konfig);

        $konfig = new StevilcenjeKonfig();
        $konfig->setDok('test.dok3');
        $konfig->setStevilcenje($stevilcenje3);
        $this->em->persist($konfig);

        $konfig = new StevilcenjeKonfig();
        $konfig->setDok('test.dok4');
        $konfig->setStevilcenje($stevilcenje3);
        $this->em->persist($konfig);



        $this->em->flush();
    }

    public function tearDownFixture()
    {
        $this->em->createQuery("delete from Stevilcenje\Entity\StevilcenjeKonfig s where s.dok='test.dok1'")->execute();
        $this->em->createQuery("delete from Stevilcenje\Entity\StevilcenjeKonfig s where s.dok='test.dok2'")->execute();
        $this->em->createQuery("delete from Stevilcenje\Entity\StevilcenjeKonfig s where s.dok='test.dok3'")->execute();
        $this->em->createQuery("delete from Stevilcenje\Entity\StevilcenjeKonfig s where s.dok='test.dok4'")->execute();
        $this->em->createQuery("delete from Stevilcenje\Entity\Stevilcenje s where s.sifra='111'")->execute();
        $this->em->createQuery("delete from Stevilcenje\Entity\Stevilcenje s where s.sifra='222'")->execute();
        $this->em->createQuery("delete from Stevilcenje\Entity\Stevilcenje s where s.sifra='T33'")->execute();
    }

}
