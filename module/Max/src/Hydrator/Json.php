<?php

/*
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * This software consists of voluntary contributions made by many individuals
 * and is licensed under the MIT license. For more information, see
 * <http://www.doctrine-project.org>.
 */

namespace Max\Stdlib\Hydrator;

use DateTime;
use Doctrine\Common\Persistence\Mapping\ClassMetadata;
use Doctrine\Common\Persistence\ObjectManager;
use DoctrineModule\Stdlib\Hydrator\Strategy\AbstractCollectionStrategy;
use InvalidArgumentException;
use Locale;
use NumberFormatter;
use RuntimeException;
use Traversable;
use Zend\Stdlib\Hydrator\AbstractHydrator;
use Zend\Stdlib\Hydrator\Strategy\StrategyInterface;

/**
 * This hydrator has been completely refactored for DoctrineModule 0.7.0. It provides an easy and powerful way
 * of extracting/hydrator objects in Doctrine, by handling most associations types.
 *
 * Note that now a hydrator is bound to a specific entity (while more standard hydrators can be instanciated once
 * and be used with objects of different types). Most of the time, this won't be a problem as in a form we only
 * create one hydrator. This is by design, because this hydrator uses metadata extensively, so it's more efficient
 *
 * @license MIT
 *
 * @since   0.7.0
 * @author  Michael Gallego <mic.gallego@gmail.com>
 */
class Json
    extends AbstractHydrator
{

    use \Zend\ServiceManager\ServiceLocatorAwareTrait;

    /**
     * @var ObjectManager
     */
    protected $objectManager;

    /**
     * @var ClassMetadata
     */
    protected $metadata;

    /**
     * @var array
     */
    protected $byValue = [];

    /**
     * @var array
     */
    protected $excludeFields = [];

    /**
     * @var array
     */
    protected $lookups = [];

    /**
     * 
     * @var array
     */
    protected $virtualFields = [];

    /**
     * Constructor
     *
     * @param ObjectManager $objectManager The ObjectManager to use
     * @param string        $targetClass   The FQCN of the hydrated/extracted object
     * @param bool          $byValue       set field names to be included by value in json
     */
    public function __construct(ObjectManager $objectManager, $targetClass, $options = [], $serviceLocator)
    {
        parent::__construct();

        
        $this->objectManager = $objectManager;
        $this->serviceLocator = $serviceLocator;
        $this->metadata = $objectManager->getClassMetadata($targetClass);

        if (isset($options['byValue']) && is_array($options['byValue'])) {
            $this->byValue = $options['byValue'];
        }
        if (isset($options['exclude']) && is_array($options['exclude'])) {
            $this->excludeFields = $options['exclude'];
        }
        // Virtual fields are translated to method calls getVirtualField
        if (isset($options['virtual']) && is_array($options['virtual'])) {
            $this->virtualFields = $options['virtual'];
        }
        // Virtual fields are translated to method calls getVirtualField
        if (isset($options['lookups']) && is_array($options['lookups'])) {
            $this->lookups = $options['lookups'];
        }
        $this->prepare();
    }

    /**
     * Extract values from an object
     *
     * @param  object $object
     * @return array
     */
    public function extract($object)
    {
        return $this->extractByValue($object);
    }

    /**
     * Hydrate $object with the provided $data.
     *
     * @param  array  $data
     * @param  object $object
     * @return object
     */
    public function hydrate(array $data, $object)
    {
        return $this->hydrateByValue($data, $object);
    }

    /**
     * {@inheritDoc}
     * @throws InvalidArgumentException If a strategy added to a collection does not extend AbstractCollectionStrategy
     */
    public function addStrategy($name, StrategyInterface $strategy)
    {
        if ($this->metadata->hasAssociation($name) && $this->metadata->isCollectionValuedAssociation($name)) {
            if (!$strategy instanceof AbstractCollectionStrategy) {
                throw new InvalidArgumentException(
                sprintf(
                    'Strategies used for collections valued associations must inherit from '
                    . 'Strategy\AbstractCollectionStrategy, %s given', get_class($strategy)
                )
                );
            }

            $strategy->setCollectionName($name)
                ->setClassMetadata($this->metadata);
        }

        return parent::addStrategy($name, $strategy);
    }

    /**
     * Prepare the hydrator by adding strategies to every collection valued associations
     *
     * @return void
     */
    protected function prepare()
    {
        $metadata = $this->metadata;
        $associations = $metadata->getAssociationNames();
        $fields = $metadata->getFieldNames();

        foreach ($associations as $association) {
            if (array_search($association, $this->excludeFields) !== false)
                continue;

            // We only need to prepare collection valued associations
            if ($metadata->isCollectionValuedAssociation($association)) {
                if (false === array_search($association, $this->byValue)) {
                    $this->addStrategy($association, new Strategy\MultivaluedIdStrategy());
                } else {
                    $hopts = $this->getSubHydratorOptions($association);
                    $strat = new Strategy\MultivaluedObjectStrategy(
                        $this->objectManager
                        , $metadata->getAssociationTargetClass($association)
                        , $hopts
                        , $this->getServiceLocator());

                    $this->addStrategy($association,$strat);
                }
            } else {
                if (false !== array_search($association, $this->byValue)) {
                    $hopts = $this->getSubHydratorOptions($association);
                    $strat = new Strategy\ObjectValueStrategy($this->objectManager
                        , $this->metadata->getAssociationTargetClass($association)
                        , $hopts
                        , $this->getServiceLocator());
                    $this->addStrategy($association, $strat);
                } elseif (false !== array_search($association, $this->lookups)) {
                    $strat = new Strategy\LabelIdentStrategy($this->objectManager
                        , $this->metadata->getAssociationTargetClass($association)
                        , $this->getServiceLocator());

                    $this->addStrategy($association, $strat);
                } else {
                    $this->addStrategy($association, new Strategy\ObjectIdStrategy());
                }
            }
        }

        foreach ($fields as $field) {

            if (array_search($field, $this->excludeFields) !== false)
                continue;

            if ($metadata->getTypeOfField($field) == 'datetime') {
                $this->addStrategy($field, new Strategy\DateString('datetime'));
            }
            if ($metadata->getTypeOfField($field) == 'date') {
                $this->addStrategy($field, new Strategy\DateString('date'));
            }
            if ($metadata->getTypeOfField($field) == 'decimal' || $metadata->getTypeOfField($field) == 'integer') {
                $this->addStrategy($field, new Strategy\Number());
            }
        }
    }

    /**
     * Extract values from an object using a by-value logic (this means that it uses the entity
     * API, in this case, getters)
     *
     * @param  object $object
     * @throws RuntimeException
     * @return array
     */
    protected function extractByValue($object)
    {
        $fieldNames = array_merge($this->metadata->getFieldNames(), $this->metadata->getAssociationNames());

        $data = [];
        $methods = get_class_methods($object);
        if (!is_array($methods))
            return $data;

        foreach ($fieldNames as $fieldName) {
            if (array_search($fieldName, $this->excludeFields) !== false) {
                continue;
            }

            $getter = 'get' . ucfirst($fieldName);

            // Ignore unknown fields
            if (!in_array($getter, $methods)) {
                continue;
            }

            $data[$fieldName] = $this->extractValue($fieldName, $object->$getter());
        }
        foreach ($this->virtualFields as $fieldName) {

            $getter = 'get' . ucfirst($fieldName);

            // Ignore unknown fields
            if (!in_array($getter, $methods)) {
                continue;
            }

            $data[$fieldName] = $this->extractValue($fieldName, $object->$getter());
        }

        return $data;
    }

    /**
     * Hydrate the object using a by-value logic (this means that it uses the entity API, in this
     * case, setters)
     *
     * @param  array  $data
     * @param  object $object
     * @throws RuntimeException
     * @return object
     */
    protected function hydrateByValue(array $data, $object)
    {
        $object = $this->tryConvertArrayToObject($data, $object);
        $metadata = $this->metadata;

        foreach ($data as $field => $value) {
            if (array_search($field, $this->excludeFields) !== false) {
                continue;
            }

            $value = $this->handleTypeConversions($value, $metadata->getTypeOfField($field));
            $setter = 'set' . ucfirst($field);

            if ($metadata->hasAssociation($field)) {
                $target = $metadata->getAssociationTargetClass($field);

                if ($metadata->isSingleValuedAssociation($field)) {
                    if (!method_exists($object, $setter)) {
                        continue;
                    }

                    $value = $this->toOne($target, $this->hydrateValue($field, $value));
                    $object->$setter($value);
                } elseif ($metadata->isCollectionValuedAssociation($field)) {
                    $this->toMany($object, $field, $target, $value);
                }
            } else {
                if (!method_exists($object, $setter)) {
                    continue;
                }

                // prazen id "" pomeni da je nova entiteta
                if ($metadata->isIdentifier($field) && $value === '') {
                    $value = null;
                }

                $value = $this->hydrateValue($field, $value);
                $object->$setter($value);
            }
        }

        return $object;
    }

    /**
     * This function tries, given an array of data, to convert it to an object if the given array contains
     * an identifier for the object. This is useful in a context of updating existing entities, without ugly
     * tricks like setting manually the existing id directly into the entity
     *
     * @param  array  $data   The data that may contain identifiers keys
     * @param  object $object
     * @return object
     */
    protected function tryConvertArrayToObject($data, $object)
    {
        $metadata = $this->metadata;
        $identifierNames = $metadata->getIdentifierFieldNames($object);
        $identifierValues = [];

        if (empty($identifierNames)) {
            return $object;
        }

        foreach ($identifierNames as $identifierName) {
            if (!isset($data[$identifierName]) || empty($data[$identifierName])) {
                return $object;
            }

            $identifierValues[$identifierName] = $data[$identifierName];
        }

        return $this->find($identifierValues, $metadata->getName());
    }

    /**
     * Handle ToOne associations
     *
     * @param  string $target
     * @param  mixed  $value
     * @return object
     */
    protected function toOne($target, $value)
    {
        if ($value instanceof $target) {
            return $value;
        }
        if ($value === null) {
            return $value;
        }
        if ($value === '') {
            return null;
        }

        return $this->find($value, $target);
    }

    /**
     * Handle ToMany associations. In proper Doctrine design, Collections should not be swapped, so
     * collections are always handled by reference. Internally, every collection is handled using specials
     * strategies that inherit from AbstractCollectionStrategy class, and that add or remove elements but without
     * changing the collection of the object
     *
     * @param  object $object
     * @param  mixed  $collectionName
     * @param  string $target
     * @param  mixed  $values
     * @return void
     */
    protected function toMany($object, $collectionName, $target, $values)
    {
        if (!is_array($values) && !$values instanceof Traversable) {
            $values = (array) $values;
        }

        $collection = [];

        // If the collection contains identifiers, fetch the objects from database
        foreach ($values as $value) {
            if ($value instanceof $target) {
                $collection[] = $value;
            } elseif ($value !== null) {

                if (array_search($collectionName, $this->byValue) !== false && is_array($value)) {
                    // če je value array, potem predvidevam,
                    // da ga je potrebno hidrirati v novi objekt
                    $collObject = new $target();
                    $hydr = new Json($this->objectManager, $target, [], $this->getServiceLocator());
                    $collObject = $hydr->hydrate($value, $collObject);
                    $assoc = $this->metadata->getAssociationMappedByTargetField($collectionName);
                    if ($assoc) {
                        $setter = 'set' . ucfirst($assoc);
                        if (method_exists($collObject, $setter)) {
                            $collObject->$setter($object);
                        }
                    }
                    $collection[] = $collObject;
                } else {
                    $targetObject = $this->find($value, $target);
                    if ($targetObject !== null) {
                        $collection[] = $targetObject;
                    }
                }
            }
        }

        // Set the object so that the strategy can extract the Collection from it
        $collectionStrategy = $this->getStrategy($collectionName);

        // Even if this check is applied in addStrategy, subclasses may inject invalid strategies
        if (!$collectionStrategy instanceof AbstractCollectionStrategy) {
            throw new InvalidArgumentException(
            sprintf(
                'Strategies used for collections valued associations must inherit from '
                . 'Strategy\AbstractCollectionStrategy, %s given', get_class($collectionStrategy)
            )
            );
        }

        $collectionStrategy->setObject($object);

        // We could directly call hydrate method from the strategy, but if people want to override
        // hydrateValue function, they can do it and do their own stuff
        $this->hydrateValue($collectionName, $collection);
    }

    /**
     * Handle various type conversions that should be supported natively by Doctrine (like DateTime)
     *
     * @param  mixed  $value
     * @param  string $typeOfField
     * @return DateTime
     */
    protected function handleTypeConversions($value, $typeOfField)
    {
        switch ($typeOfField) {
            case 'decimal':
                if (is_string($value)) {
                    $locale = Locale::getDefault();
                    $format = new NumberFormatter($locale, NumberFormatter::DECIMAL);
                    $format->setAttribute(NumberFormatter::MIN_FRACTION_DIGITS, 2);
                    $parsedFloat = $format->parse($value, NumberFormatter::TYPE_DOUBLE);
                    if (intl_is_failure($format->getErrorCode())) {
                        throw new InvalidArgumentException('Število ni razpoznano.');
                    }
                    $value = $parsedFloat;
                }
                break;
            case 'datetime':
            case 'time':
            case 'date':
                if (is_int($value)) {
                    $dateTime = new DateTime();
                    $dateTime->setTimestamp($value);
                    $value = $dateTime;
                } elseif (is_string($value)) {
                    if ($value == "") {
                        $value = null;
                    } else {
                        $value = new DateTime($value);
                    }
                }

                break;
            default:
        }

        return $value;
    }

    /**
     * Find an object by its identifiers
     *
     * @param  mixed   $identifiers
     * @param  string  $targetClass
     *
     * @return object|null
     */
    protected function find($identifiers, $targetClass)
    {

        return $this->objectManager->find($targetClass, $identifiers);
    }

    /**
     * Make sub hydrator options from $this->hydratorOptions
     */
    protected function getSubHydratorOptions($name)
    {

        $opts = ['byValue' => [], 'exclude' => [], 'virtual' => []];
        $name = $name . '.';
        $nameLen = strlen($name);

        foreach ($this->byValue as $value) {
            if (substr($value, 0, $nameLen) == $name) {
                array_push($opts['byValue'], substr($value, $nameLen));
            }
        }
        foreach ($this->excludeFields as $value) {
            if (substr($value, 0, $nameLen) == $name) {
                array_push($opts['exclude'], substr($value, $nameLen));
            }
        }
        foreach ($this->virtualFields as $value) {
            if (substr($value, 0, $nameLen) == $name) {
                array_push($opts['virtual'], substr($value, $nameLen));
            }
        }
        foreach ($this->lookups as $value) {
            if (substr($value, 0, $nameLen) == $name) {
                array_push($opts['lookups'], substr($value, $nameLen));
            }
        }


        return $opts;
    }

}
