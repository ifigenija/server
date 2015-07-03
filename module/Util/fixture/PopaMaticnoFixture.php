<?php

namespace IfiFixture;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;

/**
 * Nalaganje privzetih Drzav
 *
 * @author boris
 */
class PopaMaticnoFixture
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
        return array('IfiFixture\DrzavaFixture', 'IfiFixture\RolesFixture');       // zaradi opcije maticnopodjetje
    }

    public function populatePopaInProdukcijskaHisa($manager)
    {

        $rep    = $manager->getRepository('App\Entity\Popa');
        $phisaR = $manager->getRepository('ProgramDela\Entity\ProdukcijskaHisa');

        $drzavaR = $manager->getRepository('App\Entity\Drzava');
        $drzava  = $drzavaR->findOneBySifra('SI');
        $optionR = $manager->getRepository('App\Entity\Option');
        $option  = $optionR->findOneByName("application.tenant.maticnopodjetje");
        if ($option) {
            $sifra = $option->getDefaultValue();
            // zapišemo matično podjetje v popa
            $popa  = $rep->findOneBySifra($sifra);
            if (!$popa) {
                $popa = new \App\Entity\Popa();
                $popa->setSifra($sifra);
                $manager->persist($popa);
            }
            $popa->setTipKli('maticno');
            $popa->setStaKli('AK');

            $naziv = 'Sem Vpiši naziv matičnega podjetja';            // to popravimo
            $popa->setNaziv($naziv);
            $popa->setDrzava($drzava);

            // zapišemo matično podjetje v ProdukcijskaHisa
            $phisa = $phisaR->findOneByPopa($popa);
            if (!$phisa) {
                $phisa = new \ProgramDela\Entity\ProdukcijskaHisa();
                $phisa->setPopa($popa);
                $manager->persist($phisa);
            }
            $phisa->setSifra($sifra);
            $phisa->setStatus('AK');
        }
    }

}
