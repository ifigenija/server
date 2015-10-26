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
class ProgramDelaFixture
        extends AbstractFixture
        implements FixtureInterface, DependentFixtureInterface
{

    public function load(ObjectManager $manager)
    {
        foreach ($this->getData() as $value) {
            $this->populateProgramDela($manager, $value);
        }

        $manager->flush();
    }

    public function getDependencies()
    {
        return array('TestFixture\ProgramPremieraFixture'); // fixture classes fixture is dependent on , 
    }

    /**
     *
     * @param \Tip\Repository\IzbirneOpcije $rep
     * @param string $object
     * @param array $vals
     */
    public function populateProgramDela($manager, $v)
    {

        $rep = $manager->getRepository('ProgramDela\Entity\ProgramDela');

        $o = $rep->findOneBySifra(trim($v[0]));
        $nov = FALSE;
        if (!$o) {
            $o = new \ProgramDela\Entity\ProgramDela();
            $o->setSifra(trim($v[0]));
            $nov = true;
        }
//            'Naziv          => 'bb',
//            'Zacetek        => '2016-02-01T00:00:00+0100',
//            'Konec          => '2017-02-01T00:00:00+0100',
//            'PotrjenProgram => TRUE,
//            'Sezona         => null,
//
//            ['0001', 'Testni program dela', '2016-02-01T00:00:00+0100', '2017-02-01T00:00:00+0100', false, null, ],

        
        $o->setNaziv          ($v[1]);
        $date = empty($v[2]) ? null : date_create($v[2]);     // polje mora biti v php-jevi PHP-jevem datetime  tipu
        $o->setZacetek        ($date);
        $date = empty($v[3]) ? null : date_create($v[3]);     // polje mora biti v php-jevi PHP-jevem datetime  tipu
        $o->setKonec          ($date);
        $o->setPotrjenProgram ($v[4]);
        if ($nov) {
            $rep->create($o);
        } else {
            $rep->update($o);
        }

        $referenca = 'ProgramDela-' . $v[0];
        var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            ['0001', 'Testni program dela', '2016-02-01T00:00:00+0100', '2017-02-01T00:00:00+0100', false, ],
        ];
    }

}