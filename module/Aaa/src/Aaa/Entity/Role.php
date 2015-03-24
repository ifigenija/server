<?php

namespace Aaa\Entity;


use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Rbac\Role\RoleInterface;
use Max\Annotation\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="Aaa\Repository\Roles")
 * @Max\Lookup(ident="name",label="description")
 * @Max\I18n(label="Vloga",plural="Vloge",description="Uporabnik mora imeti vloge za dostop do delov aplikacije")
 */
class Role
    extends \Max\Entity\Base
    implements RoleInterface
{

    /**
     * @ORM\Id
     * @ORM\Column(type="integer",unique=true);
     * @ORM\GeneratedValue(strategy="IDENTITY")
     *
     * @Max\I18n(label="ID", hint="ID vloge", description="ID vloge")
     * @Max\Ui(type="id")
     */
    protected $id;

    /**
     * @ORM\Column(length=150, unique=true)
     *
     * @Max\I18n(label="Naziv", hint="Naziv vloge")
     * @Max\Ui(type="sifra", group="Vloga",ident=true)
     */
    protected $name;

    /**
     * @ORM\Column(type="text", nullable=true)
     *
     * @Max\I18n(label="Opis", hint="Opis vloge")
     * @Max\Ui(type="naziv", group="Vloga")
     */
    protected $description = '';

    /**
     * A je vloga vgrajena v sistem, ali pa dodana na user instalaciji.
     * @ORM\Column(type="boolean")
     *
     * @Max\I18n(label="Vgrajena", hint="Vloga, ki pride z namestitvijo sistema")
     */
    protected $builtIn = false;

    /**
     * @ORM\ManyToMany(targetEntity="Permission", inversedBy="roles", indexBy="name", fetch="LAZY")
     *
     * @Max\I18n(label="Dovoljenja", hint="Dovoljenja")
     * @Max\Ui(group="Dovoljenja")
     */
    protected $permissions;


    /**
     * @var HierarchicalRoleInterface[]|Collection
     *
     * @ORM\ManyToMany(targetEntity="Role")
     */
    protected $children;

    /**
     * @ORM\ManyToMany(targetEntity="User", mappedBy="hierRoles")
     *
     * @Max\I18n(label="Uporabniki", hint="Uporabniki, ki s to vlogo")
     */
    protected $users;

    /**
     * Init the Doctrine collection
     */
    public function __construct()
    {
        $this->children = new ArrayCollection();
        $this->permissions = new ArrayCollection();

    }

    /**
     * Interno polje - uporabnik, ki je zadnji spreminjal entiteto
     * To polje se ne vnaša. Uporabnika dobimo iz prijave v aplikacijo.
     *
     *  @ORM\Column(length=10,nullable=true)
     */
    protected $upor;

    /**
     * Interno polje - datum in ura zadnjega spreminjanja entitete
     * To polje se ne vnaša. Podatek vzamemo iz tekočega datuma in ure.
     *
     * @ORM\Column(type="datetime",nullable=true)
     * @var string
     */
    protected $datKnj;



    public function getName()
    {
        return $this->name;
    }

    public function getUpor()
    {
        return $this->upor;
    }

    public function setUpor($upor)
    {
        $this->upor = $upor;
        return $this;
    }

    public function getDatKnj()
    {
        return $this->datKnj;
    }

    public function setDatKnj($datKnj)
    {
        $this->datKnj = $datKnj;
        return $this;
    }

    public function getId()
    {
        return $this->id;
    }

    public function setId($id)
    {
        $this->id = $id;
    }

    /**
     * Set the role name
     *
     * @param  string $name
     * @return void
     */
    public function setName($name)
    {
        $this->name = (string) $name;
    }

    /**
     * {@inheritDoc}
     */
    public function addChild(RoleInterface $child)
    {
        $this->children[] = $child;
    }

    /**
     * {@inheritDoc}
     */
    public function addPermission($permission)
    {
        if (is_string($permission)) {
            $permission = new Permission($permission);
        }

        $this->permissions[(string) $permission] = $permission;
    }

    /**
     * {@inheritDoc}
     */
    public function hasPermission($permission)
    {
// This can be a performance problem if your role has a lot of permissions. Please refer
// to the cookbook to an elegant way to solve this issue

        return isset($this->permissions[(string) $permission]);
    }

    /**
     * {@inheritDoc}
     */
    public function getChildren()
    {
        return $this->children;
    }

    /**
     * {@inheritDoc}
     */
    public function hasChildren()
    {
        return !$this->children->isEmpty();
    }

    function getPermissions()
    {
        return $this->permissions;
    }

    function setPermissions($permissions)
    {
        $this->permissions = $permissions;
        return $this;
    }

    function getDescription()
    {
        return $this->description;
    }

    function setDescription($description)
    {
        $this->description = $description;
        return $this;
    }

    function getBuiltIn()
    {
        return $this->builtIn;
    }

    function getUsers()
    {
        return $this->users;
    }

    function setBuiltIn($builtIn)
    {
        $this->builtIn = $builtIn;
        return $this;
    }

    function setUsers($users)
    {
        $this->users = $users;
        return $this;
    }

    function setChildren($children)
    {
        $this->children = $children;
        return $this;
    }

}
