<?php

namespace Max\Form;

use Exception;
use stdClass;
use Max\Filter\StripEntity;
use Max\Form\ManagedForm;
use Max\Stdlib\Hydrator\Json;
use Zend\Form\Element\Collection;

class JsonForm
    extends ManagedForm
{

    private $entityClass;
    private $fieldSetName;
    private $mode;

    public function __construct($name = null, $options = [])
    {
        parent::__construct($name, $options);
        $this->setAttribute('method', 'POST');
    }

    public function getIzbirne($opcije)
    {
        return $this->getServiceLocator()
                ->getServiceLocator()
                ->get('options.service')
                ->getOptions($opcije);
    }

    /**
     * Vrne polje z backbone forms kompatibilno shemo forme
     * 
     * @return type
     */
    public function getSchemaFromMeta()
    {

        $f = $this->baseFieldset ? : $this;
        $result = [];

        foreach ($f->elements as $name => $element) {
            if ($element instanceof Collection) {
                $field = $this->getCollectionMeta($element);
            } else {
                $field = $this->getFieldMeta($element);
            }
            $result[$name] = $field;
        }

        return $result;
    }

    /**
     * Vrne polje z backbone forms kompatibilno shemo forme
     * 
     * @return type
     */
    public function getSchema()
    {

        $f = $this->baseFieldset ? : $this;
        $result = [];

        foreach ($f->elements as $name => $element) {
            if ($element instanceof Collection) {
                $field = $this->getCollectionSchema($element);
            } else {
                $field = $this->getFieldSchema($element);
            }
            $result[$name] = $field;
        }

        return $result;
    }

    public static function filterType($type)
    {
        $type = ucfirst($type);
        switch ($type) {
            case 'Decimal':
            case 'Integer':
                return 'Number';
            case 'Cena':
                return 'Cena';
                break;
            case 'Id':
                return 'Hidden';
            case 'Date':
                return 'DatePicker';
                break;
            case 'Daterange':
            case 'Select':
            case 'Checkbox':
            case 'Hidden':
            case 'TextArea':
            case 'Toone':
            case 'LookupSelect':
                return $type;
                break;
            default:
                return 'Text';
        }
    }

    public function getFieldMeta($element)
    {
        $opts = $element->getOptions();
        // tip dobimo iz ui anotacije
        $meta = $opts['metadata'];
        $ui = $meta->getFieldUi($element->getName());
        $type = $ui ? $ui->type : '';


        // ali doctrine anotacije
        try {
            $map = $meta->getMapping()->getFieldMapping($element->getName());
        } catch (Exception $e) {
            $map = null;
        }
        // če ni guid
        if ($map && $map['type'] !== 'guid') {
            $type = $type ? : $map['type'];
            $type = $type == 'text' ? 'TextArea' : $type;
        }
        // lahko dobim tip tudi iz atributa type
        $type = $type ? : $element->getAttribute('type');

        $element->setAttribute('type', $type);
        $field = $this->getFieldSchema($element);
        return $field;
    }

    /**
     *
     */
    public static function getFieldSchema($element)
    {
        $f = new StripEntity();
        $opts = $element->getOptions();
        $field = new stdClass();
        $type = $element->getAttribute('type');
        $field->name = $element->getName();
        $field->validators = [];

        if (isset($opts['value_options'])) {
            $field->options = $opts['value_options'];
        }

        $field->type = self::filterType($type);

        if (isset($opts['hint']) || isset($opts['description'])) {
            $field->help = $opts['description'] ? : $opts['hint'];
        } else {
            $field->help = "";
        }

        if ($type == 'daterange') {
            $field->type = 'Daterange';
        }
        // Multiselect -> checkboxes
        if ($type == 'select' && $element->getAttribute('multiple') == 'multiple') {
            $field->type = 'Checkboxes';
        }

        $field->editorAttrs = $element->getAttributes();
        if (isset($opts['maxlength'])) {
            $field->editorAttrs['maxlength'] = $opts['maxlength'];
        }
        if (isset($opts['group'])) {
            $field->group = $opts['group'];
        }

        $field->editorAttrs['class'] = isset($field->editorAttrs['class']) ? $field->editorAttrs['class'] : '';
        $field->editorAttrs['class'] .= $field->type != 'Checkbox' ? ' form-control' : '';

        if ($type == 'decimal') {
            $field->editorAttrs['step'] = 1; //pow(10, (0 - $map['scale']));
            $field->decimals  = $opts['decimals'];
        }
        if ($type == 'integer') {
            $field->editorAttrs['step'] = 1;
            $field->decimals = 0;
        }
        if (isset($opts['targetEntity'])) {
            $field->targetEntity = $f->filter($opts['targetEntity']);
        }

        if (isset($opts['minLength'])) {
            $field->minLength = $opts['minLength'];
        }
        if (isset($opts['prependIcon'])) {
            $field->editorAttrs['prependIcon'] = $opts['prependIcon'];
        }

        if (isset($opts['label'])) {
            $field->title = $opts['label']; //ucfirst($element->getAttribute('type'));
        }

        if (isset($opts['required']) && $opts['required'] == true) {
            $field->validators[] = 'required';
            $field->editorAttrs['required'] = 'required';
        }

        // Naloži polno entiteto pri lookupu?
        if (isset($opts['fullEntity'])) {
            $field->fullEntity = true;
        }

        // Upoštevaj filtre za lookup
        if (isset($opts['filters'])) {
            $field->filters = $opts['filters'];
        }
        // Upoštevaj filtre za lookup
        if (isset($opts['master'])) {
            $key = isset($opts['masterLookup']) ? $opts['masterLookup'] : $opts['master'];
            $field->filters = [$key => ['element' => $opts['master']]];
        }

        // Onemogoči element v formi?
        if (isset($opts['disabled'])) {
            $field->editorAttrs['disabled'] = true;
        }

        return get_object_vars($field);
    }

    public function getCollectionMeta(Collection $collection)
    {
        $result = [];
        $fs = $collection->getTargetElement();
        foreach ($fs as $element) {


            if ($element instanceof Collection) {
                $field = $this->getCollectionMeta($element);
            } else {
                $field = $this->getFieldMeta($element);
            }

            $result[] = $field;
        }
        return ['name' => $collection->getName(),
            'type' => 'Object',
            'subSchema' => $result
        ];
    }

    public function getCollectionSchema(Collection $collection)
    {
        $result = [];
        $fs = $collection->getTargetElement();
        foreach ($fs as $element) {

            if ($element instanceof Collection) {
                $field = $this->getCollectionSchema($element);
            } else {
                $field = $this->getFieldSchema($element);
            }

            $result[] = $field;
        }
        return ['name' => $collection->getName(),
            'type' => 'Object',
            'subSchema' => $result
        ];
    }

    /**
     *
     * @param type $class - class
     * @param Json $hydrator - custom hidrator
     */
    public function setEntity($class, $hydrator = null)
    {

        $this->entityClass = $class;
        $this->repository = $this->em->getRepository($class);
        $this->repository->setServiceLocator($this->getServiceLocator()->getServiceLocator());
        $f = new StripEntity();
        $name = $f->filter($class);

        $this->entityLink = $name;

        $fieldset = $this->serviceLocator->get($name . 'Fieldset');

        $fieldset->setUseAsBaseFieldset(true);
        if ($hydrator) {
            $fieldset->setHydrator($hydrator);
        } else {
            $fieldset->setHydrator($this->repository->getJsonHydrator());
        }
        $this->add($fieldset);

        $this->setHydrator($fieldset->getHydrator());
        $this->setObject(new $class);
        return $this;
    }

    /**
     * Postavi formo v pravi način ADD/EDIT/VIEW
     *
     * @param type $mode  način
     * @param type $link  link za edit
     */
    public function setMode($mode, $link = '')
    {
        if ($mode == 'EDIT') {
            $this->ensureIdElement();
        }
        if ($this->baseFieldset instanceof FormModeInterface) {
            $this->baseFieldset->setMode($mode);
        }
    }

    /**
     * Getter za form mode
     * @return string
     */
    public function getMode()
    {
        return $this->mode;
    }

}
