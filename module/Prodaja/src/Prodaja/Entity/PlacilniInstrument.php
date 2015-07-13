<?php

namespace Prodaja\Entity;

use Doctrine\ORM\Mapping AS ORM;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * @ORM\Entity
 */
class PlacilniInstrument
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     */
    protected $id;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    protected $ime;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\Racun", mappedBy="placilniInstrument")
     */
    protected $racun;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\NacinPlacina", inversedBy="placilniInstrument")
     * @ORM\JoinColumn(name="nacin_placina_id", referencedColumnName="id")
     */
    protected $nacinPlacina;

    public function __construct()
    {
        $this->racun = new ArrayCollection();
    }

    public function getId()
    {
        return $this->id;
    }

    public function getIme()
    {
        return $this->ime;
    }

    public function getRacun()
    {
        return $this->racun;
    }

    public function getNacinPlacina()
    {
        return $this->nacinPlacina;
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

    public function setRacun($racun)
    {
        $this->racun = $racun;
        return $this;
    }

    public function setNacinPlacina($nacinPlacina)
    {
        $this->nacinPlacina = $nacinPlacina;
        return $this;
    }

}
