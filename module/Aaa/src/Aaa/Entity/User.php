<?php

namespace Aaa\Entity;

use Doctrine\ORM\Mapping as ORM,
    Tip\Annotation\Entity as Tip,
    Zend\InputFilter\Factory as InputFactory,
    Zend\InputFilter\InputFilter,
    Zend\InputFilter\InputFilterAwareInterface,
    Zend\InputFilter\InputFilterInterface,
    Doctrine\ORM\PersistentCollection,
    Zend\Crypt\Password\Bcrypt;

/**
 * Entiteta za uporabnike
 *
 * @ORM\Entity(repositoryClass="Aaa\Repository\Users")
 * @ORM\Table(name="uporabniki")
 *
 * @Tip\I18n(label="Uporabnik", plural="Uporabniki")
 * @Tip\Lookup(ident="username",label="fullName")
 */
class User
    extends \Tip\Entity\Base
    implements \ZfcRbac\Identity\IdentityInterface
{

    /**
     * ID uporabnika
     *
     * @ORM\Id
     * @ORM\Column(type="guid",unique=true);
     * @ORM\GeneratedValue(strategy="NONE")
     *
     * @Tip\I18n(label="ID", hint="ID uporabnika", description="ID uporabnika")
     * @Tip\Ui(type="id")
     */
    protected $id;

    /**
     * Uporabniško ime za dostop
     *
     * @ORM\Column(length=10, unique=true,nullable=false)
     * @var string
     *
     * @Tip\I18n(label="Uporabniško ime", hint="Uporabniško ime", description="Uporabniško ime")
     * @TIp\Ui(group="Login", type="naziv", ident=true)
     */
    protected $username;

    /**
     * Ime uporabnika (dejansko ime)
     *
     * @ORM\Column(type="string")
     *
     * @Tip\I18n(label="Ime", hint="Ime uporabnika", description="Ime uporabnika")
     * @TIp\Ui(group="Uporabnik", type="naziv")
     */
    protected $name;

    /**
     * Priimek uporabnika
     *
     * @ORM\Column(type="string", nullable=true)
     *
     * @Tip\I18n(label="Priimek", hint="Priimek uporabnika", description="Priimek uporabnika")
     * @TIp\Ui(group="Uporabnik", type="naziv")
     */
    protected $surname;

    /**
     * Naslov e-pošte uporabnika
     *
     * @ORM\Column(type="string",unique=true,nullable=false)
     *
     * @Tip\I18n(label="E-mail", hint="E-poštni naslov", description="Naslov elektronske pošte uporabnika")
     * @Tip\Ui(type="email", group="Uporabnik")
     */
    protected $email;

    /**
     * Geslo
     *
     * @ORM\Column(length=90)
     *
     * @Tip\I18n(label="Geslo", hint="Geslo", description="Geslo")
     * @Tip\Ui(group="Login", type="password")
     */
    protected $password;

    /**
     * Uporabnik omogočen/onemogočen
     *
     * @ORM\Column(type="boolean")
     * @Tip\I18n(label="Aktiven", hint="Uporabnik aktiven (D/N)", description="Uporabnik aktiven")
     * @Tip\UI(type="checkbox", group="Uporabnik")
     */
    protected $enabled;

    /**
     * Api key 
     *
     * @ORM\Column(length=90, nullable=true);
     *
     * @Tip\I18n(label="Api Ključ", description="Api ključ za dostop preko rest vmesnikov")
     * @Tip\Ui(type="text", group="Login")
     */
    protected $apiKey;

    /**
     * Skupine v katere spada uporabnik
     *  Uporabljeno za določitev dostopov
     *
     * @ORM\ManyToMany(targetEntity="Group", mappedBy="users")
     * @Tip\I18n(label="Skupine", hint="Skupine katerih član je uporabnik", description="Skupine, katerih član je uporabnik")
     * @Tip\UI(group="Skupine")
     */
    protected $groups;

    /**
     * Vloge, ki ijih ima uporabnik - tukaj so vse vloge, ki jih ima uporabnik
     * preračunane glede na članstvo v hierRoles
     *  Uporabljeno za določitev dostopov
     *
     * @ORM\ManyToMany(targetEntity="Role")     
     * @Tip\I18n(label="Vloge", hint="ID-ji Skupin", description="Skupine, katerih član je uporabnik")
     * @Tip\UI(group="Vloge")
     */
    protected $roles;

    /**
     * Hierarhične vloge na uporabniku
     * 
     * @ORM\ManyToMany(targetEntity="Role", inversedBy="users")
     * @ORM\JoinTable(name="user_hierroles")
     * @var ArrayCollection 
     */
    protected $hierRoles;

    /**
     * Veljavnost - po tem datumu se uporabnik ne more prijaviti
     *
     * @ORM\Column(type="date", nullable=true)
     * @Tip\I18n(label="Veljavnost", hint="Datum veljavnosti ali prazno (veljavnost ne poteče)", description="Po tem datumu se uporabnik ne more prijaviti")
     * @Tip\Ui(group="Uporabnik")
     */
    protected $expires;

    /**
     * Začetna pot za uporabnika
     *
     * @ORM\Column(type="text", nullable=true)
     * @Tip\I18n(label="Privzeta pot ob prijavi", hint="Route ali prazno ('home')", description="Privzeta pot v aplikaciji po prijavi")
     * @TIp\Ui(group="Zagon", type="text")
     */
    protected $defaultRoute;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Tip\I18n(label="Parametri za pot", hint="param=>vrednost ali prazno", description="Parametri za privzeto pot v aplikaciji po prijavi")
     * @TIp\Ui(group="Zagon", type="textarea")
     */
    protected $defaultRouteParams;

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

    public function __construct()
    {
        $this->groups = new \Doctrine\Common\Collections\ArrayCollection();
        $this->roles = new \Doctrine\Common\Collections\ArrayCollection();
        $this->hierRoles = new \Doctrine\Common\Collections\ArrayCollection();
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

    public function getHierRoles()
    {
        return $this->hierRoles;
    }

    public function setHierRoles($allRoles)
    {
        $this->hierRoles = $allRoles;
        return $this;
    }

    public function addGroups(\Doctrine\Common\Collections\Collection $groups)
    {
        foreach ($groups as $group) {
            if (!$this->groups->contains($group)) {
                $this->groups->add($group);
            }
        }
    }

    public function removeGroups(\Doctrine\Common\Collections\Collection $groups)
    {
        foreach ($groups as $group) {
            if ($this->groups->contains($group)) {
                $this->groups->removeElement($group);
            }
        }
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

    /**
     * Preveri geslo uporabnika (vnos hasha in primerja z vnosom v bazi)
     *
     * @param string $user
     * @param string $passwordGiven
     */
    public static function checkPassword($user, $passwordGiven)
    {
        $bcrypt = new \Zend\Crypt\Password\Bcrypt();
        $bcrypt->setSalt(51292170311201451452855644564);
        $bcrypt->setCost(5);
        $passwordGiven = $bcrypt->create($passwordGiven);
        if ($user->getEnabled()) {
            return ($user->password === $passwordGiven ? true : false);
        } else {
            return false;
        }
    }

    public function getEnabled()
    {
        if (isset($this->expires)) {
            if ($this->expires < new \DateTime) {
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

    public function getGroups()
    {
        return $this->groups;
    }

    public function setGroups($groups)
    {
        $this->groups = $groups;
    }

    public function getExpires()
    {
        return $this->expires;
    }

    public function setExpires($expires)
    {
        $this->expires = $expires;
    }

    public function getDefaultRoute()
    {
        return $this->defaultRoute;
    }

    public function setDefaultRoute($defaultRoute)
    {
        $this->defaultRoute = $defaultRoute;
    }

    public function getDefaultRouteParams()
    {
        return $this->defaultRouteParams;
    }

    public function getUsername()
    {
        return $this->username;
    }

    public function getSurname()
    {
        return $this->surname;
    }

    public function getEmail()
    {
        return $this->email;
    }

        public function setDefaultRouteParams($defaultRouteParams)
    {
        $this->defaultRouteParams = $defaultRouteParams;
    }

    public function getFullName()
    {
        return "{$this->getName()} {$this->getSurname()}";
    }

    function setApiKey($apiKey)
    {
        if ($apiKey !== '') {
            $bcrypt = new Bcrypt();
            $bcrypt->setSalt(512703111111201451452855644564);
            $bcrypt->setCost(6);
            $this->apiKey = $bcrypt->create($apiKey);
        }
    }

    /**
     * Preveri geslo uporabnika (vnos hasha in primerja z vnosom v bazi)
     *
     * @param string $user
     * @param string $passwordGiven
     */
    public static function checkApiKey($user, $passwordGiven)
    {
        $bcrypt = new \Zend\Crypt\Password\Bcrypt();
        $bcrypt->setSalt(512703111111201451452855644564);
        $bcrypt->setCost(6);
        $passwordGiven = $bcrypt->create($passwordGiven);
        if ($user->getEnabled()) {
            return ($user->apiKey === $passwordGiven ? true : false);
        } else {
            return false;
        }
    }

}
