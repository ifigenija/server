<?php

namespace Koledar\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

/**
 * Entiteta za naslove
 *
 * @ORM\Entity(repositoryClass="Koledar\Repository\Vaje")
 * @Max\I18n(label="Vaja",plural="Vaje")
 * @Max\Id(prefix="0032")
 *  */
class Vaja
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID poštnega naslova")
     * @Max\Ui(type="id")
     * @var string
     */
    private $id;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="Zaporedna št.", description="Zaporedna številka vaje")
     * @var integer
     * 
     */
    private $zaporedna;

    /**
     * 
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="Poročilo", description="Poročilo")
     * @var string
     */
    private $porocilo;

    /**
     * @ORM\OneToOne(targetEntity="Koledar\Entity\Dogodek", mappedBy="vaja")
     * @Max\I18n(label="Dogodek",  description="Dogodek")
     * @Max\Ui(type="toone")
     * @var \Koledar\Entity\Dogodek
     */
    private $dogodek;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Uprizoritev", inversedBy="vaje")
     * @ORM\JoinColumn(name="uprizoritev_id", referencedColumnName="id")
     * @Max\I18n(label="Uprizoritev",  description="Uprizoritve")
     * @Max\Ui(type="toone")
     * @var \Produkcija\Entity\Uprizoritev
     */
    private $uprizoritev;

    public function validate($mode = 'update')
    {
        
    }

    public function getId()
    {
        return $this->id;
    }

    public function getZaporedna()
    {
        return $this->zaporedna;
    }

    public function getPorocilo()
    {
        return $this->porocilo;
    }

    public function getDogodek()
    {
        return $this->dogodek;
    }

    public function getUprizoritev()
    {
        return $this->uprizoritev;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setZaporedna($zaporedna)
    {
        $this->zaporedna = $zaporedna;
        return $this;
    }

    public function setPorocilo($porocilo)
    {
        $this->porocilo = $porocilo;
        return $this;
    }

    public function setDogodek(\Koledar\Entity\Dogodek $dogodek)
    {
        $this->dogodek = $dogodek;
        return $this;
    }

    public function setUprizoritev(\Produkcija\Entity\Uprizoritev $uprizoritev)
    {
        $this->uprizoritev = $uprizoritev;
        return $this;
    }

}
