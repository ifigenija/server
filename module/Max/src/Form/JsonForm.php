<?php

namespace Max\Form;

use DoctrineModule\Stdlib\Hydrator\DoctrineObject;
use Exception;
use Max\Exception\MaxException;
use Max\Filter\StripEntity;
use Max\Form\ManagedForm;
use stdClass;
use Zend\Form\Element\Collection;

class JsonForm
        extends ManagedForm
{

    private $entityClass;
    private $mode;
    private $opts;
    private $mf;

    public function __construct($name = null, $options = [])
    {
        parent::__construct($name, $options);
        $this->setAttribute('method', 'POST');
    }

    public function init()
    {
        $sm         = $this->getServiceLocator()->getServiceLocator();
        $this->em   = $sm->get('doctrine.entitymanager.orm_default');
        $this->mf   = $sm->get('entity.metadata.factory');
        $this->opts = $sm->get('options.service');
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

        $f      = $this->baseFieldset ? : $this;
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

        $f      = $this->baseFieldset ? : $this;
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
            case 'Tomany':
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
        $ui   = $meta->getFieldUi($element->getName());
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
        $opts              = $element->getOptions();
        $field             = new stdClass();
        $type              = $element->getAttribute('type');
        $field->name       = $element->getName();
        $field->validators = [];

        if (isset($opts['value_options'])) {
            $field->options = $opts['value_options'];
        }

        $field->type = self::filterType($type);

        if (isset($opts['description'])) {
            $field->help = $opts['description'];
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
            $field->decimals            = $opts['decimals'];
        }
        if ($type == 'integer') {
            $field->editorAttrs['step'] = 1;
            $field->decimals            = 0;
        }
        if (isset($opts['targetEntity'])) {
            
            
             $arr = explode('\\' ,$opts['targetEntity']);
             
             $field->targetEntity = array_pop($arr);
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
            $field->validators[]            = 'required';
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
            $key            = isset($opts['masterLookup']) ? $opts['masterLookup'] : $opts['master'];
            $field->filters = [$key => ['element' => $opts['master']]];
        }

        // Onemogoči element v formi?
        if (isset($opts['disabled'])) {
            $field->editorAttrs['disabled'] = true;
        }

        return get_object_vars($field);
    }



    public function getCollectionSchema(Collection $collection)
    {
        $result = [];
        $fs     = $collection->getTargetElement();
        foreach ($fs as $element) {

            if ($element instanceof Collection) {
                $field = $this->getCollectionSchema($element);
            } else {
                $field = $this->getFieldSchema($element);
            }

            $result[] = $field;
        }
        return ['name'      => $collection->getName(),
            'type'      => 'Object',
            'subSchema' => $result
        ];
    }

    /**
     * getter za mode
     *
     * @return string
     */
    public function getMode()
    {
        return $this->mode;
    }

    /**
     * Nastavi način na vseh poljih v fieldsetu.
     * Podprti načini so "VIEW|NEW|EDIT"
     *
     * @param string $mode
     * @return ManagedFieldset
     */
    public function setMode($mode)
    {
        $this->mode = $mode;

        if ($mode == 'EDIT') {
            $this->ensureIdElement();
        }
        foreach ($this->elements as $el) {
            if ($el instanceof FormModeInterface) {
                $el->setMode($mode);
            }

            if ($mode == 'VIEW') {
                $el->setAttribute('disabled', 'disabled');
            }
        }

        foreach ($this->fieldsets as $fs) {
            if ($fs instanceof FormModeInterface) {
                $fs->setMode($mode);
            }
        }
        return $this;
    }

    /**
     * Doda polje v fieldset, tako, da poskuša čim več opcij in atributov
     * iz metapodatkov
     * Vrednosti nastavljenih v $options ne povozi
     *
     * @param string $name
     * @param array $options
     * @param string $type
     * @throws Max\Exception\BrezMetapodatkovNeGre
     */
    public function addWithMeta($name, $options = [], $type = null)
    {

        if (!$this->metadata) {
            throw new MaxException($name . ': Polja ni mogoče dodati brez metapodatkov', 1000107);
        }
        if (!$type) {
            $type = $this->getTypeFromMeta($name);
        }
        $options = $this->addOptionsFromMeta($type, $name, $options);

        $this->add([
            'name'    => $name,
            'type'    => $type,
            'options' => $options
        ]);
    }

    /**
     * Nastavi opcijo v arrayu $options, samo če ključ $option še ne obstaja
     *
     * @param array $options
     * @param string $option
     * @param mixed $value
     * @return array
     */
    public function addOptionIf($options, $option, $value)
    {
        if (!array_key_exists($option, $options)) {
            if (null !== $value) {
                $options[$option] = $value;
            }
        }
        return $options;
    }

    /**
     * Nastavi opcije iz doctrine mappinga : required, maxlength
     *
     * @param string $name
     * @param string $options
     * @return array
     */
    public function addOptionsFromMeta($type, $name, $options)
    {
        $map = $this->metadata->getMapping();
        if ($map->hasField($name)) {
            $mapping = $map->getFieldMapping($name);
            $options = $this->addOptionIf($options, 'required', $this->getUiRequiredFromMeta($name));
            $options = $this->addOptionIf($options, 'required', !$mapping['nullable']);

            if ($mapping['type'] == 'string') {
                if (null === $mapping['length']) {
                    $mapping['length'] = 255;
                }
                $options = $this->addOptionIf($options, 'maxlength', $mapping['length']);
            }

            if ($type == 'decimal') {
                $options = $this->addOptionIf($options, 'decimals', $mapping['scale']);
            }
            if ($type == 'sifra' or $type == "integer") {
                $options = $this->addOptionIf($options, 'uniqueProperty', $mapping['unique']);
            }
            if ($type == 'kwselect') {
                $options = $this->addOptionIf($options, 'create_empty_option', $mapping['nullable']);
            }
            if ($type == 'select') {

                if ($this->getUiGroupedFromMeta($name) == true) {
                    // grupiramo opcije
                    $data   = $this->getUiOptionsWithFlagsFromMeta($name);
                    $groups = [];
                    foreach ($data as $key => $val) {
                        $groups[$val['flags']][$key] = $val['label'];
                    }

                    // zgradimo select element z optgroupi
                    $val_opts = [];
                    foreach ($groups as $group_name => $group) {
                        $opt = ['label' => $group_name, 'options' => []];
                        foreach ($group as $key => $label) {
                            $opt['options'][$key] = $label;
                        }
                        $val_opts[] = $opt;
                    }

                    $options = $this->addOptionIf($options, 'value_options', $val_opts);
                } else {
                    $options = $this->addOptionIf($options, 'value_options', $this->getUiOptionsFromMeta($name));
                }

                $options = $this->addOptionIf($options, 'empty_option', $this->getUiEmptyOptionFromMeta($name));
            }
            if ($type == 'checkbox') {
                if ($mapping['type'] == 'string') {
                    $options = $this->addOptionIf($options, 'checked_value', 'D');
                    $options = $this->addOptionIf($options, 'unchecked_value', 'N');
                }
            }
            if ($type == 'toone' || $type == 'lookupSelect') {
                if ($mapping['type'] !== 'guid') {
                    throw new MaxException('Max ni guid. Lookup samo na guid polja!', 'TIP-MFS-0002');
                }
                $target = $this->getUiTargetEntityFromMeta($name);
                if (!$target) {
                    // default je ista entiteta (scenarij unique property
                    $target = $this->metadata->getEntityName();
                }
                $options = $this->addOptionIf($options, 'targetEntity', $target);
                $options = $this->addOptionIf($options, 'master', $this->getUiMasterFromMeta($name));
            }
            if ($type == 'tomany') {
                $target = $this->getUiTargetEntityFromMeta($name);
                if (!$target) {
                    throw new MaxException("No target entity on $name", 1000400);
                }
                $options                           = $this->addOptionIf($options, 'targetEntity', $target);
                var_dump($options);
                $options['should_create_template'] = false;
                $options['allow_add']              = true;
            }
            if ($type == 'addresslookup') {
                $target  = $this->getUiTargetEntityFromMeta($name);
                $options = $this->addOptionIf($options, 'targetEntity', $target);
                $options = $this->addOptionIf($options, 'minLength', 1);
                $options = $this->addOptionIf($options, 'master', $this->getUiMasterFromMeta($name));
            }
            if ($type == 'cena') {
                $target  = $this->getUiTargetEntityFromMeta($name);
                $options = $this->addOptionIf($options, 'master', $this->getUiMasterFromMeta($name));
            }
        }
        if ($map->hasAssociation($name)) {
            $assoc                   = $map->getAssociationMapping($name);
            $options['targetEntity'] = $assoc['targetEntity'];
            $options                 = $this->addOptionIf($options, 'filters', $this->getUiFiltersFromMeta($name));

            $filters = isset($options['filters']) ? $options['filters'] : [];


            if ($type == 'select') {
                $valueOptions = $this->loadLookupOptions($name, $assoc['targetEntity'], $filters);
                $options      = $this->addOptionIf($options, 'value_options', $valueOptions);
                $options      = $this->addOptionIf($options, 'empty_option', $this->getUiEmptyOptionFromMeta($name));
            }

            $options = $this->addOptionIf($options, 'required', $this->getUiRequiredFromMeta($name));
            if ($this->getUiMasterFromMeta($name)) {
                $options = $this->addOptionIf($options, 'master', $this->getUiMasterFromMeta($name));
            }
        }

        $options = $this->addOptionIf($options, 'label', $this->getLabelFromMeta($name));
        $options = $this->addOptionIf($options, 'description', $this->getDescriptionFromMeta($name));
        $options = $this->addOptionIf($options, 'prependIcon', $this->getUiIconFromMeta($name));
        $options = $this->addOptionIf($options, 'class', $this->getUiClassFromMeta($name));
        $options = $this->addOptionIf($options, 'group', $this->getUiGroupFromMeta($name));
        $options = $this->addOptionIf($options, 'metadata', $this->metadata);


        return $options;
    }

    /**
     * 
     * Pripravi value opcije za select, ki ima targetEntity 
     * Če so anotirani fiksni parametri tudi upoštevamo parametre
     * 
     * @param string $name
     */
    public function loadLookupOptions($name, $targetEntity, $filter = null)
    {

        $master = $this->getUiMasterFromMeta($name);
        if ($master !== null) {
            throw new MaxException('Select je samo za taka polja, ki nimajo master odvisnosti. Uporabi tip lookupSelect polje', 'TIP-MFS-0066');
        }
        $sort   = ['sort_by' => 'ident', 'order' => 'asc'];
        $rep    = $this->em->getRepository($targetEntity);
        $rep->setServiceLocator($this->getServiceLocator()->getServiceLocator());
        $values = $rep->lookup('', $sort, $filter);
        $arr    = [];
        foreach ($values->getQuery()->getResult() as $v) {
            $arr[$v->id] = $rep->filterForSelect($v);
        }
        return $arr;
    }

    /**
     * Potegne label iz metapodatkov
     *
     * @param string $name
     * @return string null
     */
    public function getLabelFromMeta($name)
    {
        $str = $this->metadata->getFieldI18n($name);
        if ($str && $name !== 'id') {
            return $str->label;
        } else {
            return null;
        }
    }

    /**
     * Potegne description iz metapodatkov
     *
     * @param string $name
     * @return string null
     */
    public function getDescriptionFromMeta($name)
    {
        $str = $this->metadata->getFieldI18n($name);
        if ($str) {
            return $str->description;
        } else {
            return null;
        }
    }

    /**
     * Potegne ikono iz metapodatkov
     *
     * @param string $name
     * @return string null
     */
    public function getUiIconFromMeta($name)
    {
        $ui = $this->metadata->getFieldUi($name);
        if ($ui) {
            return $ui->icon ? $ui->icon : null;
        } else {
            return null;
        }
    }

    /**
     * Potegne ikono iz metapodatkov
     *
     * @param string $name
     * @return string null
     */
    public function getUiOptionsFromMeta($name)
    {
        $ui = $this->metadata->getFieldUi($name);
        if ($ui) {
            $opt = $ui->opts ? $ui->opts : null;
            return $this->opts->getOptions($opt);
        } else {
            return null;
        }
    }

    /**
     * Vrne izbirne opcije v obliki array('label' => ?, 'flags' => ?)
     *
     * @param string $name
     * @return array
     */
    public function getUiOptionsWithFlagsFromMeta($name)
    {
        $ui = $this->metadata->getFieldUi($name);
        if ($ui) {
            $opt = $ui->opts ? $ui->opts : null;
            return $this->opts->getOptionsWithFlags($opt);
        } else {
            return null;
        }
    }

    /**
     * Potegne ikono iz metapodatkov
     *
     * @param string $name
     * @return string null
     */
    public function getUiEmptyOptionFromMeta($name)
    {
        $ui  = $this->metadata->getFieldUi($name);
        $str = $this->metadata->getFieldI18n($name);
        if ($ui) {
            $opt = $ui->empty ? $ui->empty : 'Izberi ' . $str->label;
            return $opt;
        } else {
            return 'Izberi ' . $str->label;
        }
    }

    /**
     * Potegne ikono iz metapodatkov
     *
     * @param string $name
     * @return string null
     */
    public function getUiMasterFromMeta($name)
    {
        $ui = $this->metadata->getFieldUi($name);
        if ($ui) {
            return $ui->master ? $ui->master : null;
        } else {
            return null;
        }
    }

    /**
     * Potegne lookup filtre iz metapodatkov
     * @param type $name
     * @return null
     */
    public function getUiFIltersFromMeta($name)
    {
        $ui = $this->metadata->getFieldUi($name);
        if ($ui) {
            return $ui->filters ? $ui->filters : null;
        }

        return null;
    }

    /**
     * Potegne class iz UI metapodatkov
     *
     * @param string $name
     * @return string null
     */
    public function getUiClassFromMeta($name)
    {
        $ui = $this->metadata->getFieldUi($name);
        if ($ui) {
            return $ui->class ? $ui->class : null;
        } else {
            return null;
        }
    }

    /**
     * Potegne class iz UI metapodatkov
     *
     * @param string $name
     * @return string null
     */
    public function getUiGroupFromMeta($name)
    {
        $ui = $this->metadata->getFieldUi($name);
        if ($ui) {
            return $ui->group ? $ui->group : null;
        } else {
            return null;
        }
    }

    /**
     * Potegne required iz UI metapodatkov
     *
     * @param string $name
     * @return string null
     */
    public function getUiRequiredFromMeta($name)
    {
        $ui = $this->metadata->getFieldUi($name);
        if ($ui) {
            return null !== $ui->required ? $ui->required : null;
        } else {
            return null;
        }
    }

    /**
     * Potegne class iz UI metapodatkov
     *
     * @param string $name
     * @return string null
     */
    public function getUiTargetEntityFromMeta($name)
    {
        $ui = $this->metadata->getFieldUi($name);
        if ($ui) {
            return $ui->targetEntity ? $ui->targetEntity : null;
        } else {
            return null;
        }
    }

    /**
     * Potegne grouped iz UI metapodatkov
     *
     * @param string $name
     * @return boolean
     */
    public function getUiGroupedFromMeta($name)
    {
        $ui = $this->metadata->getFieldUi($name);
        if ($ui) {
            return $ui->grouped ? $ui->grouped : false;
        } else {
            return false;
        }
    }

    /**
     * Samodejno ugotovi tip vonosnega polja iz Max anotacij in doctrine anotacij
     *
     * @param string $name
     * @return string
     */
    public function getTypeFromMeta($name)
    {
        $ui = $this->metadata->getFieldUi($name);
        if ($ui) {
            if ($ui->type) {
                return $ui->type;
            }
        }

        if ($this->metadata->getMapping()->hasField($name)) {
            $fieldMapping = $this->metadata->getMapping()->getFieldMapping($name);
            switch ($fieldMapping['type']) {
                case 'date':
                    return 'date';
                case 'boolean':
                    return 'checkbox';
                case 'datetime':
                    return 'datetime';
                case 'string':
                    return 'naziv';
                case 'text':
                    return 'textarea';
                case 'decimal':
                    return 'decimal';
                case 'cena':
                    return 'cena';
                case 'integer':
                    return 'integer';
                case 'password':
                    return 'password';
                case 'guid':
                    if ($name == 'id') {
                        return 'id';
                    } else {
                        return 'text';
                    }
            }
        }
        if ($this->metadata->getMapping()->hasAssociation($name)) {
            $fieldMapping = $this->metadata->getMapping()->getAssociationMapping($name);
            if ($fieldMapping['type'] === 3) {
                return 'toone';
            }
            if ($fieldMapping['type'] === 12) {
                return 'tomany';
            }
        }
    }

    public function getEntityClass()
    {
        return $this->entityClass;
    }

    public function setEntityClass($entityClass)
    {
        $this->entityClass = $entityClass;

        $this->metadata = $this->getMf()->factory($entityClass);

        $this->setHydrator(new DoctrineObject($this->em, $this->entityClass, false));
        $this->setObject(new $this->entityClass);
        return $this;
    }

    function getOpts()
    {
        return $this->opts;
    }

    function getMf()
    {
        return $this->mf;
    }

    function setOpts($opts)
    {
        $this->opts = $opts;
    }

    function setMf($mf)
    {
        $this->mf = $mf;
    }

}
