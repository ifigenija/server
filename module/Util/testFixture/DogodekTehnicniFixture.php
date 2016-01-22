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
class DogodekTehnicniFixture
        extends AbstractFixture
        implements FixtureInterface, DependentFixtureInterface
{

    public function load(ObjectManager $manager)
    {
        foreach ($this->getData() as $value) {
            $this->populateDogodekTehnicni($manager, $value);
        }

        $manager->flush();
    }

    public function getDependencies()
    {
        return array('TestFixture\ProstorFixture', 'TestFixture\OsebaFixture', 'TestFixture\SezonaFixture');
    }

    /**
     * 
     * @param type $manager
     * @param type $v
     */
    public function populateDogodekTehnicni($manager, $v)
    {

        $rep = $manager->getRepository('Koledar\Entity\DogodekTehnicni');

        $o   = null;
        $nov = false;
        if (!$o) {
            $o   = new \Koledar\Entity\DogodekTehnicni();
            $nov = true;
        }
        $o->setTitle($v[1]);
        $o->setStatus($v[2]);

        $date = empty($v[3]) ? null : date_create($v[3]);
        $o->setZacetek($date);

        $date = empty($v[4]) ? null : date_create($v[4]);
        $o->setKonec($date);

        $ref = $v[5] ? $this->getReference($v[5]) : null;
        $o->setProstor($ref);

        $ref = $v[6] ? $this->getReference($v[6]) : null;
//        $o->setSezona($ref);

        if ($nov) {
            $rep->create($o);
        } else {
            $rep->update($o);
        }

        $referenca    = 'DogodekTehnicni-' . $v[0];
//        var_dump($referenca);
        $this->addReference($referenca, $o);
        $referencaDog = 'DogodekTeh-' . $v[0];
        $this->addReference($referencaDog, $o->getDogodek());
    }

    public function getData()
    {
        return [
            ['01', 'DogodekTehnicni 1', '200s', '2012-04-01T17:00:00+0200', '2012-04-01T17:00:00+0200', 'Prostor-0001', null],
            ['02', 'DogodekTehnicni 2', '600s', '2012-04-02T17:00:00+0200', '2012-05-02T17:00:00+0200', 'Prostor-0002', null],
        ];
    }

}
