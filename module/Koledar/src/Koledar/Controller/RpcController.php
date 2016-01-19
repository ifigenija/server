<?php

/*
 *  Licenca GPLv3
 */

namespace Koledar\Controller;

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
    public function praznikAction()
    {

        $srv = $this->getServiceLocator()->get('praznik.rpc.service');

        return $this->handleJsonRpcCall($srv);
    }

    public function vzporedniceAction()
    {

        $srv = $this->getServiceLocator()->get('vzporednice.rpc.service');

        return $this->handleJsonRpcCall($srv);
    }

    public function dogodekAction()
    {

        $srv = $this->getServiceLocator()->get('dogodek.rpc.service');

        return $this->handleJsonRpcCall($srv);
    }

}
