<?php

namespace App\Entity;

use Doctrine\ORM\Mapping AS ORM;
use Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="App\Repository\Telefonske")
 */
class Telefonska
            extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $id;

    /**
     * Vrsta telefonske številke - domača 
     * 
     * @ORM\Column(type="string", length=20, nullable=false)
     * @Max\Ui(type="select", opts="telefonska.vrsta")
  
     */
    private $vrsta;

    /**
     * Številka 
     * 
     * @ORM\Column(type="string", length=30)
     * @Max\I18n(label="Številka", description="Telefonska številka")
     */
    private $stevilka;

    /**
     * A je to privzeta telefonska številka 
     * 
     * @ORM\Column(type="boolean")
     * @Max\Ui(type="boolcheckbox",required=false)
     */
    private $privzeta = false;

    /**
     * Lastnike telefonske številke - če gre za osebo
     * 
     * @ORM\ManyToOne(targetEntity="App\Entity\Oseba", inversedBy="telefonske")
     * @ORM\JoinColumn(name="oseba_id", referencedColumnName="id")
     *
     */
    private $oseba;

    /**
     * Lastnik telfonske številke, če gre za 
     * 
     * @ORM\ManyToOne(targetEntity="App\Entity\Popa", inversedBy="telefonske")
     * @ORM\JoinColumn(name="popa_id", referencedColumnName="id")
     */
    private $popa;

    function getId()
    {
        return $this->id;
    }

    function getVrsta()
    {
        return $this->vrsta;
    }

    function getStevilka()
    {
        return $this->stevilka;
    }

    function getPrivzeta()
    {
        return $this->privzeta;
    }

    function getOseba()
    {
        return $this->oseba;
    }

    function getPopa()
    {
        return $this->popa;
    }

    function setId($id)
    {
        $this->id = $id;
    }

    function setVrsta($vrsta)
    {
        $this->vrsta = $vrsta;
    }

    function setStevilka($stevilka)
    {
        $this->stevilka = $stevilka;
    }

    function setPrivzeta($privzeta)
    {
        $this->privzeta = $privzeta;
    }

    function setOseba(Oseba $oseba = null)
    {
        $this->oseba = $oseba;
    }

    function setPopa(Popa $popa = null)
    {
        $this->popa = $popa;
    }

}
