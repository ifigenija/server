<?php

namespace TestFixture;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;

/**
 * Nalaganje privzetih Drzav
 *
 * @author boris
 */
class PopaMaticnoTestFixture
        extends AbstractFixture
        implements FixtureInterface, DependentFixtureInterface
{

    public function load(ObjectManager $manager)
    {

        $this->populatePopaInProdukcijskaHisa($manager);

        $manager->flush();
    }

    public function getDependencies()
    {
        return array('TestFixture\OptionsFixture','TestFixture\PopaFixture');       // zaradi opcije maticnopodjetje
    }

    public function populatePopaInProdukcijskaHisa($manager)
    {

        $rep    = $manager->getRepository('App\Entity\Popa');
        $phisaR = $manager->getRepository('Produkcija\Entity\ProdukcijskaHisa');

        $drzavaR = $manager->getRepository('App\Entity\Drzava');
        $drzava  = $drzavaR->findOneBySifra('SI');
        $optionR = $manager->getRepository('App\Entity\Option');
        $option  = $optionR->findOneByName("application.tenant.maticnopodjetje");
        if ($option) {
            $sifra = $option->getDefaultValue();

            // zapišemo matično podjetje v popa , če še ne obstaja
            $popa  = $rep->findOneBySifra($sifra);
       
            if (!$popa) {
                $popa = new \App\Entity\Popa();
                $popa->setSifra($sifra);
                $manager->persist($popa);
                
                $popa->setTipKli('maticno');
                $popa->setStaKli('AK');

                $naziv = 'Gledališče Matica';        
                $popa->setNaziv($naziv);
                $popa->setDrzava($drzava);
            }

            // zapišemo matično podjetje v ProdukcijskaHisa, če še ne obstaja
            $phisa = $phisaR->findOneByPopa($popa);
            if (!$phisa) {
                $phisa = new \Produkcija\Entity\ProdukcijskaHisa();
                $phisa->setPopa($popa);
                $manager->persist($phisa);

                $phisa->setSifra($sifra);
                $phisa->setStatus('AK');
            }
        }
    }

}
