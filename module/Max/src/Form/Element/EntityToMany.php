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
class EntityToMany
        extends \Zend\Form\Element\Collection
        implements InputProviderInterface, ServiceLocatorAwareInterface, ElementPrepareAwareInterface
{

    use \Zend\ServiceManager\ServiceLocatorAwareTrait;

    /*
     * Set options for an element. Accepted options are:
     * - target_entity: label to associate with the element
     *
     * @param  array|\Traversable $options
     * @return DateTime|ElementInterface
     */

    public function setOptions($options)
    {

        // preverim metapodatke in nastavim privzete vrednosti iz le-teh
        // če sem dobil entity potem naredim metadata in repositorij
        if ($this->getOption('targetEntity')) {
            $this->repository          = $this->em->getRepository($this->getOption('targetEntity'));
            $this->repository->setServiceLocator($this->serviceLocator->getServiceLocator());
            $this->options['metadata'] = $this->sm
                    ->get('entity.metadata.factory')
                    ->factory($this->getOption('targetEntity'));

            $targetEl = new EntityToOne();
            $targetEl->setServiceLocator($this->getServiceLocator());
            $targetEl->setOptions([
                "targetEntity" => $this->getOption('targetEntity'),
                "required"     => true
            ]);

            $options['target_element'] = $targetEl;
        }

        parent::setOptions($options);


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
            $v     = new \DoctrineModule\Validator\ObjectExists([
                'object_repository' => $this->repository,
                'fields'            => 'id'
            ]);

            if ($this->getOption('required') !== true) {
                $chain->addValidator(new \Zend\Validator\NotEmpty(), true);
                $chain->addValidator(new \Zend\Validator\Regex('/[a-z0-9-]{36}/'), true);
            } else {
                $chain->addValidator(new \Zend\Validator\Regex('/^$|[a-z0-9-]{36}/'), true);
            }

            $chain->addValidator($v, true);
            $this->validators = $chain;
        }
        return $this->validators;
    }

}
