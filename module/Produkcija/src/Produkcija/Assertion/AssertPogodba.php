<?php

/*
 *  Licenca GPLv3
 */

namespace Produkcija\Assertion;

/**
 * Assertion, ki se uporablja pri preverjanju dostopa do entitet in view-ev
 * 
 * @author rado
 * 
 * @param  AuthorizationService $authorization
 * @param  Produkcija\Entity\Pogodba     $pogodba
 * @return bool
 */
class AssertPogodba
        extends \Max\Assertion\AssertBase
        implements \ZfcRbac\Assertion\AssertionInterface, \Zend\ServiceManager\ServiceLocatorAwareInterface
{

    public function assert(\ZfcRbac\Service\AuthorizationService $authorizationService, $pogodba = null)
    {
        if (parent::assert($authorizationService, $pogodba, true)) {
            return true;
        }
        /**
         * pogodbe pri osebah so osebni podatki
         */
        return (!$pogodba->getOseba() || $authorizationService->isGranted("OsebniPodatki-read", $pogodba));
    }
}
