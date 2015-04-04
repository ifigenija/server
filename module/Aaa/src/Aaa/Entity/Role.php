<?php

namespace Aaa\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Rbac\Role\RoleInterface;
use Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="Aaa\Repository\Roles")
 * @Max\Acl(delete="admin")
 * @Max\I18n(label="Vloga",plural="Vloge",description="Uporabnik mora imeti vloge za dostop do delov aplikacije")
 */
class Role
        extends \Max\Entity\Base
        implements RoleInterface
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid");
     * @ORM\GeneratedValue(strategy="NONE")
     *
     * @Max\I18n(label="ID", hint="ID vloge", description="ID vloge")
     * @Max\Ui(type="id")
     */
    protected $id;

    /**
     * @ORM\Column(unique=true, length=150, nullable=true)
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
     * @ORM\Column(type="boolean", nullable=true)
     *
     * @Max\I18n(label="Vgrajena", hint="Vloga, ki pride z namestitvijo sistema")
     */
    protected $builtIn = false;

    /**
     * 
     * @Max\I18n(label="Dovoljenja", hint="Dovoljenja")
     * @Max\Ui(type="list")
     * @ORM\ManyToMany(targetEntity="Aaa\Entity\Permission", inversedBy="roles")
     * @ORM\JoinTable(
     *     name="Permission2Role",
     *     joinColumns={@ORM\JoinColumn(name="role_id", referencedColumnName="id", nullable=false)},
     *     inverseJoinColumns={@ORM\JoinColumn(name="permission_id", referencedColumnName="id", nullable=false)}
     * )
     */
    protected $permissions;

    /**
     * 
     *
     * @Max\I18n(label="Uporabniki", hint="Uporabniki, ki s to vlogo")
     * @ORM\ManyToMany(targetEntity="Aaa\Entity\User", mappedBy="roles")
     * 
     * 
     */
    protected $users;
    

    /**
     * Init the Doctrine collection
     */
    public function __construct()
    {
        $this->users = new ArrayCollection();
        $this->permissions = new ArrayCollection();
    }

    public function getName()
    {
        return $this->name;
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
    public function hasPermission($permission)
    {
// This can be a performance problem if your role has a lot of permissions. Please refer
// to the cookbook to an elegant way to solve this issue
        return isset($this->permissions[(string) $permission]);
    }


    public function assignedToUser($user)
    {
        $this->users[] = $user;
    }

    public function unassignedToUser($user)
    {
        // userja odstranimo iz array-a
        if (in_array($user, $this->users)) {
            unset($this->users[array_search($user, $this->users)]);
        }
    }
    
    
    function getDescription()
    {
        return $this->description;
    }

    function getBuiltIn()
    {
        return $this->builtIn;
    }

    function getPermissions()
    {
        return $this->permissions;
    }

    function getUsers()
    {
        return $this->users;
    }

    function setDescription($description)
    {
        $this->description = $description;
    }

    function setBuiltIn($builtIn)
    {
        $this->builtIn = $builtIn;
    }

    function setPermissions($permissions)
    {
        $this->permissions = $permissions;
    }

    function setUsers($users)
    {
        $this->users = $users;
    }


}
