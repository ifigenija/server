<?php

namespace IfiFixture;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;

/**
 * Nalaganje TipFunkcije
 *
 * @author rado
 */
class TipFunkcijeFixture extends AbstractFixture implements FixtureInterface
{

    public function load(ObjectManager $manager)
    {
        foreach ($this->getData() as $value) {
            $this->populateTipFunkcije($manager, $value);
        }

        $manager->flush();
    }

    /**
     *
     * @param \Tip\Repository\IzbirneOpcije $rep
     * @param string $object
     * @param array $vals
     */
    public function populateTipFunkcije($manager, $v)
    {

        $rep = $manager->getRepository('Produkcija\Entity\TipFunkcije');

        $o = $rep->findOneByIme(trim($v[0]));
        if (!$o) {
            $o = new \Produkcija\Entity\TipFunkcije();
            $o->setIme(trim($v[0]));
            $manager->persist($o);
        }

        $o->setOpis($v[1]);
        $o->setDovoliPrekrivanje($v[2]);
        $o->setMaxPrekrivanj($v[3]);
        $o->setImeZenski($v[4]);
        $o->setPodrocje($v[5]);
    }

    public function getData()
    {
        return [
            ['Igralec ali animator', 'Igralci in animatorji', "TRUE", "1", 'Igralka ali animatorka', 'igralec',],
            ['Igralec ali animator', 'Igralci in animatorji', TRUE, 1, 'Igralka ali animatorka', 'igralec',],
            ['Baletnik ali plesalec', 'Baletniki in plesalci', TRUE, 1, 'Baletnica ali plesalka', 'igralec',],
            ['Avtor', 'Avtorji', TRUE, 1, 'Avtorka', 'umetnik',],
            ['Režiser', 'Režiserji', TRUE, 1, 'Režiserka', 'umetnik',],
            ['Scenograf', 'Scenografi', TRUE, 1, 'Scenografka', 'tehnik',],
            ['Kostumograf', 'Kostumografi', TRUE, 1, 'Kostumografinja', 'tehnik',],
            ['Oblikovalec maske', 'Oblikovalci maske', TRUE, 1, 'Oblikovalka maske', 'tehnik',],
            ['Avtor glasbe', 'Avtorji glasbe', TRUE, 1, 'Avtorica glasbe', 'umetnik',],
            ['Oblikovalec svetlobe', 'Oblikovalci svetlobe', TRUE, 1, 'Oblikovalka svetlobe', 'tehnik',],
            ['Koreograf', 'Koreografi', TRUE, 1, 'Koreografinja', 'umetnik',],
            ['Dramaturg', 'Dramaturgi', TRUE, 1, 'Dramaturginja', 'umetnik',],
            ['Lektorj', 'Lektorji', TRUE, 1, 'Lektorica', 'umetnik',],
            ['Prevajalec', 'Prevajalci', TRUE, 1, 'Prevajalka', 'umetnik',],
            ['Oblikovalec videa', 'Oblikovalci videa', TRUE, 1, 'Oblikovalka videa', 'umetnik',],
            ['Intermedijski ustvarjalec', 'Intermedijski ustvarjalci', TRUE, 1, 'Intermedijska ustvarjalka', 'umetnik',],
        ];
    }

}
