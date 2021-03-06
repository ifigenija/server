<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Max\Ann\Entity as Max;
use Max\Entity\Base;

/**
 * @ORM\Entity(repositoryClass="App\Repository\Telefonske")
 * @Max\I18n(label="Telefonska številka",plural="Telefonske številke")
 */
class Telefonska
        extends Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="ID", description="ID telefonske številke")
     * @Max\Ui(type="id")
     * @var string
     */
    protected $id;

    /**
     * Vrsta telefonske številke - domača 
     * 
     * @ORM\Column(type="string", length=20, nullable=false)
     * @Max\I18n(label="tel.vrsta", description="tel.d.vrsta")   
     * @Max\Ui(type="select", opts="telefonska.vrsta")
     * @var string
     */
    protected $vrsta;

    /**
     * Številka 
     * 
     * @ORM\Column(type="string", length=30, nullable=true)
     * @Max\I18n(label="tel.stevilka", description="tel.d.stevilka")
     * @Max\Ui(type="sifra")
     * @var string
     */
    protected $stevilka;

    /**
     * A je to privzeta telefonska številka 
     * 
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="tel.privzeta", description="tel.d.privzeta")   
     * @Max\Ui(type="boolcheckbox",required=false)
     */
    protected $privzeta = false;

    /**
     * Lastnike telefonske številke - če gre za osebo
     * 
     * @ORM\ManyToOne(targetEntity="App\Entity\Oseba", inversedBy="telefonske")
     * @ORM\JoinColumn(name="oseba_id", referencedColumnName="id")
     * @Max\I18n(label="tel.oseba",  description="tel.d.oseba")
     * @Max\Ui(type="hiddenid")
     * @var \App\Entity\Oseba
     *
     */
    protected $oseba;

    /**
     * Lastnik telfonske številke, če gre za poslovnega partnerja
     * 
     * @ORM\ManyToOne(targetEntity="App\Entity\Popa", inversedBy="telefonske")
     * @ORM\JoinColumn(name="popa_id", referencedColumnName="id")
     * @Max\I18n(label="tel.popa",  description="tel.d.popa")
     * @Max\Ui(type="hiddenid")
     * @var \App\Entity\Popa
     */
    protected $popa;

    public function validate($mode = 'update')
    {
        $this->expect($this->popa || $this->oseba, 'Lastnik računa ni nastavljen - Poslovni partner ali oseba', 1000460);
        $this->expect(!($this->popa && $this->oseba), "Lastnika računa je lahko samo poslovni partner ali oseba", 1000461);
        $this->expect($this->stevilka, "Telefonska številka  je obvezen podatek", 1000462);
    }

    public function getId()
    {
        return $this->id;
    }

    public function getVrsta()
    {
        return $this->vrsta;
    }

    public function getStevilka()
    {
        return $this->stevilka;
    }

    public function getPrivzeta()
    {
        return $this->privzeta;
    }

    public function getOseba()
    {
        return $this->oseba;
    }

    public function getPopa()
    {
        return $this->popa;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setVrsta($vrsta)
    {
        $this->vrsta = $vrsta;
        return $this;
    }

    public function setStevilka($stevilka)
    {
        $this->stevilka = $stevilka;
        return $this;
    }

    public function setPrivzeta($privzeta)
    {
        $this->privzeta = $privzeta;
        return $this;
    }

    public function setOseba(\App\Entity\Oseba $oseba = null)
    {
        $this->oseba = $oseba;
        return $this;
    }

    public function setPopa(\App\Entity\Popa $popa=null)
    {
        $this->popa = $popa;
        return $this;
    }

}
