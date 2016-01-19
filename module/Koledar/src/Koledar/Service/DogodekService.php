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
     * @return type
     */

    /**
     * 
     * @param array $terminiStoritev
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

}
