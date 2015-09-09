<?php

namespace Produkcija\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * @ORM\Entity(repositoryClass="Produkcija\Repository\Pogodbe")
 * @Max\I18n(label="Pogodba",plural="Pogodbe")
 * @Max\Id(prefix="0011")
 * @Max\Lookup(ident="sifra",label="oseba.polnoIme", search={"sifra","oseba.polnoIme", "popa.naziv"}, extra={"oseba.polnoIme", "popa.naziv","zacetek" })
 */
class Pogodba
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="ID", description="ID pogodbe")
     * @Max\Ui(type="id")
     * @var string
     */
    protected $id;

    /**
     * Šifra pogodbe
     *
     * @ORM\Column(unique=true, length=7, nullable=false)
     * @Max\I18n(label="pogodba.sifra", description="pogodba.d.sifra")
     * @Max\Ui(ident=true, type="sifra",icon="fa fa-barcode")
     * @var string
     */
    protected $sifra;

    /**
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="pogodba.zacetek", description="pogodba.d.zacetek")
     * @var string
     */
    protected $zacetek;

    /**
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="pogodba.konec", description="pogodba.d.konec")
     * @var string
     */
    protected $konec;

    /**
     * true, če je vsebina pogodbe avtorske pravice (odkup a.p. in/ali tantieme), 
     * sicer avtorski honorar
     * 
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="pogodba.jeAvtorskePravice", description="pogodba.d.jeAvtorskePravice")   
     * @Max\Ui(type="boolcheckbox")                       
     * @var boolean
     */
    protected $jeAvtorskePravice;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="pogodba.placiloNaVajo", description="pogodba.d.placiloNaVajo")   
     * @Max\Ui(type="boolcheckbox")                       
     * @var boolean
     */
    protected $placiloNaVajo;

    /**
     * Vrednost za eno vajo. 
     * 
     * Polje je aktualno, če je placiloNaVajo=true
     * 
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="pogodba.vrednostVaje", description="pogodba.d.vrednostVaje")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $vrednostVaje;

    /**
     * Polje je aktualno, če je placiloNaVajo=true
     * 
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="pogodba.planiranoSteviloVaj", description="pogodba.d.planiranoSteviloVaj")
     * @Max\Ui(type="integer")
     * @var integer     
     */
    protected $planiranoSteviloVaj;

    /**
     * Pavšalna vrednost za vse vaje. 
     * 
     * Polje je aktualno, če je placiloNaVajo=false
     * 
     * Polje je aktualno tudi za neigralce, t.j. dramaturge, scenografe itd., 
     * vendar to ni vrednost vaj ampak kar vrednost do premiere 
     * oni dobijo vpraksi plačano le vrednost do premiere, ne pa  na predstavo.
     * 
     * V praksi dobijo honorarni igralci ali pavšalni znesek 
     * za vse vaje ali pa nič (le za predstave). Za posamezno vajo se v principu ne plačuje.
     * 
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="pogodba.vrednostVaj", description="pogodba.d.vrednostVaj")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $vrednostVaj;

    /**
     * @ORM\Column(type="decimal", nullable=true, precision=12, scale=2)
     * @Max\I18n(label="pogodba.vrednostPredstave", description="pogodba.d.vrednostPredstave")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $vrednostPredstave;

    /**
     * polje se lahko vpisuje (vrednostDo) ali pa izračuna iz cene na vajo in planiranega števila vaj
     * 
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="pogodba.vrednostDoPremiere", description="pogodba.d.vrednostDoPremiere")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $vrednostDoPremiere;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="pogodba.aktivna", description="pogodba.d.aktivna")   
     * @Max\Ui(type="boolcheckbox")                       
     * @var boolean
     */
    protected $aktivna;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="pogodba.zaposlenVDrJz", description="pogodba.d.zaposlenVDrJz")   
     * @Max\Ui(type="boolcheckbox")                       
     * @var boolean
     */
    protected $zaposlenVDrJz;

    /**
     * Samozaposlen v kulturi
     * 
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="pogodba.samozaposlen", description="pogodba.d.samozaposlen")   
     * @Max\Ui(type="boolcheckbox")                       
     * @var boolean
     */
    protected $samozaposlen;

    /**
     * MK:  DiplomiranI igralec ali študent AGRFT
     * 
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="pogodba.igralec", description="pogodba.d.igralec")
     * @Max\Ui(type="boolcheckbox")                       
     * @var boolean
     */
    protected $igralec;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="pogodba.opis", description="pogodba.d.opis")   
     * @var string
     */
    protected $opis;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Alternacija", mappedBy="pogodba")
     * @Max\Ui(type="hiddenid")
     * @var <Alternacije>
     */
    protected $alternacije;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Oseba", inversedBy="pogodbe")
     * @ORM\JoinColumn(name="oseba_id", referencedColumnName="id")
     * @Max\I18n(label="pogodba.oseba",  description="pogodba.d.oseba")
     * @Max\Ui(type="hiddenid")
     * @var \App\Entity\Oseba
     */
    protected $oseba;

    /**
     * pogodba ima lahko poslovnega partnerja, (če oseba izstavlja račune namesto avtorskih pogodb)
     * 
     * @ORM\ManyToOne(targetEntity="App\Entity\Popa", inversedBy="pogodbe")
     * @ORM\JoinColumn(name="popa_id", referencedColumnName="id")
     * @Max\I18n(label="pogodba.popa",  description="pogodba.d.popa")
     * @Max\Ui(type="toone")
     * @var \App\Entity\Popa
     */
    protected $popa;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Trr")
     * @ORM\JoinColumn(name="trr_id", referencedColumnName="id")
     * @Max\I18n(label="pogodba.trr",  description="pogodba.d.trr")
     * @Max\Ui(type="toone")
     * @var \App\Entity\Trr
     */
    protected $trr;

    public function __construct()
    {
        $this->alternacije = new ArrayCollection();
    }

    public function preracunaj($smer = false)
    {
        if ($this->placiloNaVajo) {
            $this->vrednostDoPremiere = $this->vrednostVaje * $this->planiranoSteviloVaj;
        } else {
            $this->vrednostDoPremiere = $this->vrednostVaj;
        }
        $this->vrednostDoPremiere = \Max\Functions::euroRound($this->vrednostDoPremiere);   //Zaokrožimo na 2 decimalki predno shranimo
    }

    public function validate($mode = 'update')
    {
//        $this->expect($this->oseba || $this->popa, "Pogodba nima subjekta. Oseba ali poslovni partner sta obvezna", 1000340);
//        $this->expect(!($this->popa && $this->oseba), "Pogodba nima subjekta. Subjekt je lahko samo ali poslovni partner ali oseba -ne oba hkrati", 1000341);
        $this->expect($this->sifra, "sifra je obvezen podatek", 1000342);
        $this->expect($this->oseba, "Pogodba nima subjekta. Oseba je obvezna", 1000343);
        $this->expect(!($this->zaposlenVDrJz && $this->samozaposlen), "Oseba ne more biti hkrati zaposlena v drugem jz in samozaposlena", 1000345);
    }
    
    function getFunkcija()
    {
        $alternacije = $this->getAlternacije();
        $funkcije = '';
        if($alternacije){
            foreach ($alternacije as $alter) {
                $funkcija = $alter->getFunkcija();
                if($funkcija){
                    $naziv = $funkcija->getNaziv();
                    $funkcije = $naziv . ($funkcije ? " / " : ""). $funkcije;
                }
            }
        }
        return $funkcije;
    }

    function getId()
    {
        return $this->id;
    }

    function getSifra()
    {
        return $this->sifra;
    }

    function getZacetek()
    {
        return $this->zacetek;
    }

    function getKonec()
    {
        return $this->konec;
    }

    function getPlaciloNaVajo()
    {
        return $this->placiloNaVajo;
    }

    function getVrednostVaje()
    {
        return $this->vrednostVaje;
    }

    function getPlaniranoSteviloVaj()
    {
        return $this->planiranoSteviloVaj;
    }

    function getVrednostVaj()
    {
        return $this->vrednostVaj;
    }

    function getVrednostPredstave()
    {
        return $this->vrednostPredstave;
    }

    function getVrednostDoPremiere()
    {
        return $this->vrednostDoPremiere;
    }

    function getAktivna()
    {
        return $this->aktivna;
    }

    function getZaposlenVDrJz()
    {
        return $this->zaposlenVDrJz;
    }

    function getSamozaposlen()
    {
        return $this->samozaposlen;
    }

    function getIgralec()
    {
        return $this->igralec;
    }

    function getOpis()
    {
        return $this->opis;
    }

    function getAlternacije()
    {
        return $this->alternacije;
    }

    function getOseba()
    {
        return $this->oseba;
    }

    function getPopa()
    {
        return $this->popa;
    }

    function getTrr()
    {
        return $this->trr;
    }

    function setId($id)
    {
        $this->id = $id;
    }

    function setSifra($sifra)
    {
        $this->sifra = $sifra;
    }

    function setZacetek($zacetek)
    {
        $this->zacetek = $zacetek;
    }

    function setKonec($konec)
    {
        $this->konec = $konec;
    }

    function setPlaciloNaVajo($placiloNaVajo)
    {
        $this->placiloNaVajo = $placiloNaVajo;
    }

    function setVrednostVaje($vrednostVaje)
    {
        $this->vrednostVaje = $vrednostVaje;
    }

    function setPlaniranoSteviloVaj($planiranoSteviloVaj)
    {
        $this->planiranoSteviloVaj = $planiranoSteviloVaj;
    }

    function setVrednostVaj($vrednostVaj)
    {
        $this->vrednostVaj = $vrednostVaj;
    }

    function setVrednostPredstave($vrednostPredstave)
    {
        $this->vrednostPredstave = $vrednostPredstave;
    }

    function setVrednostDoPremiere($vrednostDoPremiere)
    {
        $this->vrednostDoPremiere = $vrednostDoPremiere;
    }

    function setAktivna($aktivna)
    {
        $this->aktivna = $aktivna;
    }

    function setZaposlenVDrJz($zaposlenVDrJz)
    {
        $this->zaposlenVDrJz = $zaposlenVDrJz;
    }

    function setSamozaposlen($samozaposlen)
    {
        $this->samozaposlen = $samozaposlen;
    }

    function setIgralec($igralec)
    {
        $this->igralec = $igralec;
    }

    function setOpis($opis)
    {
        $this->opis = $opis;
    }

    function setAlternacije($alternacije)
    {
        $this->alternacije = $alternacije;
    }

    function setOseba(\App\Entity\Oseba $oseba = null)
    {
        $this->oseba = $oseba;
    }

    function setPopa(\App\Entity\Popa $popa = null)
    {
        $this->popa = $popa;
    }

    function setTrr(\App\Entity\Trr $trr = null)
    {
        $this->trr = $trr;
    }

    public function getJeAvtorskePravice()
    {
        return $this->jeAvtorskePravice;
    }

    public function setJeAvtorskePravice($jeAvtorskePravice)
    {
        $this->jeAvtorskePravice = $jeAvtorskePravice;
        return $this;
    }

}
