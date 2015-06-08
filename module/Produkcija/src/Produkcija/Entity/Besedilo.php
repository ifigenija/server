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
 * @Max\Lookup(ident="stevilka",label="naslov",search={"avtor","podnaslov"},extra={"podnaslov","avtor", "datumPrejema"})
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
     * @ORM\Column(type="string", nullable=false)
     * @Max\I18n(label="entiteta.stevilka", description="Številka besedila")
     * @Max\Ui(ident=true)
     */
    private $stevilka;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="entiteta.naslov", description="Naslov besedila")
     * @Max\Ui(type="naziv",ident=true )
     * @var string
     */
    private $naslov;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="entiteta.avtor", description="Avtor besedila")
     * @var string
     */
    private $avtor;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="entiteta.podnaslov", description="Podnaslov besedila")
     * @var string
     */
    private $podnaslov;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="besedilo.jezik", description="Jezik besedila")
     * @var string
     */
    private $jezik;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="besedilo.naslovIzvirnika", description="Naslov izvirnika besedila")
     * @var string
     */
    private $naslovIzvirnika;

    /**
     * Predvidoma v angleščini
     * 
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="entiteta.internacionalniNaslov", description="Internacionalni naslov besedila")
     * @var string
     */
    private $internacionalniNaslov;

    /**
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="besedilo.datumPrejema", description="Datum prejema besedila")
     * @var string
     */
    private $datumPrejema;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="besedilo.moskeVloge", description="Moške vloge")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $moskeVloge;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="besedilo.zenskeVloge", description="Moške vloge")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $zenskeVloge;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="besedilo.prevajalec", description="Prevajalec besedila")
     * @var string
     */
    private $prevajalec;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="besedilo.povzetekVsebine", description="Povzetek vsebine besedila")
     * @var string
     */
    private $povzetekVsebine;

    /**
     * 
     * @ORM\Column(type="date", length=4, nullable=true)
     * @Max\I18n(label="besedilo.letoIzida", description="Leto izida")
     * @var string
     */
    private $letoIzida;

    /**
     * 
     * @ORM\Column(type="date",  nullable=true)
     * @Max\I18n(label="besedilo.krajIzida", description="Kraj izida")
     * @var string
     */
    private $krajIzida;

    /**
     * 
     * @ORM\Column(type="string",  nullable=true)
     * @Max\I18n(label="besedilo.zaloznik", description="Založnik besedila")
     * @var string
     */
    private $zaloznik;

    public function validate($mode = 'update')
    {
        $this->expect($this->getStevilka(), "Številka besedila ni določena", 1000800);
    }
    public function getId()
    {
        return $this->id;
    }

    public function getStevilka()
    {
        return $this->stevilka;
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

    public function getInternacionalniNaslov()
    {
        return $this->internacionalniNaslov;
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

    public function getLetoIzida()
    {
        return $this->letoIzida;
    }

    public function getKrajIzida()
    {
        return $this->krajIzida;
    }

    public function getZaloznik()
    {
        return $this->zaloznik;
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

    public function setInternacionalniNaslov($internacionalniNaslov)
    {
        $this->internacionalniNaslov = $internacionalniNaslov;
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

    public function setLetoIzida($letoIzida)
    {
        $this->letoIzida = $letoIzida;
        return $this;
    }

    public function setKrajIzida($krajIzida)
    {
        $this->krajIzida = $krajIzida;
        return $this;
    }

    public function setZaloznik($zaloznik)
    {
        $this->zaloznik = $zaloznik;
        return $this;
    }


}
