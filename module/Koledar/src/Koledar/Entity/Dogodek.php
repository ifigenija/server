<?php

namespace Koledar\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * Dogodek uprizoritve - ali vaja ali predstava
 * 
 * @ORM\Entity(repositoryClass="Koledar\Repository\Dogodki")
 * @ORM\Table(indexes={
 *    @ORM\Index(name="dogodki_zacetek", columns={"zacetek"}),
 *    @ORM\Index(name="dogodki_konec", columns={"konec"}),
 *    @ORM\Index(name="dogodki_razred", columns={"razred"})})
 * })
 * @Max\I18n(label="Dogodek",plural="Dogodki")
 * @Max\Id(prefix="0024")
 */
class Dogodek
        extends \Max\Entity\Base
{

    const PREDSTAVA  = "100s";
    const VAJA       = "200s";
    const GOSTOVANJE = "300s";
    const SPLOSNO    = "400s";
    const ZASEDENOST = "500s";

    private $razredi = [self::PREDSTAVA, self::VAJA, self::GOSTOVANJE, self::SPLOSNO, self::ZASEDENOST];

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID dogodka")
     * @Max\Ui(type="id")
     * @var string     
     */
    protected $id;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     * @Max\I18n(label="Planiran začetek", description="Planiran začetek dogodka")
     * @var \DateTime
     */
    protected $planiranZacetek;

    /**
     * 
     * @ORM\Column(type="boolean", options = {"default"=false}, nullable=true)
     * @Max\I18n(label="Celodnevni", description="Dogodek se razteza skozi cel dan")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    protected $allDay = false;

    /**
     * 
     * @ORM\Column(type="datetime", nullable=true)
     * @Max\I18n(label="Začetek", description="Začetek dogodka")
     * @var \DateTime
     */
    protected $zacetek;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     * @Max\I18n(label="Konec", description="Konec dogodka")
     * @var \DateTime
     */
    protected $konec;

    /**
     * @ORM\Column(type="string", length=4, nullable=true)
     * @Max\I18n(label="Status", description="Status dogodka")
     * @Max\Ui(type="select", opts="dogodek.status")
     * @var string
     */
    protected $status;

    /**
     * @ORM\Column(type="string", length=4, nullable=true)
     * @Max\I18n(label="Razred", description="Razred dogodka")
     * @Max\Ui(type="select", opts="dogodek.razred")
     * @var string
     */
    protected $razred;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Termin", description="Termin dogodka")
     * @var string
     */
    protected $termin;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Ime", description="Ime dogodka")
     * @var string
     */
    protected $title;

    /**
     * @ORM\OneToOne(targetEntity="Koledar\Entity\Predstava", inversedBy="dogodek")
     * @ORM\JoinColumn(name="predstava_id", referencedColumnName="id", unique=true)
     * @Max\I18n(label="Predstava",  description="Predstava")
     * @Max\Ui(type="toone")
     * @var \Koledar\Entity\Predstava
     */
    protected $predstava;

    /**
     * @ORM\OneToOne(targetEntity="Koledar\Entity\Zasedenost", inversedBy="dogodek")
     * @ORM\JoinColumn(name="zasedenost_id", referencedColumnName="id", unique=true)
     * @Max\I18n(label="Zasedenost",  description="Zasedenost")
     * @Max\Ui(type="toone")
     * @var \Koledar\Entity\Zasedenost
     */
    protected $zasedenost;

    /**
     * @ORM\OneToOne(targetEntity="Koledar\Entity\Vaja", inversedBy="dogodek")
     * @ORM\JoinColumn(name="vaja_id", referencedColumnName="id", unique=true)
     * @Max\I18n(label="Vaja",  description="Vaja")
     * @Max\Ui(type="toone")
     * @var \Koledar\Entity\Vaja
     */
    protected $vaja;

    /**
     * @ORM\OneToOne(targetEntity="Koledar\Entity\Gostovanje", inversedBy="dogodek")
     * @ORM\JoinColumn(name="gostovanje_id", referencedColumnName="id", unique=true)
     * @Max\I18n(label="Gostovanje",  description="Gostovanje")
     * @Max\Ui(type="toone")
     * @var \Koledar\Entity\Gostovanje
     */
    protected $gostovanje;

    /**
     * @ORM\OneToOne(targetEntity="Koledar\Entity\DogodekSplosni", inversedBy="dogodek")
     * @ORM\JoinColumn(name="dogodek_splosni_id", referencedColumnName="id", unique=true)
     * @Max\I18n(label="Splošni dogodek",  description="Dogodek, ki ni ne vaja, ne predstava, ne gostovanje, zaseda pa prostor")
     * @Max\Ui(type="toone")
     * @var \Koledar\Entity\DogodekSplosni
     */
    protected $splosni;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\Prostor")
     * @Max\I18n(label="Prostor",  description="Prostor")
     * @Max\Ui(type="toone")
     * @var \Prodaja\Entity\Prostor
     */
    protected $prostor;

    /**
     * @ORM\OneToMany(targetEntity="Prisotnost\Entity\TerminStoritve", mappedBy="dogodek")
     * @var <TerminiStoritve>
     */
    protected $terminiStoritve;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\ProdajaPredstave", mappedBy="dogodek")
     * @var <ProdajaPredstave>
     */
    protected $prodajaPredstave;

    /**
     * @ORM\ManyToOne(targetEntity="Koledar\Entity\Sezona", inversedBy="dogodki")
     * @ORM\JoinColumn(name="sezona_id", referencedColumnName="id")
     * @Max\I18n(label="Sezona",  description="Sezona")
     * @Max\Ui(type="toone")
     * @var \Koledar\Entity\Sezona
     */
    protected $sezona;

    public function __construct()
    {
        $this->terminiStoritve  = new ArrayCollection();
        $this->prodajaPredstave = new ArrayCollection();
    }

    public function validate($mode = 'update')
    {
        if ($this->zacetek && $this->konec) {
            $this->expect($this->zacetek <= $this->konec, "Datum konca mora biti za datumom začetka", 1000469);
        };

        $this->expect($this->razred, "Razred dogodka ne sme biti prazen", 1000464);
        $this->expect(array_search($this->razred, $this->razredi) > -1, "Razred dogodka ni pravilen", 1000462);

        if ($this->razred === self::VAJA) {
            $this->expect($this->vaja, "Dogodek razreda vaja zahteva referenco na vajo", 1000463);
        }
        if ($this->razred === self::PREDSTAVA) {
            $this->expect($this->predstava, "Dogodek razreda predstva zahteva referenco na predstavo", 1000465);
        }
        if ($this->razred === self::GOSTOVANJE) {
            $this->expect($this->gostovanje, "Dogodek razreda gostovanje zahteva referenco na gostovanje", 1000466);
        }
        if ($this->razred === self::SPLOSNO) {
            $this->expect($this->splosni, "Dogodek razreda splošno zahteva referenco dogodekSplosni", 1000467);
            $this->expect($this->prostor, "Dogodek razreda splošno zahteva referenco Prostor", 1001050);
        }
        if ($this->razred === self::ZASEDENOST) {
            $this->expect($this->zasedenost, "Dogodek razreda zasedenost zahteva referenco zasedenost", 1000468);
            $this->expect($this->terminiStoritve->count() === 0, "Dogodek razreda zasedenost ne dovoljuje terminov storitve", 1001051);
            $this->expect(!$this->prostor, "Dogodek razreda zasedenost ne dovoljuje reference Prostor", 1001052);
        }


        $i = 0;
        if ($this->vaja) {
            $i++;
        }
        if ($this->predstava) {
            $i++;
        }
        if ($this->zasedenost) {
            $i++;
        }
        if ($this->gostovanje) {
            $i++;
        }
        if ($this->splosni) {
            $i++;
        }


        $this->expect($i === 1, "Napaka - napačno število referenc na podrobnosti dogodka $i", 1000361);
    }

    //pridobimo uprizoritev vaje
    public function getUprizoritevVaja()
    {
        return $this->getVaja()->getUprizoritev();
    }
    
    //pridobimo uprizoritev predstave
    public function getUprizoritevPredstava()
    {
        return $this->getPredstava()->getUprizoritev();
    }
    
    //pridobimo kraj gostovanja
    public function getKraj()
    {
        return $this->getGostovanje()->getKraj();
    }
    
    //pridobimo drzavo gostovanja
    public function getDrzava()
    {
        return $this->getGostovanje()->getDrzava();
    }
//    //pridobimo osebo na zasedenosti
//    public function getOseba()
//    {
//        return $this->getZasedenost()->getOseba();
//    }

    public function getPodrobno()
    {
        switch ($this->razred) {
            case self::PREDSTAVA:
                return $this->predstava;
            case self::VAJA:
                return $this->vaja;
            case self::GOSTOVANJE:
                return $this->gostovanje;
            case self::ZASEDENOST:
                return $this->zasedenost;
            case self::SPLOSNO:
                return $this->splosni;
        }
    }

    public function getId()
    {
        return $this->id;
    }

    public function getStatus()
    {
        return $this->status;
    }

    public function getRazred()
    {
        return $this->razred;
    }

    public function getTermin()
    {
        return $this->termin;
    }

    public function getPredstava()
    {
        return $this->predstava;
    }

    public function getZasedenost()
    {
        return $this->zasedenost;
    }

    public function getVaja()
    {
        return $this->vaja;
    }

    public function getGostovanje()
    {
        return $this->gostovanje;
    }

    public function getProstor()
    {
        return $this->prostor;
    }

    public function getTerminiStoritve()
    {
        return $this->terminiStoritve;
    }

    public function getProdajaPredstave()
    {
        return $this->prodajaPredstave;
    }

    public function getSezona()
    {
        return $this->sezona;
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

    public function setRazred($razred)
    {
        $this->razred = $razred;

        return $this;
    }

    public function setTermin($termin)
    {
        $this->termin = $termin;
        return $this;
    }

    public function setPredstava(\Koledar\Entity\Predstava $predstava = null)
    {
        $this->predstava = $predstava;
        return $this;
    }

    public function setZasedenost(\Koledar\Entity\Zasedenost $zasedenost = null)
    {
        $this->zasedenost = $zasedenost;
        return $this;
    }

    public function setVaja(\Koledar\Entity\Vaja $vaja = null)
    {
        $this->vaja = $vaja;
        return $this;
    }

    public function setGostovanje(\Koledar\Entity\Gostovanje $gostovanje = null)
    {
        $this->gostovanje = $gostovanje;
        return $this;
    }

    public function setProstor(\Prodaja\Entity\Prostor $prostor = null)
    {
        $this->prostor = $prostor;
        return $this;
    }

    public function setTerminiStoritve($terminiStoritve)
    {
        $this->terminiStoritve = $terminiStoritve;
        return $this;
    }

    public function setProdajaPredstave($prodajaPredstave)
    {
        $this->prodajaPredstave = $prodajaPredstave;
        return $this;
    }

    public function setSezona(\Koledar\Entity\Sezona $sezona = null)
    {
        $this->sezona = $sezona;
        return $this;
    }

    public function getPlaniranZacetek()
    {
        return $this->planiranZacetek;
    }

    public function getAllDay()
    {
        return $this->allDay;
    }

    public function getTitle()
    {
        return $this->title;
    }

    public function setPlaniranZacetek(\DateTime $planiranZacetek = null)
    {
        $this->planiranZacetek = $planiranZacetek;
        return $this;
    }

    public function setAllDay($allDay)
    {
        $this->allDay = $allDay;
        return $this;
    }

    public function setTitle($title)
    {
        $this->title = $title;
        return $this;
    }

    public function getZacetek()
    {
        return $this->zacetek;
    }

    public function getKonec()
    {
        return $this->konec;
    }

    public function setZacetek(\DateTime $zacetek)
    {
        $this->zacetek = $zacetek;
        return $this;
    }

    public function setKonec(\DateTime $konec)
    {
        $this->konec = $konec;
        return $this;
    }

    public function getStatusi()
    {
        return $this->statusi;
    }

    public function getSplosni()
    {
        return $this->splosni;
    }

    public function setStatusi($statusi)
    {
        $this->statusi = $statusi;
        return $this;
    }

    public function setSplosni(\Koledar\Entity\DogodekSplosni $splosni = null)
    {
        $this->splosni = $splosni;
        return $this;
    }

}
