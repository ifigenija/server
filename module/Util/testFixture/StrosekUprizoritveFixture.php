<?php

namespace TestFixture;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;

/**
 *
 * @author rado
 */
class StrosekUprizoritveFixture
        extends AbstractFixture
        implements FixtureInterface, DependentFixtureInterface
{

    public function load(ObjectManager $manager)
    {
        foreach ($this->getData() as $value) {
            $this->populateStrosekUprizoritve($manager, $value);
        }

        $manager->flush();
    }

    // $$ morda bo še potrebno implementirati funkcijo getOrder()

    public function getDependencies()
    {
        return array('TestFixture\PopaFixture', 'TestFixture\UprizoritevFixture');
    }

    /**
     *
     * @param \Tip\Repository\IzbirneOpcije $rep
     * @param string $object
     * @param array $vals
     */
    public function populateStrosekUprizoritve($manager, $v)
    {

        $rep           = $manager->getRepository('Produkcija\Entity\StrosekUprizoritve');
        $vrstaStroskaR = $manager->getRepository('Produkcija\Entity\VrstaStroska');


        $o = new \Produkcija\Entity\StrosekUprizoritve();
        $manager->persist($o);

        $o->setNaziv(trim($v[0]));
        $o->setVrednostDo(trim($v[1]));
        $o->setVrednostNa(trim($v[2]));
        $o->setOpis(trim($v[3]));
        $o->setSort(trim($v[4]));

        $getref = $this->getReference($v[5]);
        $o->setUprizoritev($getref);
        $getref = $this->getReference($v[6]);
        $o->setPopa($getref);
        $o->setTipstroska(trim($v[7]));

        /**
         * $$ še vrsto stroška določi
         */
        if ($v[8]) {
            $sk    = (integer) strtok($v[8], ".");
            $podsk = (integer) strtok(".");
//            echo " .............    sk=" . $sk . PHP_EOL;
//            echo " ............. podsk=" . $podsk . PHP_EOL;
//            print_r($podsk);
            $value = $vrstaStroskaR->findOneBy(["skupina" => $sk, "podskupina" => $podsk]);
//            var_dump($value);
            $o->setVrstaStroska($value);
        }

        $o->validate();


        $referenca = 'StrosekUprizoritve-' . $v[0];
        var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            ['Nabava kostumov', 600.50, 20, "Krila in maske", 1, "Uprizoritev-0002", "Popa-0988", "materialni", "2.1",],
            ['Zavese', 125.70, 3.1, "Modra in zelena zavesa", 2, "Uprizoritev-0002", "Popa-0988", "materialni", "2.1"],
//            ['Avtorske pravice', 300, 30, "Odkup avtorskih pravic", 4, "Uprizoritev-0002", "Popa-0985", "avtorprav", null],
        ];
    }

}
