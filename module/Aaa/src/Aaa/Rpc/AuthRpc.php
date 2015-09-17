<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Aaa\Rpc;
use Max\Exception\MaxException;
use Max\Exception\UnauthException;
use Max\Service\AbstractMaxService;

/**
 * Wrapper za strežbo rpc klicev v AaaService
 *
 * @author boris
 */
class AuthRpcService
        extends AbstractMaxService
{

    /**
     * Vrne podatke o prijavljenem uporabniku, če je uporabnik prijavljen. 
     * 
     * Če gre za anonymous uporabnika, potem vrnemo prazen seznam.
     * 
     * @returns array
     */
    public function checkLogin()
    {
        $ident = $this->getAuth()->getIdentity();

        if (!$ident) {
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
     * @return array
     * @throws UnauthException
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
        throw new UnauthException($tr->translate('Vpis ni uspel'), 1000998);
    }

    /**
     * Vrne podatke o uporabniku pripravljene za pošiljanje na klienta
     * 
     * @param \Aaa\Entity\User $identity
     */
    protected function getUserData($identity)
    {

        $roles       = [];
        $permissions = [];
        foreach ($identity->getRoles() as $role) {
            $roles[] = $role->getName();

            foreach ($role->getPermissions() as $perm) {
                $permissions[] = $perm->getName();
            }
        };
        return [
            'id'                 => $identity->getId(),
            'name'               => $identity->getName(),
//            'username'           => $identity->getUserName(),
            'username'           => $identity->getEmail(),
            'defaultRoute'       => $identity->getDefaultRoute(),
            'defaultRouteParams' => $identity->getDefaultRouteParams(),
            'roles'              => $roles,
            'permissions'        => $permissions
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
                // shraniti si je potrebno ključ, ki ga pošljemo in poskrbeti, 
                // da ključ ne bo aktiven neskončno časa
                // 
                $to = $user->getEmail();

                throw new MaxException('not implemented', 1000997);
            }
        } catch (\Exception $e) {
            return ["error" => "Error", "code" => 1000996];
        }
    }

    /**
     * zamenja geslo uporabniku
     * @params string $oldPassword
     * @params string $newPassword
     * @param $oldPassword
     * @param $newPassword
     * @return true če geslo uspešno menjano,
     * @throws MaxException
     */
    public function changePassword($oldPassword, $newPassword)
    {
        /**
         * ali uporabnik prijavljen
         */
        $ident = $this->getIdentity();
        if (!$ident) {
            throw new MaxException('Uporabnik ni prijavljen', 1000995);
        }

        /**
         * ali novo geslo različno staremu?
         */
        if ($newPassword ==$oldPassword) {
            throw new MaxException('Novo geslo enako staremu', 1000993);
        }

        /**
         * preverimo staro geslo
         */
        $staroGesloOk = \Aaa\Service\AaaService::checkPassword($ident, $oldPassword);
        if (!$staroGesloOk) {
            throw new MaxException('Napačno staro geslo', 1000994);
        }

        /**
         * zamenjamo geslo
         */
        $ident->setPassword($newPassword);

        $this->getEm()->flush();

        return TRUE;
    }

}
