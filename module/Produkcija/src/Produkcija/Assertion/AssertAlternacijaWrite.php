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
 * @param  Produkcija\Entity\Alternacija     $alternacija
 * @return bool
 */
class AssertAlternacijaWrite
        extends \Max\Assertion\AssertBase
        implements \ZfcRbac\Assertion\AssertionInterface, \Zend\ServiceManager\ServiceLocatorAwareInterface
{

    public function assert(\ZfcRbac\Service\AuthorizationService $authorizationService, $alternacija = null)
    {
        if (parent::assert($authorizationService, $alternacija, false)) {
            return true;
        }

        /**
         * za področje ne tehnike rabiš posebno dovoljenje
         */
        return (!$alternacija->getFunkcija() || $alternacija->getFunkcija()->getPodrocje() == 'tehnik' || $authorizationService->isGranted("Alternacija-vse", $alternacija));
    }

}
