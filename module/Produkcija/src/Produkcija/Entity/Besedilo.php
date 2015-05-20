<?php

namespace Produkcija\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;

/**
 * Besedilo uprizoritve
 * 
 * @ORM\Entity(repositoryClass="Produkcija\Repository\Besedila")
 * @Max\I18n(label="Besedilo",plural="Besedilo uprizoritve")
 * @Max\Id(prefix="0022")
 */
class Besedilo
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="")
     * @Max\Ui(type="id")
     * @var string
     */
    private $id;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Naslov", description="Naslov besedila")
     * @Max\Ui(type="naziv",ident=true )
     * @var string
     */
    private $naslov;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Avtor", description="Avtor besedila")
     * @var string
     */
    private $avtor;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Podnaslov", description="Podnaslov besedila")
     * @var string
     */
    private $podnaslov;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Jezik", description="Jezik besedila")
     * @var string
     */
    private $jezik;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Naslov izvirnika", description="Naslov izvirnika besedila")
     * @var string
     */
    private $naslovIzvirnika;

    /**
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="Datum prejema", description="Datum prejema besedila")
     * @var string
     */
    private $datumPrejema;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="Moške vloge", description="Moške vloge")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $moskeVloge;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="Ženske vloge", description="Moške vloge")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $zenskeVloge;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Prevajalec", description="Prevajalec besedila")
     * @var string
     */
    private $prevajalec;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="Povzetek vsebine", description="Povzetek vsebine besedila")
     * @var string
     */
    private $povzetekVsebine;

    public function validate($mode = 'update')
    {
        
    }

    public function getId()
    {
        return $this->id;
    }

    public function getNaslov()
    {
        return $this->naslov;
    }

    public function getAvtor()
    {
        return $this->avtor;
    }

    public function getPodnaslov()
    {
        return $this->podnaslov;
    }

    public function getJezik()
    {
        return $this->jezik;
    }

    public function getNaslovIzvirnika()
    {
        return $this->naslovIzvirnika;
    }

    public function getDatumPrejema()
    {
        return $this->datumPrejema;
    }

    public function getMoskeVloge()
    {
        return $this->moskeVloge;
    }

    public function getZenskeVloge()
    {
        return $this->zenskeVloge;
    }

    public function getPrevajalec()
    {
        return $this->prevajalec;
    }

    public function getPovzetekVsebine()
    {
        return $this->povzetekVsebine;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setNaslov($naslov)
    {
        $this->naslov = $naslov;
        return $this;
    }

    public function setAvtor($avtor)
    {
        $this->avtor = $avtor;
        return $this;
    }

    public function setPodnaslov($podnaslov)
    {
        $this->podnaslov = $podnaslov;
        return $this;
    }

    public function setJezik($jezik)
    {
        $this->jezik = $jezik;
        return $this;
    }

    public function setNaslovIzvirnika($naslovIzvirnika)
    {
        $this->naslovIzvirnika = $naslovIzvirnika;
        return $this;
    }

    public function setDatumPrejema($datumPrejema)
    {
        $this->datumPrejema = $datumPrejema;
        return $this;
    }

    public function setMoskeVloge($moskeVloge)
    {
        $this->moskeVloge = $moskeVloge;
        return $this;
    }

    public function setZenskeVloge($zenskeVloge)
    {
        $this->zenskeVloge = $zenskeVloge;
        return $this;
    }

    public function setPrevajalec($prevajalec)
    {
        $this->prevajalec = $prevajalec;
        return $this;
    }

    public function setPovzetekVsebine($povzetekVsebine)
    {
        $this->povzetekVsebine = $povzetekVsebine;
        return $this;
    }

}
