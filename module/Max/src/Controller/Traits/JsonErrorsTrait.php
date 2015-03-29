<?php

namespace Max\Controller\Traits;

use Exception;
use Max\Annotation\EntityMetadata;
use Zend\Console\Response;
use Zend\Form\Fieldset;
use Zend\Json\Json;
use Zend\View\Model\ConsoleModel;
use Zend\View\Model\JsonModel;

/**
 * Trait z metodami za vračanje napačnega stanja (ajax klici)
 */
trait JsonErrorsTrait
{

    /**
     * Seznam napak
     * 
     * @var array
     */
    private $errors = [];

    /**
     *
     * Doda Error v seznam napak, ki jih vrnemo, če se
     *
     * @param string  $message
     * @param integer $code
     * @param mixed  $cargo
     */
    public function addError($message, $code = 100, $severity = 'error', $cargo = null)
    {
        $this->errors[] = [
            'message' => $message,
            'cargo' => $cargo,
            'code' => $code,
            'severity' => $severity,
        ];
    }

    /**
     * Iz forme vzame sporočila in jih konverta v json
     *
     * @param Fieldset $form
     * @param EntityMetadata $meta
     */
    public function addFormMessages($form)
    {

        $translator = $this->getServiceLocator()->get('translator');
        //    $escapeHtml = $this->getServiceLocator()->get('ViewHelperManager')->get('escapehtml');

        $messages = $form->getMessages();

        foreach ($messages as $field => $value) {
            $element = $form->get($field);
            if ($element instanceof Fieldset) {
                $this->addFormMessages($element);
            } else {
                $label = $element->getOption('label');
                foreach ($value as $mess) {
                    if (is_array($mess)) {
                        foreach ($mess as $l1 => $m) {
                            $this->addError($l1 . ": " . $translator->translate($m), '');
                        }
                    } else {
                        $this->addError($label . ": " . $translator->translate($mess), '');
                    }
                }
            }
        }
    }

    /**
     *
     * Doda Error v seznam napak,
     *
     * @param Exception  $message
     * @param mixed  $cargo
     */
    public function addErrorFromException($exception, $cargo = null)
    {
        if ($exception instanceof \Max\Exception\UnauthorizedException) {
            $this->getResponse()->setStatusCode('403');
        }

        do {
            $this->errors[] = [
                'message' => $exception->getMessage(),
                'cargo' => $cargo,
                'code' => $exception->getCode(),
                'severity' => 'error',
            ];
        } while ($exception = $exception->getPrevious());
    }

    /**
     *  Vrzne JsonModel z napakami ali
     *
     *
     * @param integer $statusCode
     * @return JsonModel
     */
    public function getErrors($statusCode = 400)
    {
        if ($this->getResponse() instanceof Response) {
            // če je konzolni request potem vrnemo 
            // ustrezni view model.
            $resp = new ConsoleModel();
            if (!$this->hasErrors()) {
                $resp->setErrorLevel(0);
                $resp->setResult(Json::encode([
                        'success' => true
                ]));
            } else {
                $resp->setResult(Json::encode([
                        'success' => $statusCode === '200',
                        'errors' => $this->errors
                ]));
                $resp->setErrorLevel(1);
            }
            return $resp;
        } else {

            if (!$this->hasErrors()) {
                $this->getResponse()->setStatusCode(200);
                return new JsonModel([
                    'success' => true
                ]);
            }

            $this->getResponse()->setStatusCode($statusCode);
            return new JsonModel([
                'success' => $statusCode === '200',
                'errors' => $this->errors
            ]);
        }
    }

    /**
     * Ali so nastavljene napake
     * @return boolean
     */
    public function hasErrors()
    {
        return !empty($this->errors);
    }

}
