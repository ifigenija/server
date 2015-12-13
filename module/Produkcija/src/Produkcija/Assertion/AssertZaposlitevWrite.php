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
 * @param  Produkcija\Entity\Zaposlitev     $zaposlitev
 * @return bool
 */
class AssertZaposlitevWrite
        extends \Max\Assertion\AssertBase
        implements \ZfcRbac\Assertion\AssertionInterface, \Zend\ServiceManager\ServiceLocatorAwareInterface
{

    public function assert(\ZfcRbac\Service\AuthorizationService $authorizationService, $zaposlitev = null)
    {
        if (parent::assert($authorizationService, $zaposlitev, false)) {
            return true;
        }
        /**
         * vse zaposlitve  so osebni podatki
         */
        return ($authorizationService->isGranted("OsebniPodatki-write", $zaposlitev));
    }
}
