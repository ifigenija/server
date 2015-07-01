<?php

namespace TestFixture;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;

/**
 * Nalaganje privzetih Drzav
 *
 * @author boris
 */
class PopaFixture
        extends AbstractFixture
        implements FixtureInterface
{

    public function load(ObjectManager $manager)
    {

        foreach ($this->getData() as $value) {
            $this->populatePopa($manager, $value);
        }

        $manager->flush();
    }

    /**
     *
     * @param string $object
     * @param array $vals
     */
    public function populatePopa($manager, $v)
    {

        $popaR  = $manager->getRepository('App\Entity\Popa');
        $drzavaR = $manager->getRepository('App\Entity\Drzava');


        $o = $popaR->findOneBySifra(trim($v[0]));
        if (!$o) {
            $o = new \App\Entity\Popa();
            $o->setSifra(trim($v[0]));
            $manager->persist($o);
        }


        $o->setTipKli($v[1]);
        $o->setStaKli($v[2]);
        $o->setNaziv($v[3]);

        $drzava = $drzavaR->findOneBySifra(trim($v[4]));
        $o->setDrzava($drzava);
        $o->setNvo($v[5]);


        $referenca = 'Popa-' . $v[0];
        var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            ['0988', 'dobavitelj', 'AK', 'Juhuhu d.o.o.', 'SI',false, ],
            ['0989', 'koproducent', 'AK', 'Hopsasa d.o.o.', 'SI', true,],
            ['0987', 'koproducent', 'AK', 'Gledališče Šrum d.o.o.', 'SI',false,],
            ['0986', 'koproducent', 'AK', 'Lutkovni Direndaj d.o.o.', 'SI',false,],
            ['0985', 'dobavitelj', 'AK', 'Tatjana Stanič, Lektoriranje, s.p.', 'SI',false,],
            ['0984', 'koproducent', 'AK', 'Gledališče Lepote tvoje', 'AR',false,],
            ['0983', 'koproducent', 'AK', 'Sunce naše', 'HR',false,],
            ['0982', 'koproducent', 'AK', 'Theater Amadeus', 'AT',false,],
        ];
    }

}
