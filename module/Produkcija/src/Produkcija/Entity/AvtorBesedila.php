<?php

namespace Produkcija\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="Produkcija\Repository\AvtorjiBesedila")
 * @Max\I18n(label="Avtor besedila",plural="Avtorji besedila")
 * @Max\Id(prefix="0061")
 */
class AvtorBesedila
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID rekvizita")
     * @Max\Ui(type="id")
     * @var string
     */
    protected $id;

    /**
     * vloga oz. tipAvtorja(npr. soavtor, avtor orig. besedila, lektor, prevajalec ipd.)
     * 
     * @ORM\Column(type="string")
     * @Max\I18n(label="avtorBesedila.tipAvtorja", description="avtorBesedila.d.tipAvtorja")
     * @var string
     */
    protected $tipAvtorja;

    /**
     * Zaporedna številka, ki se upošteva kot prikaz avtorja v uprizoritve
     * 
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="avtorBesedila.zaporedna", description="avtorBesedila.d.zaporedna")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $zaporedna;

    /**
     * Ali se ta avtor upošteva pri prikazu uprizoritve 
     * 
     * npr. lektor se verjetno ne prikaže na vrhu gledališkega lista
     * 
     * @ORM\Column(type="boolean", length=1, nullable=true)
     * @Max\I18n(label="avtorBesedila.aliVNaslovu", description="avtorBesedila.d.aliVNaslovu")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    protected $aliVNaslovu = true;

    /**
     * 
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Besedilo", inversedBy="avtorji")
     * @Max\I18n(label="avtorBesedila.besedilo", description="avtorBesedila.d.besedilo")
     * @Max\Ui(type="hiddenid")
     * @var \Produkcija\Entity\Besedilo
     */
    protected $besedilo;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Oseba", inversedBy="avtorjiBesedil")
     * @Max\I18n(label="avtorBesedila.oseba",  description="avtorBesedila.d.oseba")
     * @Max\Ui(type="toone")
     * @var \App\Entity\Oseba
     */
    protected $oseba;

    public function preracunaj($smer = false)
    {
        /**
         * smer up pomeni oseba->avtorbesedila->besedilo->uprizoritve
         */
        if ($smer == \Max\Consts::UP) {
            if ($this->getBesedilo()) {
                $this->getBesedilo()->preracunaj(\Max\Consts::UP);
            }
        }
    }

    public function validate($mode = 'update')
    {
        
    }

    public function getId()
    {
        return $this->id;
    }

    public function getTipAvtorja()
    {
        return $this->tipAvtorja;
    }

    public function getZaporedna()
    {
        return $this->zaporedna;
    }

    public function getAliVNaslovu()
    {
        return $this->aliVNaslovu;
    }

    public function getBesedilo()
    {
        return $this->besedilo;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setTipAvtorja($tipAvtorja)
    {
        $this->tipAvtorja = $tipAvtorja;
        return $this;
    }

    public function setZaporedna($zaporedna)
    {
        $this->zaporedna = $zaporedna;
        return $this;
    }

    public function setAliVNaslovu($aliVNaslovu)
    {
        $this->aliVNaslovu = $aliVNaslovu;
        return $this;
    }

    public function setBesedilo(\Produkcija\Entity\Besedilo $besedilo = null)
    {
        $this->besedilo = $besedilo;
        return $this;
    }

    public function getOseba()
    {
        return $this->oseba;
    }

    public function setOseba(\App\Entity\Oseba $oseba = null)
    {
        $this->oseba = $oseba;
        return $this;
    }

}
