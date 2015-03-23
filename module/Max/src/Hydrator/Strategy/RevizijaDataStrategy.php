<?php

namespace Tip\Stdlib\Hydrator\Strategy;

use Zend\Stdlib\Hydrator\Strategy\StrategyInterface;
use Zend\ServiceManager\ServiceLocatorAwareInterface;
use Zend\ServiceManager\ServiceLocatorInterface;

class RevizijaDataStrategy implements StrategyInterface, ServiceLocatorAwareInterface {

    /**
     * @var ServiceLocatorInterface
     */
    protected $serviceLocator;
    
    /**
     * @var Doctrine\ORM\EntityManager
     */
    protected $em;
    
    /**
     * @var Tip\Annotation\EntityMetadata
     */
    protected $ann;
    
    /**
     * @var Tip\Repository\IzbirneOpcije
     */
    protected $options;
    
    /**
     * @var array
     */
    protected $mapping;
    
    /**
     * @var string
     */
    protected $entityClass;

    function __construct($serviceLocator, $objectManager, $entityClass) {
        $metaFactory = $serviceLocator->get('entity.metadata.factory');
        $this->em = $objectManager;
        $this->ann = $metaFactory->factory($entityClass);
        $this->options = $serviceLocator->get('options.service');
        $this->mapping = $this->ann->getMapping()->getAssociationMappings();
        $this->entityClass = $entityClass;
        $this->setServiceLocator($serviceLocator);
    }

    public function getServiceLocator() {
        return $this->serviceLocator;
    }

    public function setServiceLocator(ServiceLocatorInterface $serviceLocator) {
        $this->serviceLocator = $serviceLocator;
    }

    /**
     * Vrne repozitorij entitete
     * 
     * @param string $entityClass
     * @return \Tip\Repository\AbstractTipRepository
     * @throws \Tip\Exception\TipException
     */
    protected function getRepository($entityClass) {
        $rep = $this->em->getRepository($entityClass);
        if ($rep instanceof \Tip\Repository\AbstractTipRepository) {
            $rep->setServiceLocator($this->getServiceLocator());
            return $rep;
        } else {
            throw new \Tip\Exception\TipException("Repozitorij entitete '$entityClass' mora dedovati '\Tip\Repository\AbstractTipRepository'.", 'TIP-REV-0002');
        }
    }

    /**
     * Ali je polje asociacija
     * 
     * @param string $field
     * @return bool
     */
    protected function isAssociation($field) {
        return array_key_exists($field, $this->mapping);
    }
    
    /**
     * Ali je polje kolekcija
     * 
     * @param string $field
     * @return bool
     */
    protected function isCollection($field) {
        return $this->isAssociation($field) && $this->mapping[$field]['type'] >= 4;
    }

    /**
     * Vrne Entity class tarče asociacije
     * @param string $field
     * @return string
     */
    protected function getAssociationTarget($field) {
        return $this->mapping[$field]['targetEntity'];
    }

    /**
     * Vrne prikazno vrednost izbirnih opcij
     * 
     * @param string $field
     * @param string $value
     * @return string
     */
    public function extractOption($field, $value) {
        $ui = $this->ann->getFieldUI($field);
        if ($ui && $ui->opts) {
            $values = $this->options->getOptions($ui->opts);
            if (array_key_exists($value, $values)) {
                return $values[$value];
            }
        }
        return $value;
    }

    /**
     * Vrne prikazno vrednost asociacije
     * 
     * @param string $field
     * @param string $id
     * @return string
     */
    public function extractAssociation($field, $id) {
        if (!$id) return null; // nima asociacije
        
        $targetClass = $this->getAssociationTarget($field);
        $rep = $this->getRepository($targetClass);
        $lookup = $rep->getMeta()->getLookup();
        $ident = $rep->getMeta()->getIdent();
        $entity = $rep->find($id);
        
        if (!$entity) {
            return "$id (izbrisan)";
        }
        if ($lookup) {
            $data = $rep->filterForLookup($entity);
            $label = $data['label'];
            $ident = $data['ident'];
            
            if ($label && $ident) {
                return "{$label} ({$ident})";
            } elseif ($label) {
                return $label;
            } elseif ($ident) {
                return $ident;
            }
        }
        if ($ident) {
            return $entity->$ident;
        }
        return $id;
    }
    
    /**
     * Vrne prikazno vrednost spremembe polja
     * 
     * @param string $field
     * @param string $value
     * @return array
     */
    public function extractField($field, $value) {
        if ($this->isAssociation($field)) {
            return [
                'old' => $this->extractAssociation($field, $value[0]),
                'new' => $this->extractAssociation($field, $value[1])
            ];
        } else {
            return [
                'old' => $this->extractOption($field, $value[0]),
                'new' => $this->extractOption($field, $value[1])
            ];
        }
    }
    
    /**
     * Vrne prikazne vrednosti sprememb kolekcij
     * 
     * @param string $field
     * @param array $collection
     * @return array
     */
    public function extractCollection($field, $collection) {
        $result = [];
        foreach ($collection as $value) {
            list($op, $id) = $value;
            $result[] = [
                'op' => $op,
                'value' => $this->extractAssociation($field, $id)
            ];
        }
        return $result;
    }

    /**
     * Vrne prikazne vrednosti sprememb celotne entitete
     * 
     * @param type $data
     * @return array
     */
    public function extract($data) {
        $result = [];
        foreach ($data as $field => $value) {
            $i18n = $this->ann->getFieldI18n($field);
            $label = ($i18n && $i18n->label) ? $i18n->label : $field;
                
            if ($this->isCollection($field)) {
                $result[$label] = $this->extractCollection($field, $value);
            } else {
                $result[$label] = $this->extractField($field, $value);
            }
        }
        return $result;
    }

    public function hydrate($value) {
        throw new \Exception('Not implemented.');
    }

}
