<?php

namespace Prodaja\Entity;

use Doctrine\ORM\Mapping AS ORM;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * @ORM\Entity
 */
class ProdajaPredstave
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $id;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\Racun", mappedBy="prodajaPredstave")
     */
    private $racun;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\RazpisanSedez", mappedBy="prodajaPredstave")
     */
    private $razpisanSedez;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\Rezervacija", mappedBy="prodajaPredstave")
     */
    private $rezervacija;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\SedezniRed", inversedBy="prodajePredstave")
     * @ORM\JoinColumn(name="sedezni_red_id", referencedColumnName="id")
     */
    private $sedezniRed;

    /**
     * @ORM\ManyToOne(targetEntity="Koledar\Entity\Dogodek", inversedBy="prodajaPredstave")
     * @ORM\JoinColumn(name="dogodek_id", referencedColumnName="id", nullable=false)
     */
    private $dogodek;

    public function __construct()
    {
        $this->racun         = new ArrayCollection();
        $this->razpisanSedez = new ArrayCollection();
        $this->rezervacija   = new ArrayCollection();
    }

    public function getId()
    {
        return $this->id;
    }

    public function getRacun()
    {
        return $this->racun;
    }

    public function getRazpisanSedez()
    {
        return $this->razpisanSedez;
    }

    public function getRezervacija()
    {
        return $this->rezervacija;
    }

    public function getSedezniRed()
    {
        return $this->sedezniRed;
    }

    public function getDogodek()
    {
        return $this->dogodek;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setRacun($racun)
    {
        $this->racun = $racun;
        return $this;
    }

    public function setRazpisanSedez($razpisanSedez)
    {
        $this->razpisanSedez = $razpisanSedez;
        return $this;
    }

    public function setRezervacija($rezervacija)
    {
        $this->rezervacija = $rezervacija;
        return $this;
    }

    public function setSedezniRed($sedezniRed)
    {
        $this->sedezniRed = $sedezniRed;
        return $this;
    }

    public function setDogodek($dogodek)
    {
        $this->dogodek = $dogodek;
        return $this;
    }

}
