<?php

namespace IfiFixture;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;

/**
 * @author rado
 */
class VrstaStroskaFixture
        extends AbstractFixture
        implements FixtureInterface
{

    public function load(ObjectManager $manager)
    {

        foreach ($this->getData() as $value) {
            $this->populateVrstaStroska($manager, $value);
        }

        $manager->flush();
    }

    public function populateVrstaStroska($manager, $v)
    {
        $rep = $manager->getRepository('Produkcija\Entity\VrstaStroska');

        $skupina    = intval($v[0]);
        $podskupina = intval($v[1]);
        $nov        = false;
        $o          = $rep->findOneBy(["skupina" => $skupina, "podskupina" => $podskupina]);
        $nov        = false;
        if (!$o) {
            $o   = new \Produkcija\Entity\VrstaStroska();
            $o->setLeto($leto);
            $o->setSkupina($skupina);
            $o->setPodskupina($podskupina);
            $nov = true;
        }
        $o->setNaziv($v[2]);
        $o->setOpis($v[3]);

        if ($nov) {
            $rep->create($o);
        } else {
            $rep->update($o);
        }
    }

    public function getData()
    {
        return [
            [1, 0, "PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE", "PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE",],
            [1, 1, "Storitve varovanja zgradb in prostorov", "storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)",],
            [1, 2, "Založniške in tiskarske storitve", "založniške in tiskarske storitve",],
            [1, 3, "Časopisi, revije, knjige in strokovna literatura", "časopisi, revije, knjige in strokovna literatura",],
            [1, 4, "Stroški prevajalskih storitev", "stroški prevajalskih storitev",],
            [1, 5, "Stroški oglaševalskih storitev", "stroški oglaševalskih storitev",],
            [1, 6, "Izdatki za reprezentanco", "izdatki za reprezentanco",],
            [2, 0, "POSEBNI MATERIAL IN STORITVE", "POSEBNI MATERIAL IN STORITVE",],
            [2, 1, "Drugi posebni material in storitve", "drugi posebni material in storitve (npr. za instrumete - navedite)",],
            [2, 2, "Oprema predstave – stroški rekvizitov", "Oprema predstave – stroški rekvizitov",],
            [2, 3, "Oprema predstave – stroški kostumov", "Oprema predstave – stroški kostumov",],
            [2, 4, "Oprema predstave – stroški scenske opreme", "Oprema predstave – stroški scenske opreme",],
            [2, 5, "Oprema predstave – stroški avdio in video opreme", "Oprema predstave – stroški avdio in video opreme",],
            [3, 0, "ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE", "ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE",],
            [3, 1, "Poštnina in kurirske storitve", "poštnina in kurirske storitve",],
            [4, 0, "PREVOZNI STROŠKI IN STORITVE", "PREVOZNI STROŠKI IN STORITVE",],
            [4, 1, "Goriva in maziva za prevozna sredstva", "goriva in maziva za prevozna sredstva",],
            [4, 2, "Najem vozil in selitveni stroški", "najem vozil in selitveni stroški",],
            [4, 3, "Drugi prevozni in transportni stroški ", "drugi prevozni in transportni stroški (navedite)",],
            [5, 0, "IZDATKI ZA SLUŽBENA POTOVANJA", "IZDATKI ZA SLUŽBENA POTOVANJA",],
            [5, 1, "Dnevnice za službena potovanja v državi in tujini", "dnevnice za službena potovanja v državi in tujini",],
            [5, 2, "Hotelske in restavra. storitve v državi in tujini", "hotelske in restavra. storitve v državi in tujini",],
            [5, 3, "Stroški prevoza v državi in tujini", "stroški prevoza v državi in tujini",],
            [5, 4, "Drugi izdatki za službena potovanja", "drugi izdatki za službena potovanja (navedite)",],
            [6, 0, "NAJEMNINE IN ZAKUPNINE", "NAJEMNINE IN ZAKUPNINE",],
            [6, 1, "Druge najemnine, zakupnine in licenčnine", "druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)",],
            [7, 0, "DRUGI OPERATIVNI ODHODKI", "DRUGI OPERATIVNI ODHODKI",],
            [7, 1, "Izdatki za strok. izobraževanje zap.", "izdatki za strok. izobraževanje zap.(vezani na program. enote)  ",],
        ];
    }

}
