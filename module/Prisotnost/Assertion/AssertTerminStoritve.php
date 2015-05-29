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
//                       'priimek' => 'write protected12345', //to je vrednost, ki je assert ne dovoli
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

//        $uprizoritevId=""; //$$
        

        $ret=false;     // init
        
        
        $priimek = $terminStoritve->getPriimek();


        return $ret;
    }

}
