<?php

namespace App\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="App\Repository\Trrji")
 * @Max\Id(prefix="0007")
 * @Max\I18n(label="Transakcijski račun",plural="Transakcijski računi")
 */
class Trr
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\Ui(type="id")
     * @var string
     */
    private $id;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\Ui(type="sifra")
     * @var string
     */
    private $stevilka;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\Ui(type="sifra")
     * @var string
     */
    private $swift;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\Ui(type="sifra")
     * @var string
     */
    private $bic;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\Ui(type="sifra",icon="fa fa-university")
     * @var string
     */
    private $banka;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Popa", inversedBy="trrji")
     * @ORM\JoinColumn(name="popa_id", referencedColumnName="id")
     * @Max\I18n(label="Klient",  description="Poslovni partner, ki je lastnik transakcijskega računa")
     * @Max\Ui(type="hidden")
     * @var \App\Entity\Popa
     */
    private $popa;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Oseba", inversedBy="trrji")
     * @ORM\JoinColumn(name="oseba_id", referencedColumnName="id")
     * @Max\I18n(label="Oseba",  description="Oseba, ki je lastnica transakcijskega računa")
     * @Max\Ui(type="hidden")
     * @var \App\Entity\Oseba
     */
    private $oseba;

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

    public function setPopa(\App\Entity\Popa $popa = null)
    {
        $this->popa = $popa;
        return $this;
    }

    public function setOseba(\App\Entity\Oseba $oseba = null)
    {
        $this->oseba = $oseba;
        return $this;
    }

}
