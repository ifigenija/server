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
class TipFunkcijeFixture
        extends AbstractFixture
        implements FixtureInterface
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
        $o->setNastopajoc($v[2]);
        $o->setImeZenski($v[3]);
        if ($v[4]) {
            $o->setPodrocje($v[4]);
        }
    }

    public function getData()
    {
        return [
             // najprej specialna tipa funkcije - se ne bo uporabljalo
//            ['Inšpicient', 'Inšpicienti', FALSE,  'Inšpicientka', null,],
//            ['Tehnični vodja', 'Tehnične vodje', false,  'Tehnični vodja', null,],
            // tipi funkcije iz SLOGI:
            ['Igralec ali animator', 'Igralci in animatorji', TRUE,  'Igralka ali animatorka', 'igralec',],
            ['Baletnik ali plesalec', 'Baletniki in plesalci', TRUE, 'Baletnica ali plesalka', 'igralec',],
            ['Avtor', 'Avtorji', TRUE, 'Avtorka', 'umetnik',],
            ['Režiser', 'Režiserji', TRUE, 'Režiserka', 'umetnik',],
            ['Scenograf', 'Scenografi', TRUE, 'Scenografka', 'tehnik',],
            ['Kostumograf', 'Kostumografi', TRUE, 'Kostumografinja', 'tehnik',],
            ['Oblikovalec maske', 'Oblikovalci maske', TRUE,  'Oblikovalka maske', 'tehnik',],
            ['Avtor glasbe', 'Avtorji glasbe', TRUE,  'Avtorica glasbe', 'umetnik',],
            ['Oblikovalec svetlobe', 'Oblikovalci svetlobe', TRUE,  'Oblikovalka svetlobe', 'tehnik',],
            ['Koreograf', 'Koreografi', TRUE,  'Koreografinja', 'umetnik',],
            ['Dramaturg', 'Dramaturgi', TRUE,  'Dramaturginja', 'umetnik',],
            ['Lektorj', 'Lektorji', TRUE,  'Lektorica', 'umetnik',],
            ['Prevajalec', 'Prevajalci', TRUE,  'Prevajalka', 'umetnik',],
            ['Oblikovalec videa', 'Oblikovalci videa', TRUE,  'Oblikovalka videa', 'umetnik',],
            ['Intermedijski ustvarjalec', 'Intermedijski ustvarjalci', TRUE,  'Intermedijska ustvarjalka', 'umetnik',],
            ['Nerazvrščeno', 'Nerazvrščeno', TRUE,  'Nerazvrščeno', null,],
        ];
    }

}
