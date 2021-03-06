<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Max\Ann\Entity as Max;
use Max\Entity\Base;

/**
 * @ORM\Entity(repositoryClass="App\Repository\Trrji")
 * @Max\Id(prefix="0007")
 * @Max\I18n(label="Transakcijski račun",plural="Transakcijski računi")
 * @Max\Lookup(ident="stevilka", label="stevilka", search={"stevilka"})
 */
class Trr
        extends Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\Ui(type="id")
     * @var string
     */
    protected $id;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="trr.stevilka", description="trr.d.stevilka")
     * @Max\Ui(type="sifra", required=true)
     * @var string
     */
    protected $stevilka;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="trr.swift", description="trr.d.swift")
     * @Max\Ui(type="sifra")
     * @var string
     */
    protected $swift;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="trr.bic", description="trr.d.bic")
     * @Max\Ui(type="sifra")
     * @var string
     */
    protected $bic;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="trr.banka", description="trr.d.banka")
     * @Max\Ui(type="sifra",icon="fa fa-university",required=true)
     * @var string
     */
    protected $banka;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Popa", inversedBy="trrji")
     * @ORM\JoinColumn(name="popa_id", referencedColumnName="id")
     * @Max\I18n(label="Klient",  description="Poslovni partner, ki je lastnik transakcijskega računa")
     * @Max\Ui(type="hiddenid")
     * @var \App\Entity\Popa
     */
    protected $popa;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Oseba", inversedBy="trrji")
     * @ORM\JoinColumn(name="oseba_id", referencedColumnName="id")
     * @Max\I18n(label="Oseba",  description="Oseba, ki je lastnica transakcijskega računa")
     * @Max\Ui(type="hiddenid")
     * @var \App\Entity\Oseba
     */
    protected $oseba;

    public function validate($mode = 'update')
    {
        $this->expect($this->popa || $this->oseba, 'Lastnik računa ni nastavljen - Poslovni partner ali oseba', 1000200);
        $this->expect(!($this->popa && $this->oseba), "Lastnika računa je lahko samo poslovni partner ali oseba", 1000203);
        $this->expect($this->banka, "Banka je obvezen podatek na računu", 1000201);
        $this->expect($this->stevilka, "Številka računa je obvezen podatek", 1000202);
    }

    public function getId()
    {
        return $this->id;
    }

    public function getStevilka()
    {
        return $this->stevilka;
    }

    public function getSwift()
    {
        return $this->swift;
    }

    public function getBic()
    {
        return $this->bic;
    }

    public function getBanka()
    {
        return $this->banka;
    }

    public function getPopa()
    {
        return $this->popa;
    }

    public function getOseba()
    {
        return $this->oseba;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setStevilka($stevilka)
    {
        $this->stevilka = $stevilka;
        return $this;
    }

    public function setSwift($swift)
    {
        $this->swift = $swift;
        return $this;
    }

    public function setBic($bic)
    {
        $this->bic = $bic;
        return $this;
    }

    public function setBanka($banka)
    {
        $this->banka = $banka;
        return $this;
    }

    public function setPopa(\App\Entity\Popa $popa=null)
    {
        $this->popa = $popa;
        return $this;
    }

    public function setOseba(\App\Entity\Oseba $oseba=null)
    {
        $this->oseba = $oseba;
        return $this;
    }

}
