<?php

namespace Aaa\View\Strategy;

use Zend\Authentication\AuthenticationServiceInterface;
use Zend\Http\Response as HttpResponse;
use Zend\Http\Request as HttpRequest;
use Zend\Mvc\MvcEvent;
use Zend\View\Model\JsonModel;
use Zend\View\Model\ViewModel;
use ZfcRbac\Exception\UnauthorizedExceptionInterface;
use ZfcRbac\Guard\GuardInterface;
use ZfcRbac\View\Strategy\AbstractStrategy;

class JsonStrategy
        extends AbstractStrategy
{

    /**
     *
     * @var AuthenticationServiceInterface
     */
    protected $authenticationService;

    public function __construct($authenticationService)
    {
        $this->authenticationService = $authenticationService;
    }

    public function onError(MvcEvent $event)
    {

        // Do nothing if no error or if response is not HTTP response
        if (!($exception = $event->getParam('exception') instanceof UnauthorizedExceptionInterface) || ($event->getResult() instanceof HttpResponse) || !($response = $event->getResponse() instanceof HttpResponse)
        ) {
            return;
        }

        $request = $event->getRequest() ? : new HttpRequest();
        $response = $event->getResponse() ? : new HttpResponse();

        // za json requeste vedno odgovorimo z json odgovorom nikoli z redirectom 
        $model = new JsonModel([
            'success' => false,
            'errors' => [
                [
                    'message' => 'Unauthorized',
                    'code' => 'TIP-00403',
                    'severity' => 'error',
                ]
            ]
        ]);
        $response->setStatusCode(403);
        $event->setResponse($response);
        $event->setResult($model);
    }

}
