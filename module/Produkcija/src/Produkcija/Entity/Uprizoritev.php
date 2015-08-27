<?php

namespace Produkcija\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * @ORM\Entity(repositoryClass="Produkcija\Repository\Uprizoritve")
 * @Max\Lookup(ident="sifra",label="naslov",search={"naslov","sifra"},)
 * @Max\I18n(label="Uprizoritev",plural="Uprizoritve")
 * @Max\Id(prefix="0014")
 */
class Uprizoritev
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID uprizoritve")
     * @Max\Ui(type="id")
     * @var string   
     */
    protected $id;

    /**
     * @ORM\Column(type="string", unique=true, nullable=false)
     * @Max\I18n(label="uprizoritev.sifra", description="uprizoritev.d.sifra")
     * @Max\Ui(type="sifra",ident=true,icon="fa fa-barcode")
     * @var string
     */
    protected $sifra;

    /**
     * @ORM\Column(type="string", length=35, nullable=true)
     * @Max\I18n(label="uprizoritev.faza", description="uprizoritev.d.faza")
     * @Max\Ui(type="select", opts="uprizoritev.faza")
     * @var string
     */
    protected $faza;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="uprizoritev.naslov", description="uprizoritev.d.naslov")
     * @Max\Ui(type="naziv",ident=true, required=true )
     * @var string
     */
    protected $naslov;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="uprizoritev.podnaslov", description="uprizoritev.d.podnaslov")
     * @var string
     */
    protected $podnaslov;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="uprizoritev.delovniNaslov", description="uprizoritev.d.delovniNaslov")
     * @var string
     */
    protected $delovniNaslov;

    /**
     * Predvidoma v angleščini
     * 
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="uprizoritev.interNaslov", description="uprizoritev.d.interNaslov")
     * @var string
     */
    protected $internacionalniNaslov;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="uprizoritev.naslovIzvirnika", description="uprizoritev.d.naslovIzvirnika")
     * @var string
     */
    protected $naslovIzvirnika;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="uprizoritev.podnaslovIzvirnika", description="uprizoritev.d.podnaslovIzvirnika")
     * @var string
     */
    protected $podnaslovIzvirnika;

    /**
     * pomeni začetek faze produkcija
     * 
     * polje uporabljamo že v fazi predprodukcije za makroplaniranje
     * predpostavljamo da študij traja do $datumPremiere
     * 
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="uprizoritev.datumZacStudija", description="uprizoritev.d.datumZacStudija")
     * @var string
     */
    protected $datumZacStudija;

    /**
     * $$ rb verjetno je to odvečno polje, sedaj, ko imamo polje za planirano število vaj
     * 
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="uprizoritev.steviloVaj", description="uprizoritev.d.steviloVaj")
     * @Max\Ui(type="integer")
     * @var integer     
     */
    protected $steviloVaj;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="uprizoritev.planiranoSteviloVaj", description="uprizoritev.d.planiranoSteviloVaj")
     * @Max\Ui(type="integer")
     * @var integer     
     */
    protected $planiranoSteviloVaj;

    /**
     * pomeni tudi konec faze produkcija
     * 
     * polje uporabljamo že v fazi predprodukcije za makroplaniranje
     * 
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="uprizoritev.datumPremiere", description="uprizoritev.d.datumPremiere")
     * @var string
     */
    protected $datumPremiere;

    /**
     * 
     * polje uporabljamo že v fazi predprodukcije za makroplaniranje
     * v programu dela kot prizorišče
     * 
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\Prostor")
     * @ORM\JoinColumn(name="maticniOder_id", referencedColumnName="id")
     * @Max\I18n(label="uprizoritev.maticniOder",  description="uprizoritev.d.maticniOder")
     * @Max\Ui(type="optionalselect",empty="Kjer koli")    //$$ rb zakaj select?
     * @var \Prodaja\Entity\Prostor
     */
    protected $maticniOder;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="uprizoritev.stOdmorov", description="uprizoritev.d.stOdmorov")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stOdmorov;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="uprizoritev.avtor", description="uprizoritev.d.avtor")
     * @Max\Ui(type="naziv")
     * @var string
     */
    protected $avtor;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="uprizoritev.gostujoca", description="uprizoritev.d.gostujoca")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    protected $gostujoca;

    /**
     * $$ ali se to polje uporablja v programu dela kot trajanje študija?
     * 
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="uprizoritev.trajanje", description="uprizoritev.d.trajanje")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $trajanje;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="uprizoritev.opis", description="uprizoritev.d.opis")
     * @var string
     */
    protected $opis;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="uprizoritev.arhIdent", description="Id uprizoritve za arhiv")
     * @var string
     */
    protected $arhIdent;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="uprizoritev.arhOpomba", description="Opomba pri uprizoritvi za arhiv")
     * @var string
     */
    protected $arhOpomba;

    /**
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="uprizoritev.datumZakljucka", description="Opomba pri uprizoritvi za arhiv")
     * @Max\Ui(icon="fa fa-calendar")
     * @var string
     */
    protected $datumZakljucka;                // $$ rb - ali je sploh kdaj datum zaključka, glede na to, da se lahko ponovi?

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="uprizoritev.sloAvtor", description="uprizoritev.d.sloAvtor")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    protected $sloAvtor;

    /**
     * ali je čisto prva uprizoritev
     * 
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="uprizoritev.krstna", description="uprizoritev.d.krstna")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    protected $krstna;

    /**
     * ali je to prva uprizorizev v Sloveniji
     * 
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="uprizoritev.prvaSlovenska", description="uprizoritev.d.prvaSlovenska")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    protected $prvaSlovenska;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="uprizoritev.kratkiNaslov", description="uprizoritev.d.kratkiNaslov")
     * @var string
     */
    protected $kratkiNaslov;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Funkcija", mappedBy="uprizoritev")
     * @var <Funkcije>
     */
    protected $funkcije;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Arhivalija", mappedBy="uprizoritev")
     * @var <Arhivi>
     */
    protected $arhivi;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Rekviziterstvo", mappedBy="uprizoritev")
     * @var <Rekviziterstva>
     */
    protected $rekviziterstva;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\StrosekUprizoritve", mappedBy="uprizoritev")
     * @var <Stroski>
     */
    protected $stroski;

    /**
     * @ORM\OneToMany(targetEntity="Koledar\Entity\Vaja", mappedBy="uprizoritev")
     * @var <Vaje>
     */
    protected $vaje;

    /**
     * @ORM\OneToMany(targetEntity="Koledar\Entity\Predstava", mappedBy="uprizoritev")
     * @var <Predstave>
     */
    protected $predstave;

    /**
     * @ORM\OneToMany(targetEntity="Koledar\Entity\Gostujoca", mappedBy="uprizoritev")
     * @var <Gostujoce>
     */
    protected $gostujoce;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Besedilo")
     * @ORM\JoinColumn(name="besedilo_id", referencedColumnName="id")
     * @Max\I18n(label="uprizoritev.besedilo",  description="uprizoritev.d.besedilo")
     * @Max\Ui(type="toone")
     * @var \Produkcija\Entity\Besedilo
     */
    protected $besedilo;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\ZvrstUprizoritve")
     * @ORM\JoinColumn(name="zvrst_uprizoritve_id", referencedColumnName="id")
     * @Max\I18n(label="uprizoritev.zvrstUprizoritve",  description="uprizoritev.d.zvrstUprizoritve")
     * @Max\Ui(type="optionalselect",empty="Brez zvrsti", required=false)
     * @var \Produkcija\Entity\ZvrstUprizoritve
     */
    protected $zvrstUprizoritve;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\ZvrstSurs")
     * @ORM\JoinColumn(name="zvrst_surs_id", referencedColumnName="id")
     * @Max\I18n(label="uprizoritev.zvrstSurs",  description="uprizoritev.d.zvrstSurs")
     * @Max\Ui(type="optionalselect", empty="Neklasificirana", required=false)
     * @var \Produkcija\Entity\ZvrstSurs
     */
    protected $zvrstSurs;

    /**
     * Producent bo predvidoma večinoma domača hiša 
     * $$ rb narediti default matična hiša
     * 
     * @ORM\ManyToOne(targetEntity="ProgramDela\Entity\ProdukcijskaHisa", inversedBy="uprizoritve")
     * @Max\I18n(label="uprizoritev.producent",  description="uprizoritev.d.producent")
     * @Max\Ui(type="toone")
     * @var \ProgramDela\Entity\ProdukcijskaHisa
     */
    protected $producent;

    public function __construct()
    {
        $this->koprodukcije   = new ArrayCollection();
        $this->funkcije       = new ArrayCollection();
        $this->arhivi         = new ArrayCollection();
        $this->rekviziterstva = new ArrayCollection();
        $this->stroski        = new ArrayCollection();
        $this->vaje           = new ArrayCollection();
        $this->predstave      = new ArrayCollection();
        $this->gostujoce      = new ArrayCollection();
    }

    public function validate($mode = 'update')
    {
        $this->expect(!empty($this->sifra), 'Šifra ne sme biti prazna', 1000877);
        if (!empty($this->datumZacStudija) && !empty($this->datumPremiere)) {
            $this->expect($this->datumZacStudija <= $this->datumPremiere, 'Začetek študija ne sme biti kasneje kot datum premiere', 1000878);
        }
    }

    public function getId()
    {
        return $this->id;
    }

    public function getSifra()
    {
        return $this->sifra;
    }

    public function getFaza()
    {
        return $this->faza;
    }

    public function getNaslov()
    {
        return $this->naslov;
    }

    public function getPodnaslov()
    {
        return $this->podnaslov;
    }

    public function getDelovniNaslov()
    {
        return $this->delovniNaslov;
    }

    public function getInternacionalniNaslov()
    {
        return $this->internacionalniNaslov;
    }

    public function getDatumZacStudija()
    {
        return $this->datumZacStudija;
    }

    public function getSteviloVaj()
    {
        return $this->steviloVaj;
    }

    public function getPlaniranoSteviloVaj()
    {
        return $this->planiranoSteviloVaj;
    }

    public function getDatumPremiere()
    {
        return $this->datumPremiere;
    }

    public function getMaticniOder()
    {
        return $this->maticniOder;
    }

    public function getStOdmorov()
    {
        return $this->stOdmorov;
    }

    public function getAvtor()
    {
        return $this->avtor;
    }

    public function getGostujoca()
    {
        return $this->gostujoca;
    }

    public function getTrajanje()
    {
        return $this->trajanje;
    }

    public function getOpis()
    {
        return $this->opis;
    }

    public function getArhIdent()
    {
        return $this->arhIdent;
    }

    public function getArhOpomba()
    {
        return $this->arhOpomba;
    }

    public function getDatumZakljucka()
    {
        return $this->datumZakljucka;
    }

    public function getSloAvtor()
    {
        return $this->sloAvtor;
    }

    public function getKratkiNaslov()
    {
        return $this->kratkiNaslov;
    }

    public function getFunkcije()
    {
        return $this->funkcije;
    }

    public function getArhivi()
    {
        return $this->arhivi;
    }

    public function getRekviziterstva()
    {
        return $this->rekviziterstva;
    }

    public function getStroski()
    {
        return $this->stroski;
    }

    public function getVaje()
    {
        return $this->vaje;
    }

    public function getPredstave()
    {
        return $this->predstave;
    }

    public function getGostujoce()
    {
        return $this->gostujoce;
    }

    public function getBesedilo()
    {
        return $this->besedilo;
    }

    public function getZvrstUprizoritve()
    {
        return $this->zvrstUprizoritve;
    }

    public function getZvrstSurs()
    {
        return $this->zvrstSurs;
    }

    public function getProducent()
    {
        return $this->producent;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setSifra($sifra)
    {
        $this->sifra = $sifra;
        return $this;
    }

    public function setFaza($faza)
    {
        $this->faza = $faza;
        return $this;
    }

    public function setNaslov($naslov)
    {
        $this->naslov = $naslov;
        return $this;
    }

    public function setPodnaslov($podnaslov)
    {
        $this->podnaslov = $podnaslov;
        return $this;
    }

    public function setDelovniNaslov($delovniNaslov)
    {
        $this->delovniNaslov = $delovniNaslov;
        return $this;
    }

    public function setInternacionalniNaslov($internacionalniNaslov)
    {
        $this->internacionalniNaslov = $internacionalniNaslov;
        return $this;
    }

    public function setDatumZacStudija($datumZacStudija)
    {
        $this->datumZacStudija = $datumZacStudija;
        return $this;
    }

    public function setSteviloVaj($steviloVaj)
    {
        $this->steviloVaj = $steviloVaj;
        return $this;
    }

    public function setPlaniranoSteviloVaj($planiranoSteviloVaj)
    {
        $this->planiranoSteviloVaj = $planiranoSteviloVaj;
        return $this;
    }

    public function setDatumPremiere($datumPremiere)
    {
        $this->datumPremiere = $datumPremiere;
        return $this;
    }

    public function setMaticniOder(\Prodaja\Entity\Prostor $maticniOder)
    {
        $this->maticniOder = $maticniOder;
        return $this;
    }

    public function setStOdmorov($stOdmorov)
    {
        $this->stOdmorov = $stOdmorov;
        return $this;
    }

    public function setAvtor($avtor)
    {
        $this->avtor = $avtor;
        return $this;
    }

    public function setGostujoca($gostujoca)
    {
        $this->gostujoca = $gostujoca;
        return $this;
    }

    public function setTrajanje($trajanje)
    {
        $this->trajanje = $trajanje;
        return $this;
    }

    public function setOpis($opis)
    {
        $this->opis = $opis;
        return $this;
    }

    public function setArhIdent($arhIdent)
    {
        $this->arhIdent = $arhIdent;
        return $this;
    }

    public function setArhOpomba($arhOpomba)
    {
        $this->arhOpomba = $arhOpomba;
        return $this;
    }

    public function setDatumZakljucka($datumZakljucka)
    {
        $this->datumZakljucka = $datumZakljucka;
        return $this;
    }

    public function setSloAvtor($sloAvtor)
    {
        $this->sloAvtor = $sloAvtor;
        return $this;
    }

    public function setKratkiNaslov($kratkiNaslov)
    {
        $this->kratkiNaslov = $kratkiNaslov;
        return $this;
    }

    public function setFunkcije($funkcije)
    {
        $this->funkcije = $funkcije;
        return $this;
    }

    public function setArhivi($arhivi)
    {
        $this->arhivi = $arhivi;
        return $this;
    }

    public function setRekviziterstva($rekviziterstva)
    {
        $this->rekviziterstva = $rekviziterstva;
        return $this;
    }

    public function setStroski($stroski)
    {
        $this->stroski = $stroski;
        return $this;
    }

    public function setVaje($vaje)
    {
        $this->vaje = $vaje;
        return $this;
    }

    public function setPredstave($predstave)
    {
        $this->predstave = $predstave;
        return $this;
    }

    public function setGostujoce($gostujoce)
    {
        $this->gostujoce = $gostujoce;
        return $this;
    }

    public function setBesedilo(\Produkcija\Entity\Besedilo $besedilo)
    {
        $this->besedilo = $besedilo;
        return $this;
    }

    public function setZvrstUprizoritve(\Produkcija\Entity\ZvrstUprizoritve $zvrstUprizoritve)
    {
        $this->zvrstUprizoritve = $zvrstUprizoritve;
        return $this;
    }

    public function setZvrstSurs(\Produkcija\Entity\ZvrstSurs $zvrstSurs)
    {
        $this->zvrstSurs = $zvrstSurs;
        return $this;
    }

    public function setProducent(\ProgramDela\Entity\ProdukcijskaHisa $producent)
    {
        $this->producent = $producent;
        return $this;
    }

    public function getNaslovIzvirnika()
    {
        return $this->naslovIzvirnika;
    }

    public function getPodnaslovIzvirnika()
    {
        return $this->podnaslovIzvirnika;
    }

    public function getKrstna()
    {
        return $this->krstna;
    }

    public function getPrvaSlovenska()
    {
        return $this->prvaSlovenska;
    }

    public function setNaslovIzvirnika($naslovIzvirnika)
    {
        $this->naslovIzvirnika = $naslovIzvirnika;
        return $this;
    }

    public function setPodnaslovIzvirnika($podnaslovIzvirnika)
    {
        $this->podnaslovIzvirnika = $podnaslovIzvirnika;
        return $this;
    }

    public function setKrstna($krstna)
    {
        $this->krstna = $krstna;
        return $this;
    }

    public function setPrvaSlovenska($prvaSlovenska)
    {
        $this->prvaSlovenska = $prvaSlovenska;
        return $this;
    }

}
