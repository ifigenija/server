<?php

namespace Aaa\Entity;

use Doctrine\ORM\Mapping as ORM,
    Tip\Annotation\Entity as Tip,
    Zend\InputFilter\Factory as InputFactory,
    Zend\InputFilter\InputFilter,
    Zend\InputFilter\InputFilterAwareInterface,
    Zend\InputFilter\InputFilterInterface,
    Doctrine\ORM\PersistentCollection;

/**
 * Entiteta za skupine uporabnikov
 *
 * @ORM\Entity(repositoryClass="Aaa\Repository\Group"))
 * @ORM\Table(name="skupine")
 * @Tip\Lookup(label="name",ident="description")
 * @Tip\I18n(label="Skupina uporabnikov",plural="Skupine uporabnikov",description="Skupina uporabnikov")
 */
class Group extends \Tip\Entity\Base {

    /**
     * @ORM\Id
     * @ORM\Column(type="guid",unique=true);
     * @ORM\GeneratedValue(strategy="NONE")
     *
     */
    protected $id;

    /**
     * @ORM\Column(type="string", unique=true, nullable=false)
     *
     * @Tip\I18n(label="Naziv", hint="Naziv skupine", description="Naziv skupine uporabnikov")
     * @Tip\Ui(type="sifra",group="Skupina",ident=true)

     */
    protected $name;

    /**
     * @ORM\Column(type="text", nullable=true)
     *
     * @Tip\I18n(label="Opis", description="Opis skupine uporabnikov")
     * @Tip\Ui(group="Skupina")
     */
    protected $description;
    
    
    /**
     * @ORM\ManyToMany(targetEntity="User", inversedBy="groups")
     *
     * @Tip\I18n(label="Uporabniki", hint="Uporabniki", description="Uporabniki, člani skupine")
     */
    protected $users;

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

    public function __construct() {
        $this->users = new \Doctrine\Common\Collections\ArrayCollection();
    }

    public function getName() {
        return $this->name;
    }

    public function setName($name) {
        $this->name = $name;
        return $this;
    }


    public function addUser($user) {
        if (!$this->users->contains($user)) {
            $this->users->add($user);
        }
    }

    public function removeUser($user) {
        if ($this->users->contains($user)) {
            $this->users->removeElement($user);
        }
    }

    public function addUsers(\Doctrine\Common\Collections\Collection $users) {
        foreach ($users as $user) {
            if (!$this->users->contains($user)) {
                $this->users->add($user);
            }
        }
    }

    public function removeUsers(\Doctrine\Common\Collections\Collection $users) {
        foreach ($users as $user) {
            if ($this->users->contains($user)) {
                $this->users->removeElement($user);
            }
        }
    }

    public function getUpor() {
        return $this->upor;
    }

    public function setUpor($upor) {
        $this->upor = $upor;
        return $this;
    }

    public function getDatKnj() {
        return $this->datKnj;
    }

    public function setDatKnj($datKnj) {
        $this->datKnj = $datKnj;
        return $this;
    }

    public function getId() {
        return $this->id;
    }

    public function setId($id) {
        $this->id = $id;
    }

    public function getUsers() {
        return $this->users;
    }

    public function setUsers($users) {
        $this->users = $users;
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


}
