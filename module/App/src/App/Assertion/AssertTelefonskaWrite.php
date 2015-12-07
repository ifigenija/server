<?php

/*
 *  Licenca GPLv3
 */

namespace App\Assertion;

/**
 * Assertion, ki se uporablja pri preverjanju dostopa do entitet in view-ev
 * 
 * @author rado
 * 
 * @param  AuthorizationService $authorization
 * @param  App\Entity\Telefonska     $tel
 * @return bool
 */
class AssertTelefonskaWrite
        extends \Max\Assertion\AssertBase
        implements \ZfcRbac\Assertion\AssertionInterface, \Zend\ServiceManager\ServiceLocatorAwareInterface
{

    public function assert(\ZfcRbac\Service\AuthorizationService $authorizationService, $tel = null)
    {
        if (parent::assert($authorizationService, $tel, FALSE)) {
            return true;
        }
        /**
         * telefonska pri osebah so osebni podatki
         */
        return (!$tel->getOseba() || $authorizationService->isGranted("Oseba-vse", $tel));
    }
}
