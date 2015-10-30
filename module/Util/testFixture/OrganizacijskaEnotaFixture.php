<?php

namespace TestFixture;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;

/**
 *
 * Nalaganje TipFunkcije
 * @author rado
 */
class OrganizacijskaEnota
        extends AbstractFixture
        implements FixtureInterface, DependentFixtureInterface
{

    public function load(ObjectManager $manager)
    {
        foreach ($this->getData() as $value) {
            $this->populateOrganizacijskoEnoto($manager, $value);
        }

        $manager->flush();
    }

    public function getDependencies()
    {
        return array('TestFixture\ZaposlitevFixture'); // fixture classes fixture is dependent on , 
    }

    /**
     *
     * @param \Tip\Repository\IzbirneOpcije $rep
     * @param string $object
     * @param array $vals
     */
    public function populateOrganizacijskoEnoto($manager, $v)
    {

        $rep = $manager->getRepository('App\Entity\OrganizacijskaEnota');

        $o   = $rep->findOneBySifra(trim($v[0]));
        $nov = false;
        if (!$o) {
            $o   = new \App\Entity\OrganizacijskaEnota();
            $o->setSifra(trim($v[0]));
            $nov = true;
        }
        $o->setNaziv($v[1]);
        if ($v[2]) {
            $getref = $this->getReference($v[2]);
            $o->setParent($getref);
        }

        if ($v[3]) {
            $getref = $this->getReference($v[3]);
            $o->setVodja($getref);
        }
        if ($v[4]) {
            $getref = $this->getReference($v[4]);
            $o->setNamestnik($getref);
        }
        if ($nov) {
            $rep->create($o);
        } else {
            $rep->update($o);
        }

        $referenca = 'OrganizacijskaEnota-' . $v[0];
        //var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            ["01", "Gledališče Nimbis", null, "Zaposlitev-0010", "Zaposlitev-0003"],
            ["02", "Tehnika", "OrganizacijskaEnota-01", "Zaposlitev-0010", "Zaposlitev-0003"]
//            ["03", "Šiviljstvo",        null, null, "Zaposlitev-0010", "Zaposlitev-0003", "Zaposlitev-03"],
//            ["04", "Administracija",    "OrganizacijskaEnota-01", null, "Zaposlitev-0010", "Zaposlitev-0003", "Zaposlitev-03"],
        ];
    }

}
