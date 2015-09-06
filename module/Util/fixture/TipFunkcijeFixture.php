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

        $o = $rep->findOneByIme(trim($v[1]));
        if (!$o) {
            $o = new \Produkcija\Entity\TipFunkcije();
            $o->setIme(trim($v[1]));
            $manager->persist($o);
        }
        $o->setSifra(trim($v[0]));
        $o->setOpis($v[2]);
        $o->setImeZenski($v[3]);
        if ($v[4]) {
            $o->setPodrocje($v[4]);
        }
    }

    public function getData()
    {
        return [
            // tipi funkcije iz SLOGI:
            ['01', 'Avtor', 'Avtorji', 'Avtorka', 'umetnik',],
            ['02', 'Priredba', 'Priredba', 'Priredba', 'umetnik',],
            ['03', 'Prevod', 'Prevod', 'Prevod', 'umetnik',],
            ['04', 'Režija', 'Režija', 'Režija', 'umetnik',],
            ['05', 'Dramaturgija', 'Dramaturgija', 'Dramaturgija', 'umetnik',],
            ['06', 'Scenografija', 'Scenografija', 'Scenografija', 'umetnik',],
            ['07', 'Kostumografija', 'Kostumografija', 'Kostumografija', 'umetnik',],
            ['08', 'Koreografija', 'Koreografija', 'Koreografija', 'umetnik',],
            ['09', 'Oblikovanje svetlobe in zvoka', 'Oblikovanje svetlobe in zvoka', 'Oblikovanje svetlobe in zvoka', 'umetnik',],
            ['10', 'Oblikovanje maske', 'Oblikovanje maske', 'Oblikovanje maske', 'umetnik',],
            ['11', 'Lektorstvo', 'Lektorstvo', 'Lektorstvo', 'umetnik',],
            ['12', 'Glasbeni soustvarjalec', 'Glasbeni soustvarjalci', 'Glasbena soustvarjalka', 'umetnik',],
            ['13', 'Intermedijski ustvarjalec', 'Intermedijski ustvarjalci', 'Intermedijski ustvarjalka', 'umetnik',],
            ['14', 'Posebni efekti -izvedba in svetovanje', 'Posebni efekti -izvedba in svetovanje', 'Posebni efekti -izvedba in svetovanje', 'umetnik',],
            ['15', 'Vloga', 'Intermedijski ustvarjalci', 'Intermedijska ustvarjalka', 'igralec',],
            ['16', 'Produkcija, mentorstvo', 'Produkcija, mentorstvo', 'Produkcija, mentorstvo', 'umetnik',],
            ['17', 'Tehnična podpora', 'Tehnična podpora', 'Tehnična podpora', 'tehnik',],
            // specifika Ifigenije:
            ['18', 'Inšpicient', 'Inšpicienti', 'Inšpicientka', 'inspicient',],
        ];
    }

}
