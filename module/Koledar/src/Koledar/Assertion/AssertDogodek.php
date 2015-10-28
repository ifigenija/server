<?php

/*
 *  Licenca GPLv3
 */

namespace Koledar\Assertion;

/**
 * Assertion, ki se uporablja pri preverjanju dostopa do entitet in view-ev
 * 
 *
 * @author rado
 * 
 * @param  AuthorizationService $authorization
 * @param  Koledar\Entity\Dogodek     $dogodek
 * @return bool
 */
class AssertDogodek
        extends \Max\Assertion\AssertBase
        implements \ZfcRbac\Assertion\AssertionInterface, \Zend\ServiceManager\ServiceLocatorAwareInterface
{
    public function assert(\ZfcRbac\Service\AuthorizationService $authorizationService, $dogodek = null)
    {
        $permread=true; // ker  se permission konča z -read
        if (parent::assert($authorizationService, $dogodek,$permread)){
            return true;
        }

        // za npr. direktorja in planerja ne glede na status dogodka
        if ($authorizationService->isGranted("Dogodek-readVse", $dogodek)) {  //ker je drug perm, se ne bi smel zaciklati
            return true;
        }

        $ret = false;     // init
        // običajni uporabniki 
        
        if ($dogodek->getStatus() >= '500s') {   // $$ pazi -to primerjanje velja le za vrednosti od '100s' do '999s'
            $ret = true;
        }
        return $ret;
    }

}
