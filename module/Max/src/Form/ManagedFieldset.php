<?php

namespace Tip\Form;

use Doctrine\ORM\EntityManager;
use DoctrineModule\Stdlib\Hydrator\DoctrineObject;
use Tip\Annotation\EntityMetadata;
use Tip\Exception\BrezMetapodatkovPaNeGre;
use Tip\Exception\TipException;
use Tip\Form\FormModeInterface;
use Tip\Repository\IzbirneOpcije;
use Zend\Form\Fieldset;
use Zend\ServiceManager\ServiceLocatorAwareInterface;
use Zend\ServiceManager\ServiceLocatorInterface;

/**
 * Managed Fieldset ima funkcionalnost, da pridobi podatke o poljih
 * iz metapodatkov entitete.
 *
 * @author boris
 */
class ManagedFieldset
    extends Fieldset
    implements ServiceLocatorAwareInterface, FormModeInterface, \Zend\InputFilter\InputFilterProviderInterface
{

    use \Zend\ServiceManager\ServiceLocatorAwareTrait;

    /**
     * entityManager
     *
     * @var EntityManager
     */
    protected $em;

    /**
     * entityManager
     *
     * @var IzbirneOpcije
     */
    protected $opts;

    /**
     * Form Mode - change/new
     *
     * @var string
     */
    protected $mode;

    /**
     *
     * @var EntityMetadata
     */
    protected $metadata;

    /**
     * Metadata factory
     *
     * @var EntityMetadata
     */
    protected $mf;

    /**
     *  Entity Class za pridobivanje metapodatkov
     */
    protected $entityClass;

    function __construct($name = 'fieldset')
    {
        parent::__construct($name);
    }

    /**
     * Inicializacija entity managerja
     */
    public function init()
    {
        parent::init();
        $sm = $this->getServiceLocator()->getServiceLocator();
        $this->em = $sm->get('doctrine.entitymanager.orm_default');
        $this->mf = $sm->get('entity.metadata.factory');
        $this->opts = $sm->get('options.service');
        if ($this->entityClass) {
            $rep = $this->em->getRepository($this->entityClass);
            $rep->setServiceLocator($sm);
            $this->metadata = $rep->getMeta();

            $this->setHydrator(new DoctrineObject($this->em, $this->entityClass, false));
            $this->setObject(new $this->entityClass);
        }
    }

    /**
     * getter za metadata
     *
     * @return EntityMetadata
     */
    public function getMetadata()
    {
        return $this->metadata;
    }

    /**
     * setter za metadata
     *
     * @param EntityMetadata $metadata
     * @return ManagedFieldset
     */
    public function setMetadata($metadata)
    {
        $this->metadata = $metadata;
        return $this;
    }

    /**
     * getter za metadata factory
     *
     * @return Tip\Annotation\EntityMetadataFactory;
     */
    public function getMf()
    {
        return $this->mf;
    }

    /**
     * getter za entity manager
     *
     * @return EntityManager
     */
    public function getEm()
    {
        return $this->em;
    }

    /**
     * setter za entitymanager
     *
     * @param EntityManager $em
     * @return ManagedFieldset
     */
    public function setEm($em)
    {
        $this->em = $em;
        return $this;
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
     * @throws Tip\Exception\BrezMetapodatkovNeGre
     */
    public function addWithMeta($name, $options = [], $type = null)
    {
        if (!$this->metadata) {
            throw new BrezMetapodatkovPaNeGre($name . ': Polja ni mogoče dodati brez metapodatkov', 'TIP-MFS-0001');
        }
        if (!$type) {
            $type = $this->getTypeFromMeta($name);
        }
        $options = $this->addOptionsFromMeta($type, $name, $options);

        $this->add([
            'name' => $name,
            'type' => $type,
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
                    $data = $this->getUiOptionsWithFlagsFromMeta($name);
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
                    throw new TipException('Tip ni guid. Lookup samo na guid polja!', 'TIP-MFS-0002');
                }
                $target = $this->getUiTargetEntityFromMeta($name);
                if (!$target) {
                    // default je ista entiteta (scenarij unique property
                    $target = $this->metadata->getEntityName();
                }
                $options = $this->addOptionIf($options, 'targetEntity', $target);
                $options = $this->addOptionIf($options, 'master', $this->getUiMasterFromMeta($name));
            }
            if ($type == 'addresslookup') {
                $target = $this->getUiTargetEntityFromMeta($name);
                $options = $this->addOptionIf($options, 'targetEntity', $target);
                $options = $this->addOptionIf($options, 'minLength', 1);
                $options = $this->addOptionIf($options, 'master', $this->getUiMasterFromMeta($name));
            }
            if ($type == 'cena') {
                $target = $this->getUiTargetEntityFromMeta($name);
                $options = $this->addOptionIf($options, 'master', $this->getUiMasterFromMeta($name));
            }
        }
        if ($map->hasAssociation($name)) {
            $assoc = $map->getAssociationMapping($name);
            $options['targetEntity'] = $assoc['targetEntity'];
            $options = $this->addOptionIf($options, 'filters', $this->getUiFiltersFromMeta($name));

            $filters = isset($options['filters']) ? $options['filters'] : [];


            if ($type == 'select') {
                $valueOptions = $this->loadLookupOptions($name, $assoc['targetEntity'], $filters);
                $options = $this->addOptionIf($options, 'value_options', $valueOptions);
                $options = $this->addOptionIf($options, 'empty_option', $this->getUiEmptyOptionFromMeta($name));
            }

            $options = $this->addOptionIf($options, 'required', $this->getUiRequiredFromMeta($name));
            if ($this->getUiMasterFromMeta($name)) {
                $options = $this->addOptionIf($options, 'master', $this->getUiMasterFromMeta($name));
            }
        }

        $options = $this->addOptionIf($options, 'hint', $this->getHintFromMeta($name));
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
            throw new TipException('Select je samo za taka polja, ki nimajo master odvisnosti. Uporabi tip lookupSelect polje', 'TIP-MFS-0066');
        }
        $sort = ['sort_by' => 'ident', 'order' => 'asc'];
        $rep = $this->em->getRepository($targetEntity);
        $rep->setServiceLocator($this->getServiceLocator()->getServiceLocator());
        $values = $rep->lookup('', $sort, $filter);
        $arr = [];
        foreach ($values->getQuery()->getResult() as $v) {
            $arr[$v->id] = $rep->filterForSelect($v);
        }
        return $arr;
    }

    /**
     * Potegne hint iz metapodatkov
     *
     * @param string $name
     * @return string null
     */
    public function getHintFromMeta($name)
    {
        $str = $this->metadata->getFieldI18n($name);
        if ($str) {
            return $str->hint;
        } else {
            return null;
        }
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
        $ui = $this->metadata->getFieldUi($name);
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
        if ($ui)
            return $ui->filters ? $ui->filters : null;

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
     * Samodejno ugotovi tip vonosnega polja iz Tip anotacij in doctrine anotacij
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
            if ($fieldMapping['type'] && 3) {
                return 'toone';
            }
            if ($fieldMapping['type'] && 12) {
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
        return $this;
    }

    public function getInputFilterSpecification()
    {
        return [];
    }

}
