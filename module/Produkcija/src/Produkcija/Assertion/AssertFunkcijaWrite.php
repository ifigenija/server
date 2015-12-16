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
 * @param  Produkcija\Entity\Funkcija     $funkcija
 * @return bool
 */
class AssertFunkcijaWrite
        extends \Max\Assertion\AssertBase
        implements \ZfcRbac\Assertion\AssertionInterface, \Zend\ServiceManager\ServiceLocatorAwareInterface
{

    public function assert(\ZfcRbac\Service\AuthorizationService $authorizationService, $funkcija = null)
    {
        if (parent::assert($authorizationService, $funkcija, false)) {
            return true;
        }
        
        /**
         * za področje ne tehnike rabiš posebno dovoljenje
         */
        return ($funkcija->getPodrocje()=='tehnik' || $authorizationService->isGranted("Funkcija-vse", $funkcija));
    }
}
