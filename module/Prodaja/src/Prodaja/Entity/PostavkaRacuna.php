<?php

namespace Prodaja\Entity;

use Doctrine\ORM\Mapping AS ORM;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * @ORM\Entity
 */
class PostavkaRacuna
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     */
    protected $id;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\RazpisanSedez", mappedBy="postavkaRacuna")
     */
    protected $prodanSedez;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\Racun", inversedBy="postavke")
     * @ORM\JoinColumn(name="racun_id", referencedColumnName="id")
     */
    protected $dokument;

    public function __construct()
    {
        $this->prodanSedez = new ArrayCollection();
    }

    public function getId()
    {
        return $this->id;
    }

    public function getProdanSedez()
    {
        return $this->prodanSedez;
    }

    public function getDokument()
    {
        return $this->dokument;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setProdanSedez($prodanSedez)
    {
        $this->prodanSedez = $prodanSedez;
        return $this;
    }

    public function setDokument($dokument)
    {
        $this->dokument = $dokument;
        return $this;
    }

}
