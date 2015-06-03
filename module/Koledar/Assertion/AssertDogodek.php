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
        implements \ZfcRbac\Assertion\AssertionInterface, \Zend\ServiceManager\ServiceLocatorAwareInterface
{

    use \Zend\ServiceManager\ServiceLocatorAwareTrait;

    public function assert(\ZfcRbac\Service\AuthorizationService $authorizationService, $dogodek = null)
    {
        if (!$dogodek) {
            //če je null vrne ok
            return true;
        }

        // če ima vlogo ifi-all ali ifi-readall   dovolimo dostop
//        $roles = $authorizationService->roleService->getIdentityRoles(); //$$ rb zaenkrat javi napako:  Fatal error: Cannot access protected property 
//                                                                       // ZfcRbac\Service\AuthorizationService::$roleService
//                                                                       // morda bi extendali AuthorizationService in popravili v RestControllerFactory
//                                                                       // potem bi lahko kontrolirali tudi vloge
//        foreach ($roles as $role) {
//            if ($role === 'ifi-all' || $role === 'ifi-readall') {
//                return true;
//            }
//        }

        $iden = $authorizationService->getIdentity();
        $user = $iden->getEmail();
        if ($user == "admin@ifigenija.si") {          // $$ rb začasno, dokler shortCircuit ne preskoči tega assert-a
            return true;
        }


        // za npr. direktorja in planerja ne glede na status dogodka
        if ($authorizationService->isGranted("Dogodek-readVse", $dogodek)) {  //ker je drug perm, se ne bi smel zaciklati
            return true;
        }

        $ret = false;     // init
        // običajni uporabniki 
        if ($dogodek->getStatus() >= 7) {             // $$ treba je še definirati, od katerega statusa naprej bo odobren dogodek (za test npr. 7)
            $ret = true;
        }
        return $ret;
    }

}
