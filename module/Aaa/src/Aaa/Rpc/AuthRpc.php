<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Aaa\Rpc;

/**
 * Wrapper za strežbo rpc klicev v AaaService
 *
 * @author boris
 */
class AuthRpcService
        extends \Max\Service\AbstractMaxService
{

    /**
     * Vrne podatke o prijavljenem uporabniku, če je uporabnik prijavljen. 
     * 
     * Če gre za anonymous uporabnika, potem vrnemo prazen seznam.
     * 
     * @returns arra
     */
    public function checkLogin()
    {
        $ident = $this->getAuth()->getIdentity();

        if (!$ident || $ident->getUsername() === 'anonymous') {
            return [];
        }

        return $this->getUserData($ident);
    }

    /**
     * Prijava uporabnika
     * 
     * Preveri geslo in vrne seznam vlog, če je bila prijava uspešna. 
     * Če prijava ni uspešna vrne napako.
     * 
     * @param string $username
     * @param string $password
     */
    public function login($username, $password)
    {

        /* @var $authService \Zend\Authentication\AuthenticationService */
        $authService = $this->getServiceLocator()->get('Zend\Authentication\AuthenticationService');

        /**
         * če je uporabnik že prijavljen in se hoče prijaviti še enkrat,
         * mu to dovolimo. Najprej spraznimo trenutno prijavo.
         */
        if ($authService->hasIdentity()) {
            $authService->clearIdentity();
            $authService->getStorage()->clear();
        }

        $adapter    = $authService->getAdapter();
        $adapter->setIdentityValue($username);
        $adapter->setCredentialValue($password);
        $authResult = $authService->authenticate();
        if ($authResult->isValid()) {
           
            /* @var $identity \Aaa\Entity\User */
            $identity = $authResult->getIdentity();
            $authService->getStorage()->write($identity);

            return $this->getUserData($identity);
        }

        $tr = $this->getServiceLocator()->get('translator');
        throw new \Max\Exception\UnauthException($tr->translate('Vpis ni uspel'), 100998);
    }

    /**
     * Vrne podatke o uporabniku pripravljene za pošiljanje na klienta
     * 
     * @param \Aaa\Entity\User $identity
     */
    protected function getUserData($identity)
    {

        $roles = [];
        foreach ($identity->getRoles() as $role) {
            $roles[] = $role->getName();
        };
        return [
            'name'               => $identity->getName(),
            'username'           => $identity->getUserName(),
            'defaultRoute'       => $identity->getDefaultRoute(),
            'defaultRouteParams' => $identity->getDefaultRouteParams(),
            'roles'              => $roles
        ];
    }

    /**
     * Odjava uporabnika 
     * 
     */
    public function logout()
    {
        /* @var $authService \Zend\Authentication\AuthenticationService */
        $authService = $this->getServiceLocator()->get('Zend\Authentication\AuthenticationService');

        /**
         * če je uporabnik že prijavljen in se hoče prijaviti še enkrat,
         * mu to dovolimo. Najprej spraznimo trenutno prijavo.
         */
        if ($authService->hasIdentity()) {
            $authService->clearIdentity();
            $authService->getStorage()->clear();
        }
    }

    /**
     * Pošlje mail z linkom do strani za spremembo gesla....
     * 
     * @param string $email email uporabnika, ki je pozabil geslo
     */
    public function forgotPassword($email)
    {

        $rep = $this->getEm()->getRepository('Aaa\Entity\User');
        try {
            $user = $rep->findOneByEmail();

            if ($user) {
                // potrebno poslati link do pravega tennanta 
                // shraiti si je potrebno ključ, ki ga pošljemo in poskrbeti, 
                // da ključ ne bo aktiven neskončno časa
                // 
                $to = $user->getEmail();

                throw new \Max\Exception\MaxException('not implemented', 100997);
            }
        } catch (\Exception $e) {
            return ["error" => "Error", "code" => 1000996];
        }
    }

}
