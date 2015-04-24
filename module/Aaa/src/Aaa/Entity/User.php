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
     * @ORM\Column(type="string", nullable=false)
     * @Max\I18n(label="Polno ime", description="Polno ime uporabnika. Ime in priimek oz. opis za api uporabnike")
     */
    private $name;

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
     * @Max\Ui(type="boolCheckbox", group="Uporabnik")
     */
    protected $enabled;

    /**
     * Vloge, ki ijih ima uporabnik - tukaj so vse vloge, ki jih ima uporabnik
     * preračunane glede na članstvo v hierRoles
     *  Uporabljeno za določitev dostopov
     *
     *      
     * @Max\I18n(label="Vloge",  description="Skupine, katerih član je uporabnik")
     * @Max\UI(group="Vloge", type="tomany")
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
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Privzeta pot ob prijavi",  description="Privzeta pot v aplikaciji po prijavi")
     * @Max\Ui(group="Zagon")
     */
    protected $defaultRoute;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Parametri za pot",  description="Parametri za privzeto pot v aplikaciji po prijavi")
     * @Max\Ui(group="Zagon")
     */
    protected $defaultRouteParams;

    /**
     * @ORM\Column(type="string", nullable=false)
     * @Max\Ui(type="email")
     * @Max\I18n(label="Email", description="Elektronski naslov, ki služi za prijavo uporabnika") 
     */
    private $email;

    /**
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="Čas zadnje priajve")
     */
    private $lastLogon;

    /**
     * Token, ki ga pošljemo po mailu uporabniku, ki je pozabil geslo
     * 
     * @ORM\Column(type="string", nullable=true)
     * 
     */
    private $passRestToken;

    /**
     * Veljavnost žetona, za reset gesla
     * 
     * zaenkrat se to polje ne uporablja. Tudi datetime funkcionalnost še ne deluje (npr. ne sprejme formata: '1973-28-03T04:30:00'     
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $tokenExpires;

    public function __construct()
    {
        $this->roles = new ArrayCollection();
    }

    public function validate($mode = 'update')
    {
        $this->expect($this->email, "Email (uporabniško ime) je obvezen podatek", 1000470);
        $this->expect($this->name, "Name je obvezen podatek", 1000471);
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

    public function setPassword($password)
    {
        if ($password !== '') {
            $bcrypt         = new Bcrypt();
            $bcrypt->setSalt(51292170311201451452855644564);  //$$ rb potrebno še dopolniti, da se bo salt generiral dinamično
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

    public function getId()
    {
        return $this->id;
    }

    public function getName()
    {
        return $this->name;
    }

    public function getRoles()
    {
        return $this->roles;
    }

    public function getExpires()
    {
        return $this->expires;
    }

    public function getDefaultRoute()
    {
        return $this->defaultRoute;
    }

    public function getDefaultRouteParams()
    {
        return $this->defaultRouteParams;
    }

    public function getEmail()
    {
        return $this->email;
    }

    public function getLastLogon()
    {
        return $this->lastLogon;
    }

    public function getPassRestToken()
    {
        return $this->passRestToken;
    }

    public function getTokenExpires()
    {
        return $this->tokenExpires;
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

    public function setRoles($roles)
    {
        $this->roles = $roles;
        return $this;
    }

    public function setExpires($expires)
    {
        $this->expires = $expires;
        return $this;
    }

    public function setDefaultRoute($defaultRoute)
    {
        $this->defaultRoute = $defaultRoute;
        return $this;
    }

    public function setDefaultRouteParams($defaultRouteParams)
    {
        $this->defaultRouteParams = $defaultRouteParams;
        return $this;
    }

    public function setEmail($email)
    {
        $this->email = $email;
        return $this;
    }

    public function setLastLogon($lastLogon)
    {
        $this->lastLogon = $lastLogon;
        return $this;
    }

    public function setPassRestToken($passRestToken)
    {
        $this->passRestToken = $passRestToken;
        return $this;
    }

    public function setTokenExpires($tokenExpires)
    {
        $this->tokenExpires = $tokenExpires;
        return $this;
    }

    public function setEnabled($enabled)
    {
        $this->enabled = $enabled;
        return $this;
    }

    public function getPassword()
    {
        return $this->password;
    }

}
