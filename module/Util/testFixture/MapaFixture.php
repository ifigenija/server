<?php

namespace TestFixture;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;

/**
 *
 * Nalaganje TipFunkcije
 * @author rado
 */
class MapaFixture
        extends AbstractFixture
        implements FixtureInterface, DependentFixtureInterface
{

    public function load(ObjectManager $manager)
    {
        foreach ($this->getData() as $value) {
            $this->populateMapa($manager, $value);
        }

        $manager->flush();
    }

    public function getDependencies()
    {
        return array('TestFixture\UsersFixture'); // fixture classes fixture is dependent on , 
    }

    /**
     *
     * @param \Tip\Repository\IzbirneOpcije $rep
     * @param string $object
     * @param array $vals
     */
    public function populateMapa($manager, $v)
    {

        $rep   = $manager->getRepository('Zapisi\Entity\Mapa');
        $userR = $manager->getRepository('Aaa\Entity\User');

        $o   = $rep->findOneByIme($v[1]);
        $nov = false;
        if (!$o) {
            $o   = new \Zapisi\Entity\Mapa();
            $o->setIme($v[1]);
            $nov = true;
        }
        $o->setKomentar($v[2]);
        $o->setJavniDostop($v[3]);
        
        /***
         * za ne-root mape še verjetno ni pripravljen fixture
         */
        $o->setParent($v[4]);

        $lastnik = $userR->findOneByEmail($v[5]);
        $o->setLastnik($lastnik);

        if ($nov) {
            if ($v[4] == null) {
                /**
                 * root mapa gre mimo creatae v repozitoriju
                 * zaradi preverjanja privilegijev
                 * 
                 * ponovimo del create metode:
                 */
                $o->setCasKreiranja(new \DateTime());
                $o->setCasSpremembe(new \DateTime());

                $manager->persist($o);
            } else {
                /**
                 *  povozi lastnika
                 */
                $rep->create($o);
            }
//            $rep->create($o);
        } else {
            $rep->update($o);
        }


        $referenca = 'Mapa-' . $v[0];
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            [
                '01', 'Prva mapa', 'Root mapa', 'R', null, 'admin@ifigenija.si',],
        ];
    }

}
