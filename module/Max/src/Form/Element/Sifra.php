<?php

namespace Max\Form\Element;

use DoctrineModule\Validator\NoObjectExists;
use DoctrineModule\Validator\UniqueObject;
use Exception;
use Max\Annotation\EntityMetadata;
use Max\Exception\NevaljavenEntityMetadata;
use Max\Form\FormModeInterface;
use Max\Repository\AbstractMaxRepository;
use Traversable;
use Zend\Form\Element\Text;
use Zend\Form\ElementInterface;
use Zend\InputFilter\InputProviderInterface;
use Zend\ServiceManager\ServiceLocatorAwareInterface;
use Zend\ServiceManager\ServiceLocatorInterface;
use Zend\Validator\NotEmpty;
use Zend\Validator\StringLength;
use Zend\Validator\ValidatorChain;

/**
 * Vnosno polje za sifre, z validatorji, ki preverjajo veljavnost šifre
 *
 * @author boris
 */
class Sifra
    extends Text
    implements InputProviderInterface, FormModeInterface, ServiceLocatorAwareInterface
{

    /**
     * Seed attributes
     *
     * @var array
     */
    protected $attributes = [
        'type' => 'text',
        'class' => 'sifra-polje'
    ];
    protected $em;
    protected $validators;

    /**
     *
     * @var AbstractMaxRepository
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

    public function getServiceLocator()
    {
        return $this->serviceLocator;
    }

    public function setServiceLocator(ServiceLocatorInterface $serviceLocator)
    {
        $this->serviceLocator = $serviceLocator;
        $this->em = $serviceLocator->getServiceLocator()->get('doctrine.entitymanager.orm_default');

        return $this;
    }

    protected function getValidators()
    {

        if (null === $this->validators) {
            $chain = new ValidatorChain();

            if ($this->getOption('required')) {
                $chain->addValidator(new NotEmpty(), true);
            }
            $chain->addValidator(new StringLength(
                [
                'min' => 0,
                'max' => $this->getOption('maxlength')
                ]
            ));

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
                        'fields' => $this->getName(),
                        'use_context' => true
                    ]);
                    $chain->addValidator($val);
                }
            }
            $this->validators = $chain;
        }
        return $this->validators;
    }

    /**
     * Nastavi opcije za polje kratka šifra.
     * Privzeto je to dolžina min 1 in max 3
     * maxLength,
     *
     * @param  array|Traversable $options
     * @return ElementInterface
     */
    public function setOptions($options)
    {
        parent::setOptions($options);

        if (isset($this->options['targetEntity'])) {
            $this->repository = $this->em->getRepository($this->options['targetEntity']);
            $this->repository->setServiceLocator($this->serviceLocator->getServiceLocator());
            $this->metadata = $this->repository->getMeta();
        }

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
        } else {
            $this->setAttribute('required', $this->options['required']);
        }

        if (!isset($this->options['maxlength'])) {
            $this->options['maxlength'] = 10;
        }
        $this->setAttribute('maxlength', $this->options['maxlength']);

        if (isset($this->options['uniqueProperty'])) {
            if (!$this->repository) {
                throw new Exception('uniqueProperty zahteva repository');
            }
            $this->uniqueProperty = $this->options['uniqueProperty'];
        }

        return $this;
    }

    /**
     * Provide default input rules for this element
     *
     * Attaches the captcha as a validator.
     *
     * @return array
     */
    public function getInputSpecification()
    {
        $spec = [
            'name' => $this->getName(),
            'filters' => [
                ['name' => 'StripTags'],
                ['name' => 'HtmlEntities', 'options' => ['quotestyle' => ENT_QUOTES]],
                ['name' => 'StringTrim'],
                ['name' => 'StringToUpper'],
            ],
            'required' => $this->getOption('required'),
            'validators' => $this->getValidators()
        ];

        return $spec;
    }

    public function getMode()
    {
        return $this->mode;
    }

    public function setMode($mode)
    {
        $this->mode = $mode;
        return $this;
    }

}
