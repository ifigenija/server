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

        $o   = $tippopaR->findOneBySifra($v[0]);
        $nov = false;
        if (!$o) {
            $o = new \App\Entity\TipPopa();
            $o->setSifra(trim($v[0]));
            $nov=true;
        }
        $o->setIme($v[1]);
        $o->setOpis($v[2]);
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
            ['0001', 'šola', 'osnovna ali srednja šola'],
            ['0002', 'gledalec', 'gledalec, ki ima abonma ali podobno'],
            ['0003', 'sponzor', 'sponzor dogodkov'],
        ];
    }

}
