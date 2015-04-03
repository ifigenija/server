<?php

namespace Aaa\Entity;

use Doctrine\ORM\Mapping as ORM;
use Max\Ann\Entity as Max;

/**
 * Entiteta Dovoljenja za dostop
 *
 * @ORM\Entity(repositoryClass="Aaa\Repository\Permissions")
 * @Max\Id(prefix="0002")
 * @Max\I18n(label="Dovoljenje",plural="Dovoljenja")
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
     * @Max\I18n(label="Naziv", description="Naziv dovoljenja")
     * @Max\Ui(type="sifra",ident=true )
     */
    protected $name;

    /**
     * Opis
     *
     * @ORM\Column(type="text", nullable=true)
     *
     * @Max\I18n(label="Opis", description="Opis dovoljenja")
     * @Max\Ui(type="naziv")
     */
    protected $description;

    /**
     * A je dovoljene vgrajeno v sistem, ali pa dodano kasneje.
     * @ORM\Column(type="boolean", nullable=true)
     *
     * @Max\I18n(label="Vgrajeno", hint="Dovoljene, ki pride z namestitvijo sistema")
     */
    protected $builtIn = false;

    /**
     * 
     *
     * @Max\I18n(label="Vloge", description="Vloge, ki imajo to dovoljenje")
     * @ORM\ManyToMany(targetEntity="Aaa\Entity\Role", inversedBy="permissions")
     * @ORM\JoinTable(
     *     name="Role2Permission",
     *     joinColumns={@ORM\JoinColumn(name="permission_id", referencedColumnName="id", nullable=false)},
     *     inverseJoinColumns={@ORM\JoinColumn(name="role_id", referencedColumnName="id", nullable=false, unique=true)}
     * )
     */
    protected $roles;

    public function __construct($name = '')
    {
        $this->name = $name;
        $this->roles = new \Doctrine\Common\Collections\ArrayCollection();
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
