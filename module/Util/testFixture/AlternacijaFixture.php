<?php

namespace IfiFixture;

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

    // $$ morda bo še potrebno implementirati funkcijo getOrder()

    public function getDependencies()
    {
        return array('IfiFixture\FunkcijaFixture','IfiFixture\OsebaFixture'); // fixture classes fixture is dependent on , 
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
            // $$ še ni implementirano
            $getref = $this->getReference($v[5]);
            $o->setKoprodukcija($getref);
        }
        if ($v[5]) {
            // $$ še ni implementirano
            $getref = $this->getReference($v[5]);
            $o->setPogodba($getref);
        }


        $referenca = 'Alternacija-' . $v[0];
        var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            ['0001', false, 'Funkcija-Tezej', null, 'Oseba-0009', null, null,],
            ['0002', false, 'Funkcija-Režija', null, 'Oseba-0010', null, null,],
        ];
    }

}
