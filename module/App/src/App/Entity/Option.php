<?php

namespace App\Entity;

use Doctrine\ORM\Mapping AS ORM;

/**
 *   name        : ime opcije
 *                 opcija je lahko globalno in/ali uporabniško nastavljiva; v tem
 *                 primeru se vrednost zapiše v OptionValue entiteto
 *   type        : ip opcije, npr. entity ali array
 *   description : opis opicje
 *   defaultValue: vrednost, ki se uporabi, če opcija nima globalne ali uporabniške nastavitve
 *   perUser     : opicjo lahko uporabnik spremeni, v tem primeru bo veljala le zanj
 *   readOnly    : če je true, potem opcija ni niti globalno niti uporabniško nastavljiva
 *   public      : velja za anonymous uporabnika
 *   role        : se uporabi če je posamezno polje v entiteti zaščiteno in dostop do njega 
 *                 zahteva posebne uporabniške pravice
 *
 *   @ORM\Entity
 */
class Option
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @var string
     * 
     */
    protected $id;

    /**
     * @ORM\Column(type="string", unique=true, length=100, nullable=false)
     */
    protected $name;

    /**
     * @ORM\Column(type="string", length=20, nullable=true)
     */
    protected $type;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    protected $defaultValue;

    /**
     * @ORM\Column(type="boolean", nullable=true, options={"default":true})
     */
    protected $perUser = false;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    protected $readOnly = false;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    protected $public = false;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    protected $role = "";

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    protected $description;

    function getId()
    {
        return $this->id;
    }

    function getName()
    {
        return $this->name;
    }

    function getType()
    {
        return $this->type;
    }

    function getDefaultValue()
    {
        return unserialize($this->defaultValue);
    }

    function getPerUser()
    {
        return $this->perUser;
    }

    function getReadOnly()
    {
        return $this->readOnly;
    }

    function getPublic()
    {
        return $this->public;
    }

    function getRole()
    {
        return $this->role;
    }

    function setId($id)
    {
        $this->id = $id;
    }

    function setName($name)
    {
        $this->name = $name;
    }

    function setType($type)
    {
        $this->type = $type;
    }

    function setDefaultValue($defaultValue)
    {
        $this->defaultValue = serialize($defaultValue);
    }

    function setPerUser($perUser)
    {
        $this->perUser = $perUser;
    }

    function setReadOnly($readOnly)
    {
        $this->readOnly = $readOnly;
    }

    function setPublic($public)
    {
        $this->public = $public;
    }

    function setRole($role)
    {
        $this->role = $role;
    }

    function getDescription()
    {
        return $this->description;
    }

    function setDescription($description)
    {
        $this->description = $description;
    }

}
