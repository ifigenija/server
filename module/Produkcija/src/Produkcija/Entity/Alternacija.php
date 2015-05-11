<?php

namespace Produkcija\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity
 * @Max\I18n(label="Alternacija",plural="Alternacije")
 * @Max\Id(prefix="0012")
 */
class Alternacija
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="ID", description="ID alternacije")
     * @Max\Ui(type="id")
     * @var string

     */
    private $id;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="zaposlen", description="Ali je zaposlen")
     * @Max\Ui(type="boolcheckbox")     
     * @var boolean
     */
    private $zaposlen;

    /**
     * 
     * 
     */
    private $funkcija;

    /**
     * 
     * 
     * @Max\I18n(label="Vloga",  description="Vloga pri alternaciji")
     * @Max\Ui(type="toone")
     * @var
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Funkcija", inversedBy="alternacije")
     * @ORM\JoinColumn(name="vloga_id", referencedColumnName="id", nullable=false) \Produkcija\Entity\Funkcija
     */
    private $vloga;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Zaposlitev", inversedBy="alternacija")
     * @ORM\JoinColumn(name="sodelovanje_id", referencedColumnName="id")
     * @Max\I18n(label="Sodelovanje",  description="Sodelovanje oz. zaposlitev")
     * @Max\Ui(type="toone")
     * @var \Produkcija\Entity\Funkcija
     */
    private $sodelovanje;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Oseba", inversedBy="alternacije")
     * @ORM\JoinColumn(name="oseba_id", referencedColumnName="id")
     * @Max\I18n(label="Oseba",  description="Oseba pri alternaciji")
     * @Max\Ui(type="toone")
     * @var \App\Entity\Oseba
     */
    private $oseba;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\ProdukcijaDelitev", inversedBy="alternacije")
     * @ORM\JoinColumn(name="koprodukcija_delitev_id", referencedColumnName="id")
     * @Max\I18n(label="Koprodukcija",  description="Koprodukcija pri alternaciji")
     * @Max\Ui(type="toone")
     * @var \Produkcija\Entity\ProdukcijaDelitev
     */
    private $koprodukcija;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Pogodba", inversedBy="alternacije")
     * @ORM\JoinColumn(name="pogodba_id", referencedColumnName="id")
     * @Max\I18n(label="Pogodba",  description="Pogodba pri alternaciji")
     * @Max\Ui(type="toone")
     * @var \Produkcija\Entity\Pogodba
     */
    private $pogodba;

    public function validate($mode = 'update')
    {
        
    }
    public function getId()
    {
        return $this->id;
    }

    public function getZaposlen()
    {
        return $this->zaposlen;
    }

    public function getVloga()
    {
        return $this->vloga;
    }

    public function getSodelovanje()
    {
        return $this->sodelovanje;
    }

    public function getOseba()
    {
        return $this->oseba;
    }

    public function getKoprodukcija()
    {
        return $this->koprodukcija;
    }

    public function getPogodba()
    {
        return $this->pogodba;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setZaposlen($zaposlen)
    {
        $this->zaposlen = $zaposlen;
        return $this;
    }

    public function setVloga(\Produkcija\Entity\Funkcija $vloga)
    {
        $this->vloga = $vloga;
        return $this;
    }

    public function setSodelovanje(\Produkcija\Entity\Funkcija $sodelovanje)
    {
        $this->sodelovanje = $sodelovanje;
        return $this;
    }

    public function setOseba(\App\Entity\Oseba $oseba)
    {
        $this->oseba = $oseba;
        return $this;
    }

    public function setKoprodukcija(\Produkcija\Entity\ProdukcijaDelitev $koprodukcija)
    {
        $this->koprodukcija = $koprodukcija;
        return $this;
    }

    public function setPogodba(\Produkcija\Entity\Pogodba $pogodba)
    {
        $this->pogodba = $pogodba;
        return $this;
    }


}
