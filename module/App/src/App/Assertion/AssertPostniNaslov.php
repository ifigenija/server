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
 * @param  App\Entity\PostniNaslov     $naslov
 * @return bool
 */
class AssertPostniNaslov
        extends \Max\Assertion\AssertBase
        implements \ZfcRbac\Assertion\AssertionInterface, \Zend\ServiceManager\ServiceLocatorAwareInterface
{

    public function assert(\ZfcRbac\Service\AuthorizationService $authorizationService, $naslov = null)
    {
        if (parent::assert($authorizationService, $naslov, true)) {
            return true;
        }
        /**
         * naslovi pri osebah so osebni podatki
         */
        return (!$naslov->getOseba() || $authorizationService->isGranted("OsebniPodatki-read", $naslov));
    }
}
