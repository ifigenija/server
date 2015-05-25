<?php

namespace IfiFixture;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;

/**
 *
 * Nalaganje TipFunkcije
 * @author rado
 */
class OsebaFixture
        extends AbstractFixture
        implements FixtureInterface
{

    public function load(ObjectManager $manager)
    {
        foreach ($this->getData() as $value) {
            $this->populateOseba($manager, $value);
        }

        $manager->flush();
    }

    /**
     *
     * @param \Tip\Repository\IzbirneOpcije $rep
     * @param string $object
     * @param array $vals
     */
    public function populateOseba($manager, $v)
    {

        $rep = $manager->getRepository('App\Entity\Oseba');

        $o = $rep->findOneByEmso(trim($v[9]));
        if (!$o) {
            $o = new \App\Entity\Oseba();
            $o->setIme(trim($v[9]));
            $manager->persist($o);
        }
        $o->setNaziv($v[0]);
        $o->setIme($v[1]);
        $o->setPriimek($v[2]);
        $o->setFunkcija($v[3]);
        $o->setSrednjeIme($v[4]);
        $o->setPsevdonim($v[5]);
        $o->setEmail($v[6]);
        
        $date=empty($v[7]) ? null : date_create($v[7]);     // polje mora biti v php-jevi PHP-jevem datetime  tipu
        $o->setDatumRojstva($date);
        $o->setDavcna($v[8]);
        $o->setSpol($v[10]);
        $o->setOpombe($v[11]);
        $o->setDrzavljanstvo($v[12]);
        $o->setDrzavaRojstva($v[13]);
        $o->setKrajRojstva($v[14]);
//        $o->setUser($v[15]);
    }

    public function getData()
    {
        return [
            ['g.', 'Janez', 'Novak', 'a', 'Peter', 'Jani', 'jani.novak@xxx.xx', '1958-01-06', '0601958000000', '123456789', 'M', 'Jani Janez', 'Slovenija', 'Slovenija', 'Ljubljana', null,],
            ['dr.', 'Anton', 'Horvat', 'b', '', '', 'anton.horvat@xxx.xx', '1968-02-12', '1202968111111', '234567890', 'M', '', 'Slovenija', 'Slovenija', 'Maribor', null,],
            ['', 'Ivan', 'Kovačič', 'c', '', '', 'ivan.kovacic@xxx.xx', '1975-03-26', '2603976222222', '345678901', 'M', '', 'Slovenija', 'Slovenija', 'Celje', null,],
            ['prof.', 'Jožef', 'Krajnc', 'd', '', 'Joža', 'jozef.krajnc@xxx.xx', '1971-04-30', '3004971333333', '456789012', 'M', '', 'Slovenija', 'Slovenija', 'Kranj', null,],
            ['', 'Marko', 'Zupančič', 'e', '', '', 'marko.zupancic@xxx.xx', '1984-05-07', '0705984444444', '567890123', 'M', '', 'Slovenija', 'Slovenija', 'Koper', null,],
            ['ga.', 'Marija', 'Kovač', 'f', '', '', 'marija.kovac@xxx.xx', '1962-06-19', '1906962444444', '678901234', 'Z', '', 'Slovenija', 'Slovenija', 'Murska Sobota', null,],
            ['ga.', 'Ana', 'Potočnik', 'g', '', '', 'ana.potocnik@xxx.xx', '1975-07-24', '2407975555555', '789012345', 'Z', '', 'Slovenija', 'Slovenija', 'Novo Mesto', null,],
            ['ga.', 'Maja', 'Mlakar', 'h', '', '', 'maja.mlakar@xxx.xx', '1986-08-02', '0208986666666', '890123456', 'Z', '', 'Slovenija', 'Slovenija', 'Nova Gorica', null,],
            ['', 'Irena', 'Kos', 'i', '', '', 'irena.kos@xxx.xx', '1967-09-14', '1409967777777', '901234567', 'Z', '', 'Slovenija', 'Slovenija', 'Ptuj', null,],
            ['', 'Mojca', 'Vidmar', 'J', '', '', 'mojca.vidmar@xxx.xx', '1967-09-14', '1409967777777', '901234567', 'Z', '', 'Slovenija', 'Slovenija', 'Idrija', null,],
        ];
    }

}
