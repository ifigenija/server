<?php

/*
 *  Licenca GPLv3
 */

namespace App\Filter;

/**
 * Description of DecorateEntity
 *
 * @author boris
 */
class DecorateEntity
        implements \Zend\ServiceManager\ServiceLocatorAwareInterface
{

    use \Zend\ServiceManager\ServiceLocatorAwareTrait;

    //put your code here

    public function filter($entity)
    {
        $em = $this->getServiceLocator()->get('doctrine.entitymanager.orm_default');

        $classes = $em->getConfiguration()->getMetadataDriverImpl()->getAllClassNames();
        $dl      = strlen($entity);

        foreach ($classes as $class) {
            if (strtolower(substr($class, -$dl)) === strtolower($entity)) {
                return $class;
            }
        }
        return null;
    }

}
