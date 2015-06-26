<?php

/*
 *  Licenca GPLv3
 */

namespace ProgramDela\Controller;

/**
 * Description of RpcController
 *
 * @author rado
 */
class RpcController
        extends \Zend\Mvc\Controller\AbstractActionController
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
}
