<?php

namespace Aaa\EntityEvents;

use Doctrine\Common\EventSubscriber;
use Doctrine\ORM\Events;
use Doctrine\ORM\Event\OnFlushEventArgs;
use Zend\ServiceManager\ServiceLocatorAwareInterface;
use Zend\ServiceManager\ServiceLocatorInterface;

class RevisionsListener
        implements EventSubscriber,
        ServiceLocatorAwareInterface
{

    private $tableName = 'revizije';

    /**
     * @var Doctrine\DBAL\Connection
     */
    private $conn;

    /**
     * @var Doctrine\DBAL\Platforms\AbstractPlatform
     */
    private $platform;

    /**
     * @var Doctrine\ORM\EntityManager
     */
    private $em;

    /**
     * @var Doctrine\ORM\UnitOfWork
     */
    private $uow;

    /**
     * @var ServiceLocatorInterface
     */
    private $serviceLocator;

    /**
     * @var \Aaa\Entity\User
     */
    private $identity;

    /**
     * @var \Max\Ann\EntityMetadataFactory
     */
    private $metaFactory;

    /**
     * @var array<Entity>
     */
    protected $entities = [];

    /**
     * @var array<PersistentCollection>
     */
    protected $collections = [];

    /**
     * Polje obdelanih sprememb
     *
     * Vzorec:
     * $changes[entityId] =
     *      entity: Entity,
     *      type: 'INS' / 'UPD' / 'DEL',
     *      data:
     *          polje1: ['staraVrednost', 'novaVrednost'],
     *          kolekcija1:
     *              ['+', reverseEntityId1],
     *              ['-', reverseEntityId2],
     *
     * @var array
     */
    protected $changes = [];

    public function __construct(ServiceLocatorInterface $serviceLocator, $identity)
    {
        $this->identity = $identity;
        $this->metaFactory = $serviceLocator->get('entity.metadata.factory');
        $this->setServiceLocator($serviceLocator);
    }

    public function getServiceLocator()
    {
        return $this->serviceLocator;
    }

    public function setServiceLocator(ServiceLocatorInterface $serviceLocator)
    {
        $this->serviceLocator = $serviceLocator;
    }

    public function getSubscribedEvents()
    {
        return [Events::onFlush];
    }

    /**
     * Ob onFlush dogodku dobimo vse spremembe polj in kolekcij ter
     * jih zapišemo v revizije
     *
     * @param \Doctrine\ORM\Event\OnFlushEventArgs $eventArgs
     */
    public function onFlush(OnFlushEventArgs $eventArgs)
    {
        $this->em = $eventArgs->getEntityManager();
        $this->conn = $this->em->getConnection();
        $this->uow = $this->em->getUnitOfWork();
        $this->platform = $this->conn->getDatabasePlatform();

        $changes = $this->getChanges();
        $this->saveChanges($changes);
    }

    /**
     * Vrne obdelan array vseh sprememb polj in kolekcij.
     * Glej $this->changes za vzorec
     *
     * @return array
     */
    public function getChanges()
    {
        $this->cleanUp();
        $this->fetchScheduledChanges();
        $this->processEntities();
        $this->processCollections();
        $this->processInverseCollections();
        return $this->changes;
    }

    /**
     * Zapiše vse spremenjene entitete in kolekcije za nadaljno obdelavo
     */
    protected function fetchScheduledChanges()
    {
        $this->collections = array_values($this->uow->getScheduledCollectionUpdates());
        $this->entities = array_merge(
                array_values($this->uow->getScheduledEntityInsertions()), array_values($this->uow->getScheduledEntityUpdates()),
                array_values($this->uow->getScheduledEntityDeletions())
        );
    }

    /**
     * Obdela spremembe polj entitet
     */
    protected function processEntities()
    {
        foreach ($this->entities as $entity) {
            $this->checkBaseEntity($entity);
            if ($this->uow->isScheduledForInsert($entity)) {
                // INSERT - ni sprememb
                $this->addChanges($entity, 'INS');
            } elseif ($this->uow->isScheduledForUpdate($entity)) {
                // UPDATE - shrani samo spremembe
                $class = get_class($entity);
                $changes = $this->getEntityChanges($entity);
                foreach ($changes as $field => $change) {
                    if ($this->isFieldTracked($class, $field)) {
                        $this->addChanges($entity, 'UPD', [$field => $change]);
                    }
                }
            } elseif ($this->uow->isScheduledForDelete($entity)) {
                // DELETE - shrani zadnje stanje entitete
                $data = $this->getEntityData($entity);
                $this->addChanges($entity, 'DEL', $data);
            }
        }
    }

    /**
     * Obdela spremembe kolekcij
     */
    protected function processCollections()
    {
        foreach ($this->collections as $collection) {
            if ($this->isCollectionTracked($collection)) {
                $entity = $collection->getOwner();
                $mapping = $collection->getMapping();
                $field = $mapping['fieldName'];

                $this->checkBaseEntity($entity);

                // shranimo samo spremembe obstoječih entitet (ignoriramo nove)
                if (!$this->uow->isScheduledForInsert($entity)) {
                    foreach ($collection->getInsertDiff() as $inverseEntity) {
                        $this->checkBaseEntity($inverseEntity);
                        $this->addCollectionChange($entity, 'UPD', $field, '+', $inverseEntity);
                    }

                    foreach ($collection->getDeleteDiff() as $inverseEntity) {
                        $this->checkBaseEntity($inverseEntity);
                        $this->addCollectionChange($entity, 'UPD', $field, '-', $inverseEntity);
                    }
                }
            }
        }
    }

    /**
     * Obdela spremembe inverznih M:N kolekcij
     */
    protected function processInverseCollections()
    {
        foreach ($this->collections as $collection) {
            $mapping = $collection->getMapping();

            // zapišemo spremembe inverznih kolekcij M:N
            if ($mapping['type'] >= 8 && $this->isCollectionTracked($collection)) {
                $entity = $collection->getOwner();
                $inverseField = $mapping['inversedBy'];

                foreach ($collection->getInsertDiff() as $inverseEntity) {
                    if (!$this->uow->isScheduledForInsert($inverseEntity)) {
                        $this->addCollectionChange($inverseEntity, 'UPD', $inverseField, '+', $entity);
                    }
                }

                foreach ($collection->getDeleteDiff() as $inverseEntity) {
                    if (!$this->uow->isScheduledForInsert($inverseEntity)) {
                        $this->addCollectionChange($inverseEntity, 'UPD', $inverseField, '-', $entity);
                    }
                }
            }
        }
    }

    /**
     * Vrne array sprememb polj posamezne entitete
     *
     * @param Entity $entity
     * @return array
     */
    protected function getEntityChanges($entity)
    {
        $result = [];
        $changes = $this->uow->getEntityChangeSet($entity);
        foreach ($changes as $field => $change) {
            list($old, $new) = $change;
            if ($this->isEntity($old)) {
                $old = $old ? $old->getId() : $old;
            }
            if ($this->isEntity($new)) {
                $new = $new ? $new->getId() : $new;
            }
            if ($old != $new) {
                $result[$field] = [$old, $new];
            }
        }
        return $result;
    }

    /**
     * Vrne array vrednosti polj posamezne entitete
     *
     * @param Entity $entity
     * @return array
     */
    protected function getEntityData($entity)
    {
        $data = $entity->getArrayCopy();
        $result = [];
        foreach ($data as $field => $value) {
            if ($this->isEntity($value)) {
                $result[$field] = $value->getId();
            } elseif ($this->isCollection($value)) {
                foreach ($value as $entity) {
                    $result[$field][] = $entity->getId();
                }
            } else {
                $result[$field] = $value;
            }
        }
        return $result;
    }

    /**
     * Inicializira spremembo entitete v $this->changes
     *
     * @param Entity $entity
     * @param string $type
     */
    protected function initChange($entity, $type)
    {
        $id = $entity->getId();
        if (!isset($this->changes[$id])) {
            $this->changes[$id] = [
                'entity' => $entity,
                'type' => $type,
                'data' => []
            ];
        }
    }

    /**
     * Doda spremembo kolekcije v $this->changes
     *
     * @param type $entity          lastnik kolekcije
     * @param type $type            tip spremembe entitete ('INS' 'UPD', 'DEL')
     * @param type $field           polje kolekcije
     * @param type $op              operacija ('+' ali '-')
     * @param type $inverseEntity   entiteta dodana v kolekcijo
     */
    protected function addCollectionChange($entity, $type, $field, $op, $inverseEntity)
    {
        $this->initChange($entity, $type);

        $id = $entity->getId();
        $this->changes[$id]['data'][$field][] = [$op, $inverseEntity->getId()];
    }

    /**
     * Doda array sprememb entitete v $this->changes
     *
     * @param type $entity  entiteta sprememb
     * @param type $type    tip spremembe entitete ('INS' 'UPD', 'DEL')
     * @param type $data    array sprememb (polje => [staraVrednost, novaVrednost])
     */
    protected function addChanges($entity, $type, $data = null)
    {
        $this->initChange($entity, $type);

        $id = $entity->getId();
        if (is_array($data)) {
            foreach ($data as $field => $value) {
                $this->changes[$id]['data'][$field] = $value;
            }
        }
    }

    protected function isEntity($obj)
    {
        if (is_object($obj) && $obj instanceof \Max\Entity\Base) {
            return true;
        }
        return false;
    }

    protected function isCollection($obj)
    {
        return is_object($obj) && $obj instanceof \Doctrine\ORM\PersistentCollection;
    }

    protected function isEntityTracked($entityClass)
    {
        $ann = $this->metaFactory->factory($entityClass);
        return $ann->getTracking()->log;
    }

    protected function isFieldTracked($entityClass, $field)
    {
        $ann = $this->metaFactory->factory($entityClass);
        return $ann->getFieldTracking($field)->log;
        return true;
    }

    protected function isCollectionTracked($collection)
    {
        $mapping = $collection->getMapping();
        return $this->isFieldTracked($mapping['sourceEntity'], $mapping['fieldName']);
    }

    /**
     * Zahteva da entiteta deduje \Max\Entity\Base
     *
     * @param \Max\Entity\Base $entity
     * @throws \Max\Exception\MaxException
     */
    protected function checkBaseEntity($entity)
    {
        if (!$entity instanceof \Max\Entity\Base) {
            $class = get_class($entity);
            throw new \Max\Exception\MaxException("Entiteta '$class' mora dedovati '\\Max\\Entity\\Base'", 100077);
        }
    }

    protected function cleanUp()
    {
        $this->collections = [];
        $this->entities = [];
        $this->changes = [];
    }

    /**
     * Shrani array sprememb entitet v bazo
     *
     * @param array $changes
     */
    protected function saveChanges($changes)
    {
        $sql = "INSERT INTO {$this->tableName} (razred, objectId, upor, datum, tip, data)
                VALUES (?, ?, ?, ?, ?, ?)";

        $stmt = $this->conn->prepare($sql);

        $date = date_create("now")->format($this->platform->getDateTimeFormatString());
        $user = $this->identity ? $this->identity->getId() : null;

        foreach ($changes as $objectId => $change) {
            $class = get_class($change['entity']);
            $type = $change['type'];
            $data = serialize($change['data']);

            $stmt->bindValue(1, $class, \PDO::PARAM_STR);
            $stmt->bindValue(2, $objectId, \PDO::PARAM_STR);
            $stmt->bindValue(3, $user, \PDO::PARAM_STR);
            $stmt->bindValue(4, $date, \PDO::PARAM_STR);
            $stmt->bindValue(5, $type, \PDO::PARAM_STR);
            $stmt->bindValue(6, $data, \PDO::PARAM_STR);
            $stmt->execute();
        }
    }

}
