<?php

namespace Max\Form\Element;

use Exception;
use Zend\Form\Element\Collection;
use Zend\Form\ElementPrepareAwareInterface;
use Zend\ServiceManager\ServiceLocatorAwareInterface;

/**
 * Vnosno polje, ki se uporablja za izbiro relacij
 *
 * @author boris
 */
class EntityToMany
        extends Collection
        implements ServiceLocatorAwareInterface, ElementPrepareAwareInterface
{

    use \Zend\ServiceManager\ServiceLocatorAwareTrait;

    protected $repository;
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
            $parentSl = $this->getServiceLocator()->getServiceLocator();
            $this->em = $parentSl->get('doctrine.entitymanager.orm_default');
            $this->repository          = $this->em->getRepository($this->getOption('targetEntity'));
            $this->repository->setServiceLocator($parentSl);
            $this->options['metadata'] = $parentSl->get('entity.metadata.factory')
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
            throw new Exception('Entity ni nastavljen na elementu forme');
        }
        return $this;
    }

 

}
