<?php

namespace Max\Controller\Traits;

use Zend\Http\Response;
use Zend\Json\Server\Server;
use Zend\Json\Server\Smd;

class RpcController {
        

    protected function handleJsonRpcCall($service)
    {

        ini_set('html_errors', 0);

        $server = new Server();
        $server->setClass($service);
        $server->setReturnResponse(true);
        header('Content-Type: application/json');
        $smd = $server->getServiceMap();

        $smd->removeService('getServiceLocator');
        $smd->removeService('setServiceLocator');
        if (!$this->request->isPost()) {
// Indicate the URL endpoint, and the JSON-RPC version used:
            $routeMatch = $event->getRouteMatch();

            $server->setTarget($this->url()->fromRoute(null, ['action' => $routeMatch->getParam('action')]))
                    ->setEnvelope(Smd::ENV_JSONRPC_2);

// Grab the SMD
            echo $smd;
            return new Response();
        }

        $response = $server->handle();
        echo $response;
        return new Response();
    }

}
