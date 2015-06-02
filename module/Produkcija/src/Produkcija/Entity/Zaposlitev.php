<?php

namespace Produkcija\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="Produkcija\Repository\Zaposlitve")
 * @Max\I18n(label="Zaposlitev",plural="Zaposlitve")
 * @Max\Lookup(ident="sifra", label="oseba.polnoIme", search={"oseba.sifra", "oseba.polnoIme"}, extra={"zacetek", "konec","status"})
 * @Max\Id(prefix="0016")
 */
class Zaposlitev
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID zaposlitve")
     * @Max\Ui(type="id")
     * @var string     
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=10)
     * @Max\I18n(label="entiteta.sifra",  description="Šifra osebe")
     * @Max\Ui(ident=true)
     * @var string
     */
    private $sifra;

    /**
     * @ORM\Column(type="string", length=10)
     * @Max\I18n(label="entiteta.status",  description="Status zaposlitve")
     * @Max\Ui(type="select",opts="zaposlitev.status")
     * @var string
     */
    private $status;

    /**
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="entiteta.zacetek",  description="Datum začetka zaposlitve")
     * @var string
     */
    private $zacetek;

    /**
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="entiteta.konec",  description="Datum konca zaposlitve")
     * @var string
     */
    private $konec;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="zaposlitev.tip",  description="Tip zaposlitve")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $tip;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="zaposlitev.delovnaObveza",  description="Delovna obveza zaposlitve")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $delovnaObveza;

    /**
     * @ORM\Column(nullable=true)
     * @Max\I18n(label="zaposlitev.malica",  description="Malica")
     * @var string
     */
    private $malica;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="zaposlitev.izmenskoDelo", description="Izmensko delo")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    private $izmenskoDelo;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="zaposlitev.individualnaPogodba", description="Zaposlitev z individualno pogodbo")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    private $individualnaPogodba;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="zaposlitev.jeZaposlenVdrugemjz", description="Ali je zaposlen v drugem javnem zavodu")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    private $jeZaposlenVdrugemJz;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="zaposlitev.jeNastopajoci", description="Ali je nastopajoči")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    private $jeNastopajoci;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Alternacija", mappedBy="sodelovanje")
     * 
     * @var <Alternacije>
     */
    private $alternacije;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Oseba", inversedBy="sodelovanja")
     * @ORM\JoinColumn(name="oseba_id", referencedColumnName="id")
     * @Max\I18n(label="entiteta.oseba",  description="Oseba, ki je zaposlena")
     * @Max\Ui(type="toone")
     * @var \App\Entity\Oseba
     */
    private $oseba;

    public function validate($mode = 'update')
    {
        $this->expect($this->oseba, "Oseba je obvezna", 1000333);        
        $this->setSifra($this->oseba->getSifra());
    }

    public function getId()
    {
        return $this->id;
    }

    public function getStatus()
    {
        return $this->status;
    }

    public function getZacetek()
    {
        return $this->zacetek;
    }

    public function getKonec()
    {
        return $this->konec;
    }

    public function getTip()
    {
        return $this->tip;
    }

    public function getDelovnaObveza()
    {
        return $this->delovnaObveza;
    }

    public function getMalica()
    {
        return $this->malica;
    }

    public function getIzmenskoDelo()
    {
        return $this->izmenskoDelo;
    }

    public function getIndividualnaPogodba()
    {
        return $this->individualnaPogodba;
    }

    public function getJeZaposlenVdrugemJz()
    {
        return $this->jeZaposlenVdrugemJz;
    }

    public function getJeNastopajoci()
    {
        return $this->jeNastopajoci;
    }

    public function getAlternacije()
    {
        return $this->alternacije;
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

    public function setStatus($status)
    {
        $this->status = $status;
        return $this;
    }

    public function setZacetek($zacetek)
    {
        $this->zacetek = $zacetek;
        return $this;
    }

    public function setKonec($konec)
    {
        $this->konec = $konec;
        return $this;
    }

    public function setTip($tip)
    {
        $this->tip = $tip;
        return $this;
    }

    public function setDelovnaObveza($delovnaObveza)
    {
        $this->delovnaObveza = $delovnaObveza;
        return $this;
    }

    public function setMalica($malica)
    {
        $this->malica = $malica;
        return $this;
    }

    public function setIzmenskoDelo($izmenskoDelo)
    {
        $this->izmenskoDelo = $izmenskoDelo;
        return $this;
    }

    public function setIndividualnaPogodba($individualnaPogodba)
    {
        $this->individualnaPogodba = $individualnaPogodba;
        return $this;
    }

    public function setJeZaposlenVdrugemJz($jeZaposlenVdrugemJz)
    {
        $this->jeZaposlenVdrugemJz = $jeZaposlenVdrugemJz;
        return $this;
    }

    public function setJeNastopajoci($jeNastopajoci)
    {
        $this->jeNastopajoci = $jeNastopajoci;
        return $this;
    }

    public function setAlternacije($alternacije)
    {
        $this->alternacije = $alternacije;
        return $this;
    }

    public function setOseba(\App\Entity\Oseba $oseba)
    {
        $this->oseba = $oseba;
        return $this;
    }
    public function getSifra()
    {
        return $this->sifra;
    }

    public function setSifra($sifra)
    {
        $this->sifra = $sifra;
        return $this;
    }


}
