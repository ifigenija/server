<?php

namespace Koledar\Service;

use Doctrine\ORM\Query;
use Doctrine\ORM\QueryBuilder;
use Max\Service\AbstractMaxService;
use Produkcija\Entity\Uprizoritev;

class DogodekService
        extends AbstractMaxService
{

    /**
     * Shrani dogodek in pripadajoče ažurirane termine storitve
     * 
     * 
     * @param \Koledar\Entity\Dogodek $dogodek
     * @param array $terminiStoritev       termini storitev v obliki:
     *                                   [ { 'id' : 'id-ts'
     *                                      ,'planiranZacetek' : 'iso-date'
     *                                      ,'planiranKonec' : 'iso-date'
     *                                      ,'alternacija' : 'id-alternacije'
     *                                      ,'dezurni' : 'boolean'
     *                                      ,'gost' : 'boolean'
     *                                      ,'sodelujoc' : 'boolean'
     *                                      ,'oseba' : 'oseba-id'
     *                                     } ,...]
     * @return boolean
     */
    public function azurirajTSDogodka(\Koledar\Entity\Dogodek $dogodek, array $terminiStoritev = [])
    {
        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");

        $tsR    = $em->getRepository("Prisotnost\Entity\TerminStoritve");
        $altR   = $em->getRepository("Produkcija\Entity\Alternacija");
        $osebaR = $em->getRepository("App\Entity\Oseba");

        /*
         * - za vse stare ts
         *   . če ne obstaja novi TS -> DELETE stari TS 
         */
        foreach ($dogodek->getTerminiStoritve() as $oldts) {
            if (!in_array($oldts->getId(), array_column($terminiStoritev, "id"))) {
                $tsR->delete($oldts);
            }
        }

        /*
         * - za vse nove ts
         *   . če obstaja stari TS -> UPDATE novi TS če se časa starega novega razlikujeta
         *   . sicer -> CREATE novi TS
         */
        foreach ($terminiStoritev as $newts) {
            /*
             * ali TS že obstaja v dogodku
             */
            if (array_key_exists('id', $newts) &&
                    $dogodek->getTerminiStoritve()->exists(function($key, $f) use(&$newts) {
                        return ($f->getId() === $newts['id']);    // nov ts obstaja v dogodku
                    })) {
                $tsA = $dogodek->getTerminiStoritve()->filter(function($ent) use(&$newts) {
                    return ($ent->getId() === $newts['id']);    // nov ts obstaja v dogodku
                });
                $this->expect($tsA->count() == 1, "V dogodku je napačno število terminov storitev z id=" . $newts['id'], 1001260);
                $ts              = $tsA->first();
                /*
                 * če je spremennjen začetek ali konec termina storitve ga osvežimo
                 */
                $planiranZacetek = empty($newts['planiranZacetek']) ? null : date_create($newts['planiranZacetek']);     // polje mora biti v php-jevi PHP-jevem datetime  tipu
                $planiranKonec   = empty($newts['planiranKonec']) ? null : date_create($newts['planiranKonec']);     // polje mora biti v php-jevi PHP-jevem datetime  tipu

                if ($ts->getPlaniranZacetek() !== $planiranZacetek || $ts->getPlaniranKonec() !== $planiranKonec) {
                    $ts->setPlaniranZacetek($planiranZacetek);
                    $ts->setPlaniranKonec($planiranKonec);
                    $tsR->update($ts);
                }
            } else {
                /*
                 * kreiraj nov TS
                 */
                $ts = new \Prisotnost\Entity\TerminStoritve();
                $ts->setDogodek($dogodek);

                $planiranZacetek = empty($newts['planiranZacetek']) ? null : date_create($newts['planiranZacetek']);     // polje mora biti v php-jevi PHP-jevem datetime  tipu
                $ts->setPlaniranZacetek($planiranZacetek);

                $planiranKonec = empty($newts['planiranKonec']) ? null : date_create($newts['planiranKonec']);     // polje mora biti v php-jevi PHP-jevem datetime  tipu
                $ts->setPlaniranKonec($planiranKonec);

                $oseba = empty($newts['oseba']) ? null : $osebaR->findOneById($newts['oseba']['id']);
                $ts->setOseba($oseba);

                $alt = empty($newts['alternacija']) ? null : $altR->findOneById($newts['alternacija']['id']);
                $ts->setAlternacija($alt);
                $ts->setDezurni(($newts['dezurni'])? : false);
                $ts->setGost(($newts['gost'])? : FALSE);
                $ts->setSodelujoc(($newts['sodelujoc'])? : false);
                $ts->setZasedenost(false);
                $ts->setVirtZasedenost(false);
                $tsR->create($ts);
            }
        }
        return TRUE;
    }

    /**
     * 
     * @param \Koledar\Entity\Dogodek $dogodek
     * @param datetime $zacetekD                začetek novega dogodka
     * @return boolean
     */
    public function kopirajDogodek(\Koledar\Entity\Dogodek $dogodek, $zacetekD)
    {
        $this->expect(in_array($dogodek->getStatus(), [
            \Koledar\Entity\Dogodek::PLANIRAN,
            \Koledar\Entity\Dogodek::PREGLEDAN,
            \Koledar\Entity\Dogodek::POTRJEN,])
                , "Kopirati je možno planirane,pregledane ali potrjene dogodke", 1001261);
        $this->expect($dogodek->getRazred() != \Koledar\Entity\Dogodek::GOSTOVANJE
                , "Gostovanja ni možno kopirati", 1001262);
        $this->expect(!$dogodek->getNadrejenoGostovanje(), "Dogodka, ki je del gostovanja, ni možno kopirati", 1001263);

        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");

        $dogR = $em->getRepository("Koledar\Entity\Dogodek");

        $newDog = $dogodek->copy();
        $this->getEm()->persist($newDog);

        $newDog->setStatus(\Koledar\Entity\Dogodek::PLANIRAN);
        $newDog->setZacetek($zacetekD);

        /**
         * novi dogodek je enako dolg kot stari
         */
        $delta = (int) (($dogodek->getKonec()->getTimestamp() - $dogodek->getZacetek()->getTimestamp()) / 60);
        $newDog->setKonec($dogR->dodajInterval($zacetekD, $delta));

        /*
         * spraznimo array collectione
         */
        $newDog
                ->setTerminiStoritve(new \Doctrine\Common\Collections\ArrayCollection());

        /*
         * razčisti polja:
         *  sezona  - se pri update-u sama preračuna
         */
        if ($dogodek->getVaja()) {
            $newPodDog = $dogodek->getVaja()->copy();
            $this->getEm()->persist($newPodDog);

            $newPodDog->setDogodek($newDog);
            $newDog->setVaja($newPodDog);
        }
        if ($dogodek->getPredstava()) {
            $newPodDog = $dogodek->getPredstava()->copy();
            $this->getEm()->persist($newPodDog);

            /*
             *  $$ preveri polja
             * gostovanje ?? ali je potrebno spreminjati - verjetno  lahko ostane isto!
             *   abonmaji  - many to many relacij tehnično ni potrebno spreminjati
             * 
             * $$ uskladi kloniranje predstave tudi spodaj pri gostovanjih!
             */
            $newPodDog->setDogodek($newDog);
            $newDog->setPredstava($newPodDog);
        }
        if ($dogodek->getSplosni()) {
            $newPodDog = $dogodek->getSplosni()->copy();
            $this->getEm()->persist($newPodDog);
            $newPodDog->setDogodek($newDog);
            $newDog->setSplosni($newPodDog);
        }
        if ($dogodek->getTehnicni()) {
            $newPodDog = $dogodek->getTehnicni()->copy();
            $this->getEm()->persist($newPodDog);
            $newPodDog->setDogodek($newDog);
            $newDog->setTehnicni($newPodDog);
        }
        if ($dogodek->getGostovanje()) {
            $newPodDog = $dogodek->getGostovanje()->copy();
            $this->getEm()->persist($newPodDog);

            /*
             * $$ namesto predstave bodo dogodki!
             */
            $newPodDog
                    ->setPredstave(new \Doctrine\Common\Collections\ArrayCollection());
            /*
             * $$ ppreglej polja
             *  id
             *  vrsta
             *  zamejstvo
             *  kraj
             *  dogodek
             *  predstave
             *  drzava
             * $$ namesto predstave bodo dogodki !!
             */

            $coll = $dogodek->getGostovanje()->getPredstave();
            foreach ($coll as $pre) {
                $newGPred = $pre->copy();
                $this->getEm()->persist($newGPred);
                /*
                 *  $$ preveri polja
                 * gostovanje ?? ali je potrebno spreminjati - verjetno  lahko ostane isto!
                 * 
                 * $$ uskladi kloniranje predstave tudi zoraj pri dogodku
                 */
                $newGPred->setGostovanje($newPodDog);
                $newGPred->setDogodek($newPodDog);
                $newPodDog->getPredstave()->add($newGPred);
            }
            $newPodDog->setDogodek($newDog);
            $newDog->setGostovanje($newPodDog);
        }
        $coll = $dogodek->getTerminiStoritve();
        foreach ($coll as $ts) {
            $newTS = $ts->copy();
            $this->getEm()->persist($newTS);

            $newTS->setUra(null);

            $newTS->setDogodek($newDog);
            $newDog->getTerminiStoritve()->add($newTS);
        }
        $dogR->update($newDog); // da na novo preračuna termine storitve

        return $newDog->getId();
    }

}
