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
    protected $id;

    /**
     * @ORM\Column(type="string", nullable=false)
     * @Max\I18n(label="besedilo.stevilka", description="besedilo.d.stevilka")
     * @Max\Ui(ident=true)
     */
    protected $stevilka;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="besedilo.naslov", description="besedilo.d.naslov")
     * @Max\Ui(type="naziv",ident=true )
     * @var string
     */
    protected $naslov;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="besedilo.avtor", description="besedilo.d.avtor")
     * @var string
     */
    protected $avtor;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="besedilo.podnaslov", description="besedilo.d.podnaslov")
     * @var string
     */
    protected $podnaslov;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="besedilo.jezik", description="besedilo.d.jezik")
     * @var string
     */
    protected $jezik;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="besedilo.naslovIzvirnika", description="besedilo.d.naslovIzvirnika")
     * @var string
     */
    protected $naslovIzvirnika;

    /**
     * Predvidoma v angleščini
     * 
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="besedilo.interNaslov", description="besedilo.d.interNaslov")
     * @var string
     */
    protected $internacionalniNaslov;

    /**
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="besedilo.datumPrejema", description="besedilo.d.datumPrejema")
     * @var string
     */
    protected $datumPrejema;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="besedilo.moskeVloge", description="besedilo.d.moskeVloge")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $moskeVloge;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="besedilo.zenskeVloge", description="besedilo.d.zenskeVloge")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $zenskeVloge;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="besedilo.prevajalec", description="besedilo.d.prevajalec")
     * @var string
     */
    protected $prevajalec;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="besedilo.povzetekVsebine", description="besedilo.d.povzetekVsebine")
     * @var string
     */
    protected $povzetekVsebine;

    /**
     * 
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="besedilo.letoIzida", description="besedilo.d.letoIzida")
     * @var integer
     */
    protected $letoIzida;

    /**
     * 
     * @ORM\Column(type="string",  nullable=true)
     * @Max\I18n(label="besedilo.krajIzida", description="besedilo.d.krajIzida")
     * @var string
     */
    protected $krajIzida;

    /**
     * 
     * @ORM\Column(type="string",  nullable=true)
     * @Max\I18n(label="besedilo.zaloznik", description="besedilo.d.zaloznik")
     * @var string
     */
    protected $zaloznik;

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
