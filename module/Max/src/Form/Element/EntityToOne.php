<?php

namespace Max\Form\Element;

use Zend\Form\Element\Text as ZendText;
use Zend\InputFilter\InputProviderInterface;
use Zend\ServiceManager\ServiceLocatorAwareInterface;
use Zend\Form\ElementPrepareAwareInterface;
use Max\Filter;

/**
 * Vnosno polje, ki se uporablja za izbiro relacij
 *
 * @author boris
 */
class EntityToOne
        extends ZendText
        implements InputProviderInterface, ServiceLocatorAwareInterface, ElementPrepareAwareInterface
{

    use \Zend\ServiceManager\ServiceLocatorAwareTrait;

    /**
     *
     * @var \Doctrine\ORM\EntityRepository
     */
    protected $repository;

    /**
     *
     * @var \Doctrine\ORM\EntityManager
     */
    protected $sm;

    /**
     *
     * @var \Doctrine\ORM\EntityManager
     */
    protected $em;

    /**
     *
     * @var \Max\Ann\EntityMetadata
     */
    protected $metadata;

    public function init()
    {
        $this->sm = $this->getServiceLocator()->getServiceLocator();
        $this->em = $this->sm->get('doctrine.entitymanager.orm_default');
    }

    public function getObjectRepository()
    {
        return $this->repository;
    }

    /**
     * Seed attributes
     *
     * @var array
     */
    protected $attributes = [
        'type' => 'toone'
    ];
    protected $validators;


    /*
     * Set options for an element. Accepted options are:
     * - label: label to associate with the element
     * - label_attributes: attributes to use when the label is rendered
     * - format: datetime format - php format value
     * - metadata: doctrine metadata for entity
     *
     * @param  array|\Traversable $options
     * @return DateTime|ElementInterface
     */

    public function setOptions($options)
    {
        parent::setOptions($options);

        // preverim metapodatke in nastavim privzete vrednosti iz le-teh
        // če sem dobil entity potem naredim metadata in repositorij
        if ($this->getOption('targetEntity')) {
            $this->repository          = $this->em->getRepository($this->getOption('targetEntity'));
            $this->repository->setServiceLocator($this->serviceLocator->getServiceLocator());
            $this->options['metadata'] = $this->sm
                    ->get('enetity.metadata.factory')
                    ->factory($this->getOption('targetEntity'));
        }


        // če sem dobil metadata pa pridobim repositorij
        if (isset($this->options['metadata'])) {
            $this->metadata = $this->options['metadata'];
            if (!$this->repository) {
                $this->repository = $this->em->getRepository($this->metadata->getEntityName());
            }

            // če ima field master relacijo, poiščemo target field po katerem filtriramo
            if (isset($options['master'])) {
                $masterField                   = $options['master'];
                $mapping                       = $options['metadata']->getMapping();
                $assoc                         = $mapping->getAssociationMapping($masterField);
                $masterTargetMeta              = $this->em->getClassMetadata($assoc['targetEntity']);
                $masterLookupAssoc             = $masterTargetMeta->getAssociationsByTargetClass($options['targetEntity']);
                $this->options['masterLookup'] = array_values($masterLookupAssoc)[0]['mappedBy'];
            }
        }



        if ($this->metadata && !$this->getOption('targetEntity')) {
            $dmap = $this->metadata->getMapping();
            if ($dmap->hasField($this->getName())) {

                $mapping = $dmap->getFieldMapping($this->getName());
                if ($mapping['type'] !== 'guid') {
                    throw new \Exception('Tip ni guid. Lookup samo na guid polja!');
                }
                $this->options['required'] = !$mapping['nullable'];
                $this->setAttribute('required', !$mapping['nullable']);
            } elseif ($dmap->hasAssociation($this->getName())) {

                $assoc                         = $dmap->getAssociationMapping($this->getName());
                $this->options['targetEntity'] = $assoc['targetEntity'];
            } else {
                throw new \Exception(sprintf('Entity nima elementa %s', $this->getName()));
            }
        }

        // če ni uspelo nastaviti repositorija in ciljnih metapodatkov potem
        // ne moremo nadaljevat
        if (!$this->repository) {
            throw new \Exception('Entity ni nastavljen na elementu forme');
        }
        return $this;
    }

    /**
     * Validatorji
     * @return type
     */
    protected function getValidators()
    {
        if (null === $this->validators) {

            $chain = new \Zend\Validator\ValidatorChain();

            if ($this->getOption('required') !== true) {
                $chain->addValidator(new \Zend\Validator\NotEmpty(), true);
                $chain->addValidator(new \Zend\Validator\Regex('/[a-z0-9-]{36}/'), true);
            } else {
                $chain->addValidator(new \Zend\Validator\Regex('/^$|[a-z0-9-]{36}/'), true);
            }
            $v                = new \DoctrineModule\Validator\ObjectExists([
                'object_repository' => $this->repository,
                'fields'            => 'id'
            ]);
            $chain->addValidator($v, true);
            $this->validators = $chain;
        }
        return $this->validators;
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
        $ef   = new Filter\EntityToOne();
        $spec = [
            'name'       => $this->getName(),
            'filters'    => [new \Zend\Filter\Null(), $ef],
            'required'   => $this->getOption('required'),
            'validators' => $this->getValidators()
        ];

        return $spec;
    }

    /**
     * Prepare the form element (mostly used for rendering purposes)
     *
     * @param  FormInterface $form
     * @return mixed
     */
    public function prepareElement(\Zend\Form\FormInterface $form)
    {
        $name = $this->getName();
        if (isset($this->options['master'])) {
            $master                  = preg_replace('/\[\w+\]$/', '[' . $this->options['master'] . ']', $name);
            $this->options['master'] = $master;
        }
    }

    function getRepository()
    {
        return $this->repository;
    }

    function getEm()
    {
        return $this->em;
    }

    function getMetadata()
    {
        return $this->metadata;
    }

    function setRepository(\Doctrine\ORM\EntityRepository $repository)
    {
        $this->repository = $repository;
        return $this;
    }

    function setEm(\Doctrine\ORM\EntityManager $em)
    {
        $this->em = $em;
        return $this;
    }

    function setMetadata(\Max\Ann\EntityMetadata $metadata)
    {
        $this->metadata = $metadata;
        return $this;
    }

}
