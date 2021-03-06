<?php

/**
 * Servis, ki računa vzporednice in prekrivanja
 *
 * User: boris
 * Date: 12. 12. 15
 * Time: 17:42
 */

namespace Koledar\Service;

use Doctrine\ORM\Query;
use Doctrine\ORM\QueryBuilder;
use Max\Service\AbstractMaxService;
use Produkcija\Entity\Uprizoritev;

class VzporedniceService
        extends AbstractMaxService
{

    /**
     *
     * Vrne seznam ključev oseb, ki sodelujejo na polju uprizoritev 
     * in v VSEH terminih storitve  med začetkom in koncem 
     * Privzete alternacije se lahko overridajo z $alternacije
     *
     *
     * @param array <Uprizoritev> $uprizoritve
     * @param array $alternacije - seznam mora biti v obliki: [ ['id-funkcije1'=> ['id-osebe1', 'id-osebe2, ...], ...]
     * @param type $zacetekD         čas začetka
     * @param type $konecD           čas konca
     * @return array
     */
    function getSodelujoci($uprizoritve, $alternacije = [], $zacetekD = null, $konecD = null)
    {
        /*
         * najdi osebe iz  uprizoritev in alternacij
         */

        /*
         * $alternacije mora biti v obliki:
         *  [ ['id-funkcije1'=> ['id-osebe1', 'id-osebe2, ...], ...]
         * v tem primeru se defaultne alternacije prepišejo s podanimi in se zračunajo vzporednice za
         * takšno zasedbo. Na ta način ni potrebno spreminjati defaulta na alternaciji, pa še vedno
         * pridemo do pravih vzporednic.
         *
         */
        $u = $this->getPrivzeteAlternacije($uprizoritve);

        // obrnem rezultat v fun=> oseba
        $r = [];
        foreach ($u as $row) {

            /**
             * pričakujemo, da ima ena funkcija le 1 osebo
             */
            $r[$row['fun']] = [$row['oseba']];
        }

        $altFO = [];
        foreach ($alternacije as $a) {
            foreach ($a as $key => $val) {
                $altFO[$key] = $val;
            }
        }

        // funkcija se override-a, če obstaja alternacija za njo
        $osebeU = [];
        foreach (array_merge($r, $altFO) as $t) {
            foreach ($t as $p) {
                $osebeU[] = $p;
            }
        }

        /*
         * najdi osebe iz terminov storitev med začetkom in koncem
         */
        $osebeTS = [];
        if (!empty($zacetekD) && !empty($konecD)) {
            $tsqb = $this->getEm()->createQueryBuilder();
            $e    = $tsqb->expr();
            $tsqb->select('os.id')
                    ->from('Prisotnost\Entity\TerminStoritve', 'ts')
                    ->join('ts.oseba', 'os')
                    ->setParameter('zac', $zacetekD, "datetime")
                    ->setParameter('kon', $konecD, "datetime");

            $zac = $e->andX($e->lte('ts.planiranZacetek', ':zac')
                    , $e->gte('ts.planiranKonec', ':zac'));
            $kon = $e->andX($e->lte('ts.planiranZacetek', ':kon')
                    , $e->gte('ts.planiranKonec', ':kon'));
            $cas = $e->orX($zac, $kon);
            $tsqb->andWhere($cas);

            $tsA     = $tsqb->getQuery()
                    ->getResult();
            $osebeTS = array_column($tsA, 'id');
        }

        $osebe = array_merge($osebeU, $osebeTS);     // še poenostavi
        $osebe = array_unique($osebe);

        return $osebe;
    }

    /**
     * Privzete alternacije za polje/collection uprizoritev
     * rezultat je v obliki [['funkcija' => 'id', 'oseba' => 'id]]
     * @param $uprizoritve
     * @return array
     */
    public function getPrivzeteAlternacije($uprizoritve)
    {
        /**
         * če ni uprizoritev tudi ni privzetih alternacij
         */
        if (count($uprizoritve) == 0) {
            return [];
        }

        $qb = $this->getEm()->createQueryBuilder();

        $keys = [];
        foreach ($uprizoritve as $u) {
            $keys[] = $u->getId();
        }
        $fo = $qb->select('o.id oseba, funkcija.id fun')
                ->from('Produkcija\Entity\Funkcija', 'funkcija')
                ->join('funkcija.uprizoritev', 'u')
                ->join('funkcija.privzeti', 'alternacija')
//                ->join('funkcija.alternacije', 'alternacija')
                ->join('alternacija.oseba', 'o')
                ->andWhere('funkcija.sePlanira = TRUE')
                ->andWhere('u.gostujoca =  FALSE or u.gostujoca is NULL')
                ->andWhere($qb->expr()->in('funkcija.uprizoritev', $keys))
                ->getQuery()
                ->getResult();

        return $fo;
    }

    /**
     *
     * Seznam možnih uprizoritev, če upoštevamo, da so $osebe že zasedene
     *
     * @param array $osebe seznam ključev oseb
     * @return array
     */
    public function getMozneUprizoritve($osebe)
    {

        $konfliktneFunkcije = $this->getKonfliktneFunkcije($osebe);

        $konfliktneUprizoritve = $this->getEm()->createQueryBuilder();
        $e                     = $konfliktneUprizoritve->expr();
        $konfliktneUprizoritve->select('u.id')
                ->from('Produkcija\Entity\Uprizoritev', 'u')
                ->join('u.funkcije', 'f')
                ->where($e->in('f.id', $konfliktneFunkcije->getDql()));

        $vzporednice = $this->getEm()->createQueryBuilder();
        $e           = $vzporednice->expr();

        $vzporednice->select('vzp')
                ->from('Produkcija\Entity\Uprizoritev', 'vzp')
                ->where($e->in('vzp.faza', $this->getStatusiUprizoritev()))
                ->andWhere('vzp.gostujoca = FALSE OR vzp.gostujoca is NULL')
                ->andWhere($e->notIn('vzp.id', $konfliktneUprizoritve->getDQL()));
        return $vzporednice->getQuery()->getResult();
    }

    /**
     * Vrne query za konfliktne funkcije za seznam oseb
     * @param array|QueryBuilder $osebe
     * @return QueryBuilder
     */
    public function getKonfliktneFunkcije($osebe)
    {

        if ($osebe instanceof QueryBuilder) {
            $osebe = $osebe->getDQL();
        }
        $konfliktneFunkcije = $this->getEm()->createQueryBuilder();
        $e                  = $konfliktneFunkcije->expr();
        $konfliktneFunkcije->select('fk')
                ->from('Produkcija\Entity\Funkcija', 'fk')
                ->join('fk.alternacije', 'al')
                ->join('al.oseba', 'os')
                ->join('fk.uprizoritev', 'up')
                ->andWhere('fk.sePlanira = TRUE')
                ->andWhere($e->in('up.faza', $this->getStatusiUprizoritev()))
                ->orderBy('up.sifra')
        ;
        if (count($osebe) > 0) {
            $konfliktneFunkcije
                    ->andWhere($e->in('os.id', $osebe));
        } else {
            $konfliktneFunkcije
                    ->andWhere('1=0');
        }

        return $konfliktneFunkcije;
    }

    public function getStatusiUprizoritev()
    {
        return ['produkcija', 'postprodukcija'];
    }

    /**
     * Seznam seznam konfliktnih funkcij na pogojno sprejemljivih  (oz. nesprejemljivih) 
     * uprizoritvah
     *
     * Vrne seznam (brezpogojno in pogojno) konflitnih funkcij 
     * 
     * @param type $osebe
     * @param boolean $vrniKonfliktne  če true, vrne funkcije le brezpogojno 
     *                                          konfliktnih uprizoritev
     *                                 če false, vrne  funkcije le pogojno 
     *                                          konfliktnih uprizoritev
     * @return type
     */
    public function getPogojneUprizoritve($osebe, $vrniKonfliktne = false)
    {
        /**
         * število prostih oseb v določeni funkciji
         */
        $stProstihOseb = $this->getEm()->createQueryBuilder();
        $est           = $stProstihOseb->expr();
        $stProstihOseb
                ->select('count(fkpro)')
                ->from('Produkcija\Entity\Funkcija', 'fkpro')
                ->join('fkpro.alternacije', 'alte')
                ->join('alte.oseba', 'oseb')
                ->where('fkpro.id=fk.id')
        ;
        if (count($osebe) > 0) {
            $stProstihOseb
                    ->andWhere($est->notIn('oseb.id', $osebe)); // le proste oz. nezasedene osebe
        }

        /**
         * konfliktne funkcije brez alternacij s prostimi osebami
         */
        $konfliktneFunkcijeBrezProstih = $this->getKonfliktneFunkcije($osebe);
        $e                             = $konfliktneFunkcijeBrezProstih->expr();
        $konfliktneFunkcijeBrezProstih
                ->andWhere($e->eq("(" . $stProstihOseb->getDQL() . ")", 0));

        $konfliktneUprizoritve = $this->getEm()->createQueryBuilder();
        $e                     = $konfliktneUprizoritve->expr();
        $konfliktneUprizoritve->select('u')
                ->from('Produkcija\Entity\Uprizoritev', 'u')
                ->join('u.funkcije', 'f')
                ->where($e->in('u.faza', $this->getStatusiUprizoritev()))
                ->andWhere($e->in('f', $konfliktneFunkcijeBrezProstih->getDql()));

        $konfliktneFunkcijeZAlternacijami = $this->getEm()->createQueryBuilder();
        $e                                = $konfliktneFunkcijeZAlternacijami->expr();
        $konfliktneFunkcijeZAlternacijami->select('fn')
                ->from('Produkcija\Entity\Funkcija', 'fn')
                ->join('fn.alternacije', 'alt')
                ->join('alt.oseba', 'ose')
                ->join('fn.uprizoritev', 'uprizoritev')
                ->andWhere('fn.sePlanira = TRUE')
                ->andWhere($e->in('uprizoritev.faza', $this->getStatusiUprizoritev()))
                ->orderBy('uprizoritev.sifra');

        if ($vrniKonfliktne) {
            $konfliktneFunkcijeZAlternacijami
                    ->andWhere($e->in('uprizoritev', $konfliktneUprizoritve->getDQL())); // le konfliktne
        } else {
            $konfliktneFunkcijeZAlternacijami
                    ->andWhere($e->notIn('uprizoritev', $konfliktneUprizoritve->getDQL())); // brez konfliktnih
        }
        if (count($osebe) > 0) {
            $konfliktneFunkcijeZAlternacijami->andWhere($e->in('ose.id', $osebe));
        } else {
            $konfliktneFunkcijeZAlternacijami->andWhere('1=0'); // false
        }


        return $konfliktneFunkcijeZAlternacijami->getQuery()->getResult();
    }

    /**
     * Poišče med alternacijami, če je katera oseba prisotna v različnih uprizoritvah
     * 
     * @param array $alternacije - seznam mora biti v obliki: [ 'id-funkcije1 => ['id-osebe1', 'id-osebe2, ...], ...]
     * @return array                   v obliki [ ['id-osebe1', ['id-uprizoritve1', 'id-uprizoritve2'],...]
     */
    function getKonfliktOsebaUpriz($alternacije)
    {
        $funR = $this->getEm()->getRepository('Produkcija\Entity\Funkcija');

        $ou = [];
        foreach ($alternacije as $a) {
            foreach ($a as $key => $val) {
                $fun = $funR->findOneById($key);
                foreach ($val as $o) {
                    $ou[] = [$o, $fun->getUprizoritev()->getId()];
                }
            }
        }

        /**
         * sort polja po osebi, uprizoritvi
         */
        uasort($ou, function($a, $b) {
            return ($a[0] < $b[0]) ? -1 : (($a[0] > $b[0]) ? 1 : ( ($a[1] < $b[1]) ? -1 : 1));
        });

        $konflikti = [];
        $osPrej    = $upPrej    = "";   //init
        foreach ($ou as $osUp) {
            if ($osUp[0] === $osPrej && $osUp[1] !== $upPrej) {
                $konflikti[$osUp[0]][] = $upPrej;
                $konflikti[$osUp[0]][] = $osUp[1];
            }
            $osPrej = $osUp[0];
            $upPrej = $osUp[1];
        }

        /**
         * odstranim duplicirane uprizoritve
         */
        return array_map(function($val) {
            return array_values(array_unique($val));
        }, $konflikti);
    }

}
