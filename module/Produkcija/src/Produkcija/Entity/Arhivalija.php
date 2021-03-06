<?php

namespace Produkcija\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;
use Koledar\Entity\Dogodek;

/**
 * Zvrst uprizoritve
 * 
 * @ORM\Entity(repositoryClass="Produkcija\Repository\Arhivalije")
 * @Max\I18n(label="Arhivalija",plural="Arhivalije")
 * @Max\Id(prefix="0023")
 */
class Arhivalija
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID arhivalije")
     * @Max\Ui(type="id")
     * @var string     
     */
    protected $id;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Oznaka datuma", description="Oznaka datuma arhivalije")
     * @var string
     *      */
    protected $oznakaDatuma;

    /**
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="Datum", description="Datuma arhivalije")
     * @var string
     */
    protected $datum;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Fizična oblika", description="Fizična oblika arhivalije")
     * @var string
     */
    protected $fizicnaOblika;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Izvor digitalizata", description="Izvor digitalizata arhivalije")
     * @var string
     */
    protected $izvorDigitalizata;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="Povzetek", description="Povzetek arhivalije")
     * @var string
     */
    protected $povzetek;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="Opombe", description="Opombe pri arhivaliji")
     * @var string
     */
    protected $opombe;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Lokacija originala", description="Lokacija originala arhivalije")
     * @var string
     */
    protected $lokacijaOriginala;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Objavljeno", description="Objavljeno")
     * @var string
     */
    protected $objavljeno;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Naslov", description="Naslov arhivalije")
     * @var string
     */
    protected $naslov;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Avtorstvo", description="Avtorstvo arhivalije")
     * @var string
     */
    protected $avtorstvo;

    /**
     * @ORM\ManyToOne(targetEntity="Koledar\Entity\Dogodek", inversedBy="arhivi")
     * @ORM\JoinColumn(name="dogodek_id", referencedColumnName="id")
     * @Max\I18n(label="Dogodek",  description="Dogodek, na katerega se nanaša arhivalija")
     * @Max\Ui(type="toone")
     * @var Dogodek
     */
//    protected $dogodek;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Uprizoritev", inversedBy="arhivi")
     * @ORM\JoinColumn(name="uprizoritev_id", referencedColumnName="id")
     * @Max\I18n(label="Uprizoritev",  description="Uprizoritev, na katero se nanaša arhivalija")
     * @Max\Ui(type="toone")
     * @var \Produkcija\Entity\Uprizoritev
     */
    protected $uprizoritev;

    public function validate($mode = 'update')
    {
//        $this->expect($this->uprizoritev || $this->dogodek, "Uprizoritev ali dogodek pri arhivaliji sta obvezna", 1000350);
//        $this->expect(!($this->uprizoritev && $this->dogodek), "Arhivalija ima  lahko samo ali uprizoritev ali dogodek - ne oba hkrati", 1000351);
    }

    public function getId()
    {
        return $this->id;
    }

    public function getOznakaDatuma()
    {
        return $this->oznakaDatuma;
    }

    public function getDatum()
    {
        return $this->datum;
    }

    public function getFizicnaOblika()
    {
        return $this->fizicnaOblika;
    }

    public function getIzvorDigitalizata()
    {
        return $this->izvorDigitalizata;
    }

    public function getPovzetek()
    {
        return $this->povzetek;
    }

    public function getOpombe()
    {
        return $this->opombe;
    }

    public function getLokacijaOriginala()
    {
        return $this->lokacijaOriginala;
    }

    public function getObjavljeno()
    {
        return $this->objavljeno;
    }

    public function getNaslov()
    {
        return $this->naslov;
    }

    public function getAvtorstvo()
    {
        return $this->avtorstvo;
    }

    public function getDogodek()
    {
        return $this->dogodek;
    }

    public function getUprizoritev()
    {
        return $this->uprizoritev;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setOznakaDatuma($oznakaDatuma)
    {
        $this->oznakaDatuma = $oznakaDatuma;
        return $this;
    }

    public function setDatum($datum)
    {
        $this->datum = $datum;
        return $this;
    }

    public function setFizicnaOblika($fizicnaOblika)
    {
        $this->fizicnaOblika = $fizicnaOblika;
        return $this;
    }

    public function setIzvorDigitalizata($izvorDigitalizata)
    {
        $this->izvorDigitalizata = $izvorDigitalizata;
        return $this;
    }

    public function setPovzetek($povzetek)
    {
        $this->povzetek = $povzetek;
        return $this;
    }

    public function setOpombe($opombe)
    {
        $this->opombe = $opombe;
        return $this;
    }

    public function setLokacijaOriginala($lokacijaOriginala)
    {
        $this->lokacijaOriginala = $lokacijaOriginala;
        return $this;
    }

    public function setObjavljeno($objavljeno)
    {
        $this->objavljeno = $objavljeno;
        return $this;
    }

    public function setNaslov($naslov)
    {
        $this->naslov = $naslov;
        return $this;
    }

    public function setAvtorstvo($avtorstvo)
    {
        $this->avtorstvo = $avtorstvo;
        return $this;
    }

    public function setDogodek(Dogodek $dogodek=null)
    {
        $this->dogodek = $dogodek;
        return $this;
    }

    public function setUprizoritev(\Produkcija\Entity\Uprizoritev $uprizoritev=null)
    {
        $this->uprizoritev = $uprizoritev;
        return $this;
    }


}
