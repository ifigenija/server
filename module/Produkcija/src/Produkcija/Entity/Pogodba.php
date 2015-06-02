<?php

namespace Produkcija\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;

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
     * @Max\I18n(label="entiteta.sifra", description="Unikatna šifra pogodbe")
     * @Max\Ui(ident=true, type="sifra",icon="fa fa-barcode")
     * @var string
     */
    private $sifra;

    /**
     * @ORM\Column(type="decimal", nullable=true)
     * @Max\I18n(label="entiteta.vrednostDo", description="vrednost do")
     * $$ novo polje
     */
    private $vrednostDo;

    /**
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="entiteta.zacetek", description="začetek pogodbe")
     */
    private $zacetek;

    /**
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="entiteta.konec", description="konec pogodbe")
     */
    private $konec;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="pogodba.vrednostVaje", description="Vrednost vaje")   
     * @var double
     */
    private $vrednostVaje;

    /**
     * @ORM\Column(type="decimal", nullable=true, precision=12, scale=2)
     * @Max\I18n(label="pogodba.vrednostPredstave", description="Vrednost predstave")   
     * @var double
     */
    private $vrednostPredstave;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="pogodba.vrednostUre", description="Vrednost ure")   
     * @var double
     */
    private $vrednostUre;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="pogodba.aktivna", description="Ali je pogodba aktivna")   
     * @Max\Ui(type="boolcheckbox")                       
     * @var boolean
     */
    private $aktivna;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="entiteta.opis", description="Opis pogodbe")   
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
     * @Max\I18n(label="entiteta.oseba",  description="Oseba, s katero je napravljena pogodba")
     * @Max\Ui(type="toone")
     * @var \App\Entity\Oseba
     */
    private $oseba;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Popa", inversedBy="pogodbe")
     * @ORM\JoinColumn(name="popa_id", referencedColumnName="id")
     * @Max\I18n(label="pogodba.popa",  description="Poslovni partner, s katerim je napravljena pogodba")
     * @Max\Ui(type="toone")
     * @var \App\Entity\Popa
     */
    private $popa;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Trr")
     * @ORM\JoinColumn(name="trr_id", referencedColumnName="id")
     * @Max\I18n(label="pogodba.trr",  description="Trr na pogodbi")
     * @Max\Ui(type="toone")
     * @var \App\Entity\Trr
     */
    private $trr;

    public function validate($mode = 'update')
    {
        $this->expect($this->oseba || $this->popa, "Pogodba nima subjekta. Oseba ali poslovni partner sta obvezna", 1000340);
        $this->expect(!($this->popa && $this->oseba), "Pogodba nima subjekta. Subjekt je lahko samo ali poslovni partner ali oseba -ne oba hkrati", 1000341);
        $this->expect($this->sifra, "sifra je obvezen podatek", 1000342);
    }

    public function getId()
    {
        return $this->id;
    }

    public function getSifra()
    {
        return $this->sifra;
    }

    public function getVrednostVaje()
    {
        return $this->vrednostVaje;
    }

    public function getVrednostPredstave()
    {
        return $this->vrednostPredstave;
    }

    public function getVrednostUre()
    {
        return $this->vrednostUre;
    }

    public function getAktivna()
    {
        return $this->aktivna;
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

    public function setVrednostVaje($vrednostVaje)
    {
        $this->vrednostVaje = $vrednostVaje;
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

    public function setAktivna($aktivna)
    {
        $this->aktivna = $aktivna;
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
