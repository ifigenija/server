<?php

namespace IfiFixture;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;

/**
 * Nalaganje privzetih Drzav
 *
 * @author boris
 */
class PopaProdFixture
        extends AbstractFixture
        implements FixtureInterface
{

    public function load(ObjectManager $manager)
    {

//        foreach ($this->getData() as $value) {
//            $this->populatePopa($manager, $value);
//        }
//
//        $manager->flush();
    }

    public function getDependencies()
    {
        return array('IfiFixture\DrzavaFixture'); // fixture classes fixture is dependent on , 
    }

    /**
     *
     * @param \Tip\Repository\IzbirneOpcije $rep
     * @param string $object
     * @param array $vals
     */
    public function populatePopa($manager, $v)
    {

        $rep  = $manager->getRepository('App\Entity\Popa');
        $drzavaR = $manager->getRepository('App\Entity\Drzava');
        
        $drzava = $drzavaR->findOneBySifra('SI ');

        $o = $rep->findOneBySifra(trim($v[0]));
        if (!$o) {
            $o = new \App\Entity\Popa();
            $o->setSifra(trim($v[0]));
            $manager->persist($o);
        }

        $o->setTipKli($v[1]);
        $o->setStaKli($v[2]);
        $o->setNaziv($v[3]);

        $o->setDrzava($drzava);

        $referenca = 'Popa-' . $v[0];
        var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
// matično potjetje, šifra naj bo ista kot vrednost opcije application.tenant.maticnopodjetje
            ['0100', 'maticno', 'AK', 'Sem Vpiši naziv matičnega podjetja',]    // popraviti naziv
        ];
    }

}
