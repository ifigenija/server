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
class TipPopaFixture
        extends AbstractFixture
        implements FixtureInterface
{

    public function load(ObjectManager $manager)
    {

        foreach ($this->getData() as $value) {
            $this->populateTipPopa($manager, $value);
        }

        $manager->flush();
    }

    /**
     *
     * @param string $object
     * @param array $vals
     */
    public function populateTipPopa($manager, $v)
    {

        $tippopaR = $manager->getRepository('App\Entity\TipPopa');

        $o   = $tippopaR->findByIme($v[1]);
        $nov = false;
        if (!$o) {
            $o = new \App\Entity\TipPopa();
            $nov=true;
        }
        $o->setIme($v[1]);
        $o->setOpis($v[2]);
        $o->setSort($v[3]);
        if ($nov) {
            $tippopaR->create($o);
        } else {
            $tippopaR->update($o);
        }

        $referenca = 'TipPopa-' . $v[0];
        var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            ['01', 'šola', 'osnovna ali srednja šola', 1],
            ['02', 'gledalec', 'gledalec, ki ima abonma ali podobno', 2],
            ['03', 'sponzor', 'sponzor dogodkov', 3],
        ];
    }

}
