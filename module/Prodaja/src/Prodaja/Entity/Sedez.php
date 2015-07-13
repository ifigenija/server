<?php

namespace Prodaja\Entity;

use Doctrine\ORM\Mapping AS ORM;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * @ORM\Entity
 */
class Sedez
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     */
    protected $id;

    /**
     * @ORM\Column(type="string", length=3, nullable=true)
     */
    protected $stevilka;

    /**
     * @ORM\Column(type="string", length=60, nullable=true)
     */
    protected $oznaka;

    /**
     * @ORM\Column(type="string", length=20, nullable=true)
     */
    protected $kakovost;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    protected $koordinataX;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    protected $koordinataY;

    /**
     * @ORM\Column(type="string", length=10, nullable=true)
     */
    protected $barva;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\RazpisanSedez", mappedBy="sedez")
     */
    protected $prodanSedez;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\VrstaSedezev", inversedBy="sedezi")
     * @ORM\JoinColumn(name="vrsta_id", referencedColumnName="id", nullable=false)
     */
    protected $vrsta;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\SedezniRed", inversedBy="sedez")
     * @ORM\JoinColumn(name="sedezni_red_id", referencedColumnName="id")
     */
    protected $sedezniRed;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\PodrocjeSedenja", inversedBy="sedez")
     * @ORM\JoinColumn(name="podrocja_sedenja_id", referencedColumnName="id")
     */
    protected $podrocjaSedenja;

    public function __construct()
    {
        $this->prodanSedez = new ArrayCollection();
    }

    public function getId()
    {
        return $this->id;
    }

    public function getStevilka()
    {
        return $this->stevilka;
    }

    public function getOznaka()
    {
        return $this->oznaka;
    }

    public function getKakovost()
    {
        return $this->kakovost;
    }

    public function getKoordinataX()
    {
        return $this->koordinataX;
    }

    public function getKoordinataY()
    {
        return $this->koordinataY;
    }

    public function getBarva()
    {
        return $this->barva;
    }

    public function getProdanSedez()
    {
        return $this->prodanSedez;
    }

    public function getVrsta()
    {
        return $this->vrsta;
    }

    public function getSedezniRed()
    {
        return $this->sedezniRed;
    }

    public function getPodrocjaSedenja()
    {
        return $this->podrocjaSedenja;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setStevilka($stevilka)
    {
        $this->stevilka = $stevilka;
        return $this;
    }

    public function setOznaka($oznaka)
    {
        $this->oznaka = $oznaka;
        return $this;
    }

    public function setKakovost($kakovost)
    {
        $this->kakovost = $kakovost;
        return $this;
    }

    public function setKoordinataX($koordinataX)
    {
        $this->koordinataX = $koordinataX;
        return $this;
    }

    public function setKoordinataY($koordinataY)
    {
        $this->koordinataY = $koordinataY;
        return $this;
    }

    public function setBarva($barva)
    {
        $this->barva = $barva;
        return $this;
    }

    public function setProdanSedez($prodanSedez)
    {
        $this->prodanSedez = $prodanSedez;
        return $this;
    }

    public function setVrsta($vrsta)
    {
        $this->vrsta = $vrsta;
        return $this;
    }

    public function setSedezniRed($sedezniRed)
    {
        $this->sedezniRed = $sedezniRed;
        return $this;
    }

    public function setPodrocjaSedenja($podrocjaSedenja)
    {
        $this->podrocjaSedenja = $podrocjaSedenja;
        return $this;
    }

}
