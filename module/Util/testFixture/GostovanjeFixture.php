<?php

namespace TestFixture;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Doctrine\Common\Collections\ArrayCollection;

/**
 *
 * @author rado
 */
class GostovanjeFixture
        extends AbstractFixture
        implements FixtureInterface, DependentFixtureInterface
{

    public function load(ObjectManager $manager)
    {
        foreach ($this->getData() as $value) {
            $this->populateGostovanje($manager, $value);
        }

        $manager->flush();
    }

    public function getDependencies()
    {
        return array('TestFixture\DogodekFixture');
    }

    /**
     *
     * @param \Tip\Repository\IzbirneOpcije $rep
     * @param string $object
     * @param array $vals
     */
    public function populateGostovanje($manager, $v)
    {

        $rep     = $manager->getRepository('Koledar\Entity\Gostovanje');
        $drzavaR = $manager->getRepository('App\Entity\Drzava');

        $o   = null;
        $nov = false;
        if (!$o) {
            $o   = new \Koledar\Entity\Gostovanje();
            $nov = true;
        }
        $date = empty($v[1]) ? null : date_create($v[1]);
        $o->setZacetek($date);

        $date = empty($v[2]) ? null : date_create($v[2]);
        $o->setKonec($date);
        $o->setTitle($v[3]);
        $o->setStatus($v[4]);
        $o->setVrsta($v[5]);

        $drzava = $drzavaR->findOneBySifra(trim($v[6]));
        $o->setDrzava($drzava);

        $o->setBarva($v[7]);

        if ($nov) {
            $rep->create($o);
        } else {
            $rep->update($o);
        }

        $referenca    = 'Gostovanje-' . $v[0];
//        var_dump($referenca);
        $this->addReference($referenca, $o);
        $referencaDog = 'DogodekGos-' . $v[0];
        $this->addReference($referencaDog, $o->getDogodek());
    }

    public function getData()
    {
        return [
            ['01', '2015-03-10T07:00:00+0100', '2015-03-20T23:00:00+0100', 'Gostovanje 1.', '200s', '', 'IS', '#001122',],
        ];
    }

}
