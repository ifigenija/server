<?php

namespace Produkcija\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="Produkcija\Repository\Funkcije")
 * @Max\Lookup(ident="naziv",search={"naziv"},)
 * @Max\I18n(label="Funkcija",plural="Funkcije")
 * @Max\Id(prefix="0013")
 */
class Funkcija
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID funkcije")
     * @Max\Ui(type="id")
     * @var string
     */
    private $id;

    /**
     * $$ rb ali sploh rabimo to polje - saj je v tipih funkcij, ki bi jih fixturji skreirali,  že pripravljeno
     * $$ v validate  se polje povozi, tako, da UI za to verjetno več ne velja
     * 
     * @ORM\Column(type="string", length=20, nullable=true)
     * @Max\I18n(label="entiteta.podrocje", description="Področje funkcije")
     * @Max\Ui(type="select", opts="funkcija.podrocje")
     * @var string
     */
    private $podrocje;

    /**
     * inšpecient in Vodja tehnične ekipe sta vodja ekipe  za $področje oz. tipfunkcije.podrocje  
     * $$ če se bo uporabljalo polje $področje v tej entiteti, je potrebno poskrbeti, da so možne le določene vrednosti, npr.  tehnik, umetnik, igralec
     * inšpecient je vodja ekipe za vsa področja, tehnični vodja le za podrocje=tehnik
     * 
     * @ORM\Column(type="boolean", length=1, nullable=true)
     * @Max\I18n(label="funkcija.vodjaEkipe", description="Ali je vodja področja")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    private $vodjaEkipe;

    /**
     * V to polje se vpiše ime funkcije kot npr. Romeo, Julija,Tezej ipd.
     * 
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="entiteta.naziv", description="Naziv funkcije")
     * @Max\Ui(type="naziv",ident=true )
     * @var string
     */
    private $naziv;

    /**
     * V to polje se vpiše poljubno - bolj specifično ime funkcije za to uprizoritev,
     * kot je tip funkcije, ki je standariziran glede na SLOGI (Slovenski gledališki inštitut) 
     * 
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="funkcija.komentar", description="Komentar funkcije")
     * @var string
     */
    private $komentar;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="funkcija.velikost", description="Velikost funkcije")
     * @Max\Ui(type="select", opts="funkcija.velikost")
     * @var string
     */
    private $velikost;

    /**
     * Če je funkcija pomembna, je tudi vsebovana v osebni izkaznici 
     * Če pomembna=false, potem se ne izpiše v osebni izkaznici, ampak le v gledališkem listu
     * 
     * Smiselno je, da imajo pomembne funkcije tudi večjo utež oz. sortno vrednost ($sort)
     * 
     * @ORM\Column(type="boolean", nullable=false)
     * @Max\I18n(label="funkcija.pomembna", description="Ali je funkcija pomembna")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    private $pomembna;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="entiteta.sort", description="Sort funkcije oz. utež")
     * @Max\Ui(type="integer", icon="fa fa-sort")
     * @var integer
     */
    private $sort;

    /**
     * @ORM\Column(type="boolean", nullable=false)
     * @Max\I18n(label="funkcija.sePlanira")
     * @Max\Ui(type="boolcheckbox")
     */
    private $sePlanira;

    /**
     * @ORM\Column(type="boolean", nullable=false)
     * @Max\I18n(label="funkcija.dovoliPrekrivanje")
     * @Max\Ui(type="boolcheckbox")
     */
    private $dovoliPrekrivanje;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="funkcija.maxPrekrivanj")
     * @Max\Ui(type="integer")
     * @var integer     
     */
    private $maxPrekrivanj;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Alternacija", mappedBy="funkcija")
     * @var <Alternacije>
     */
    private $alternacije;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Uprizoritev", inversedBy="funkcije")
     * @ORM\JoinColumn(name="uprizoritev_id", referencedColumnName="id", nullable=false)
     * @Max\I18n(label="entiteta.uprizoritev",  description="Uprizoritev")
     * @Max\Ui(type="hiddenid")
     * @var \Produkcija\Entity\Uprizoritev
     */
    private $uprizoritev;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Alternacija")
     * @ORM\JoinColumn(name="alternacija_id", referencedColumnName="id") \Produkcija\Entity\Alternacija
     * @Max\I18n(label="funkcija.privzeti",  description="Privzeta alternacija")
     * @Max\Ui(type="toone")
     * @var
     */
    private $privzeti;

    /**
     * tipi funkcij, ki so standarizirani glede na SLOGI (Slovenski gledališki inštitut)
     * 
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\TipFunkcije", inversedBy="funkcije", fetch="EAGER")
     * @Max\I18n(label="funkcija.tipFunkcije",  description="Tip funkcije")
     * @Max\Ui(type="select")
     * @var \Produkcija\Entity\TipFunkcije
     */
    private $tipFunkcije;

    public function validate($mode = 'update')
    {
        $this->setPodrocje($this->getTipFunkcije()->getPodrocje());
    }

    /**
     * Vrne imena ljudi, ki so na alternacijah
     */
    public function getImena()
    {
        $imena = "";
        foreach ($this->getAlternacije() as $alter) {
            /* @var $alter \Produkcija\Entity\Alternacija */
            if ($alter->getOseba()) {
                if ($alter->getPrivzeti()) {
                    $ime = "<strong>" . $alter->getOseba()->getPolnoIme() . "</strong>";
                } else {
                    $ime = $alter->getOseba()->getPolnoIme();
                }
                $imena .= ($imena ? ", " : "") . $ime;
            }
        }
        return $imena;
    }

    public function getId()
    {
        return $this->id;
    }

    public function getPodrocje()
    {
        return $this->podrocje;
    }

    public function getVodjaEkipe()
    {
        return $this->vodjaEkipe;
    }

    public function getNaziv()
    {
        return $this->naziv;
    }

    public function getKomentar()
    {
        return $this->komentar;
    }

    public function getVelikost()
    {
        return $this->velikost;
    }

    public function getPomembna()
    {
        return $this->pomembna;
    }

    public function getSort()
    {
        return $this->sort;
    }

    public function getSePlanira()
    {
        return $this->sePlanira;
    }

    public function getDovoliPrekrivanje()
    {
        return $this->dovoliPrekrivanje;
    }

    public function getMaxPrekrivanj()
    {
        return $this->maxPrekrivanj;
    }

    public function getAlternacije()
    {
        return $this->alternacije;
    }

    public function getUprizoritev()
    {
        return $this->uprizoritev;
    }

    public function getPrivzeti()
    {
        return $this->privzeti;
    }

    public function getTipFunkcije()
    {
        return $this->tipFunkcije;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setPodrocje($podrocje)
    {
        $this->podrocje = $podrocje;
        return $this;
    }

    public function setVodjaEkipe($vodjaEkipe)
    {
        $this->vodjaEkipe = $vodjaEkipe;
        return $this;
    }

    public function setNaziv($naziv)
    {
        $this->naziv = $naziv;
        return $this;
    }

    public function setKomentar($komentar)
    {
        $this->komentar = $komentar;
        return $this;
    }

    public function setVelikost($velikost)
    {
        $this->velikost = $velikost;
        return $this;
    }

    public function setPomembna($pomembna)
    {
        $this->pomembna = $pomembna;
        return $this;
    }

    public function setSort($sort)
    {
        $this->sort = $sort;
        return $this;
    }

    public function setSePlanira($sePlanira)
    {
        $this->sePlanira = $sePlanira;
        return $this;
    }

    public function setDovoliPrekrivanje($dovoliPrekrivanje)
    {
        $this->dovoliPrekrivanje = $dovoliPrekrivanje;
        return $this;
    }

    public function setMaxPrekrivanj($maxPrekrivanj)
    {
        $this->maxPrekrivanj = $maxPrekrivanj;
        return $this;
    }

    public function setAlternacije($alternacije)
    {
        $this->alternacije = $alternacije;
        return $this;
    }

    public function setUprizoritev(\Produkcija\Entity\Uprizoritev $uprizoritev)
    {
        $this->uprizoritev = $uprizoritev;
        return $this;
    }

    public function setPrivzeti($privzeti)
    {
        $this->privzeti = $privzeti;
        return $this;
    }

    public function setTipFunkcije(\Produkcija\Entity\TipFunkcije $tipFunkcije)
    {
        $this->tipFunkcije = $tipFunkcije;
        return $this;
    }

}
