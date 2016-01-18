<?php

namespace Koledar\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;
use Produkcija\Entity\Uprizoritev;

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

    use DogodekTrait;

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID poštnega naslova")
     * @Max\Ui(type="id")
     * @var string
     */
    protected $id;

    /**
     * @ORM\ManyToOne(targetEntity="Koledar\Entity\TipVaje", inversedBy="vaje", fetch="EAGER")
     * @Max\I18n(label = "vaja.tipvaje", description = "vaja.d.tipvaje")
     * @Max\Ui(type="lookupselect", empty="Izberite tip vaje", required=false)
     * @var \Koledar\Entity\TipVaje
     */
    protected $tipvaje = null;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label = "vaja.zaporedna", description = "vaja.d.zaporedna")
     * @Max\Ui(type="integer", ident=true)
     * @var integer
     */
    protected $zaporedna;

    /**
     * @ORM\OneToOne(targetEntity="Koledar\Entity\Dogodek", mappedBy="vaja", cascade={"persist"})
     * @Max\I18n(label = "vaja.dogodek", description = "vaja.d.dogodek")
     * @Max\Ui(type="toone")
     * @var \Koledar\Entity\Dogodek
     */
    protected $dogodek;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Uprizoritev", inversedBy="vaje")
     * @ORM\JoinColumn(name="uprizoritev_id", referencedColumnName="id")
     * @Max\I18n(label = "vaja.uprizoritev", description = "vaja.d.uprizoritev")
     * @Max\Ui(type="hiddenid", required=true)
     * @var Uprizoritev
     */
    protected $uprizoritev;

    public function validate($mode = 'update')
    {
        $this->expect($this->uprizoritev, "Pri vaji je uprizoritev obvezna", 1000471);
    }

    public function getUprizoritev()
    {
        return $this->uprizoritev;
    }

    public function setUprizoritev(Uprizoritev $uprizoritev = null)
    {
        $this->uprizoritev = $uprizoritev;
        return $this;
    }

    public function lahkoBrisem()
    {
        if ($this->getDogodek()) {
            $niPotrjen = $this->getDogodek()->getStatus() < Dogodek::ODOBREN;
            $this->expect($niPotrjen, "Dogodek je javno potrjen, brisanje ni mogoče", 1000544);
        }
    }

    /**
     * dodaj dogodek
     */
    public function dodajDogodek()
    {

        $this->dogodek = new Dogodek();

        $this->dogodek->setVaja($this);
        $this->dogodek->setRazred(Dogodek::VAJA);
    }

    public function getDogodek()
    {
        return $this->dogodek;
    }

    public function setDogodek(Dogodek $dogodek = null)
    {
        $this->dogodek = $dogodek;
        return $this;
    }

    function getId()
    {
        return $this->id;
    }

    function getTipvaje()
    {
        return $this->tipvaje;
    }

    function getZaporedna()
    {
        return $this->zaporedna;
    }

    function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    function setTipvaje(\Koledar\Entity\TipVaje $tipvaje = null)
    {
        $this->tipvaje = $tipvaje;
        return $this;
    }

    function setZaporedna($zaporedna)
    {
        $this->zaporedna = $zaporedna;
        return $this;
    }

}
