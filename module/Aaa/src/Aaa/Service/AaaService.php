<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
namespace Aaa\Service;

use Zend\Crypt\Password\Bcrypt;

/**
 * Description of AaaService
 *
 * @author boris
 */
class AaaService
{
 /**
     * Preveri geslo uporabnika (vnos hasha in primerja z vnosom v bazi)
     *
     * @param string $user
     * @param string $passwordGiven
     */
    public static function checkPassword($user, $passwordGiven)
    {
        $bcrypt = new Bcrypt();
        $bcrypt->setSalt(51292170311201451452855644564);
        $bcrypt->setCost(5);
        $passwordGiven = $bcrypt->create($passwordGiven);
        if ($user->getEnabled()) {
            return ($user->password === $passwordGiven ? true : false);
        } else {
            return false;
        }
    }   //put your code here
}
