<?php

namespace Prodaja\Entity;

use Doctrine\ORM\Mapping AS ORM;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * @ORM\Entity
 */
class SedezniRed
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $id;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $kapaciteta;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $ime;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\ProdajaPredstave", mappedBy="sedezniRed")
     */
    private $prodajePredstave;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\Sedez", mappedBy="sedezniRed")
     */
    private $sedez;

    /**
     * 
     */
    private $vrste;

    public function __construct()
    {
        $this->prodajePredstave = new ArrayCollection();
        $this->sedez            = new ArrayCollection();
    }

    public function getId()
    {
        return $this->id;
    }

    public function getKapaciteta()
    {
        return $this->kapaciteta;
    }

    public function getIme()
    {
        return $this->ime;
    }

    public function getProdajePredstave()
    {
        return $this->prodajePredstave;
    }

    public function getSedez()
    {
        return $this->sedez;
    }

    public function getVrste()
    {
        return $this->vrste;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setKapaciteta($kapaciteta)
    {
        $this->kapaciteta = $kapaciteta;
        return $this;
    }

    public function setIme($ime)
    {
        $this->ime = $ime;
        return $this;
    }

    public function setProdajePredstave($prodajePredstave)
    {
        $this->prodajePredstave = $prodajePredstave;
        return $this;
    }

    public function setSedez($sedez)
    {
        $this->sedez = $sedez;
        return $this;
    }

    public function setVrste($vrste)
    {
        $this->vrste = $vrste;
        return $this;
    }

}
