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
        extends \Max\Assertion\AssertBase
        implements \ZfcRbac\Assertion\AssertionInterface, \Zend\ServiceManager\ServiceLocatorAwareInterface
{

    public function assert(\ZfcRbac\Service\AuthorizationService $authorizationService, $oseba = null)
    {
        if (parent::assert($authorizationService, $oseba)) {
            return true;
        }

//                       'priimek' => 'write protected12345', //to je vrednost, ki je assert ne dovoli
        $isG     = $authorizationService->isGranted("Oseba-vse", $oseba);  //ker je drug perm, se ne bi smel zaciklati
        $priimek = $oseba->getPriimek();
// za zaščiten zapis potrebujemo dodaten permission Oseba-vse
        $ret     = (!('write protected12345' === $priimek) or $isG);
        return $ret;
    }
}
