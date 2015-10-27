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
class VajaFixture
        extends AbstractFixture
        implements FixtureInterface, DependentFixtureInterface
{

    public function load(ObjectManager $manager)
    {
        foreach ($this->getData() as $value) {
            $this->populateVaja($manager, $value);
        }

        $manager->flush();
    }

    // $$ morda bo še potrebno implementirati funkcijo getOrder()

    public function getDependencies()
    {
        return array('TestFixture\UprizoritevFixture'); // fixture classes fixture is dependent on , $$ rb dodaj še AlternacijaFixture, ko bo
    }

    /**
     *
     * @param \Tip\Repository\IzbirneOpcije $rep
     * @param string $object
     * @param array $vals
     */
    public function populateVaja($manager, $v)
    {

        $rep = $manager->getRepository('Koledar\Entity\Vaja');

        $uprizoritevId = $v[4] ? $this->getReference($v[4]) : null;
        $o             = $rep->findOneBy([
            "uprizoritev" => $uprizoritevId,
            "zaporedna"   => $v[1],
        ]);
        $nov           = false;
        if (!$o) {
            $o   = new \Koledar\Entity\Vaja();
            $o->setZaporedna($v[1]);
            $o->setUprizoritev($uprizoritevId);
            $nov = true;
        }

        $o->setPorocilo($v[2]);
        if ($v[3]) {
            // še za implementirati, če bo potrebno
            $getref = $this->getReference($v[3]);
            $o->setDogodek($getref);
        }
        if ($nov) {
            $rep->create($o);
        } else {
            $rep->update($o);
        }

        $referenca = 'Vaja-' . $v[0];
        var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            ['01', 1, "", NULL, 'Uprizoritev-0002',],
            ['02', 2, "", NULL, 'Uprizoritev-0002',],
            ['03', 3, "", NULL, 'Uprizoritev-0002',],
            ['04', 4, "", NULL, 'Uprizoritev-0002',],
            ['05', 5, "", NULL, 'Uprizoritev-0002',],
        ];
    }

}
