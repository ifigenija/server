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
        return array('TestFixture\FunkcijaFixture', 'TestFixture\OsebaFixture'); // fixture classes fixture is dependent on , 
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

        $o->setSort($v[6]);
        $o->setImaPogodbo($v[7]);
        $o->setPomembna($v[8]);

        $o->preracunaj();
        $o->validate();


        $referenca = 'Alternacija-' . $v[0];
        var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            ['0001', false, 'Funkcija-Tezej', null, 'Oseba-0009', null,3, TRUE,True,],
            ['0002', true, 'Funkcija-Režija', null, 'Oseba-0010', null, 8,false,false,],
            ['0003', TRUE, 'Funkcija-Inšpicient', null, 'Oseba-0003', null, 2,false,false,],
            ['0004', TRUE, 'Funkcija-Tehnični vodja', null, 'Oseba-0002', null, 26,false,false,],
            ['0005', TRUE, 'Funkcija-Lučni mojster', null, 'Oseba-0012', null, 7,false,false,],
            ['0006', false, 'Funkcija-Helena', null, 'Oseba-0006', null, 1,true,true,],
            ['0007', true, 'Funkcija-Hipolita', null, 'Oseba-0008', null, 14,false,true,],
            ['0008', false, 'Funkcija-Lektoriranje', null, 'Oseba-0013', null, 12,true,true,],
        ];
    }

}
