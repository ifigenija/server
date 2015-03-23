<?php

/*
 * 
 */

namespace Tip\Stdlib\Hydrator\Strategy;

/**
 * Strategija, ki hidrira objekte v {id:"",ident:"",label:""}
 *
 * @author boris
 */
class LabelIdentStrategy
    implements \Zend\Stdlib\Hydrator\Strategy\StrategyInterface
{

    use \Zend\ServiceManager\ServiceLocatorAwareTrait;

    /**
     *
     * @var \Tip\Repository\AbstractTipRepository
     *  
     */
    protected $rep;

    function __construct($objectManager, $entityClass, $serviceLocator)
    {
        $this->rep = $objectManager->getRepository($entityClass);
        $this->rep->setServiceLocator($serviceLocator);            
        $this->setServiceLocator($serviceLocator);
    }

    public function extract($value)
    {
        if ($value) {
            return $this->rep->filterForLookup($value);
        }
        return $value;
    }

    public function hydrate($value)
    {
        if (is_string($value)) {
            return $value;
        }
        if (is_array($value)) {
            return $value['id'];
        } else {
            return null;
        }
    }

}
