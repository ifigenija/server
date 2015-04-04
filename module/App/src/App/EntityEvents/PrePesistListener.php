<?php

/**
 * (copyleft) Licenca
 */

namespace App\EntityEvents;

use Doctrine\Common\EventSubscriber;
use Doctrine\ORM\Event\LifecycleEventArgs;
use Doctrine\ORM\Events;

/**
 * Opis GenerateIdListener
 *
 * @author Boris Lašič <boris@max.si>
 * Ustvarjeno: 18.4.2013
 */
class PrePersistListener
        implements EventSubscriber
{

    protected $map;

    function __construct($map)
    {
        $this->setEntityMap($map);
        return $this;
    }

    public function getSubscribedEvents()
    {
        return [Events::prePersist];
    }

    public function prePersist(LifecycleEventArgs $eventArgs)
    {
        // onFlush was executed before, everything already initialized
        $entity = $eventArgs->getEntity();

        $em = $eventArgs->getEntityManager();
        $meta = $em->getClassMetadata(get_class($entity));
        $id = $meta->getIdentifier()[0];
        $getid = 'get' . ucfirst($id);
        $setid = 'set' . ucfirst($id);
        $map = $meta->getFieldMapping($id);
        if ($map['type'] == 'guid') {
            if (!$entity->$getid()) {
                $entity->$setid($this->getNewId($meta->name));
            }
        }
    }

    /**
     * Kreiranje novega guid-a za id novih entitet
     * @return guid
     */
    public function getNewID($entity)
    {
        $arr = explode('\\',$entity);
        $prefix = $this->map[array_pop($arr)];
        $time = time();
        return sprintf('%04x%04x-%04x-%04x-%04x-%04x%04x%04x',
                // entity prefix, tennant 
                
                $prefix,                 0x0000,
                // 16 bits for "time_mid"
                $time  >> 16,
                $time & 0x0000FFFF ,
                // 16 bits for "time_hi_and_version",
                // four most significant bits holds version number 4
                
                // 16 bits, 8 bits for "clk_seq_hi_res",
                // 8 bits for "clk_seq_low",
                // two most significant bits holds zero and one for variant DCE1.1
                mt_rand(0, 0xffff),
                // 48 bits for "node"
                mt_rand(0, 0xffff), mt_rand(0, 0xffff), mt_rand(0, 0xffff)
        );
    }



    public function setIdentity($identity)
    {
        if (is_object($identity)) {
            $this->identity = $identity->getUsername();
            return $this;
        }
        $this->identity = $identity;
        return $this;
    }

    public function setEntityMap($map)
    {
        $this->map = $map;
    }

}
