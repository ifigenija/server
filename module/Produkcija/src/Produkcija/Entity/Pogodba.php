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
     * pogodbena vrednost do premiere, ki se vnese kot 1 znesek in se ne 
     * računa iz števila vaj
     * 
     * to bi se prepisalo v vrednost vrednostDoPremiere
     * 
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="entiteta.vrednostDo", description="entiteta.vrednostDo")
     * @var double
     */
    private $vrednostDo;

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
     * Pavšalna vrednost za vse vaje. V praksi dobijo honorarni igralci ali pavšalni znesek 
     * za vse vaje ali pa nič (le za predstave). Za posamezno vajo se ne plačuje.
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
     * $$ zaenkrat še ne uporabljamo
     * 
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="pogodba.vrednostUre", description="pogodba.vrednostUre")   
     * @var double
     */
    private $vrednostUre;

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
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Alternacija", mappedBy="pogodba")
     * @var <Alternacije>
     */
    private $alternacije;

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

    public function __construct()
    {
        $this->alternacije = new ArrayCollection();
    }

    public function validate($mode = 'update')
    {
//        $this->expect($this->oseba || $this->popa, "Pogodba nima subjekta. Oseba ali poslovni partner sta obvezna", 1000340);
//        $this->expect(!($this->popa && $this->oseba), "Pogodba nima subjekta. Subjekt je lahko samo ali poslovni partner ali oseba -ne oba hkrati", 1000341);
        $this->expect($this->sifra, "sifra je obvezen podatek", 1000342);
        $this->expect($this->oseba, "Pogodba nima subjekta. Oseba je obvezna", 1000343);
    }

    public function getId()
    {
        return $this->id;
    }

    public function getSifra()
    {
        return $this->sifra;
    }

    public function getVrednostDo()
    {
        return $this->vrednostDo;
    }

    public function getZacetek()
    {
        return $this->zacetek;
    }

    public function getKonec()
    {
        return $this->konec;
    }

    public function getVrednostVaj()
    {
        return $this->vrednostVaj;
    }

    public function getVrednostPredstave()
    {
        return $this->vrednostPredstave;
    }

    public function getVrednostUre()
    {
        return $this->vrednostUre;
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

    public function getAlternacije()
    {
        return $this->alternacije;
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

    public function setVrednostDo($vrednostDo)
    {
        $this->vrednostDo = $vrednostDo;
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

    public function setVrednostUre($vrednostUre)
    {
        $this->vrednostUre = $vrednostUre;
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
