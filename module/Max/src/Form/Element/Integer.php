<?php

namespace Max\Form\Element;

use DoctrineModule\Validator\NoObjectExists;
use DoctrineModule\Validator\UniqueObject;
use Exception;
use Max\Ann\EntityMetadata;
use Max\Exception\NevaljavenEntityMetadata;
use Max\Form\FormModeInterface;
use Max\Repository\AbstractTipRepository;
use Traversable;
use Zend\Form\Element\Text;
use Zend\Form\ElementInterface;
use Zend\InputFilter\InputProviderInterface;
use Zend\ServiceManager\ServiceLocatorAwareInterface;
use Zend\ServiceManager\ServiceLocatorInterface;
use Zend\Validator\GreaterThan;
use Zend\Validator\LessThan;
use Zend\Validator\NotEmpty;
use Zend\Validator\ValidatorChain;

/**
 * Vnosno polje za integer številke
 *
 * @author boris
 */
class Integer extends Text implements InputProviderInterface, FormModeInterface, ServiceLocatorAwareInterface {

    /**
     * Seed attributes
     *
     * @var array
     */
    protected $attributes = [
        'type' => 'text',
        'class' => 'integer-polje'
    ];
    protected $em;
    protected $validators;

    /**
     *
     * @var AbstractTipRepository
     */
    protected $repository;
    protected $uniqueProperty;
    protected $mode = 'NEW';
    protected $serviceLocator;

    /**
     * Metadata za dolžine, required, classname....
     *
     * @var EntityMetadata
     */
    protected $metadata;

    public function getServiceLocator() {
        return $this->serviceLocator;
    }

    public function setServiceLocator(ServiceLocatorInterface $serviceLocator) {
        $this->serviceLocator = $serviceLocator;
        $this->em = $serviceLocator->getServiceLocator()->get('doctrine.entitymanager.orm_default');

        return $this;
    }

    protected function getValidators() {

        if (null === $this->validators) {
            $chain = new ValidatorChain();

            if ($this->options['required']) {
                $chain->addValidator(new NotEmpty(), true);
            }
            if (isset($this->options['min'])) {
                $chain->addValidator(
                        new GreaterThan([
                    'min' => $this->options['min'],
                    'inclusive' => true
                        ])
                );
            }
            if (isset($this->options['max'])) {
                $chain->addValidator(
                        new LessThan([
                    'max' => $this->options['max'],
                    'inclusive' => true
                        ])
                );
            }
            if ($this->uniqueProperty) {
                if ($this->mode == 'NEW') {
                    $val = new NoObjectExists([
                        'object_repository' => $this->repository,
                        'fields' => $this->getName(),
                    ]);
                    $chain->addValidator($val);
                } else {
                    $val = new UniqueObject([
                        'object_repository' => $this->repository,
                        'object_manager' => $this->em,
                        'use_context' => true,
                        'fields' => $this->getName(),
                    ]);
                    $chain->addValidator($val);
                }
            }
            $this->validators = $chain;
        }
        return $this->validators;

        return;
    }

    /**
     * Nastavi opcije za polje kratka šifra.
     * Privzeto je to dolžina min 1 in max 3
     * maxLength,
     *
     * @param  array|Traversable $options
     * @return ElementInterface
     */
    public function setOptions($options) {
        parent::setOptions($options);

        if (isset($this->options['metadata'])) {
            if ($this->options['metadata'] instanceof EntityMetadata) {
                $this->metadata = $this->options['metadata'];
                $this->repository = $this->em->getRepository($this->metadata->getEntityName());
                $this->repository->setServiceLocator($this->serviceLocator->getServiceLocator());
            } else {
                throw new NevaljavenEntityMetadata(
                'Neveljavni metapodatki v elementu sifra');
            }
        }

        if (!isset($this->options['required'])) {
            $this->options['required'] = true;
        }

        if (!isset($this->options['min'])) {
            $this->options['min'] = 0;
        }

        if (isset($this->options['uniqueProperty'])) {
            if (!$this->repository) {
                throw new Exception('uniqueProperty zahteva repository');
            }
            $this->uniqueProperty = $this->options['uniqueProperty'];
        }
        $this->setAttribute('data-attach', 'spinner');
        return $this;
    }

    /**
     * Provide default input rules for this element
     *
     * Attaches the captcha as a validator.
     *
     * @return array
     */
    public function getInputSpecification() {
        $spec = [
            'name' => $this->getName(),
            'filters' => [
                ['name' => 'Int'],
                ['name' => 'Null']
            ],
            'required' => $this->getOption('required'),
            'validators' => $this->getValidators()
        ];

        return $spec;
    }

    public function getMode() {
        return $this->mode;
    }

    public function setMode($mode) {
        $this->mode = $mode;
        return $this;
    }

}


