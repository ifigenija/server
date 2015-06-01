<?php

/*
 *  Licenca GPLv3
 */

namespace Prisotnost\Assertion;

/**
 * Assertion, ki se uporablja pri preverjanju dostopa do entitet in view-ev
 * 
 *
 * @author rado
 * 
 * @param  AuthorizationService $authorization
 * @param  Prisotnost\Entity\TerminStoritve     $terminStoritve
 * @return bool
 */
class AssertTerminStoritve
        implements \ZfcRbac\Assertion\AssertionInterface, \Zend\ServiceManager\ServiceLocatorAwareInterface
{

    use \Zend\ServiceManager\ServiceLocatorAwareTrait;

    public function assert(\ZfcRbac\Service\AuthorizationService $authorizationService, $terminStoritve = null)
    {
        if (!$terminStoritve) {
            //če je null vrne ok
            return true;
        }

        $iden = $authorizationService->getIdentity();
        $user = $iden->getEmail();
        if ($user == "admin@ifigenija.si") {          // $$ rb začasno, dokler shortCircuit ne preskoči tega assert-a
            return true;
        }

        /* $$ plan:
         * - izjema za tiste dogodke, ki nimajo uprizoritve (npr. oddaja prostora, knjženje ur za hostese, ki pomagajo 
         *   => tisti, ki ima dovoljenje TerminStoritve-vse, lahko vse zapise popravlja
         *  $$ razčisti, ali bo asociacija na alternacijo, ali le na osebe - verjetno najboljše oboje, redundantno
         * - kontrola za tehničnega vodjo select joini
         * - kontrola za inšpicienta 
         *   . ali vse alternacije  (t.j. tudi funkcija.podrocje je tehnik   (morda bi lahko dali dodatno dovoljenje  ..ure-vodjaekipetehnik
         *   . ali le tiste, kjer je funkcija.podrocje igralec ali umetnik
         * 
         */

        // npr. za vnos tistih dogodkov, ki nimajo uprizoritve , npr. za vnos ur hostes, ki le pomagajo pri prireditvi, ko smo prodali dvorano
        if ($authorizationService->isGranted("TerminStoritve-vse", $terminStoritve)) {  //ker je drug perm, se ne bi smel zaciklati
            return true;
        }

        $ret  = false;     // init
        // najprej najdemo uprizoritev od termina storitve, če le-ta obstaja
//        $uprizoritevId=""; //$$
//        termin storitve -> alternacija -> funkcija-> uprizoritev
        // $$ še manager definirati - ali naj se pošlje kot parameter funkciji?
//        $altR = $manager->getRepository('Produkcija\Entity\Alternacija');
//        $funR = $manager->getRepository('Produkcija\Entity\Funkcija');
//        $uprR = $manager->getRepository('Produkcija\Entity\Uprizoritev');
//        $oseR = $manager->getRepository('App\Entity\Oseba');
//        if (!empty($terminStoritve->getAlternacija())) {
//            $alt = $altR->findOneById($terminStoritve->getAlternacija());
//            if (!empty($alt->getFunkcija())) {
//                $fun = $funR->findOneById($alt->getFunkcija());
//                if (!empty($fun->getUprizoritev())) {
//                    $upr = $funR->findOneById($fun->getUprizoritev());
//                }
//            }
//        }

        // če smo našli uprizoritev, pogledamo še, če je vodja ekipe
        // ident -> oseba -> alternacije ->funkcija -> uprizoritev
        if (!empty($upr)) {
//            $qb = $manager->createQueryBuilder();
//
//            $qb->select('count(*)')
//            ->from('Alternacija', 'a')
//            ->join('a.Funkcija', 'f', WITH, 'a.Funkcija =f.id')
//            ->join('a.Oseba', 'o', WITH, 'o.id= a.oseba')
//            ->andWhere('f.uprizoritev = :upriz')
//            ->andWhere('f.vodjaekipe=TRUE')
//            ->expr()->in('f.podrocje',array('tehnik')) 
//            ->andWhere('o.user=:user')
//            ->setParameter('user', $iden->getId(), "string");
//            ->setParameter('upriz', $upr->getId(), "string");
//        $query=qb->getQuery();
        
        }
        



        return $ret;
    }

}
