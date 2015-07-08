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
    private $id;

    /**
     * Šifra pogodbe
     *
     * @ORM\Column(unique=true, length=7, nullable=false)
     * @Max\I18n(label="entiteta.sifra", description="entiteta.d.sifra")
     * @Max\Ui(ident=true, type="sifra",icon="fa fa-barcode")
     * @var string
     */
    private $sifra;

    /**
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="entiteta.zacetek", description="entiteta.d.zacetek")
     * @var string
     */
    private $zacetek;

    /**
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="entiteta.konec", description="entiteta.d.konec")
     * @var string
     */
    private $konec;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="pogodba.placiloNaVajo", description="pogodba.placiloNaVajo")   
     * @Max\Ui(type="boolcheckbox")                       
     * @var boolean
     */
    private $placiloNaVajo;

    /**
     * Vrednost za eno vajo. 
     * 
     * Polje je aktualno, če je placiloNaVajo=true
     * 
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="pogodba.vrednostVaje", description="pogodba.d.vrednostVaje")   
     * @var double
     */
    private $vrednostVaje;

    /**
     * Polje je aktualno, če je placiloNaVajo=true
     * 
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="pogodba.planiranoSteviloVaj", description="pogodba.planiranoSteviloVaj")
     * @Max\Ui(type="integer")
     * @var integer     
     */
    private $planiranoSteviloVaj;

    /**
     * Pavšalna vrednost za vse vaje. 
     * 
     * Polje je aktualno, če je placiloNaVajo=false
     * 
     * V praksi dobijo honorarni igralci ali pavšalni znesek 
     * za vse vaje ali pa nič (le za predstave). Za posamezno vajo se v principu ne plačuje.
     * 
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="pogodba.vrednostVaj", description="pogodba.d.vrednostVaj")   
     * @var double
     */
    private $vrednostVaj;

    /**
     * @ORM\Column(type="decimal", nullable=true, precision=12, scale=2)
     * @Max\I18n(label="pogodba.vrednostPredstave", description="pogodba.vrednostPredstave")   
     * @var double
     */
    private $vrednostPredstave;

    /**
     * polje se lahko vpisuje (vrednostDo) ali pa izračuna iz cene na vajo in planiranega števila vaj
     * 
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="pogodba.vrednostDoPremiere", description="pogodba.vrednostDoPremiere")   
     * @var double
     */
    private $vrednostDoPremiere;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="entiteta.aktivna", description="entiteta.d.aktivna")   
     * @Max\Ui(type="boolcheckbox")                       
     * @var boolean
     */
    private $aktivna;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="pogodba.zaposlenVDrJz", description="pogodba.d.zaposlenVDrJz")   
     * @Max\Ui(type="boolcheckbox")                       
     * @var boolean
     */
    private $zaposlenVDrJz;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="entiteta.opis", description="entiteta.opis")   
     * @var string
     */
    private $opis;

    /**
     * 
     * @ORM\OneToOne(targetEntity="Produkcija\Entity\Alternacija", mappedBy="pogodba")
     * @Max\I18n(label="pogodba.alternacija",  description="pogodba.alternacija")
     * @Max\Ui(type="toone")
     * @var \Produkcija\Entity\Alternacija
     */
    private $alternacija;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Oseba", inversedBy="pogodbe")
     * @ORM\JoinColumn(name="oseba_id", referencedColumnName="id")
     * @Max\I18n(label="entiteta.oseba",  description="entiteta.oseba")
     * @Max\Ui(type="hiddenid")
     * @var \App\Entity\Oseba
     */
    private $oseba;

    /**
     * pogodba ima lahko poslovnega partnerja, (če oseba izstavlja račune namesto avtorskih pogodb)
     * 
     * @ORM\ManyToOne(targetEntity="App\Entity\Popa", inversedBy="pogodbe")
     * @ORM\JoinColumn(name="popa_id", referencedColumnName="id")
     * @Max\I18n(label="pogodba.popa",  description="pogodba.popa")
     * @Max\Ui(type="toone")
     * @var \App\Entity\Popa
     */
    private $popa;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Trr")
     * @ORM\JoinColumn(name="trr_id", referencedColumnName="id")
     * @Max\I18n(label="pogodba.trr",  description="pogodba.trr")
     * @Max\Ui(type="toone")
     * @var \App\Entity\Trr
     */
    private $trr;

    public function preracunaj($smer = false)
    {
        if ($this->placiloNaVajo) {
            $this->vrednostDoPremiere = $this->vrednostVaje * $this->planiranoSteviloVaj;
        } else {
            $this->vrednostDoPremiere = $this->vrednostVaj;
        }
        $this->vrednostDoPremiere = \Max\Functions::euroRound($this->vrednostDoPremiere);   //Zaokrožimo na 2 decimalki predno shranimo
        if ($smer == \Max\Consts::UP) {
            if ($this->getAlternacija()) {
                $this->getAlternacija()->preracunaj(\Max\Consts::UP);
            }
        }
    }

    public function validate($mode = 'update')
    {
//        $this->expect($this->oseba || $this->popa, "Pogodba nima subjekta. Oseba ali poslovni partner sta obvezna", 1000340);
//        $this->expect(!($this->popa && $this->oseba), "Pogodba nima subjekta. Subjekt je lahko samo ali poslovni partner ali oseba -ne oba hkrati", 1000341);
        $this->expect($this->sifra, "sifra je obvezen podatek", 1000342);
        $this->expect($this->oseba, "Pogodba nima subjekta. Oseba je obvezna", 1000343);
        $this->expect($this->alternacija, "Alternacija je obvezen podatek", 1000344);
    }

    public function getId()
    {
        return $this->id;
    }

    public function getSifra()
    {
        return $this->sifra;
    }

    public function getZacetek()
    {
        return $this->zacetek;
    }

    public function getKonec()
    {
        return $this->konec;
    }

    public function getPlaciloNaVajo()
    {
        return $this->placiloNaVajo;
    }

    public function getVrednostVaje()
    {
        return $this->vrednostVaje;
    }

    public function getPlaniranoSteviloVaj()
    {
        return $this->planiranoSteviloVaj;
    }

    public function getVrednostVaj()
    {
        return $this->vrednostVaj;
    }

    public function getVrednostPredstave()
    {
        return $this->vrednostPredstave;
    }

    public function getVrednostDoPremiere()
    {
        return $this->vrednostDoPremiere;
    }

    public function getAktivna()
    {
        return $this->aktivna;
    }

    public function getZaposlenVDrJz()
    {
        return $this->zaposlenVDrJz;
    }

    public function getOpis()
    {
        return $this->opis;
    }

    public function getAlternacija()
    {
        return $this->alternacija;
    }

    public function getOseba()
    {
        return $this->oseba;
    }

    public function getPopa()
    {
        return $this->popa;
    }

    public function getTrr()
    {
        return $this->trr;
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

    public function setPlaciloNaVajo($placiloNaVajo)
    {
        $this->placiloNaVajo = $placiloNaVajo;
        return $this;
    }

    public function setVrednostVaje($vrednostVaje)
    {
        $this->vrednostVaje = $vrednostVaje;
        return $this;
    }

    public function setPlaniranoSteviloVaj($planiranoSteviloVaj)
    {
        $this->planiranoSteviloVaj = $planiranoSteviloVaj;
        return $this;
    }

    public function setVrednostVaj($vrednostVaj)
    {
        $this->vrednostVaj = $vrednostVaj;
        return $this;
    }

    public function setVrednostPredstave($vrednostPredstave)
    {
        $this->vrednostPredstave = $vrednostPredstave;
        return $this;
    }

    public function setVrednostDoPremiere($vrednostDoPremiere)
    {
        $this->vrednostDoPremiere = $vrednostDoPremiere;
        return $this;
    }

    public function setAktivna($aktivna)
    {
        $this->aktivna = $aktivna;
        return $this;
    }

    public function setZaposlenVDrJz($zaposlenVDrJz)
    {
        $this->zaposlenVDrJz = $zaposlenVDrJz;
        return $this;
    }

    public function setOpis($opis)
    {
        $this->opis = $opis;
        return $this;
    }

    public function setAlternacija(\Produkcija\Entity\Alternacija $alternacija)
    {
        $this->alternacija = $alternacija;
        return $this;
    }

    public function setOseba(\App\Entity\Oseba $oseba)
    {
        $this->oseba = $oseba;
        return $this;
    }

    public function setPopa(\App\Entity\Popa $popa)
    {
        $this->popa = $popa;
        return $this;
    }

    public function setTrr(\App\Entity\Trr $trr)
    {
        $this->trr = $trr;
        return $this;
    }

}
