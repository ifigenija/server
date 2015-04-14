<?php

namespace App\Entity;

use Doctrine\ORM\Mapping AS ORM;

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
     * @ORM\Column(type="string", length=20, nullable=false)
     */
    private $vrsta;

    /**
     * @ORM\Column(type="string", length=30, nullable=false)
     */
    private $stevilka;

    /**
     * @ORM\Column(nullable=false)
     */
    private $privzeta;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Oseba", inversedBy="telefonske")
     * @ORM\JoinColumn(name="oseba_id", referencedColumnName="id")
     */
    private $oseba;

    /**
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

    function setOseba($oseba)
    {
        $this->oseba = $oseba;
    }

    function setPopa($popa)
    {
        $this->popa = $popa;
    }

}
