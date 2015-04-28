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
            //če je null vrne null
            return true;
        } else {
            $priimek=$oseba->getPriimek();
            $ret=!('write protected12345' === $priimek);
            return $ret;
        }
    }
}
