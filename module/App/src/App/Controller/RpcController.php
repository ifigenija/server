<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
namespace App\Controller;
use Zend\Mvc\Controller\AbstractActionController;

/**
 * Description of IfiRpcController
 *
 * @author boris
 */
class RpcController
 extends AbstractActionController
{
    
    use \Max\Controller\Traits\RpcTrait;
    /**
     * Akcije ki streže nastavitve preko JsonRpc
     * 
     */
    public function optionsAction() {
        
        $srv = $this->getServiceLocator()->get('options.rpc.service');
        
        return $this->handleJsonRpcCall($srv);
    }
    
}
