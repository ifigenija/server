<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
namespace Aaa\Controller;
/**
 * Description of IfiRpcController
 *
 * @author boris
 */
class RpcController
 extends \Zend\Mvc\Controller\AbstractActionController
{
    use \Max\Controller\Traits\RpcTrait;
    
    /**
     * Akcije ki streže nastavitve preko JsonRpc
     * 
     */
    public function authAction() {
        
        $srv = $this->getServiceLocator()->get('auth.rpc.service');
        
        return $this->handleJsonRpcCall($srv);
    }

    public function userAction() {
        
        $srv = $this->getServiceLocator()->get('user.rpc.service');
        
        return $this->handleJsonRpcCall($srv);
    }
    public function roleAction() {
        
        $srv = $this->getServiceLocator()->get('role.rpc.service');
        
        return $this->handleJsonRpcCall($srv);
    }
   
}
