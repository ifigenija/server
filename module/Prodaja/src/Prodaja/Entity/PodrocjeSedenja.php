<?php

namespace Prodaja\Entity;

use Doctrine\ORM\Mapping AS ORM;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * @ORM\Entity
 */
class PodrocjeSedenja
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $id;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $ime;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $kapaciteta;

    /**
     * @ORM\Column(type="string", length=20, nullable=true)
     */
    private $templatePlaceholder;

    /**
     * @ORM\Column(type="string", length=10, nullable=true)
     */
    private $barva;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\VrstaSedezev", mappedBy="podrocjaSedenja")
     */
    private $vrsta;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\Sedez", mappedBy="podrocjaSedenja")
     */
    private $sedez;

    public function __construct()
    {
        $this->vrsta = new ArrayCollection();
        $this->sedez = new ArrayCollection();
    }

    public function getId()
    {
        return $this->id;
    }

    public function getIme()
    {
        return $this->ime;
    }

    public function getKapaciteta()
    {
        return $this->kapaciteta;
    }

    public function getTemplatePlaceholder()
    {
        return $this->templatePlaceholder;
    }

    public function getBarva()
    {
        return $this->barva;
    }

    public function getVrsta()
    {
        return $this->vrsta;
    }

    public function getSedez()
    {
        return $this->sedez;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setIme($ime)
    {
        $this->ime = $ime;
        return $this;
    }

    public function setKapaciteta($kapaciteta)
    {
        $this->kapaciteta = $kapaciteta;
        return $this;
    }

    public function setTemplatePlaceholder($templatePlaceholder)
    {
        $this->templatePlaceholder = $templatePlaceholder;
        return $this;
    }

    public function setBarva($barva)
    {
        $this->barva = $barva;
        return $this;
    }

    public function setVrsta($vrsta)
    {
        $this->vrsta = $vrsta;
        return $this;
    }

    public function setSedez($sedez)
    {
        $this->sedez = $sedez;
        return $this;
    }

}
