<?php

namespace Aaa\Entity;

use Doctrine\ORM\Mapping as ORM;
use Max\Ann\Entity as Max;

/**
 * Entiteta Dovoljenja za dostop
 *
 * @ORM\Entity(repositoryClass="Aaa\Repository\Permissions")
 * @Max\Id(prefix="0003")
 * @Max\I18n(label="Dovoljenje",plural="Dovoljenja")
 * @Max\Lookup(ident="name", label="description", search={"name","description"})

 */
class Permission
        extends \Max\Entity\Base
{

    /**
     * ID
     *
     * @ORM\Id
     * @ORM\Column(type="guid");
     * @ORM\GeneratedValue(strategy="NONE")
     *
     * @Max\Ui(type="id")
     */
    protected $id;

    /**
     * Naziv
     *
     * @ORM\Column(length=150, nullable=true)
     * @var string
     *
     * @Max\I18n(label="entiteta.naziv", description="entiteta.naziv")
     * @Max\Ui(type="sifra",ident=true )
     */
    protected $name;

    /**
     * Opis
     *
     * @ORM\Column(type="text", nullable=true)
     *
     * @Max\I18n(label="entiteta.opis", description="entiteta.opis")
     *
     */
    protected $description;

    /**
     * A je dovoljene vgrajeno v sistem, ali pa dodano kasneje.
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="entiteta.builtIn", description="permission.d.builtIn")
     */
    protected $builtIn = false;

    /**
     * 
     *
     * @Max\I18n(label="Vloge", description="Vloge, ki imajo to dovoljenje")
     * @ORM\ManyToMany(targetEntity="Aaa\Entity\Role", mappedBy="permissions")
     * 
     */
    protected $roles;

    public function __construct($name = '')
    {
        $this->name  = $name;
        $this->roles = new \Doctrine\Common\Collections\ArrayCollection();
    }

    public function addRole($role)
    {
        $this->roles->add($role);
    }

    public function removeRole($role)
    {
        $this->roles->removeElement($role);
    }

    public function validate($mode = 'update')
    {
        
    }

    function getId()
    {
        return $this->id;
    }

    function getName()
    {
        return $this->name;
    }

    function getDescription()
    {
        return $this->description;
    }

    function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    function setName($name)
    {
        $this->name = $name;
        return $this;
    }

    function setDescription($description)
    {
        $this->description = $description;
        return $this;
    }

    public function __toString()
    {
        return $this->name;
    }

    function getRoles()
    {
        return $this->roles;
    }

    function setRoles($roles)
    {
        $this->roles = $roles;
        return $this;
    }

    function getBuiltIn()
    {
        return $this->builtIn;
    }

    function setBuiltIn($builtIn)
    {
        $this->builtIn = $builtIn;
        return $this;
    }

}
