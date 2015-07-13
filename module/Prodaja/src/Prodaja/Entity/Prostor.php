<?php

namespace Prodaja\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

/**
 *
 * @ORM\Entity(repositoryClass="Prodaja\Repository\Prostori")
 * @Max\I18n(label="Prostor",plural="Prostori")
 * @Max\Id(prefix="0034")
 * @Max\Lookup(extra={"kapaciteta","jePrizorisce"})
 *  */
class Prostor
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
    protected $id;   
    
    /**
     * @ORM\Column(type="string", unique=true, nullable=false)
     * @Max\I18n(label="prostor.sifra", description="prostor.d.sifra")
     * @Max\Ui(type="sifra",ident=true, icon="fa fa-barcode")
     * @var string
     */
    protected $sifra;

    /**
     * @ORM\Column(type="string", unique=true, nullable=false)
     * @Max\I18n(label="prostor.naziv", description="prostor.d.naziv")
     * @Max\Ui(type="naziv",ident=true )
     * @var string
     */
    protected $naziv;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="prostor.jePrizorisce", description="prostor.d.jePrizorisce")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    protected $jePrizorisce;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="prostor.kapaciteta", description="prostor.d.kapaciteta")
     * @var integer
     */
    protected $kapaciteta;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="prostor.opis", description="prostor.d.opis")
     * @var string
     */
    protected $opis;

    
    public function validate($mode = 'update')
    {
        
    }
    public function getId()
    {
        return $this->id;
    }

    public function getSifra()
    {
        return $this->sifra;
    }

    public function getNaziv()
    {
        return $this->naziv;
    }

    public function getJePrizorisce()
    {
        return $this->jePrizorisce;
    }

    public function getKapaciteta()
    {
        return $this->kapaciteta;
    }

    public function getOpis()
    {
        return $this->opis;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setSifra($sifra)
    {
        $this->sifra = $sifra;
        return $this;
    }

    public function setNaziv($naziv)
    {
        $this->naziv = $naziv;
        return $this;
    }

    public function setJePrizorisce($jePrizorisce)
    {
        $this->jePrizorisce = $jePrizorisce;
        return $this;
    }

    public function setKapaciteta($kapaciteta)
    {
        $this->kapaciteta = $kapaciteta;
        return $this;
    }

    public function setOpis($opis)
    {
        $this->opis = $opis;
        return $this;
    }


}
