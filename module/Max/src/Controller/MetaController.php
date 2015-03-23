<?php

namespace Max\Controller;

use Exception;
use Max\Exception\MaxException;
use Max\Filter\DecorateEntity;
use Max\Repository\AbstractMaxRepository;
use Zend\View\Model\JsonModel;

/**
 * Kontroller, ki vrne metapodatke o paginatorju
 */
class FormMetaController
    extends \Max\Controller\AbstractRestfulController
{

    use \Max\Controller\JsonErrorsTrait;
    /**
     * @var AbstractMaxRepository
     */
    protected $sr;

    /**
     *
     * @var \Zend\Form\FormElementManager
     */
    protected $fm;

    /**
     *
     * @var \Max\Form\JsonForm
     */
    protected $form;

    /**
     *
     * @throws MaxException
     */
    public function init()
    {
        
    }

    /**
     * Vrne seznam kontekstov
     *
     * @return JsonModel
     */
    public function getList()
    {
        $result = [];
        try {

            if (!$this->params('ent'))
                throw new MaxException('Ni nastavljene entitete', 'TIP-MET-0001');

            $this->entity = $this->params('ent');

            $f = new DecorateEntity();
            $this->entityClass = $f->filter($this->entity);
            if (class_exists($this->entityClass)) {
                $fm = $this->getServiceLocator()->get('FormElementManager');
                $this->form = $fm->get('Max\Form\JsonForm');
            } else {
                throw new MaxException('Entiteta ali fieldset ne obstaja', 'TIP-MET-0004');
            }

            if ($this->params('fieldset')) {
                $this->form->setFieldSet($this->params('fieldset'));
            } else {
                $this->form->setEntity($this->entityClass);
            }

            $result = $this->form->getSchemaFromMeta();


            return new JsonModel(array_values($result));
        } catch (Exception $e) {
            $this->addErrorFromException($e);
            return $this->getErrors();
        }
    }

    /**
     * Vrne metapodatke za filter formo.
     * Class dobimo iz 
     *
     * @return JsonModel
     */
    public function filterFormMetaAction()
    {
        $result = [];
        try {

            $formClass = $this->params('class');

            // spremenim ime forme iz Proizvodnja-DnSearch v
            // \Proizvodnja\Form\Filter\DnSearch ....
            $parts = explode('-', $formClass);
            array_splice($parts, 1, 0, ['Form', 'Filter']);
            $formClass = '\\' . implode('\\', $parts);

            if (class_exists($formClass)) {
                try {
                    $fm = $this->getServiceLocator()->get('FormElementManager');
                    $form = $fm->get($formClass);
                    $result = array_values($form->getSchema());
                    return new JsonModel(['schema' => $result, 'defaults' => $form->getDefaults()]);
                } catch (Exception $ex) {
                    $this->addErrorFromException($ex);
                    $this->addError('Napaka pri produciranju metapodatkov za filter formo', 'TIP-MET-0006');
                }
            } else {
                throw new MaxException('Filter Forma ne obstaja ' . $formClass, 'TIP-MET-0007');
            }
        } catch (Exception $e) {
            $this->addErrorFromException($e);
            return $this->getErrors();
        }
    }

}
