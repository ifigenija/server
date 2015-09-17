<?php

/*
 *  Licenca GPLv3
 */

namespace App\Filter;
use Zend\ServiceManager\ServiceLocatorAwareInterface;

/**
 * Description of DecorateEntity
 *
 * @author boris
 */
class DecorateEntity
        implements ServiceLocatorAwareInterface
{

    use \Zend\ServiceManager\ServiceLocatorAwareTrait;

    //put your code here

    public function filter($entity)
    {
        $em = $this->getServiceLocator()->get('doctrine.entitymanager.orm_default');

        $classes = $em->getConfiguration()->getMetadataDriverImpl()->getAllClassNames();
        $dl      = strlen($entity);

        foreach ($classes as $class) {
            $parts = explode('\\', $class);
            $name = array_pop($parts);
            if (strtolower($name) === strtolower($entity)) {
                return $class;
            }
        }
        return null;
    }

}
