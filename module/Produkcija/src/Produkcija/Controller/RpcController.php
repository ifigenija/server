<?php

/*
 *  Licenca GPLv3
 */

namespace Produkcija\Controller;
use Max\Controller\Traits\RpcTrait;
use Zend\Mvc\Controller\AbstractActionController;

/**
 * Description of RpcController
 *
 * @author rado
 */
class RpcController
        extends AbstractActionController
{
        use RpcTrait;

    /**
     * Akcije ki streže nastavitve preko JsonRpc
     * 
     */
    public function alternacijaAction() {
        
        $srv = $this->getServiceLocator()->get('alternacija.rpc.service');
        
        return $this->handleJsonRpcCall($srv);
    }

}
