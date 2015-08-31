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
class DogodekFixture
        extends AbstractFixture
        implements FixtureInterface, DependentFixtureInterface
{

    public function load(ObjectManager $manager)
    {
        foreach ($this->getData() as $value) {
            $this->populateDogodek($manager, $value);
        }

        $manager->flush();
    }

    // $$ morda bo še potrebno implementirati funkcijo getOrder()

    public function getDependencies()
    {
        return array('TestFixture\VajaFixture'); // fixture classes fixture is dependent on , 
    }

    /**
     *
     * @param \Tip\Repository\IzbirneOpcije $rep
     * @param string $object
     * @param array $vals
     */
    public function populateDogodek($manager, $v)
    {

        $rep = $manager->getRepository('Koledar\Entity\Dogodek');

        $o = new \Koledar\Entity\Dogodek();

        $date = empty($v[1]) ? null : date_create($v[1]);     // polje mora biti v php-jevi PHP-jevem datetime  tipu
        $o->setPlaniranZacetek($date);
        $date = empty($v[2]) ? null : date_create($v[2]);     // polje mora biti v php-jevi PHP-jevem datetime  tipu
        $o->setZacetek($date);
        $date = empty($v[3]) ? null : date_create($v[3]);     // polje mora biti v php-jevi PHP-jevem datetime  tipu
        $o->setKonec($date);

        $o->setStatus($v[4]);
        $o->setRazred($v[5]);
        $o->setTermin($v[6]);
        $o->setTitle($v[7]);

        if ($v[8]) {
            $getref = $this->getReference($v[8]);
            $o->setPredstava($getref);
        }
        if ($v[9]) {
            $getref = $this->getReference($v[9]);
            $o->setZasedenost($getref);
        }
        if ($v[10]) {
            $getref = $this->getReference($v[10]);
            $o->setVaja($getref);
        }
        if ($v[11]) {
            $getref = $this->getReference($v[11]);
            $o->setGostovanje($getref);
        }
        if ($v[12]) {
            $getref = $this->getReference($v[12]);
            $o->setDogodekIzven($getref);
        }
        if ($v[13]) {
            $getref = $this->getReference($v[13]);
            $o->setProstor($getref);
        }
        if ($v[14]) {
            $getref = $this->getReference($v[14]);
            $o->setSezona($getref);
        }

        $manager->persist($o);

        $referenca = 'Dogodek-' . $v[0];
        var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            ['01', "2015-06-26 10:00", "2015-06-26 10:00", "2015-06-26 12:00", 3, "", "", "", NULL, NULL, 'Vaja-01', NULL, NULL, NULL, NULL,],
            ['02', "2015-06-27 10:00", "2015-06-27 10:00", "2015-06-27 12:00", 4, "", "", "", NULL, NULL, 'Vaja-02', NULL, NULL, NULL, NULL,],
            // oddaja prostora, ni vezano na uprizoritev
            ['03', "2015-08-01 20:00", "2015-08-01 20:00", "2015-08-01 23:00", 5, "", "", "", NULL, NULL, null, NULL, NULL, NULL, NULL,],
            // status  še ni odobren (zaenkrat <7) $$
            ['04', "2015-08-01 20:00", "2015-08-01 20:00", "2015-08-01 23:00", 2, "", "", "", NULL, NULL, null, NULL, NULL, NULL, NULL,],
            // status odobren (zaenkrat >=7) $$
            ['05', "2015-08-01 20:00", "2015-08-01 20:00", "2015-08-01 23:00", 7, "", "", "", NULL, NULL, null, NULL, NULL, NULL, NULL,],
        ];
    }

}
