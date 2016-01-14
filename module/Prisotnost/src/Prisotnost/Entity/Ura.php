<?php

namespace Prisotnost\Entity;

use Doctrine\ORM\Mapping as ORM;
use Max\Ann\Entity as Max;
use Max\Entity\Base;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * Ure prisotnosti zaposlenih
 * 
 * @ORM\Entity(repositoryClass="Prisotnost\Repository\Ure")
 * @Max\I18n(label="Ura",plural="Ure")
 * @Max\Id(prefix="0071")
 */
class Ura
        extends Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID termina storitve")
     * @Max\Ui(type="id")
     * @var string   
     */
    protected $id;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     * @Max\I18n(label="ura.zacetek", description="ura.d.zacetek")
     * @var string
     */
    protected $zacetek;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     * @Max\I18n(label="ura.konec", description="ura.d.konec")
     * @var string
     */
    protected $konec;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Oseba")
     * @Max\I18n(label="ura.oseba",  description="ura.d.oseba")
     * @Max\Ui(type="toone")
     * @var \App\Entity\Oseba
     */
    protected $oseba;
    
    /**
     * @ORM\OneToOne(targetEntity="Prisotnost\Entity\TerminStoritve", inversedBy="ura")
     * @Max\I18n(label = "ura.terminStoritve", description = "ura.d.terminStoritve")
     * @Max\Ui(type="hiddenid")
     * @var \Prisotnost\Entity\TerminStoritve
     */
    protected $terminStoritve;

    /**
     * @ORM\OneToMany(targetEntity="Prisotnost\Entity\Dodatek", mappedBy="ura", orphanRemoval=true)
     * @var <Dodatki>
     */
    protected $dodatki;

    public function __construct()
    {
        $this->dodatki = new ArrayCollection();
    }

    public function validate($mode = 'update')
    {
        $this->expect($this->oseba, "Oseba je obvezen podatek", 1001770);
        $this->expect($this->zacetek, "Začetek je obvezen podatek", 1001771);
        $this->expect($this->konec, "Konec je obvezen podatek", 1001772);
        $this->expect($this->zacetek < $this->konec, "Konec mora biti za začetkom", 1001773);

        /*
         * $$ kontrola, da se ure ne smejo prekrivati - ali takoj ali pri oddaji?
         */
    }

    function getId()
    {
        return $this->id;
    }

    function getZacetek()
    {
        return $this->zacetek;
    }

    function getKonec()
    {
        return $this->konec;
    }

    function getOseba()
    {
        return $this->oseba;
    }

    function getTerminStoritve()
    {
        return $this->terminStoritve;
    }

    function getDodatki()
    {
        return $this->dodatki;
    }

    function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    function setZacetek($zacetek)
    {
        $this->zacetek = $zacetek;
        return $this;
    }

    function setKonec($konec)
    {
        $this->konec = $konec;
        return $this;
    }

    function setOseba(\App\Entity\Oseba $oseba)
    {
        $this->oseba = $oseba;
        return $this;
    }

    function setTerminStoritve(\Prisotnost\Entity\TerminStoritve $terminStoritve = null)
    {
        $this->terminStoritve = $terminStoritve;
        return $this;
    }

    function setDodatki($dodatki)
    {
        $this->dodatki = $dodatki;
        return $this;
    }

}
