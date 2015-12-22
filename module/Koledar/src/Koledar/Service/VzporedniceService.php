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
     * ./bin/util orm:run-dql 'update Produkcija\Entity\Funkcija f set f.alterCount = (select count(x) from Produkcija\Entity\Alternacija x where x.funkcija = f.id)'
     * ./bin/util orm:run-dql 'update Produkcija\Entity\Uprizoritev f set f.gostujoca = FALSE where f.gostujoca is null'
     */

    /**
     *
     * Vrne seznam ključev oseb, ki sodelujejo na polju uprizoritev.
     * Privzete alternacije se lahko overridajo z $alternacije
     *
     *
     * @param array <Uprizoritev> $uprizoritve
     * @param array $alternacije - seznam mora biti v obliki: ['id-funkcije' => 'id-osebe']
     * @return array
     */
    function getSodelujoci($uprizoritve, $alternacije = [])
    {

        /**
         * $alternacije mora biti v obliki:
         *  ['id-funkcije' => 'id-osebe']
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
            $r[$row['fun']] = $row['oseba'];
        }
        // dodam override in  vrnem samo osebe
        $osebe = array_unique(array_values(array_merge($r, $alternacije)));

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
        $qb = $this->getEm()->createQueryBuilder();

        $keys = [];
        foreach ($uprizoritve as $u) {
            $keys[] = $u->getId();
        }
        $u = $qb->select('o.id oseba, funkcija.id fun')
                ->from('Produkcija\Entity\Funkcija', 'funkcija')
                ->join('funkcija.uprizoritev', 'u')
                ->join('funkcija.privzeti', 'alternacija')
//                ->join('funkcija.alternacije', 'alternacija')
                ->join('alternacija.oseba', 'o')
                ->andWhere('funkcija.sePlanira = TRUE')
                ->andWhere('u.gostujoca =  FALSE ')
                ->andWhere($qb->expr()->in('funkcija.uprizoritev', $keys))
                ->getQuery()
                ->getResult();

        return $u;
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
                ->andWhere('vzp.gostujoca = FALSE')
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
                ->where($e->in('os.id', $osebe))
                ->andWhere('fk.sePlanira = TRUE')
                ->andWhere($e->in('up.faza', $this->getStatusiUprizoritev()))
                ->orderBy('up.sifra');

        return $konfliktneFunkcije;
    }

    public function getStatusiUprizoritev()
    {
        return ['produkcija', 'postprodukcija'];
    }

    /**
     * Seznam pogojno sprejemljivih funkcij na uprizoritvah
     * ki nimajo konfliktov na funkcijah, brez alternacij,
     * prekrivajo se samo na funkcijah, ki imajo alternacije - alterCount > 1
     *
     * Vrne seznam funkcij, ker je zaželjeno, da pokažemo s kom se prekriva
     *
     * @param $osebe
     * @return array
     */
    public function getPogojneUprizoritve($osebe)
    {
        /**
         * število prostih oseb v določeni funkciji
         */
        $prosteOsebe =$this->getEm()->createQueryBuilder();
        $est                             = $prosteOsebe->expr();
        $prosteOsebe
                ->select('count(fkpro)')
                ->from('Produkcija\Entity\Funkcija', 'fkpro')
                ->join('fkpro.alternacije', 'alte')
                ->join('alte.oseba', 'oseb')
                ->where('fkpro.id=fk.id')
                ->andWhere($est->notIn('oseb.id', $osebe)) // le proste oz. nezasedene osebe
        ;

        /**
         * konfliktne funkcije brez alternacij s prostimi osebami
         */
        $konfliktneFunkcijeBrezProstih = $this->getKonfliktneFunkcije($osebe);
        $e                             = $konfliktneFunkcijeBrezProstih->expr();
        $konfliktneFunkcijeBrezProstih 
                ->addSelect('('.$prosteOsebe->getDQL().') cnt')
                ->andWhere('cnt = 0');
        
        /**
         * $$ začasno
         */
        $tmpFBrezPr = $konfliktneFunkcijeBrezProstih ->getQuery()->getResult();
        
        
        
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
                ->where($e->in('ose.id', $osebe))
                ->andWhere('fn.alterCount > 1') //$$ popravi v nezasedene osebe
                ->andWhere('fn.sePlanira = TRUE')
                ->andWhere($e->notIn('uprizoritev', $konfliktneUprizoritve->getDQL()))// brez konfliktnih
                ->andWhere($e->in('uprizoritev.faza', $this->getStatusiUprizoritev()))
                ->orderBy('uprizoritev.sifra');

        /**
         * $$ začasno
         */
        $tmpKA = $konfliktneFunkcijeZAlternacijami->getQuery();



        return $konfliktneFunkcijeZAlternacijami->getQuery()->getResult();
    }

}
