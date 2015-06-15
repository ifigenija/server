<?php

namespace Prodaja\Entity;

use Doctrine\ORM\Mapping AS ORM;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * @ORM\Entity
 */
class Racun
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $id;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\PostavkaRacuna", mappedBy="dokument")
     */
    private $postavke;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\Kupec", inversedBy="racun")
     * @ORM\JoinColumn(name="kupec_id", referencedColumnName="id")
     */
    private $kupec;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\ProdajaPredstave", inversedBy="racun")
     * @ORM\JoinColumn(name="prodaja_predstave_id", referencedColumnName="id")
     */
    private $prodajaPredstave;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\NacinPlacina")
     * @ORM\JoinColumn(name="nacin_placina_id", referencedColumnName="id", nullable=false)
     */
    private $nacinPlacina;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\PlacilniInstrument", inversedBy="racun")
     * @ORM\JoinColumn(name="placilni_instrument_id", referencedColumnName="id")
     */
    private $placilniInstrument;

    public function __construct()
    {
        $this->postavke = new ArrayCollection();
    }

    public function getId()
    {
        return $this->id;
    }

    public function getPostavke()
    {
        return $this->postavke;
    }

    public function getKupec()
    {
        return $this->kupec;
    }

    public function getProdajaPredstave()
    {
        return $this->prodajaPredstave;
    }

    public function getNacinPlacina()
    {
        return $this->nacinPlacina;
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

    public function setPostavke($postavke)
    {
        $this->postavke = $postavke;
        return $this;
    }

    public function setKupec($kupec)
    {
        $this->kupec = $kupec;
        return $this;
    }

    public function setProdajaPredstave($prodajaPredstave)
    {
        $this->prodajaPredstave = $prodajaPredstave;
        return $this;
    }

    public function setNacinPlacina($nacinPlacina)
    {
        $this->nacinPlacina = $nacinPlacina;
        return $this;
    }

    public function setPlacilniInstrument($placilniInstrument)
    {
        $this->placilniInstrument = $placilniInstrument;
        return $this;
    }

}
