<?php

namespace Tip\Stdlib\Hydrator\Strategy;

use InvalidArgumentException;
use Doctrine\Common\Collections\Collection;
use Doctrine\Common\Persistence\Mapping\ClassMetadata;
use Zend\Stdlib\Hydrator\Strategy\StrategyInterface;

/**
 * Strategija za extract in hidriranje kolekcije objektov
 */
class MultivaluedObjectStrategy extends \DoctrineModule\Stdlib\Hydrator\Strategy\AllowRemoveByReference
        implements StrategyInterface
{

    protected $hydr;

    function __construct($objectManager, $entityClass, $options, $serviceLocator)
    {
        // @TODO uporaba hidratorja objekta bi lahko bila optional
        //$this->hydr = new \Tip\Stdlib\Hydrator\Json($objectManager, $entityClass);
        $rep = $objectManager->getRepository($entityClass);
        $rep->setServiceLocator($serviceLocator);
        $this->hydr = $rep->getJsonHydrator($options);
    }

    /**
     * {@inheritDoc}
     */
    public function extract($value)
    {
        $arr = [];
        if (null !== $value) {
            foreach ($value as $object) {
                $arr[] = $this->hydr->extract($object);
            }
        }
        return $arr;
    }

}

