<?php

namespace Produkcija\Entity;

use Doctrine\ORM\Mapping as ORM;
use Max\Ann\Entity as Max;
use Max\Entity\Base;

/**
 * Vrste materialnih stroškov
 * 
 * @ORM\Entity(repositoryClass="Produkcija\Repository\VrsteStroska")
 * @Max\I18n(label="Vrsta stroška",plural="Vrste stroška")
 * @Max\Id(prefix="0059")
 */
class VrstaStroska
        extends Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID tipa stroška")
     * @Max\Ui(type="id")
     * @var string    
     */
    protected $id;

    /**
     * @ORM\Column(type="integer")
     * @Max\I18n(label="vrstaStroska.skupina", description="vrstaStroska.d.skupina")
     * @Max\Ui(type="integer",icon="fa fa-sort")
     * @var integer
     */
    protected $skupina;

    /**
     * če je 0 se uporablja kotglava npr. ime skupine ali kot seštevek
     * 
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="vrstaStroska.podskupina", description="vrstaStroska.d.podskupina")
     * @Max\Ui(type="integer",icon="fa fa-sort")
     * @var integer
     */
    protected $podskupina;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="vrstaStroska.naziv", description="vrstaStroska.d.naziv")
     * @Max\Ui(type="naziv",ident=true, required=true)
     * @var string
     */
    protected $naziv;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="vrstaStroska.opis", description="vrstaStroska.d.opis")
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

    public function getSkupina()
    {
        return $this->skupina;
    }

    public function getPodskupina()
    {
        return $this->podskupina;
    }

    public function getNaziv()
    {
        return $this->naziv;
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

    public function setSkupina($skupina)
    {
        $this->skupina = $skupina;
        return $this;
    }

    public function setPodskupina($podskupina)
    {
        $this->podskupina = $podskupina;
        return $this;
    }

    public function setNaziv($naziv)
    {
        $this->naziv = $naziv;
        return $this;
    }

    public function setOpis($opis)
    {
        $this->opis = $opis;
        return $this;
    }

}
