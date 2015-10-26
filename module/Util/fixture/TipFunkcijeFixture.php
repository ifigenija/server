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

        $o   = $rep->findOneBySifra($v[0]);
        $nov = false;
        if (!$o) {
            $o = new \Produkcija\Entity\TipFunkcije();
            $o->setSifra(trim($v[0]));
            $nov = true;
        }
        $o->setIme($v[1]);
        $o->setOpis($v[2]);
        $o->setImeZenski($v[3]);
        if ($v[4]) {
            $o->setPodrocje($v[4]);
        }
        $o->setSort($v[5]);
                if ($nov) {
            $rep->create($o);
        } else {
            $rep->update($o);
        }
    }

    public function getData()
    {
        return [
            // tipi funkcije iz SLOGI:
            ['01', 'Avtor', 'Avtorji', 'Avtorka', 'umetnik', 150,],
            ['02', 'Priredba', 'Priredba', 'Priredba', 'umetnik', 160,],
            ['03', 'Prevod', 'Prevod', 'Prevod', 'umetnik', 20,],
            ['04', 'Režija', 'Režija', 'Režija', 'umetnik', 30,],
            ['05', 'Dramaturgija', 'Dramaturgija', 'Dramaturgija', 'umetnik', 40,],
            ['06', 'Scenografija', 'Scenografija', 'Scenografija', 'umetnik', 60,],
            ['07', 'Kostumografija', 'Kostumografija', 'Kostumografija', 'umetnik', 70,],
            ['08', 'Koreografija', 'Koreografija', 'Koreografija', 'umetnik', 90,],
            ['09', 'Oblikovanje svetlobe in zvoka', 'Oblikovanje svetlobe in zvoka', 'Oblikovanje svetlobe in zvoka', 'umetnik', 100,],
            ['10', 'Oblikovanje maske', 'Oblikovanje maske', 'Oblikovanje maske', 'umetnik', 110,],
            ['11', 'Lektorstvo', 'Lektorstvo', 'Lektorstvo', 'umetnik', 50,],
            ['12', 'Glasbeni soustvarjalec', 'Glasbeni soustvarjalci', 'Glasbena soustvarjalka', 'umetnik', 80,],
            ['13', 'Intermedijski ustvarjalec', 'Intermedijski ustvarjalci', 'Intermedijski ustvarjalka', 'umetnik', 130,],
            ['14', 'Posebni efekti -izvedba in svetovanje', 'Posebni efekti -izvedba in svetovanje', 'Posebni efekti -izvedba in svetovanje', 'umetnik', 120,],
            ['15', 'Vloga', 'Intermedijski ustvarjalci', 'Intermedijska ustvarjalka', 'igralec', 10,],
            ['16', 'Produkcija, mentorstvo', 'Produkcija, mentorstvo', 'Produkcija, mentorstvo', 'umetnik', 140,],
            ['17', 'Tehnična in druga podpora', 'Tehnična in druga podpora', 'Tehnična in druga podpora', 'tehnik', 180,],
            // specifika Ifigenije:
            ['18', 'Inšpicient', 'Inšpicienti', 'Inšpicientka', 'inspicient', 170,],
        ];
    }

}
