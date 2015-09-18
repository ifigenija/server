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
class OsebaFixture
        extends AbstractFixture
        implements FixtureInterface, DependentFixtureInterface
{

    public function load(ObjectManager $manager)
    {
        foreach ($this->getData() as $value) {
            $this->populateOseba($manager, $value);
        }

        $manager->flush();
    }

    public function getDependencies()
    {
        return array('TestFixture\UserTestFixture'); // fixture classes fixture is dependent on , 
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

        $o = $rep->findOneBySifra(trim($v[0]));
        if (!$o) {
            $o = new \App\Entity\Oseba();
            $o->setSifra(trim($v[0]));
            $manager->persist($o);
        }
        $o->setNaziv($v[1]);
        $o->setIme($v[2]);
        $o->setPriimek($v[3]);
        $o->setFunkcija($v[4]);
        $o->setSrednjeIme($v[5]);
        $o->setPolnoIme(sprintf('%s %s %s', $v[2], $v[5], $v[3]));
        $o->setPsevdonim($v[6]);
        $o->setEmail($v[7]);

        $date = empty($v[8]) ? null : date_create($v[8]);     // polje mora biti v php-jevi PHP-jevem datetime  tipu
        $o->setDatumRojstva($date);
        $o->setEmso($v[9]);
        $o->setDavcna($v[10]);
        $o->setSpol($v[11]);
        $o->setOpombe($v[12]);
        $o->setDrzavljanstvo($v[13]);
        $o->setDrzavaRojstva($v[14]);
        $o->setKrajRojstva($v[15]);
        if ($v[16]) {
            // $$ še ni implementirano
            $getref = $this->getReference($v[16]);
            $o->setUser($getref);
        }

        $referenca = 'Oseba-' . $v[0];
        var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            ['0001', 'g.', 'Janez', 'Novak', 'a', 'Peter', 'Jani', 'jani.novak@xxx.xx', '1958-01-06', '0601958000000', '123456789', 'M', 'Jani Janez', 'Slovenija', 'Slovenija', 'Ljubljana', null,],
            ['0002', 'dr.', 'Anton', 'Horvat', 'b', '', 'Tona', 'anton.horvat@xxx.xx', '1968-02-12', '1202968111111', '234567890', 'M', '', 'Slovenija', 'Slovenija', 'Maribor', 'User-tona@ifigenija.si',],
            ['0003', '', 'Ivan', 'Kovačič', 'c', '', 'Ivo', 'ivan.kovacic@xxx.xx', '1975-03-26', '2603976222222', '345678901', 'M', '', 'Slovenija', 'Slovenija', 'Celje', 'User-ivo@ifigenija.si',],
            ['0004', 'prof.', 'Jožef', 'Krajnc', 'd', '', 'Joža', 'jozef.krajnc@xxx.xx', '1971-04-30', '3004971333333', '456789012', 'M', '', 'Slovenija', 'Slovenija', 'Kranj', 'User-joze@ifigenija.si',],
            ['0005', '', 'Marko', 'Zupančič', 'e', '', '', 'marko.zupancic@xxx.xx', '1984-05-07', '0705984444444', '567890123', 'M', '', 'Slovenija', 'Slovenija', 'Koper', null,],
            ['0006', 'ga.', 'Marija', 'Kovač', 'f', '', '', 'marija.kovac@xxx.xx', '1962-06-19', '1906962444444', '678901234', 'Z', '', 'Slovenija', 'Slovenija', 'Murska Sobota', null,],
            ['0007', 'ga.', 'Ana', 'Potočnik', 'g', '', '', 'ana.potocnik@xxx.xx', '1975-07-24', '2407975555555', '789012345', 'Z', '', 'Slovenija', 'Slovenija', 'Novo Mesto', null,],
            ['0008', 'ga.', 'Maja', 'Mlakar', 'h', '', '', 'maja.mlakar@xxx.xx', '1986-08-02', '0208986666666', '890123456', 'Z', '', 'Slovenija', 'Slovenija', 'Nova Gorica', null,],
            ['0009', '', 'Irena', 'Kos', 'i', '', '', 'irena.kos@xxx.xx', '1967-09-14', '1409967777777', '901234567', 'Z', '', 'Slovenija', 'Slovenija', 'Ptuj', 'User-irena@ifigenija.si',],
            ['0010', '', 'Mojca', 'Vidmar', 'J', '', '', 'mojca.vidmar@xxx.xx', '1967-09-14', '1409967777777', '901234567', 'Z', '', 'Slovenija', 'Slovenija', 'Idrija', null,],
            ['0011', '', 'xx', 'write protected12345', "a", '', '', 'xx@xxx.xx', null, null, null, 'Z', '', null, NULL, NULL, null,],
            ['0012', '', 'Luka', 'Golob', 'luč', 'a', '', 'luka.golob@xxx.xx', null, null, null, 'M', '', null, NULL, NULL, null,],
            ['0013', '', 'Tatjana', 'Božič', 'tajnica', 'a', '', 'tatjana.bozic@xxx.xx', null, null, null, 'Z', '', null, NULL, NULL, 'User-tatjana@ifigenija.si',],
            ['0014', '', 'William', 'Shakespeare', 'avtor', '', '', null, null, null, null, 'M', '', null, NULL, NULL, null,],
            ['0015', '', 'Nebojša', 'Kavader', 'avtor', '', '', null, null, null, null, 'M', '', null, NULL, NULL, null,],
            ['0016', '', 'Fjodor', 'Dostojevski', 'avtor', 'Mihajlovič', '', null, null, null, null, 'M', '', null, NULL, NULL, null,],
            ['0017', '', 'Berta ', 'Hočevar', 'avtorica', '', '', null, null, null, null, 'Z', '', null, NULL, NULL, null,],
            ['0018', '', 'Katarina', 'Podbevšek', 'lektorica', '', '', null, null, null, null, 'Z', '', null, NULL, NULL, null,],
        ];
    }

}
