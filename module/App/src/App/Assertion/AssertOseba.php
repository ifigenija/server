<?php

/*
 *  Licenca GPLv3
 */

namespace App\Assertion;

/**
 * Assertion, ki se uporablja pri preverjanju dostopa do entitet in view-ev
 * 
 * Ta assertion je testni ($$ rb - kasneje ga zbriši?)
 *
 * @author rado
 * 
 * @param  AuthorizationService $authorization
 * @param  App\Entity\Oseba     $oseba
 * @return bool
 */
class AssertOseba
        implements \ZfcRbac\Assertion\AssertionInterface, \Zend\ServiceManager\ServiceLocatorAwareInterface
{

    use \Zend\ServiceManager\ServiceLocatorAwareTrait;

    public function assert(\ZfcRbac\Service\AuthorizationService $authorizationService, $oseba = null)
    {
//                       'priimek' => 'write protected12345', //to je vrednost, ki je assert ne dovoli
        if (!$oseba) {
            //če je null vrne ok
            return true;
        } else {

            //
            $iden = $authorizationService->getIdentity();
            $user = $iden->getEmail();
            if ($user == "admin@ifigenija.si") {          // $$ rb začasno, dokler shortCircuit ne preskoči tega assert-a
                return true;
            }
            $isG     = $authorizationService->isGranted("Oseba-vse", $oseba);  //ker je drug perm, se ne bi smel zaciklati
            $priimek = $oseba->getPriimek();
            // za zaščiten zapis potrebujemo dodaten permission Oseba-vse
            $ret     = (!('write protected12345' === $priimek) or $isG);
            return $ret;
        }
    }
}
