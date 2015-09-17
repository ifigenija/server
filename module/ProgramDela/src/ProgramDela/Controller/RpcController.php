<?php

/*
 *  Licenca GPLv3
 */

namespace ProgramDela\Controller;
use Zend\Mvc\Controller\AbstractActionController;

/**
 * Description of RpcController
 *
 * @author rado
 */
class RpcController
        extends AbstractActionController
{
        use \Max\Controller\Traits\RpcTrait;

    /**
     * Akcije ki streže nastavitve preko JsonRpc
     * 
     */
    public function enotaprogramaAction() {
        
        $srv = $this->getServiceLocator()->get('enotaprograma.rpc.service');
        
        return $this->handleJsonRpcCall($srv);
    }

    public function programdelaAction() {
        
        $srv = $this->getServiceLocator()->get('programdela.rpc.service');
        
        return $this->handleJsonRpcCall($srv);
    }
}
