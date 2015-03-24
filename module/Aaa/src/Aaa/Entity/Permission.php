<?php

namespace Aaa\Entity;

use Doctrine\ORM\Mapping as ORM;
use Max\Annotation\Entity as Max;

/**
 * Entiteta Dovoljenja za dostop
 *
 * @ORM\Entity(repositoryClass="Aaa\Repository\Permissions")
 *
 * @Max\I18n(label="Dovoljenje",plural="Dovoljenja")
 * @Max\Lookup(ident="name", label="description")
 */
class Permission extends \Max\Entity\Base
{

    /**
     * ID
     *
     * @ORM\Id
     * @ORM\Column(type="integer",unique=true);
     * @ORM\GeneratedValue(strategy="IDENTITY")
     *
     * @Max\Ui(type="id")
     */
    protected $id;

    /**
     * Naziv
     *
     * @ORM\Column(length=255)
     * @var string
     *
     * @Max\I18n(label="Naziv", hint="Naziv dovoljenja", description="Naziv dovoljenja")
     * @Max\Ui(type="sifra",ident=true )
     */
    protected $name;

    
    /**
     * Opis
     *
     * @ORM\Column(type="text", nullable=true)
     *
     * @Max\I18n(label="Opis", hint="Opis dovoljenja", description="Opis dovoljenja")
     * @Max\Ui(type="naziv")
     */
    protected $description;
    
        /**
     * A je dovoljene vgrajeno v sistem, ali pa dodano kasneje.
     * @ORM\Column(type="boolean")
     *
     * @Max\I18n(label="Vgrajeno", hint="Dovoljene, ki pride z namestitvijo sistema")
     */
    protected $builtIn = false;
    

    /**
     * @ORM\ManyToMany(targetEntity="Role", mappedBy="permissions")
     *
     * @Max\I18n(label="Vloge", description="Vloge, ki imajo to dovoljenje")
     */
    protected $roles;   

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
        $this->allRoles = new \Doctrine\Common\Collections\ArrayCollection();
        $this->roles = new \Doctrine\Common\Collections\ArrayCollection();
    }
    
    
    public function getAllRoles()
    {
        return $this->allRoles;
    }

    public function setAllRoles(\Doctrine\Common\Collections\ArrayCollection $allRoles)
    {
        $this->allRoles = $allRoles;
        return $this;
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

    function getUpor()
    {
        return $this->upor;
    }

    function getDatKnj()
    {
        return $this->datKnj;
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

    function setUpor($upor)
    {
        $this->upor = $upor;
        return $this;
    }

    function setDatKnj($datKnj)
    {
        $this->datKnj = $datKnj;
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
