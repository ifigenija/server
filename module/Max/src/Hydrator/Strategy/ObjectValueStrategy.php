<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Tip\Stdlib\Hydrator\Strategy;

/**
 * Description of DateString
 *
 * @author boris
 */
class ObjectValueStrategy
    implements \Zend\Stdlib\Hydrator\Strategy\StrategyInterface
{

    use \Zend\ServiceManager\ServiceLocatorAwareTrait;

    protected $hydr;

    function __construct($objectManager, $entityClass, $options = [], $serviceLocator)
    {
        $rep = $objectManager->getRepository($entityClass);
        $rep->setServiceLocator($serviceLocator);
        $this->setServiceLocator($serviceLocator);
        if ($rep instanceof \Tip\Repository\AbstractTipRepository) {
            $this->hydr = $rep->getJsonHydrator($options);
        } else {
            $this->hydr = new \Tip\Stdlib\Hydrator\Json($objectManager, $entityClass);
            $this->hydr->setServiceLocator($serviceLocator);
        }
    }

    public function extract($value)
    {
        if ($value) {
            return $this->hydr->extract($value);
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
