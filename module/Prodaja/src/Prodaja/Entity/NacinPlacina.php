<?php
namespace Prodaja\Entity;
use Doctrine\ORM\Mapping AS ORM;
use Doctrine\Common\Collections\ArrayCollection;
/**
 * @ORM\Entity
 */
class NacinPlacina
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
     * @ORM\Column(type="string", length=10, nullable=true)
     */
    private $vrsta;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\PlacilniInstrument", mappedBy="nacinPlacina")
     */
    private $placilniInstrument;
    
        public function __construct()
    {
        $this->placilniInstrument  = new ArrayCollection();
    }
    public function getId()
    {
        return $this->id;
    }

    public function getIme()
    {
        return $this->ime;
    }

    public function getVrsta()
    {
        return $this->vrsta;
    }

    public function getPlacilniInstrument()
    {
        return $this->placilniInstrument;
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

    public function setVrsta($vrsta)
    {
        $this->vrsta = $vrsta;
        return $this;
    }

    public function setPlacilniInstrument($placilniInstrument)
    {
        $this->placilniInstrument = $placilniInstrument;
        return $this;
    }


}