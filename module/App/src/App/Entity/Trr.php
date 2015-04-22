<?php

namespace App\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="App\Repository\Trrji")
 * @Max\Id(prefix="0007")
 *  */
class Trr
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $id;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $stevilka;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $swift;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $bic;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $banka;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Popa", inversedBy="trrji")
     * @ORM\JoinColumn(name="popa_id", referencedColumnName="id")
     * @Max\Ui(type="toone")
     */
    private $popa;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Oseba", inversedBy="trrji")
     * @ORM\JoinColumn(name="oseba_id", referencedColumnName="id")
     * @Max\Ui(type="toone")
     */
    private $oseba;
    
    
    public function validate($mode = 'update')
    {
        $this->expect($this->popa || $this->oseba, 'Lastnik računa ni nastavljen - Poslovni partner ali oseba', 1000200);        
        $this->expect(!($this->popa && $this->oseba), "Lastnika računa je lahko samo poslovni partner ali oseba", 1000203);
        $this->expect($this->banka, "Banka je obvezen podatek na računu", 1000201);
        $this->expect($this->stevilka, "Številka računa je obvezen podatek", 1000202);
                
    }

    function getId()
    {
        return $this->id;
    }

    function getStevilka()
    {
        return $this->stevilka;
    }

    function getSwift()
    {
        return $this->swift;
    }

    function getBic()
    {
        return $this->bic;
    }

    function getBanka()
    {
        return $this->banka;
    }

    function getPopa()
    {
        return $this->popa;
    }

    function getOseba()
    {
        return $this->oseba;
    }

    function setId($id)
    {
        $this->id = $id;
    }

    function setStevilka($stevilka)
    {
        $this->stevilka = $stevilka;
    }

    function setSwift($swift)
    {
        $this->swift = $swift;
    }

    function setBic($bic)
    {
        $this->bic = $bic;
    }

    function setBanka($banka)
    {
        $this->banka = $banka;
    }

    function setPopa($popa)
    {
        $this->popa = $popa;
    }

    function setOseba($oseba)
    {
        $this->oseba = $oseba;
    }

}
