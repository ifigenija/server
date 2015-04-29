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
        implements \ZfcRbac\Assertion\AssertionInterface
{

    public function assert(\ZfcRbac\Service\AuthorizationService $authorizationService, $oseba = null)
    {
//                       'priimek' => 'write protected12345', //to je vrednost, ki je assert ne dovoli
        if (!$oseba) {
            //če je null vrne ok
            return true;
        } else {
//            $roles = $authorizationService->roleService->getIdentityRoles();
//            if (!$authorizationService->rbac->isGranted($roles, $permission)) {
//                return false;
//            }
//            $isG = $authorizationService->rbac->isGranted($roles, "Oseba-vse"));
            $iden = $authorizationService->getIdentity();
            $user = $iden->getEmail();
            if ($user == "admin@ifigenija.si") {          // $$ rb začasno, dokler shortCircuit ne preskoči tega assert-a
                return true;
            }
            $priimek = $oseba->getPriimek();
            $ret     = !('write protected12345' === $priimek);
            return $ret;
        }
    }

}
