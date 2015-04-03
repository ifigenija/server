<?php
namespace App\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class Option         extends \Max\Entity\Base

{
    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $id;

    /**
     * @ORM\Column(type="string", unique=true, length=100, nullable=false)
     */
    private $name;

    /**
     * @ORM\Column(type="string", length=20, nullable=true)
     */
    private $type;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $defaultValue;

    /**
     * @ORM\Column(type="boolean", nullable=true, options={"default":true})
     */
    private $perUser = false;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $readOnly = false;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $public = false;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $role = "";

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $description;
    
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