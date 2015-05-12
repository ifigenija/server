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
class PopaFixture extends AbstractFixture implements FixtureInterface, \Doctrine\Common\DataFixtures\DependentFixtureInterface {

    public function load(ObjectManager $manager) {

        foreach ($this->getData() as $value) {
            $this->populatePopa($manager, $value);
        }

        $manager->flush();
    }

    /**
     *
     * @param \Tip\Repository\IzbirneOpcije $rep
     * @param string $object
     * @param array $vals
     */
    public function populatePopa($manager, $v) {

        $rep = $manager->getRepository('App\Entity\Popa');
        $repD = $manager->getRepository('App\Entity\Drzava');

        $drzava = $repD->findAll()[0];
        
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
    }



    public function getData(){
        return [
          ['1000', 'c', 'AK', 'Juhuhu d.o.o.' ],  
          ['1001', 'c', 'AK', 'Hopsasa d.o.o.' ]  
        ];
    }
    
    
    public function getDependencies()
    {
        
    }

    
}