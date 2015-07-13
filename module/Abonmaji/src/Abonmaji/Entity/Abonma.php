<?php

namespace Abonmaji\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="Abonmaji\Repository\Abonmaji")
 * @Max\Id(prefix="0010")
 * @Max\I18n(label="Abonma",plural="Abonmaji")

 */
class Abonma
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="ID", description="ID abonmaja")
     * @Max\Ui(type="id")
     * @var string
     */
    protected $id;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="abonma.stPredstav", description="abonma.d.stPredstav")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stPredstav;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="abonma.stKuponov", description="abonma.d.stKuponov")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stKuponov;

    /**
     * @ORM\Column(type="string", length=40, nullable=true)
     * @Max\I18n(label="abonma.ime", description="abonma.d.ime")
     * @Max\Ui(ident=true,type="naziv")
     * @var string
     */
    protected $ime;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="abonma.opis", description="abonma.d.opis")
     */
    protected $opis;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="abonma.kapaciteta", description="abonma.d.kapaciteta")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $kapaciteta;

    public function validate($mode = 'update')
    {
        $this->expect($this->stPredstav >= 0, "Število predstava ne sme biti negativno", 1000330);
    }

    public function getId()
    {
        return $this->id;
    }

    public function getStPredstav()
    {
        return $this->stPredstav;
    }

    public function getStKuponov()
    {
        return $this->stKuponov;
    }

    public function getIme()
    {
        return $this->ime;
    }

    public function getOpis()
    {
        return $this->opis;
    }

    public function getKapaciteta()
    {
        return $this->kapaciteta;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setStPredstav($stPredstav)
    {
        $this->stPredstav = $stPredstav;
        return $this;
    }

    public function setStKuponov($stKuponov)
    {
        $this->stKuponov = $stKuponov;
        return $this;
    }

    public function setIme($ime)
    {
        $this->ime = $ime;
        return $this;
    }

    public function setOpis($opis)
    {
        $this->opis = $opis;
        return $this;
    }

    public function setKapaciteta($kapaciteta)
    {
        $this->kapaciteta = $kapaciteta;
        return $this;
    }

}
