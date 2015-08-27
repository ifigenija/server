<?php

namespace ProgramDela\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * @ORM\Entity(repositoryClass="ProgramDela\Repository\EnotePrograma")
 * @ORM\InheritanceType("SINGLE_TABLE")
 * @ORM\DiscriminatorColumn(name="tip", length=20, type="string")
 * @ORM\DiscriminatorMap(
 *     {
 *     "premiera"="ProgramDela\Entity\ProgramPremiera",
 *     "ponovitevpremiere"="ProgramDela\Entity\ProgramPonovitevPremiere",
 *     "ponovitevprejsnjih"="ProgramDela\Entity\ProgramPonovitevPrejsnjih",
 *     "izjemni"="ProgramDela\Entity\ProgramIzjemni",
 *     "gostujoci"="ProgramDela\Entity\ProgramGostujoca",
 *     "gostovanje"="ProgramDela\Entity\ProgramGostovanje",
 *     "razno"="ProgramDela\Entity\ProgramRazno",
 *     "festival"="ProgramDela\Entity\ProgramFestival",
 *     "enota"="ProgramDela\Entity\EnotaPrograma"
 * }
 * )
 * 
 * @Max\I18n(label="Enota programa",plural="Enote programa")
 * 
 * prefiksi so definirani v podentitetah
 */
class EnotaPrograma
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID enote programa")
     * @Max\Ui(type="id")
     * @var string   
     */
    protected $id;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="ep.celotnaVrednost", description="ep.d.celotnaVrednost")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $celotnaVrednost;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="ep.nasDelez", description="ep.d.nasDelez")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $nasDelez;

    /**
     * V primeru programov ponovititev velja:
     * celotnavrednostMat + celotnaVrednostGostovSZ =nasDelez
     * 
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="ep.celotnaVrednostMat", description="ep.d.celotnaVrednostMat")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $celotnaVrednostMat;

    /**
     * V primeru programov ponovititev velja:
     * celotnavrednostMat + celotnaVrednostGostovSZ =nasDelez
     * 
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="ep.celotnaVrednostGostovSZ", description="ep.d.celotnaVrednostGostovSZ")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $celotnaVrednostGostovSZ;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="ep.zaproseno", description="ep.d.zaproseno")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $zaproseno;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="ep.lastnaSredstva", description="ep.d.lastnaSredstva")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $lastnaSredstva;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2,options={"default":0})
     * @Max\I18n(label="ep.avtorskiHonorarji", description="ep.d.avtorskiHonorarji")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $avtorskiHonorarji;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2,options={"default":0})
     * @Max\I18n(label="ep.avtorskiHonorarjiSamoz", description="ep.d.avtorskiHonorarjiSamoz")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $avtorskiHonorarjiSamoz;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="ep.tantieme", description="ep.d.tantieme")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $tantieme;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="ep.avtorskePravice", description="ep.d.avtorskePravice")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $avtorskePravice;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="ep.materialni", description="ep.d.materialni")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $materialni;

    /**
     * @ORM\OneToMany(targetEntity="ProgramDela\Entity\DrugiVir", mappedBy="enotaPrograma", orphanRemoval=true)
     * @var <drugiViri>
     */
    protected $drugiViri;

    /**
     * ali ima enota programa koprodukcije oz. koproducente
     * 
     * @ORM\Column(type="boolean", length=1, nullable=true)
     * @Max\I18n(label="ep.imaKoprodukcije", description="ep.d.imaKoprodukcije")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    protected $imaKoprodukcije;

    /**
     * @ORM\OneToMany(targetEntity="ProgramDela\Entity\ProdukcijaDelitev", mappedBy="enotaPrograma", orphanRemoval=true)
     * @var <Koprodukcije>
     */
    protected $koprodukcije;

    /**
     * Pojasnilo MK: : Prihodek od odkupa predstave v primeru gostovanja po Sloveniji in zamejstvu
     * 
     * če poenostavimo, je tudi:
     *  Odkup (vložek gostitelja)   pri mednarodnih gostovanjih
     * 
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="ep.vlozekGostitelja", description="ep.d.vlozekGostitelja")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $vlozekGostitelja;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="ep.drugiJavni", description="ep.d.drugiJavni")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $drugiJavni;

    /**
     * Št. zaposlenih čl. umetniškega ansambla, ki sodelujejo pri uprizoritvi:
     * 
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="ep.stZaposlenih", description="ep.d.stZaposlenih")
     * @Max\Ui(type="integer")
     * @var integer     
     */
    protected $stZaposlenih;

    /**
     * Št. zaposlenih čl. umetniškega ansambla, ki sodelujejo pri uprizoritvi:
     * 
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="ep.stZaposUmet", description="ep.d.stZaposUmet")
     * @Max\Ui(type="integer")
     * @var integer     
     */
    protected $stZaposUmet;

    /**
     * Št. drugih zaposlenih, ki sodelujejo pri uprizoritvi (brez upravno-administrativnih delavcev):
     * 
     * obstaja naj možnost da se podatek prepišejo iz uprizoritve in njenih relacij
     * 
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="ep.stZaposDrug", description="ep.d.stZaposDrug")
     * @Max\Ui(type="integer")
     * @var integer     
     */
    protected $stZaposDrug;

    /**
     * Št. vseh, ki sodelujejo honorarno
     * 
     * obstaja naj možnost da se podatek prepišejo iz uprizoritve in njenih relacij
     * 
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="ep.stHonorarnih", description="ep.d.stHonorarnih")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stHonorarnih;

    /**
     *  št. honorarnih igralcev
     * 
     * obstaja naj možnost da se podatek prepišejo iz uprizoritve in njenih relacij
     * 
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="ep.stHonorarnihIgr", description="ep.d.stHonorarnihIgr")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stHonorarnihIgr;

    /**
     *  št. honorarnih igralcev, zaposlenih v drugih javnih zavodih
     * 
     * obstaja naj možnost da se podatek prepišejo iz uprizoritve in njenih relacij
     * 
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="ep.stHonorarnihIgrTujJZ", description="ep.d.stHonorarnihIgrTujJZ")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stHonorarnihIgrTujJZ;

    /**
     *  št. honorarnih igralcev,samozaposlenih v drugih javnih zavodih
     * 
     * obstaja naj možnost da se podatek prepišejo iz uprizoritve in njenih relacij
     * 
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="ep.stHonorarnihIgrSamoz", description="ep.d.stHonorarnihIgrSamoz")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stHonorarnihIgrSamoz;

    /**
     * 
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="ep.obiskDoma", description="ep.d.obiskDoma")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    protected $obiskDoma;

    /**
     *  na odru slovenskega ali zamejskega koproducenta
     * 
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="ep.obiskKopr", description="ep.d.obiskKopr")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    protected $obiskKopr;

    /**
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="ep.obiskGost", description="ep.d.obiskGost")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    protected $obiskGost;

    /**
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="ep.obiskZamejo", description="ep.d.obiskZamejo")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    protected $obiskZamejo;

    /**
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="ep.obiskInt", description="ep.d.obiskInt")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    protected $obiskInt;

    /**
     * Načrtovano število gledalcev  odru koproducenta v tujini:
     * 
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="ep.obiskKoprInt", description="ep.d.obiskKoprInt")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    protected $obiskKoprInt;

    /**
     * @ORM\Column(type="integer", nullable=false, options={"default":" 0"})
     * @Max\I18n(label="ep.ponoviDoma", description="ep.d.ponoviDoma")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    protected $ponoviDoma;

    /**
     * na odru slovenskega ali zamejskega koproducenta
     * 
     * @ORM\Column(type="integer", nullable=false, options={"default":" 0"})
     * @Max\I18n(label="ep.ponoviKopr", description="ep.d.ponoviKopr")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    protected $ponoviKopr;

    /**
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="ep.ponoviZamejo", description="ep.d.ponoviZamejo")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    protected $ponoviZamejo;

    /**
     * število gostovanj po Sloveniji
     * 
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="ep.ponoviGost", description="ep.d.ponoviGost")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    protected $ponoviGost;

    /**
     * Število ponovitev na odru koproducenta v tujini:
     * 
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="ep.ponoviKoprInt", description="ep.d.ponoviKoprInt")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    protected $ponoviKoprInt;

    /**
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="ep.ponoviInt", description="ep.d.ponoviInt")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    protected $ponoviInt;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Uprizoritev")
     * @Max\I18n(label="ep.uprizoritev", description="ep.d.uprizoritev")   
     * @Max\Ui(type="toone", required=true)
     * @var \Produkcija\Entity\Uprizoritev
     */
    protected $uprizoritev;

    /**
     * Naziv dogodka za tiste programe, ki nimajo uprizoritve
     * Naziv festivala za festival,
     * Naziv sklopa za razno,
     * Naziv dogodka za izjemnidogodek.
     *
     * @ORM\Column(length=50, nullable=true)
     * @Max\I18n(label="ep.naziv", description="ep.d.naziv")
     * @var string
     */
    protected $naziv;

    /**
     * @ORM\ManyToOne(targetEntity="ProgramDela\Entity\TipProgramskeEnote", inversedBy="enotePrograma")
     * @Max\I18n(label="ep.tipProgramskeEnote", description="ep.d.tipProgramskeEnote")   
     * @Max\Ui(type="select",empty="Izberi tip programske enote", required=true)
     * @var \ProgramDela\Entity\TipProgramskeEnote
     */
    protected $tipProgramskeEnote;

    /**
     * koeficient programske enote
     * 
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="ep.kpe", description="ep.d.kpe")   
     * @var double
     */
    protected $kpe;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="ep.sort", description="ep.d.sort")
     * @Max\Ui(type="integer", icon="fa fa-sort")
     * @var integer
     */
    protected $sort;

    public function __construct()
    {
        $this->drugiViri    = new ArrayCollection();
        $this->koprodukcije = new ArrayCollection();
    }

    /**
     * sešteje vse druge vire
     */
    public function vsotaDrugihVirov()
    {
        $sumDNV = 0;    //init
        foreach ($this->getDrugiViri() as $numObject => $drugiVir) {
            $sumDNV += $drugiVir->getZnesek();
        }
        return $sumDNV;
    }

    /**
     * preračuna polja, ki se uporabljajo v matični koprodukciji
     * 
     * naš delež mora biti prej preračunan, predno se prenese v matično koprodukcijo
     */
    public function preracunajPoljaZaMatKoprodukcijo()
    {
        
    }

    public function preracunaj($smer = false)
    {

        $ls                   = $this->nasDelez - $this->zaproseno - $this->drugiJavni - $this->vsotaDrugihVirov() - $this->vlozekGostitelja;
        $this->lastnaSredstva = \Max\Functions::euroRound($ls);   //Zaokrožimo na 2 decimalki predno shranimo

        $this->preracunajCelotnoVrednost();     //$$ verjetno malo redundantno
        // preračunamo navzdol
        foreach ($this->getKoprodukcije() as $numObject => $koprodukcija) {
            $koprodukcija->preracunaj();        // se ne zacikla, ker ni smer=up
        }

        $this->celotnaVrednostMat = $this->celotnaVrednost - $this->celotnaVrednostGostovSZ;
    }

    /**
     * preračuna celotno vrednost kot seštevek deležev koprodukcij
     *  
     * @param type $mode
     */
    public function preracunajCelotnoVrednost()
    {
        if ($this->getKoprodukcije()->isEmpty()) {
            $this->celotnaVrednost = $this->getNasDelez();
        } else {
            $this->celotnaVrednost = 0; //init
            foreach ($this->getKoprodukcije() as $numObject => $koprodukcija) {
                $this->celotnaVrednost += $koprodukcija->getDelez();
            }
            // najprej moramo imeti sešteto celotno vrednost, da lahko preračunamo odstotke
            foreach ($this->getKoprodukcije() as $numObject => $koprodukcija) {
                $koprodukcija->preracunajOdstotekFinanciranja();
            }
        }
    }

    public function validate($mode = 'update')
    {
        $this->validateEuroGE0($this->celotnaVrednost, "Celotna vrednost", 1000622);
        $this->validateEuroGE0($this->nasDelez, "Naš delež", 1000623);
        $this->validateEuroGE0($this->celotnaVrednostMat, "Celotna vrednost na matičnem odru", 1000624);
        $this->validateEuroGE0($this->celotnaVrednostGostovSZ, "Celotna vrednost gostovanj v Slo in zamejstvu", 1000625);
        $this->validateEuroGE0($this->zaproseno, "Zaprošeno", 1000626);
//        $this->validateEuroGE0($this->lastnaSredstva, "Lastna sredstva", 1000627);
        $this->validateEuroGE0($this->avtorskiHonorarji, "Avtorski honorarji", 1000628);
        $this->validateEuroGE0($this->avtorskiHonorarjiSamoz, "Avtorski honorarji samozaposlenih", 1000629);
        $this->validateEuroGE0($this->tantieme, "Tantieme", 1000680);
        $this->validateEuroGE0($this->avtorskePravice, "Avtorske pravice", 1000681);
        $this->validateEuroGE0($this->vlozekGostitelja, "Vložek gostitelja", 1000682);
        $this->validateEuroGE0($this->drugiJavni, "Drugi javni", 1000683);
        $this->validateIntGE0($this->stZaposlenih, "", 1000684);
        $this->validateIntGE0($this->stZaposUmet, "", 1000685);
        $this->validateIntGE0($this->stZaposDrug, "", 1000686);
        $this->validateIntGE0($this->stHonorarnih, "", 1000687);
        $this->validateIntGE0($this->stHonorarnihIgr, "", 1000688);
        $this->validateIntGE0($this->stHonorarnihIgrTujJZ, "", 1000689);
        $this->validateIntGE0($this->stHonorarnihIgrSamoz, "", 1000690);
        $this->validateIntGE0($this->obiskDoma, "", 1000691);
        $this->validateIntGE0($this->obiskGost, "", 1000692);
        $this->validateIntGE0($this->obiskZamejo, "", 1000693);
        $this->validateIntGE0($this->obiskInt, "", 1000694);
        $this->validateIntGE0($this->ponoviDoma, "", 1000695);
        $this->validateIntGE0($this->ponoviZamejo, "", 1000696);
        $this->validateIntGE0($this->ponoviGost, "", 1000697);
        $this->validateIntGE0($this->ponoviInt, "", 1000698);
        $this->validateIntGE0($this->sort, "", 1000699);
        $this->validateEuroGE0($this->materialni, "Materialni", 1001200);

        /**
         * pred primerjanjem damo števila s plavajočo vejico v string
         */
        $nd   = \Max\Functions::euroRoundS($this->getNasDelez());
        $cv   = \Max\Functions::euroRoundS($this->getCelotnaVrednost());
        $cvSZ = \Max\Functions::euroRoundS($this->celotnaVrednostGostovSZ);
        $this->expect($nd <= $cv, "Delež matičnega JZ (" . $nd . ") ne sme biti večji od celotne vrednosti (" . $cv . ")", 1000621);
        $this->expect($cvSZ <= $cv, "Celotna vrednost gostovanj v Slo in zam. (" . $cvSZ . ") ne sme biti večja od celotne vrednosti (" . $cv . ")", 1000622);
    }

    public function getId()
    {
        return $this->id;
    }

    public function getCelotnaVrednost()
    {
        return $this->celotnaVrednost;
    }

    public function getNasDelez()
    {
        return $this->nasDelez;
    }

    public function getCelotnaVrednostMat()
    {
        return $this->celotnaVrednostMat;
    }

    public function getCelotnaVrednostGostovSZ()
    {
        return $this->celotnaVrednostGostovSZ;
    }

    public function getZaproseno()
    {
        return $this->zaproseno;
    }

    public function getLastnaSredstva()
    {
        return $this->lastnaSredstva;
    }

    public function getAvtorskiHonorarji()
    {
        return $this->avtorskiHonorarji;
    }

    public function getTantieme()
    {
        return $this->tantieme;
    }

    public function getDrugiViri()
    {
        return $this->drugiViri;
    }

    public function getKoprodukcije()
    {
        return $this->koprodukcije;
    }

    public function getVlozekGostitelja()
    {
        return $this->vlozekGostitelja;
    }

    public function getDrugiJavni()
    {
        return $this->drugiJavni;
    }

    public function getStZaposlenih()
    {
        return $this->stZaposlenih;
    }

    public function getStZaposUmet()
    {
        return $this->stZaposUmet;
    }

    public function getStZaposDrug()
    {
        return $this->stZaposDrug;
    }

    public function getStHonorarnih()
    {
        return $this->stHonorarnih;
    }

    public function getStHonorarnihIgr()
    {
        return $this->stHonorarnihIgr;
    }

    public function getStHonorarnihIgrTujJZ()
    {
        return $this->stHonorarnihIgrTujJZ;
    }

    public function getObiskDoma()
    {
        return $this->obiskDoma;
    }

    public function getObiskGost()
    {
        return $this->obiskGost;
    }

    public function getObiskZamejo()
    {
        return $this->obiskZamejo;
    }

    public function getObiskInt()
    {
        return $this->obiskInt;
    }

    public function getPonoviDoma()
    {
        return $this->ponoviDoma;
    }

    public function getPonoviZamejo()
    {
        return $this->ponoviZamejo;
    }

    public function getPonoviGost()
    {
        return $this->ponoviGost;
    }

    public function getPonoviInt()
    {
        return $this->ponoviInt;
    }

    public function getUprizoritev()
    {
        return $this->uprizoritev;
    }

    public function getNaziv()
    {
        return $this->naziv;
    }

    public function getTipProgramskeEnote()
    {
        return $this->tipProgramskeEnote;
    }

    public function getSort()
    {
        return $this->sort;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setCelotnaVrednost($celotnaVrednost)
    {
        $this->celotnaVrednost = $celotnaVrednost;
        return $this;
    }

    public function setNasDelez($nasDelez)
    {
        $this->nasDelez = $nasDelez;
        return $this;
    }

    public function setCelotnaVrednostMat($celotnaVrednostMat)
    {
        $this->celotnaVrednostMat = $celotnaVrednostMat;
        return $this;
    }

    public function setCelotnaVrednostGostovSZ($celotnaVrednostGostovSZ)
    {
        $this->celotnaVrednostGostovSZ = $celotnaVrednostGostovSZ;
        return $this;
    }

    public function setZaproseno($zaproseno)
    {
        $this->zaproseno = $zaproseno;
        return $this;
    }

    public function setLastnaSredstva($lastnaSredstva)
    {
        $this->lastnaSredstva = $lastnaSredstva;
        return $this;
    }

    public function setAvtorskiHonorarji($avtorskiHonorarji)
    {
        $this->avtorskiHonorarji = $avtorskiHonorarji;
        return $this;
    }

    public function setTantieme($tantieme)
    {
        $this->tantieme = $tantieme;
        return $this;
    }

    public function setDrugiViri($drugiViri)
    {
        $this->drugiViri = $drugiViri;
        return $this;
    }

    public function setKoprodukcije($koprodukcije)
    {
        $this->koprodukcije = $koprodukcije;
        return $this;
    }

    public function setVlozekGostitelja($vlozekGostitelja)
    {
        $this->vlozekGostitelja = $vlozekGostitelja;
        return $this;
    }

    public function setDrugiJavni($drugiJavni)
    {
        $this->drugiJavni = $drugiJavni;
        return $this;
    }

    public function setStZaposlenih($stZaposlenih)
    {
        $this->stZaposlenih = $stZaposlenih;
        return $this;
    }

    public function setStZaposUmet($stZaposUmet)
    {
        $this->stZaposUmet = $stZaposUmet;
        return $this;
    }

    public function setStZaposDrug($stZaposDrug)
    {
        $this->stZaposDrug = $stZaposDrug;
        return $this;
    }

    public function setStHonorarnih($stHonorarnih)
    {
        $this->stHonorarnih = $stHonorarnih;
        return $this;
    }

    public function setStHonorarnihIgr($stHonorarnihIgr)
    {
        $this->stHonorarnihIgr = $stHonorarnihIgr;
        return $this;
    }

    public function setStHonorarnihIgrTujJZ($stHonorarnihIgrTujJZ)
    {
        $this->stHonorarnihIgrTujJZ = $stHonorarnihIgrTujJZ;
        return $this;
    }

    public function setObiskDoma($obiskDoma)
    {
        $this->obiskDoma = $obiskDoma;
        return $this;
    }

    public function setObiskGost($obiskGost)
    {
        $this->obiskGost = $obiskGost;
        return $this;
    }

    public function setObiskZamejo($obiskZamejo)
    {
        $this->obiskZamejo = $obiskZamejo;
        return $this;
    }

    public function setObiskInt($obiskInt)
    {
        $this->obiskInt = $obiskInt;
        return $this;
    }

    public function setPonoviDoma($ponoviDoma)
    {
        $this->ponoviDoma = $ponoviDoma;
        return $this;
    }

    public function setPonoviZamejo($ponoviZamejo)
    {
        $this->ponoviZamejo = $ponoviZamejo;
        return $this;
    }

    public function setPonoviGost($ponoviGost)
    {
        $this->ponoviGost = $ponoviGost;
        return $this;
    }

    public function setPonoviInt($ponoviInt)
    {
        $this->ponoviInt = $ponoviInt;
        return $this;
    }

    public function setUprizoritev(\Produkcija\Entity\Uprizoritev $uprizoritev=null)
    {
        $this->uprizoritev = $uprizoritev;
        return $this;
    }

    public function setNaziv($naziv)
    {
        $this->naziv = $naziv;
        return $this;
    }

    public function setTipProgramskeEnote(\ProgramDela\Entity\TipProgramskeEnote $tipProgramskeEnote=null)
    {
        $this->tipProgramskeEnote = $tipProgramskeEnote;
        return $this;
    }

    public function setSort($sort)
    {
        $this->sort = $sort;
        return $this;
    }

    public function getStHonorarnihIgrSamoz()
    {
        return $this->stHonorarnihIgrSamoz;
    }

    public function setStHonorarnihIgrSamoz($stHonorarnihIgrSamoz)
    {
        $this->stHonorarnihIgrSamoz = $stHonorarnihIgrSamoz;
        return $this;
    }

    public function getAvtorskePravice()
    {
        return $this->avtorskePravice;
    }

    public function setAvtorskePravice($avtorskePravice)
    {
        $this->avtorskePravice = $avtorskePravice;
        return $this;
    }

    public function getAvtorskiHonorarjiSamoz()
    {
        return $this->avtorskiHonorarjiSamoz;
    }

    public function setAvtorskiHonorarjiSamoz($avtorskiHonorarjiSamoz)
    {
        $this->avtorskiHonorarjiSamoz = $avtorskiHonorarjiSamoz;
        return $this;
    }

    public function getMaterialni()
    {
        return $this->materialni;
    }

    public function setMaterialni($materialni)
    {
        $this->materialni = $materialni;
        return $this;
    }

    public function getImaKoprodukcije()
    {
        return $this->imaKoprodukcije;
    }

    public function setImaKoprodukcije($imaKoprodukcije)
    {
        $this->imaKoprodukcije = $imaKoprodukcije;
        return $this;
    }

    public function getObiskKopr()
    {
        return $this->obiskKopr;
    }

    public function getObiskKoprInt()
    {
        return $this->obiskKoprInt;
    }

    public function getPonoviKopr()
    {
        return $this->ponoviKopr;
    }

    public function getPonoviKoprInt()
    {
        return $this->ponoviKoprInt;
    }

    public function setObiskKopr($obiskKopr)
    {
        $this->obiskKopr = $obiskKopr;
        return $this;
    }

    public function setObiskKoprInt($obiskKoprInt)
    {
        $this->obiskKoprInt = $obiskKoprInt;
        return $this;
    }

    public function setPonoviKopr($ponoviKopr)
    {
        $this->ponoviKopr = $ponoviKopr;
        return $this;
    }

    public function setPonoviKoprInt($ponoviKoprInt)
    {
        $this->ponoviKoprInt = $ponoviKoprInt;
        return $this;
    }

    public function getKpe()
    {
        return $this->kpe;
    }

    public function setKpe($kpe)
    {
        $this->kpe = $kpe;
        return $this;
    }

}
