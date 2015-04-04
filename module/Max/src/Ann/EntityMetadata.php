<?php

/**
 *  (copyleft) Licenca
 */

namespace Max\Ann;

use Doctrine\Common\Persistence\Mapping\ClassMetadata;
use Max\Ann\Entity\Acl;
use Max\Ann\Entity\I18n;
use Max\Ann\Entity\Id;
use Max\Ann\Entity\Lookup;
use Max\Ann\Entity\Tracking;
use Max\Ann\Entity\Search;
use Max\Ann\Entity\Ui;

/**
 * Vmesnik MetadataInterface da na voljo metode, s katerimi lahko pridemo do podatkov
 * o entiteti in njenih poljih
 *
 * @author Boris Lašič <boris@max.si>
 * Ustvarjeno: 16.3.2013
 */
class EntityMetadata
{

    protected $i18n;
    protected $acl;
    protected $propertyI18n;
    protected $propertyUi;
    protected $propertyTracking;
    protected $entityName;
    protected $mapping;
    protected $tracking;
    protected $search;
    protected $id;

    /**
     * Magic getter
     * @param mixed $name
     * @return mixed
     */
    public function __get($name)
    {
        return $this->$name;
    }

    /**
     * 
     * 
     * @return Tracking podatki o sledenju
     */
    function getTracking()
    {
        return $this->tracking;
    }

    function setTracking($tracking)
    {
        $this->tracking = $tracking;
    }

    
    /**
     * Vrne doctrine mapping povezan s to entiteto
     *
     * @return ClassMetadata
     */
    public function getMapping()
    {
        return $this->mapping;
    }

    /**
     * Shrani doctrine metadata mapping
     * @param ClassMetadata $mapping
     * @return EntityMetadata
     */
    public function setMapping($mapping)
    {
        $this->mapping = $mapping;
        return $this;
    }

    public function __construct($entityName)
    {

        $this->entityName = $entityName;
    }

    /**
     * Vzame entity class name za katerega so to metapodatki
     * @return string
     */
    public function getEntityName()
    {
        return $this->entityName;
    }

    /**
     * Nastavi ime entitete na katero se nanašajo metapodatki
     *
     * @param string $entityName

     * @return EntityMetadata
     */
    public function setEntityName($entityName)
    {
        $this->entityName = $entityName;
        return $this;
    }

    /**
     * Vrne ACL definicije za entiteto
     * @return Acl
     */
    public function getAcl()
    {

        return $this->acl;
    }

    function getSearch()
    {
        return $this->search;
    }

    /**
     * Vrne default search parametre
     * 
     * @param Search $search
     */
    function setSearch($search)
    {
        $this->search = $search;
    }

    /**
     * Vrne translacijski ključ za ime entitete
     *
     * @return I18n
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Nastavi class  Id
     * @param Id $id
     * @return EntityMetadata
     */
    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    /**
     * Vrne translacijski ključ za ime entitete
     *
     * @return I18n
     */
    public function getI18n()
    {
        return $this->i18n;
    }

    /**
     * Nastavi class  I18n
     * @param I18n $i18n
     * @return EntityMetadata
     */
    public function setI18n($i18n)
    {
        $this->i18n = $i18n;
        return $this;
    }

    /**
     * Nastavi Class  Acl
     * @param Acl
     * @return I18n
     */
    public function setAcl(Acl $acl)
    {
        $this->acl = $acl;
        return $this;
    }

    /**
     * Vrne i18n stringe za posamezno polje na entiteti
     * @return I18n
     */
    public function getFieldI18n($field)
    {
        if (array_key_exists($field, $this->propertyI18n)) {
            return $this->propertyI18n[$field];
        } else {
            return null;
        }
    }

    /**
     * Vrne objekt s podatki za
     *
     * @param string Ime polja
     * @return Ui
     */
    public function getFieldUi($field)
    {
        if ($this->propertyUi) {
            if (array_key_exists($field, $this->propertyUi)) {
                return $this->propertyUi[$field];
            }
        }
        return null;
    }

    /**
     * Vrne objekt s podatki za
     *
     * @param string Ime polja
     * @return Ui
     */
    public function getFieldUiArray($field)
    {
        if ($this->propertyUi) {
            if (array_key_exists($field, $this->propertyUi)) {
                return get_object_vars($this->propertyUi[$field]);
            }
        }
        return [];
    }

    /**
     * Vrne metapodatke revizije
     * @return Tracking
     */
    public function getFieldTracking($field)
    {
        if (array_key_exists($field, $this->propertyTracking)) {
            return $this->propertyTracking[$field];
        } else {
            return null;
        }
    }

    /**
     * Vrne lookup definicije za razred
     * @return Lookup
     */
    public function getLookup()
    {
        return $this->lookup;
    }

    /**
     * Nastavi class
     * @param Lookup $classLookup
     * @return Lookup
     */
    public function setLookup(Lookup $classLookup)
    {
        $this->lookup = $classLookup;
        return $this;
    }

    /**
     * Vrne vse property I18n-je kot polje
     * @return array<\Max\Ann\Entity\I18n>
     */
    public function getPropertyI18n()
    {
        return $this->propertyI18n;
    }

    /**
     * Shrani polje I18n jev za propertije
     *
     * @param array<\Max\Ann\Entity\I18n> $propertyI18n
     * @return EntityMetadata
     */
    public function setPropertyI18n($propertyI18n)
    {
        $this->propertyI18n = $propertyI18n;
        return $this;
    }

    /**
     * Vrne polje property Ui klasov
     * @return array<\Max\Ann\Entity\Ui>
     */
    public function getPropertyUi()
    {
        return $this->propertyUi;
    }

    /**
     * Nastavi seznam property Ui objektov
     * @param array<\Max\Ann\Entity\Ui> $propertyUI
     * @return EntityMetadata
     */
    public function setPropertyUi($propertyUi)
    {
        $this->propertyUi = $propertyUi;
        return $this;
    }

    /**
     * Vrne polje property Tracking klasov
     * @return array<\Max\Ann\Entity\Tracking>
     */
    public function getPropertyTracking()
    {
        return $this->propertyTracking;
    }

    /**
     * Nastavi seznam property Ui objektov
     * @param array<\Max\Ann\Entity\Tracking> $propertyTracking
     * @return EntityMetadata
     */
    public function setPropertyTracking($propertyTracking)
    {
        $this->propertyTracking = $propertyTracking;
        return $this;
    }

    /**
     * Preveri ali ime polja obstaja proxy orm class info
     * @param $name Ime polja
     * @return boolean
     */
    public function hasField($name)
    {
        return $this->getMapping()->hasField($name);
    }

    /**
     *  Vrne ime polja, ki ima v ui objektu nastaljeno ident=true
     * @return string
     */
    public function getIdent()
    {
        foreach ($this->propertyUi as $field => $ui) {
            if ($ui->ident) {
                return $field;
            }
        }
        return false;
    }

    /**
     * alias za getI18n()->label
     */
    public function getLabel()
    {
        return $this->i18n->label;
    }

    /**
     * alias za getI18n()->plural
     */
    public function getPlural()
    {
        return $this->i18n->plural;
    }

}
