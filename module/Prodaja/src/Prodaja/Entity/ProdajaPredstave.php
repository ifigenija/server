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
    protected $id;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\Racun", mappedBy="prodajaPredstave")
     */
    protected $racun;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\RazpisanSedez", mappedBy="prodajaPredstave")
     */
    protected $razpisanSedez;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\Rezervacija", mappedBy="prodajaPredstave")
     */
    protected $rezervacija;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\SedezniRed", inversedBy="prodajePredstave")
     * @ORM\JoinColumn(name="sedezni_red_id", referencedColumnName="id")
     */
    protected $sedezniRed;

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

}
