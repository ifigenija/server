<?php

namespace IfiFixture;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;

/**
 * Nalaganje Tipov dodatka
 *
 * @author rado
 */
class TipDodatkaFixture
        extends AbstractFixture
        implements FixtureInterface
{

    public function load(ObjectManager $manager)
    {

        foreach ($this->getData() as $value) {
            $this->populateTipDodatka($manager, $value);
        }

        $manager->flush();
    }

    /**
     * @param string $object
     * @param array $vals
     */
    public function populateTipDodatka($manager, $v)
    {

        $rep = $manager->getRepository('Prisotnost\Entity\TipDodatka');

        $o   = $rep->findOneBySifra($v[0]);
        $nov = false;
        if (!$o) {
            $o = new \Prisotnost\Entity\TipDodatka();
            $o->setSifra(trim($v[0]));
            $nov=true;
        }
        $o->setIme($v[1]);
        $o->setOpis($v[2]);
        if ($nov) {
            $rep->create($o);
        } else {
            $rep->update($o);
        }
    }

    public function getData()
    {
        return [
            ['0001', 'Višina 20%', 'Dodatek za delo na višini 2-4 m -39.člen /12.'],
            ['0002', 'Višina 30%', 'Dodatek za delo na višini 4-20 m -39.člen /12.'],
            ['0003', 'izmensko delo', 'dodatek za izmensko delo 40. člen'],
            ['0004', 'd.č. 13%', 'dodatek za delo v deljenem delovnem času - 41. člen'],
            ['0005', 'd.č. 10%', 'dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu'],
            ['0006', 'd.č. 20%', 'dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu'],
        ];
    }

}
