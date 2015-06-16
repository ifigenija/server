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
 * @return boolean
 */
class AssertTerminStoritve
        extends \Max\Assertion\AssertBase
        implements \ZfcRbac\Assertion\AssertionInterface, \Zend\ServiceManager\ServiceLocatorAwareInterface
{

    /**
     * 
     * @param \ZfcRbac\Service\AuthorizationService $authorizationService
     * @param Prisotnost\Entity\TerminStoritve      $terminStoritve
     * @return boolean
     */
    public function assert(\ZfcRbac\Service\AuthorizationService $authorizationService, $terminStoritve = null)
    {
        if (parent::assert($authorizationService, $terminStoritve)) {
            return true;
        }

        $iden = $authorizationService->getIdentity();
        $user = $iden->getEmail();

        /* $$ plan:
         * - izjema za tiste dogodke, ki nimajo uprizoritve (npr. oddaja prostora, knjženje ur za hostese, ki pomagajo 
         *   => tisti, ki ima dovoljenje 
         * TerminStoritve-vse, lahko vse zapise popravlja
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
        $em   = $this->getServiceLocator()->getServiceLocator()->get('doctrine.entitymanager.orm_default');
        // najprej najdemo uprizoritev od termina storitve, če le-ta obstaja
//        $uprizoritevId=""; //$$
//        termin storitve -> alternacija -> funkcija-> uprizoritev
        // $$ še manager definirati - ali naj se pošlje kot parameter funkciji?
        $altR = $em->getRepository('Produkcija\Entity\Alternacija');
        $funR = $em->getRepository('Produkcija\Entity\Funkcija');
        $uprR = $em->getRepository('Produkcija\Entity\Uprizoritev');
        $oseR = $em->getRepository('App\Entity\Oseba');
        if (!empty($terminStoritve->getAlternacija())) {
            $alt = $altR->findOneById($terminStoritve->getAlternacija());
            if (!empty($alt->getFunkcija())) {
                $fun       = $funR->findOneById($alt->getFunkcija());
                $fpodrocje = $fun->getPodrocje();                      // ali je tehnik ali netehnik
                if (!empty($fun->getUprizoritev())) {
                    $upr = $uprR->findOneById($fun->getUprizoritev());
                }
            }
        }

        // če smo našli uprizoritev, pogledamo še, če je vodja ekipe
        // ident -> oseba -> alternacije ->funkcija -> uprizoritev  (ista kot tista iz terminastoritve)
        if (!empty($upr)) {

            $qb = $em->createQueryBuilder();
            $e  = $qb->expr();
            $qb->select('count(a) c');
            $qb->from('Produkcija\Entity\Alternacija', 'a');
            $qb->join('a.funkcija', 'f');
            $qb->join('a.oseba', 'o');
            $qb->where($e->eq('f.uprizoritev', ':upriz'));
            $qb->setParameter('upriz', $upr->getId(), "string");
            $qb->andWhere($e->eq('f.vodjaEkipe', 'TRUE'));
            $qb->andWhere('o.user=:user');
            $qb->setParameter('user', $iden->getId(), "string");

            // ali vodja ekipe umetnik ali igralec
            $qbUI    = clone $qb;
            $qbUI->andWhere('f.podrocje = :igralec OR f.podrocje = :umetnik');
            $qbUI->setParameter('igralec', 'igralec', "string");
            $qbUI->setParameter('umetnik', 'umetnik', "string");
            $queryUI = $qbUI->getQuery();
            $cntUI   = $queryUI->getSingleScalarResult();
            if ($cntUI >= 1) {             //vodja celotne ekipe 
                return true;
            }

            // ali vodja ekipe tehnik
            $qbT = clone $qb;
            $qbT->andWhere($e->eq('f.podrocje', ':tehnik'));
            $qbT->setParameter('tehnik', 'tehnik', "string");

            $queryT = $qbT->getQuery();
            $cntT   = $queryT->getSingleScalarResult();
            if ($cntT >= 1) {             //vodja tehnične ekipe
                if ($fpodrocje == 'tehnik') {     //lahko le za svojo ekipo
                    $ret = true;
                }
            }
        }
        return $ret;
    }

}
