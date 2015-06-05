<?php

/*
 *  Licenca GPLv3
 */

namespace Produkcija\Controller;

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
    public function alternacijaAction() {
        
        $srv = $this->getServiceLocator()->get('alternacija.rpc.service');
        
        return $this->handleJsonRpcCall($srv);
    }
}
