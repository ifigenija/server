<?php

namespace Aaa\Entity;

use Aaa\Repository\Users;
use DateTime;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use Max\Ann\Entity as Max;
use Max\Entity\Base;
use Zend\Crypt\Password\Bcrypt;
use ZfcRbac\Identity\IdentityInterface;

/**
 * Entiteta za uporabnike
 *
 * @ORM\Entity(repositoryClass="Aaa\Repository\Users")
 * @ORM\Table(name="uporabniki")
 * @Max\Id(prefix="0001")
 * @Max\I18n(label="Uporabnik", plural="Uporabniki")
 * @Max\Acl(delete="admi")
 * 
 */
class User
        extends Base
        implements IdentityInterface
{

    /**
     * ID uporabnika
     *
     * @ORM\Id
     * @ORM\Column(type="guid");
     * @ORM\GeneratedValue(strategy="NONE")
     *
     * @Max\I18n(label="ID",  description="ID uporabnika")
     * @Max\Ui(type="id")
     */
    protected $id;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $name;

    /**
     * Uporabniško ime za dostop
     *
     * @ORM\Column(unique=true, length=10, nullable=false)
     * @var string
     *
     * @Max\I18n(label="Uporabniško ime",  description="Uporabniško ime")
     * @Max\Ui(group="Login", type="naziv", ident=true)
     */
    protected $username;

    /**
     * Geslo
     *
     * @ORM\Column(length=90, nullable=true)
     *
     * @Max\I18n(label="Geslo",  description="Geslo")
     * @Max\Ui(group="Login", type="password")
     * @Max\Tracking(log=false)
     */
    protected $password;

    /**
     * Uporabnik omogočen/onemogočen
     *
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="Aktiven",  description="Uporabnik aktiven")
     * @Max\Ui(type="checkbox", group="Uporabnik")
     */
    protected $enabled;

    /**
     * Vloge, ki ijih ima uporabnik - tukaj so vse vloge, ki jih ima uporabnik
     * preračunane glede na članstvo v hierRoles
     *  Uporabljeno za določitev dostopov
     *
     *      
     * @Max\I18n(label="Vloge",  description="Skupine, katerih član je uporabnik")
     * @Max\UI(group="Vloge")
     * @ORM\ManyToMany(targetEntity="Aaa\Entity\Role", inversedBy="users")
     * @ORM\JoinTable(
     *     name="Role2User",
     *     joinColumns={@ORM\JoinColumn(name="user_id", referencedColumnName="id", nullable=false)},
     *     inverseJoinColumns={@ORM\JoinColumn(name="role_id", referencedColumnName="id", nullable=false)}
     * )
     * 
     * 
     */
    protected $roles;

    /**
     * Veljavnost - po tem datumu se uporabnik ne more prijaviti
     *
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="Veljavnost",  description="Po tem datumu se uporabnik ne more prijaviti")
     * @Max\Ui(group="Uporabnik")
     */
    protected $expires;

    /**
     * Začetna pot za uporabnika
     *
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="Privzeta pot ob prijavi",  description="Privzeta pot v aplikaciji po prijavi")
     * @Max\Ui(group="Zagon", type="text")
     */
    protected $defaultRoute;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="Parametri za pot",  description="Parametri za privzeto pot v aplikaciji po prijavi")
     * @Max\Ui(group="Zagon", type="textarea")
     */
    protected $defaultRouteParams;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $email;

    public function __construct()
    {
        $this->roles = new ArrayCollection();
    }

    public function addRoles($role)
    {
        // pri Many2Many dodajamo (kličemo metodo) na owner strani
        $role->addUser($this);
        $this->roles->add($role);
        return $this;
    }

    public function removeRoles($role)
    {
        // pri Many2Many odstranimo (kličemo metodo) na owner strani
        $role->removeUser($this);

        // odstranimi role-o iz array-a
        $this->roles->removeElement($role);

        return $this;
    }

    public function getId()
    {
        return $this->id;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setPassword($password)
    {
        if ($password !== '') {
            $bcrypt         = new Bcrypt();
            $bcrypt->setSalt(51292170311201451452855644564);
            $bcrypt->setCost(5);
            $this->password = $bcrypt->create($password);
        }
        return $this;
    }

    public function getEnabled()
    {
        if (isset($this->expires)) {
            if ($this->expires < new DateTime) {
                $this->enabled = false;
            }
        }
        return $this->enabled;
    }

    public function __toString()
    {
        return $this->getUsername();
    }

    function getName()
    {
        return $this->name;
    }

    function getUsername()
    {
        return $this->username;
    }

    function getRoles()
    {
        return $this->roles;
    }

    function getExpires()
    {
        return $this->expires;
    }

    function getDefaultRoute()
    {
        return $this->defaultRoute;
    }

    function getDefaultRouteParams()
    {
        return $this->defaultRouteParams;
    }

    function getEmail()
    {
        return $this->email;
    }

    function setName($name)
    {
        $this->name = $name;
    }

    function setUsername($username)
    {
        $this->username = $username;
    }

    function setRoles($roles)
    {
        $this->roles = $roles;
    }

    function setExpires($expires)
    {
        $this->expires = $expires;
    }

    function setDefaultRoute($defaultRoute)
    {
        $this->defaultRoute = $defaultRoute;
    }

    function setDefaultRouteParams($defaultRouteParams)
    {
        $this->defaultRouteParams = $defaultRouteParams;
    }

    function setEmail($email)
    {
        $this->email = $email;
    }

    function setEnabled($enabled)
    {
        $this->enabled = $enabled;
    }

}
