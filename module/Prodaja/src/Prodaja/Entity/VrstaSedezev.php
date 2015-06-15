<?php

namespace Prodaja\Entity;

use Doctrine\ORM\Mapping AS ORM;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * @ORM\Entity
 */
class VrstaSedezev
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
    private $poravnava;

    /**
     * @ORM\Column(type="string", length=2, nullable=true)
     */
    private $oblika;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\Sedez", mappedBy="vrsta")
     */
    private $sedezi;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\PodrocjeSedenja", inversedBy="vrsta")
     * @ORM\JoinColumn(name="podrocja_sedenja_id", referencedColumnName="id", nullable=false)
     */
    private $podrocjaSedenja;

    public function __construct()
    {
        $this->sedezi = new ArrayCollection();
    }

    public function getId()
    {
        return $this->id;
    }

    public function getKapaciteta()
    {
        return $this->kapaciteta;
    }

    public function getPoravnava()
    {
        return $this->poravnava;
    }

    public function getOblika()
    {
        return $this->oblika;
    }

    public function getSedezi()
    {
        return $this->sedezi;
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

    public function setKapaciteta($kapaciteta)
    {
        $this->kapaciteta = $kapaciteta;
        return $this;
    }

    public function setPoravnava($poravnava)
    {
        $this->poravnava = $poravnava;
        return $this;
    }

    public function setOblika($oblika)
    {
        $this->oblika = $oblika;
        return $this;
    }

    public function setSedezi($sedezi)
    {
        $this->sedezi = $sedezi;
        return $this;
    }

    public function setPodrocjaSedenja($podrocjaSedenja)
    {
        $this->podrocjaSedenja = $podrocjaSedenja;
        return $this;
    }

}
