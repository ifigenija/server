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
 * @param  App\Entity\Trr     $trr
 * @return bool
 */
class AssertTrr
        extends \Max\Assertion\AssertBase
        implements \ZfcRbac\Assertion\AssertionInterface, \Zend\ServiceManager\ServiceLocatorAwareInterface
{

    public function assert(\ZfcRbac\Service\AuthorizationService $authorizationService, $trr = null)
    {
        if (parent::assert($authorizationService, $trr, true)) {
            return true;
        }
        /**
         * trr pri osebah so osebni podatki
         */
        return (!$trr->getOseba() || $authorizationService->isGranted("OsebniPodatki-read", $trr));
    }
}
