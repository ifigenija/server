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
class TerminStoritveFixture
        extends AbstractFixture
        implements FixtureInterface, DependentFixtureInterface
{

    public function load(ObjectManager $manager)
    {
        foreach ($this->getData() as $value) {
            $this->populateTerminStoritve($manager, $value);
        }

        $manager->flush();
    }

    // $$ morda bo še potrebno implementirati funkcijo getOrder()

    public function getDependencies()
    {
        return array('TestFixture\DogodekFixture','TestFixture\AlternacijaFixture','TestFixture\OsebaFixture'); // fixture classes fixture is dependent on , 
    }

    /**
     *
     * @param \Tip\Repository\IzbirneOpcije $rep
     * @param string $object
     * @param array $vals
     */
    public function populateTerminStoritve($manager, $v)
    {

        $rep = $manager->getRepository('Prisotnost\Entity\TerminStoritve');

//            'planiranZacetek => '2011-02-01T00:00:00+0100',
//            'planiranKonec   => '2012-02-01T00:00:00+0100',
//            'zacetek         => '2013-02-01T00:00:00+0100',
//            'konec           => '2014-02-01T00:00:00+0100',
//            'planiranoTraja  => 1.23,
//            'dogodek         => $this->objDogodek['id'],
//            'alternacija     => $this->objAlternacija['id'],
//            'oseba           => $this->objOseba['id'],


        $o = new \Prisotnost\Entity\TerminStoritve();
        $manager->persist($o);


        $date = empty($v[1]) ? null : date_create($v[1]);     // polje mora biti v php-jevi PHP-jevem datetime  tipu
        $o->setPlaniranZacetek($date);
        $date = empty($v[2]) ? null : date_create($v[2]);     // polje mora biti v php-jevi PHP-jevem datetime  tipu
        $o->setPlaniranKonec($date);
        $date = empty($v[3]) ? null : date_create($v[3]);     // polje mora biti v php-jevi PHP-jevem datetime  tipu
        $o->setZacetek($date);
        $date = empty($v[4]) ? null : date_create($v[4]);     // polje mora biti v php-jevi PHP-jevem datetime  tipu
        $o->setKonec($date);
        $o->setPlaniranoTraja($v[5]);

        if ($v[6]) {
            $getref = $this->getReference($v[6]);
            $o->setDogodek($getref);
        }
        if ($v[7]) {
            $getref = $this->getReference($v[7]);
            $o->setAlternacija($getref);
        }
        if ($v[8]) {
            $getref = $this->getReference($v[8]);
            $o->setOseba($getref);
        }


        $referenca = 'TerminStoritve-' . $v[0];
        var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            ['01',"2015-06-26 10:00", "2015-06-26 10:00",null,null,2,"Dogodek-01","Alternacija-0001","Oseba-0009",],
            ['02',"2015-06-26 10:00", "2015-06-26 10:00",null,null,2,"Dogodek-01","Alternacija-0002","Oseba-0010",],
            ['03',"2015-06-26 10:00", "2015-06-26 10:00",null,null,2,"Dogodek-01","Alternacija-0003","Oseba-0003",],
            ['04',"2015-06-26 10:00", "2015-06-26 10:00",null,null,2,"Dogodek-01","Alternacija-0004","Oseba-0002",],
            ['05',"2015-06-26 10:00", "2015-06-26 10:00",null,null,2,"Dogodek-01","Alternacija-0005","Oseba-0012",],
            // dogodek brez uprizoritve:
            ['06',"2015-08-01 20:00", "2015-08-01 23:00",null,null,2,"Dogodek-03",null,"Oseba-0012",],
        ];
    }

}
