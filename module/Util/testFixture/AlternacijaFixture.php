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
class AlternacijaFixture
        extends AbstractFixture
        implements FixtureInterface, DependentFixtureInterface
{

    public function load(ObjectManager $manager)
    {
        foreach ($this->getData() as $value) {
            $this->populateAlternacija($manager, $value);
        }

        $manager->flush();
    }

    public function getDependencies()
    {
        return array('TestFixture\FunkcijaFixture', 'TestFixture\OsebaFixture', 'TestFixture\PogodbaFixture'); // fixture classes fixture is dependent on , 
    }

    /**
     *
     * @param \Tip\Repository\IzbirneOpcije $rep
     * @param string $object
     * @param array $vals
     */
    public function populateAlternacija($manager, $v)
    {

        $rep = $manager->getRepository('Produkcija\Entity\Alternacija');
//        $tipFunR = $manager->getRepository('Produkcija\Entity\TipFunkcije');

        $o = $rep->findOneBySifra(trim($v[0]));
        if (!$o) {
            $o = new \Produkcija\Entity\Alternacija();
            $o->setSifra(trim($v[0]));
            $manager->persist($o);
        }
//            'Zaposlen     => true,
//            'Funkcija     => $this->lookFunkcija['id'],
//            'Sodelovanje  => $this->objZaposlitev['id'],
//            'Oseba        => $this->lookOseba['id'],
//            'Koprodukcija => $this->objKoprodukcija['id'],
//            'Pogodba      => $this->objPogodba['id'],

        $o->setZaposlen($v[1]);

        $getref = $this->getReference($v[2]);
        $o->setFunkcija($getref);
        if ($v[3]) {
            // $$ še ni implementirano
            $getref = $this->getReference($v[3]);
            $o->setSodelovanje($getref);
        }

        $getref = $this->getReference($v[4]);
        $o->setOseba($getref);

        if ($v[5]) {
            $getref = $this->getReference($v[5]);
            $o->setKoprodukcija($getref);
        }

        if ($v[6]) {
            $getref = $this->getReference($v[6]);
            $o->setPogodba($getref);
        }
        $o->setImaPogodbo($v[7]);
        $o->setPomembna($v[8]);
        $o->setSort($v[9]);


        $referenca = 'Alternacija-' . $v[0];
        var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            ['0001', false, 'Funkcija-Tezej', null, 'Oseba-0009', null, "Pogodba-0001",TRUE,True,3,],
            ['0002', true, 'Funkcija-Režija', null, 'Oseba-0010', null, null,false,false,8,],
            ['0003', TRUE, 'Funkcija-Inšpicient', null, 'Oseba-0003', null, null,false,false,2,],
            ['0004', TRUE, 'Funkcija-Tehnični vodja', null, 'Oseba-0002', null, null,false,false,26,],
            ['0005', TRUE, 'Funkcija-Lučni mojster', null, 'Oseba-0012', null, null,false,false,7,],
            ['0006', false, 'Funkcija-Helena', null, 'Oseba-0006', null, "Pogodba-0002",true,true,1,],
            ['0007', true, 'Funkcija-Hipolita', null, 'Oseba-0008', null, NULL,false,true,14,],
            ['0008', false, 'Funkcija-Lektoriranje', null, 'Oseba-0013', null, "Pogodba-0003",true,true,12,],
        ];
    }

}
