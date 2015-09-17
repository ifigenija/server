<?php

namespace Jobs\Printing\Model;

use Zend\ServiceManager\ServiceLocatorAwareInterface;
use Zend\ServiceManager\ServiceLocatorAwareTrait;
use Zend\ServiceManager\ServiceLocatorInterface;
use Max\Exception\MaxException;

class TableCell implements ServiceLocatorAwareInterface {
    
    
    use ServiceLocatorAwareTrait;
    
    /**
     * Ključ celice
     * @var string
     */
    protected $key;
    
    /**
     * Ime skupine v kateri je celica
     * @var string
     */
    protected $group;
    
    /**
     * Naslov celice, string ali funkcija
     * @var mixed
     */
    protected $title;
    
    /**
     * Vsebina celica, ime polja entitete ali funkcija
     * @var mixed
     */
    protected $field;
    
    /**
     * Tip izpisa v celici (za formatiranje)
     * @var string
     */
    protected $type;
    
    /**
     * Zadnja vrstica pri izpisu (ponavadi za vsoto)
     * @var \Closure 
     */
    protected $final;
    
    /**
     * Seznam CSS classov
     * @var array
     */
    protected $class;
    
    /**
     * Poravnava ([top|middle|bottom] [left|center|right])
     * @var string
     */
    protected $align;
    
    /**
     * Širina stolpca (CSS)
     * @var string
     */
    protected $width;
    
    /**
     * Število rowspan ali pa ime podatkovne skupine iz katere izračuna rowspan
     * @var mixed
     */
    protected $rowspan;
    
    /**
     * Število colspan
     * @var int
     */
    protected $colspan;
    
    /**
     * Število decimalk v number fieldih
     * @var int
     */
    protected $decimals;
    
    /**
     * Za katero celico ponavljamo vrednost
     * @var string
     */
    protected $repeat;
    
    /** 
     * @var string
     */
    protected $entityClass;
    
    /**
     * @var array
     */
    protected $metadata;
    
    /**
     * @var \Max\Factory\EntityMetadataFactory
     */
    protected $metadataCustom;
    
    /**
     * @var \Doctrine\ORM\EntityManager
     */
    protected $em;
    
    public function __construct(ServiceLocatorInterface $sl, $def) {
        $this->setServiceLocator($sl);
        $this->em = $this->getServiceLocator()->get('doctrine.entitymanager.orm_default');        
        
        // defaulti
        $this->key = $this->array_get($def, 'key', null, true);
        $this->group = $this->array_get($def, 'group', null, true);
        $this->title = $this->array_get($def, 'title');
        $this->field = $this->array_get($def, 'field', $this->key);
        $this->type = $this->array_get($def, 'type');
        $this->final = $this->array_get($def, 'final');
        $this->setClass($this->array_get($def, 'class', []));
        $this->align = $this->array_get($def, 'align', '');
        $this->width = $this->array_get($def, 'width', 'auto');
        $this->rowspan = $this->array_get($def, 'rowspan');
        $this->colspan = $this->array_get($def, 'colspan');
        $this->repeat = $this->array_get($def, 'repeat');

        $this->prependClass("cell-key-{$this->getKey()}");
        $this->prependClass("cell-group-{$this->getGroup()}");
    }
    
    private function resolveMetadata($entityClass, $path = null) {
        $path = $path ?: $this->field;
        
        // resolvamo samo pot
        if (!is_string($path) || $path === null) { return false; }
        
        $meta = $this->em->getMetadataFactory()->getMetadataFor($entityClass);
        if ($meta->hasField($path) || $meta->hasAssociation($path)) {
            // našli smo metapodatke, shrani
            $rep = $this->em->getRepository($meta->getName());
            $rep->setServiceLocator($this->getServiceLocator());
            
            $this->metadata = $meta->hasField($path)
                    ? $meta->getFieldMapping($path)
                    : $meta->getAssociationMapping($path);
            $this->metadataCustom = $rep->getMeta();
            
            return true;
        } else {
            // rekurzivno resolvamo metadata po poti
            $parts = explode('.', $path);
            $first = $parts[0];
            $rest = implode('.', array_slice($parts, 1));
            if ($meta->hasAssociation($first)) {
                $targetClass = $meta->getAssociationTargetClass($first);
                return $this->resolveMetadata($targetClass, $rest);
            }
             
        }
        
        return false;
    }
    
    private function resolveTitle() {
        if ($this->getTitle() === null && $this->metadataCustom) {
            $i18n = $this->metadataCustom->getFieldI18n($this->getSingleField());
            if ($i18n) {
                $this->setTitle($i18n->label ? : '');
            }
        }
    }
    
    private function resolveType() {
        if ($this->getType() === null && isset($this->metadata['type'])) {
            $this->setType($this->metadata['type']);
        }
    }
    
    private function getTypeClass() {
        switch ($this->getType()) {
            case 'date':
                return "cell-type-date";
            case 'integer':
            case 'int':
            case 'decimal':
                return "cell-type-number";
            default:
                return '';
        }
    }   
    
    private function array_get($array, $key, $default = null, $throw = false){
        if (isset($array[$key])) {
            return $array[$key];
        } else if ($throw) {
            throw new MaxException("Parameter '{$key}' je obvezen del definicije celice", 'TIP-TABLE-0002');
        } else {
            return $default;
        }
    }
    
    private function escapeClass($class) {
        return str_replace('.', '-', trim($class));
    }
    
    public function getKey() {
        return $this->key;
    }
    
    public function getGroup() {
        return $this->group;
    }

    public function getTitle() {
        return $this->title;
    }

    public function getField() {
        return $this->field;
    }
    
    public function getSingleField() {
        $expl = explode('.', $this->field);
        return end($expl);
    }

    public function getType() {
        return $this->type;
    }

    public function getFinal() {
        switch ($this->final) {
            case 'sum':
                return function($sum, $value) { return $sum + $value; };
            case 'count':
                return function($sum) { return $sum + 1; };
            default:
                return $this->final;
        }
    }

    public function getClass() {
        return $this->class;
    }
    
    public function getFullClassString() {
        $class = implode(' ', $this->getClass());
        return "{$this->getTypeClass()} {$class}";
    }

    public function getRowspan() {
        return $this->rowspan;
    }

    public function getColspan() {
        return $this->colspan;
    }

    public function setTitle($title) {
        $this->title = $title;
    }

    public function setField($field) {
        $this->field = $field;
    }

    public function setType($type) {
        $this->type = $type;
    }

    public function setFinal($final) {
        $this->final = $final; 
    }
    
    public function setClass($class) {
        // pretvorimo v array
        if (is_string($class)) {
            $class = array_map(function($x) { return $x; }, explode(' ', $class));
        }
        
        // odstranimo prazne razrede in escapamo
        $this->class = array_map(
            function($x) {
                return $this->escapeClass($x);
            }, array_filter($class, function($x) { return $x !== ''; })
        );
    }
    
    public function prependClass($class) {
        array_unshift($this->class, $this->escapeClass($class));
    }
    
    public function appendClass($class) {
        $this->class[] = $this->escapeClass($class);
    }

    public function setRowspan($rowspan) {
        $this->rowspan = $rowspan;
    }

    public function setColspan($colspan) {
        $this->colspan = $colspan;
    }
    
    public function getEntityClass() {
        return $this->entityClass;
    }

    public function setEntityClass($entityClass) {
        $this->entityClass = $entityClass;
        if ($this->resolveMetadata($entityClass)) {
            $this->resolveTitle();
            $this->resolveType();
        }
    }
    
    public function getAlign() {
        return $this->align;
    }

    public function setAlign($align) {
        $this->align = $align;
    }
    
    public function getWidth() {
        return $this->width;
    }

    public function setWidth($width) {
        $this->width = $width;
    }
    
    public function getRepeat() {
        return $this->repeat;
    }

    public function setRepeat($repeat) {
        $this->repeat = $repeat;
    }
            

}