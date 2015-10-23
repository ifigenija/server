<?php

namespace IfiFixture;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;

/**
 * Nalaganje Praznik
 *
 * @author rado
 */
class PraznikFixture
        extends AbstractFixture
        implements FixtureInterface
{

    public function load(ObjectManager $manager)
    {
        foreach ($this->getData() as $value) {
            var_dump($value);
            $this->populatePraznik($manager, $value);
        }

        $manager->flush();
    }

    /**
     *
     * @param \Tip\Repository\IzbirneOpcije $rep
     * @param string $object
     * @param array $vals
     */
    public function populatePraznik($manager, $v)
    {

        $rep = $manager->getRepository('Koledar\Entity\Praznik');

        $dan   = intval($v[2]);
        $mesec = intval($v[3]);
        $leto  = is_null($v[4]) ? null : intval($v[4]);
        $o     = $rep->findOneBy(["dan" => $dan, "mesec" => $mesec, "leto" => $leto]);
        $nov   = false;
        if (!$o) {
            $o   = new \Koledar\Entity\Praznik();
            $o->setDan($dan);
            $o->setMesec($mesec);
            $o->setLeto($leto);
            $nov = true;
        }
        $o->setIme($v[1]);
        $o->setDelaProst($v[5]);

        if ($nov) {
            $rep->create($o);
        } else {
            $rep->update($o);
        }
    }

    public function getData()
    {
        return [
            ['', 'novo leto',1,1, null, true,],
            ['', "Prešernov dan, slovenski kulturni praznik",8,2, null, true,],
            ['', 'dan upora proti okupatorju', 27,4, null, true,],
            ['', 'praznik dela',1,5, null, true,],
            ['', 'praznik dela',2,5, null, true,],
            ['', 'dan Primoža Trubarja', 8,6, null, false,],
            ['', 'dan državnosti', 25,        6, null, true,],
            ['', 'združitev prekmurskih Slovencev z matičnim narodom', 17,8, null, false,],
            ['', 'vrnitev Primorske k matični domovini', 15,9, null, false,],
            ['', 'dan suverenosti', 25, 10, null, false,],
            ['', 'dan spomina na mrtve',1, 11, null, true,],
            ['', 'dan Rudolfa Maistra', 23, 11, null, false,],
            ['', 'božič', 25, 12, null, true,],
            ['', 'dan samostojnosti in enotnosti', 26, 12, null, true,],
            ['', 'Marijino vnebovzetje', 15,    8, null, true,],
            ['', 'dan reformacije', 31, 10, null, true,],
            ['', 'velikonočna nedelja', 27, 3, 2016, true,],
            ['', 'velikonočna nedelja', 16, 4, 2017, true,],
            ['', 'velikonočna nedelja',1, 4, 2018, true,],
            ['', 'velikonočna nedelja', 21, 4, 2019, true,],
            ['', 'velikonočna nedelja', 12, 4, 2020, true,],
            ['', 'velikonočna nedelja', 4, 4, 2021, true,],
            ['', 'velikonočna nedelja', 17, 4, 2022, true,],
            ['', 'velikonočna nedelja', 9, 4, 2023, true,],
            ['', 'velikonočna nedelja', 31, 3, 2024, true,],
            ['', 'velikonočna nedelja', 20, 4, 2025, true,],
            ['', 'velikonočna nedelja', 5, 4, 2026, true,],
            ['', 'velikonočna nedelja', 28, 3, 2027, true,],
            ['', 'velikonočna nedelja', 16, 4, 2028, true,],
            ['', 'velikonočna nedelja', 1, 4, 2029, true,],
            ['', 'velikonočna nedelja', 21, 4, 2030, true,],
            ['', 'velikonočni ponedeljek', 28, 3, 2016, true,],
            ['', 'velikonočni ponedeljek', 17, 4, 2017, true,],
            ['', 'velikonočni ponedeljek', 2, 4, 2018, true,],
            ['', 'velikonočni ponedeljek', 22, 4, 2019, true,],
            ['', 'velikonočni ponedeljek', 13, 4, 2020, true,],
            ['', 'velikonočni ponedeljek', 5, 4, 2021, true,],
            ['', 'velikonočni ponedeljek', 18, 4, 2022, true,],
            ['', 'velikonočni ponedeljek', 10, 4, 2023, true,],
            ['', 'velikonočni ponedeljek', 1, 4, 2024, true,],
            ['', 'velikonočni ponedeljek', 21, 4, 2025, true,],
            ['', 'velikonočni ponedeljek', 6, 4, 2026, true,],
            ['', 'velikonočni ponedeljek', 29, 3, 2027, true,],
            ['', 'velikonočni ponedeljek', 17, 4, 2028, true,],
            ['', 'velikonočni ponedeljek', 2, 4, 2029, true,],
            ['', 'velikonočni ponedeljek', 22, 4, 2030, true,],
            ['', 'binkoštna nedelja - binkošti', 15,5, 2016, true,],
            ['', 'binkoštna nedelja - binkošti', 4,6, 2017, true,],
            ['', 'binkoštna nedelja - binkošti', 20,5, 2018, true,],
            ['', 'binkoštna nedelja - binkošti', 9,6, 2019, true,],
            ['', 'binkoštna nedelja - binkošti', 31,5, 2020, true,],
            ['', 'binkoštna nedelja - binkošti', 23,5, 2021, true,],
            ['', 'binkoštna nedelja - binkošti', 5,6, 2022, true,],
            ['', 'binkoštna nedelja - binkošti', 28,5, 2023, true,],
            ['', 'binkoštna nedelja - binkošti', 19,5, 2024, true,],
            ['', 'binkoštna nedelja - binkošti', 8,6, 2025, true,],
            ['', 'binkoštna nedelja - binkošti', 24,5, 2026, true,],
            ['', 'binkoštna nedelja - binkošti', 16,5, 2027, true,],
            ['', 'binkoštna nedelja - binkošti', 4,6, 2028, true,],
            ['', 'binkoštna nedelja - binkošti', 20,5, 2029, true,],
            ['', 'binkoštna nedelja - binkošti', 9,6, 2030, true,],
        ];
    }

}
