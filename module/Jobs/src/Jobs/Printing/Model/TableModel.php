<?php

namespace Jobs\Printing\Model;

use Zend\ServiceManager\ServiceLocatorAwareInterface;
use Zend\ServiceManager\ServiceLocatorAwareTrait;
use Zend\ServiceManager\ServiceLocatorInterface;

use Max\Exception\MaxException;

class TableModel implements ServiceLocatorAwareInterface {
    
    use ServiceLocatorAwareTrait;
    /**
     * Tip izpisa tabele: horizontal | vertical | grouped
     * @var string
     */
    protected $type;

    /**
     * Naslov tabele
     * @var string 
     */
    protected $title;
    
    /**
     * Naslov v headerju tabele (se ponovi na vsaki strani)
     * @var string
     */
    protected $headerTitle;
    
    /**
     * Discriminator field za tabele tipa 'grouped'
     * @var string
     */
    protected $discriminator;

    /**
     * Podatkovne skupine tabele
     * @var array 
     */
    protected $groups;
    
    /**
     * Entity class podatkov v tabeli
     * @var string
     */
    protected $entityClass;
    
    
    public function __construct(ServiceLocatorInterface $sl, $def) {
        $this->setServiceLocator($sl->getServiceLocator());
        
        $this->type = $this->array_get($def, 'type', 'horizontal');
        $this->title = $this->array_get($def, 'title');
        $this->headerTitle = $this->array_get($def, 'headerTitle');
        $this->discriminator = $this->array_get($def, 'discriminator');
        $this->groups = [];
        $this->hasUpdated = true;
        
        // ustvarimo definicije TableCell
        $groups = $this->array_get($def, 'groups', null, true);
        foreach ($groups as $groupKey => $group) {
            foreach ($group as $cellKey => $cell) {
                if (is_string($cell)) {
                    // celica je podana kot string
                    $cellKey = $cell;
                    $cell = ['key' => $cellKey, 'field' => $cellKey];
                }
                
                // celica je podana kot array
                $cell['key'] = $cellKey;
                $cell['group'] = $groupKey;
                $this->groups[$groupKey][$cellKey] = new TableCell($this->serviceLocator, $cell);
            }
        }
    }
    
    public function hasFinal() {
        foreach ($this->groups as $group) {
            foreach ($group as $cell) {
                if ($cell->getFinal()) { return true; }
            }
        }
        return false;
    }

    private function array_get(&$array, $key, $default = null, $throw = false){
        if (isset($array[$key])) {
            return $array[$key];
        } else if ($throw) {
            throw new MaxException("Parameter '{$key}' je obvezen del definicije tabele", 'TIP-TAB-0001');
        } else {
            return $default;
        }
    }
    
    public function getType() {
        return $this->type;
    }

    public function getTitle() {
        return $this->title;
    }

    public function getHeaderTitle() {
        return $this->headerTitle;
    }

    public function getGroups() {
        return $this->groups;
    }

    public function getEntityClass() {
        return $this->entityClass;
    }

    public function setType($type) {
        $this->type = $type;
    }

    public function setTitle($title) {
        $this->title = $title;
    }

    public function setHeaderTitle($headerTitle) {
        $this->headerTitle = $headerTitle;
    }
    
    public function getDiscriminator() {
        return $this->discriminator;
    }

    public function setDiscriminator($discriminator) {
        $this->discriminator = $discriminator;
    }

    public function setGroups($groups) {
        $this->groups = $groups;
    }

    public function setEntityClass($entityClass) {
        // posodobimo entity class vseh celic
        foreach ($this->groups as $group) {
            foreach ($group as $cell) {
                $cell->setEntityClass($entityClass);
            }
        }
        $this->entityClass = $entityClass;
    }
        

}