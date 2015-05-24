<?php

namespace Stevilcenje\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="Stevilcenje\Repository\StevilcenjaKonfig")
 * @Max\Id(prefix="000b")
 * @Max\I18n(label="Številčenje",plural="Številčenja po skladiščih")
 */
class StevilcenjeKonfig extends \Max\Entity\Base {

    /**
     * ID
     *
     * @ORM\Id
     * @ORM\Column(type="guid", nullable=false)
     * @Max\I18n(label="ID koledarja")
     * @var string
     */
    protected $id;

    /**
     * 
     * 
     * @ORM\Column(length=100, unique=true)
     * @Max\I18n(label="Objekt", description="Vrsta dokumenta na katerega se nanaša pravilo številčenja")
     * @var string
     */
    protected $dok;

    /**
     *
     * @ORM\ManyToOne(targetEntity="Stevilcenje\Entity\Stevilcenje")
     * @var Stevilcenje
     */
     protected $stevilcenje;
     


    public function getId() {
        return $this->id;
    }

    public function setId($id) {
        $this->id = $id;
        return $this;
    }


    public function getDok() {
        return $this->dok;
    }

    public function setDok( $dok) {
        $this->dok = $dok;
        return $this;
    }

    public function getStevilcenje() {
        return $this->stevilcenje;
    }

    public function setStevilcenje(Stevilcenje $stevilcenje) {
        $this->stevilcenje = $stevilcenje;
        return $this;
    }




}
