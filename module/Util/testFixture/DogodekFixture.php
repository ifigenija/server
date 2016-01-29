<?php

namespace TestFixture;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Koledar\Entity\Dogodek;

/**
 *
 * @author rado
 */
class DogodekFixture
        extends AbstractFixture
        implements FixtureInterface, DependentFixtureInterface
{

    public function load(ObjectManager $manager)
    {
        foreach ($this->getData() as $value) {
            $this->populateDogodek($manager, $value);
        }

        $manager->flush();
    }

    public function getDependencies()
    {
        return array('TestFixture\VajaFixture', 'TestFixture\ProstorFixture'); // fixture classes fixture is dependent on , 
    }

    /**
     *
     * @param \Tip\Repository\IzbirneOpcije $rep
     * @param string $object
     * @param array $vals
     */
    public function populateDogodek($manager, $v)
    {

        $rep = $manager->getRepository('Koledar\Entity\Dogodek');

        /*
         * rabimo le referenco 
         */
        $vajaId       = $v[1] ? $this->getReference($v[1]) : null;
        $o            = $rep->findOneBy([
            "vaja"       => $vajaId,
        ]);

        
        
        $referenca = 'Dogodek-' . $v[0];
//        var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            ['01', 'Vaja-01', ],
            ['02', 'Vaja-02', ],
            ['03', 'Vaja-03', ],
            ['04', 'Vaja-04', ],
            ['05', 'Vaja-05', ],
        ];
    }

}
