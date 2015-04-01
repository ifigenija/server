<?php

namespace Aaa\Entity;

use Aaa\Repository\Users;
use DateTime;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use Max\Annotation\Entity as Max;
use Max\Entity\Base;
use Zend\Crypt\Password\Bcrypt;
use ZfcRbac\Identity\IdentityInterface;

/**
 * Entiteta za uporabnike
 *
 * @ORM\Entity(repositoryClass="Aaa\Repository\Users")
 * @ORM\Table(name="uporabniki")
 *
 * @Max\I18n(label="Uporabnik", plural="Uporabniki")
 * @Max\Lookup(ident="username",label="fullName")
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
     * @Max\I18n(label="ID", hint="ID uporabnika", description="ID uporabnika")
     * @Max\Ui(type="id")
     */
    protected $id;

    /**
     * Uporabniško ime za dostop
     *
     * @ORM\Column(unique=true, length=10, nullable=false)
     * @var string
     *
     * @Max\I18n(label="Uporabniško ime", hint="Uporabniško ime", description="Uporabniško ime")
     * @Max\Ui(group="Login", type="naziv", ident=true)
     */
    protected $username;

    /**
     * Geslo
     *
     * @ORM\Column(length=90, nullable=true)
     *
     * @Max\I18n(label="Geslo", hint="Geslo", description="Geslo")
     * @Max\Ui(group="Login", type="password")
     */
    protected $password;

    /**
     * Uporabnik omogočen/onemogočen
     *
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="Aktiven", hint="Uporabnik aktiven (D/N)", description="Uporabnik aktiven")
     * @Max\Ui(type="checkbox", group="Uporabnik")
     */
    protected $enabled;


    /**
     * Vloge, ki ijih ima uporabnik - tukaj so vse vloge, ki jih ima uporabnik
     * preračunane glede na članstvo v hierRoles
     *  Uporabljeno za določitev dostopov
     *
     *      
     * @Max\I18n(label="Vloge", hint="ID-ji Skupin", description="Skupine, katerih član je uporabnik")
     * @Max\UI(group="Vloge")
     * @ORM\ManyToMany(targetEntity="Aaa\Entity\Role", mappedBy="users")
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
     * @Max\I18n(label="Privzeta pot ob prijavi", hint="Route ali prazno ('home')", description="Privzeta pot v aplikaciji po prijavi")
     * @Max\Ui(group="Zagon", type="text")
     */
    protected $defaultRoute;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="Parametri za pot", hint="param=>vrednost ali prazno", description="Parametri za privzeto pot v aplikaciji po prijavi")
     * @Max\Ui(group="Zagon", type="textarea")
     */
    protected $defaultRouteParams;

    /**
     * @ORM\OneToOne(targetEntity="App\Entity\Oseba", mappedBy="user")
     */
    private $oseba;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\OptionValue", mappedBy="user")
     */
    private $optionValue;



    public function __construct()
    {
        $this->roles = new ArrayCollection();

    }


    public function getName()
    {
        return $this->name;
    }

    public function setName($name)
    {
        $this->name = $name;
        return $this;
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


    public function getId()
    {
        return $this->id;
    }
    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setUsername($username)
    {
        $this->username = $username;
        return $this;
    }

    public function setSurname($surname)
    {
        $this->surname = $surname;
        return $this;
    }

    public function setEmail($email)
    {
        $this->email = $email;
        return $this;
    }

        
    public function setPassword($password)
    {
        if ($password !== '') {
            $bcrypt = new Bcrypt();
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

    public function setEnabled($enabled)
    {
        $this->enabled = $enabled;
        return $this;
    }

    function getExpires()
    {
        return $this->expires;
    }

    function getDefaultRoute()
    {
        return $this->defaultRoute;
    }

    function getOseba()
    {
        return $this->oseba;
    }

    function setExpires($expires)
    {
        $this->expires = $expires;
    }

    function setDefaultRoute($defaultRoute)
    {
        $this->defaultRoute = $defaultRoute;
    }

    function setOseba($oseba)
    {
        $this->oseba = $oseba;
    }

            public function setDefaultRouteParams($defaultRouteParams)
    {
        $this->defaultRouteParams = $defaultRouteParams;
    }

    public function getFullName()
    {
        return "{$this->getName()} {$this->getSurname()}";
    }
    public function __toString()
    {
        return $this->getFullName();
    }


}
