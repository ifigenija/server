<?php

namespace Aaa\Entity;

use Aaa\Repository\Roles;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Criteria;
use Doctrine\ORM\Mapping as ORM;
use Max\Ann\Entity as Max;
use Rbac\Role\RoleInterface;

/**
 * @ORM\Entity(repositoryClass="Aaa\Repository\Roles")
 * @Max\Acl(delete="admin")
 * @Max\I18n(label="Vloga",plural="Vloge",description="Uporabnik mora imeti vloge za dostop do delov aplikacije")
 * @Max\Id(prefix="0002") 
 *  */
class Role
        extends \Max\Entity\Base
        implements RoleInterface
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid");
     * @ORM\GeneratedValue(strategy="NONE")
     *
     * @Max\I18n(label="ID",  description="ID vloge")
     * @Max\Ui(type="id")
     */
    protected $id;

    /**
     * @ORM\Column(unique=true, length=150, nullable=false)
     *
     * @Max\I18n(label="Naziv", description="Naziv vloge")
     * @Max\Ui(type="sifra", group="Vloga",ident=true)
     */
    protected $name;

    /**
     * @ORM\Column(type="text", nullable=true)
     *
     * @Max\I18n(label="Opis", description="Opis vloge")
     * @Max\Ui(type="naziv", group="Vloga")
     */
    protected $description = '';

    /**
     * A je vloga vgrajena v sistem, ali pa dodana na user instalaciji.
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="Vgrajena", description="Vloga, ki pride z namestitvijo sistema")
     */
    protected $builtIn = false;

    /**
     * 
     * @Max\I18n(label="Dovoljenja", description="Dovoljenja")
     * @Max\Ui(type="tomany")
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
     * @Max\I18n(label="Uporabniki", description="Uporabniki, ki s to vlogo")
     * @ORM\ManyToMany(targetEntity="Aaa\Entity\User", mappedBy="roles")
     * 
     * @Max\Ui(type="tomany")
     */
    protected $users;

    /**
     * Init the Doctrine collection
     */
    public function __construct()
    {
        $this->users       = new ArrayCollection();
        $this->permissions = new ArrayCollection();
    }

    /**
     * {@inheritDoc}
     */
    public function hasPermission($permission)
    {

        $criteria = Criteria::create()->where(Criteria::expr()->eq('name', (string) $permission));
        $result   = $this->permissions->matching($criteria);

        return count($result) > 0;
    }

    public function validate($mode = 'update')
    {
        $this->expect($this->name, "rolename je obvezen podatek", 1000346);
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

    public function addUser($user)
    {
        $this->users->add($user);
    }

    public function removeUser($user)
    {
        $this->users->removeElement($user);
    }

    public function getId()
    {
        return $this->id;
    }

    public function getName()
    {
        return $this->name;
    }

    public function getDescription()
    {
        return $this->description;
    }

    public function getBuiltIn()
    {
        return $this->builtIn;
    }

    public function getPermissions()
    {
        return $this->permissions;
    }

    public function getUsers()
    {
        return $this->users;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setName($name)
    {
        $this->name = $name;
        return $this;
    }

    public function setDescription($description)
    {
        $this->description = $description;
        return $this;
    }

    public function setBuiltIn($builtIn)
    {
        $this->builtIn = $builtIn;
        return $this;
    }

    public function setPermissions($permissions)
    {
        $this->permissions = $permissions;
        return $this;
    }

    public function setUsers($users)
    {
        $this->users = $users;
        return $this;
    }

}
