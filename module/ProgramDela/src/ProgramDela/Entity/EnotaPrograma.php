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
     * delež matičnega JZ
     * 
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
     *  Odkup (vložek gos   titelja)   pri mednarodnih gostovanjih
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
     * @ORM\Column(type="integer", nullable=true, options={"default":0})
     * @Max\I18n(label="ep.stHonorarnihZun", description="ep.d.stHonorarnihZun")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stHonorarnihZun;

    /**
     *  št. honorarnih igralcev
     * 
     * obstaja naj možnost da se podatek prepišejo iz uprizoritve in njenih relacij
     * 
     * @ORM\Column(type="integer", nullable=true, options={"default":0})
     * @Max\I18n(label="ep.stHonorarnihZunIgr", description="ep.d.stHonorarnihZunIgr")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stHonorarnihZunIgr;

    /**
     *  št. honorarnih igralcev, zaposlenih v drugih javnih zavodih
     * 
     * obstaja naj možnost da se podatek prepišejo iz uprizoritve in njenih relacij
     * 
     * @ORM\Column(type="integer", nullable=true, options={"default":0})
     * @Max\I18n(label="ep.stHonorarnihZunIgrTujJZ", description="ep.d.stHonorarnihZunIgrTujJZ")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stHonorarnihZunIgrTujJZ;

    /**
     *  št. honorarnih igralcev,samozaposlenih v drugih javnih zavodih
     * 
     * obstaja naj možnost da se podatek prepišejo iz uprizoritve in njenih relacij
     * 
     * @ORM\Column(type="integer", nullable=true, options={"default":0})
     * @Max\I18n(label="ep.stHonorarnihZunSamoz", description="ep.d.stHonorarnihZunSamoz")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stHonorarnihZunSamoz;

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
     * delež matičnega JZ
     * 
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="ep.obiskGost", description="ep.d.obiskGost")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    protected $obiskGost;

    /**
     * delež koproducentov
     * 
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="ep.obiskKoprGost", description="ep.d.obiskKoprGost")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    protected $obiskKoprGost;

    /**
     * delež matičnega JZ
     * 
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="ep.obiskZamejo", description="ep.d.obiskZamejo")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    protected $obiskZamejo;

    /**
     * delež ostalih koproducentov
     * 
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="ep.obiskKoprZamejo", description="ep.d.obiskKoprZamejo")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    protected $obiskKoprZamejo;

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
     * delež matičnega JZ
     * 
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="ep.ponoviZamejo", description="ep.d.ponoviZamejo")   
     * @var double
     */
    protected $ponoviZamejo;

    /**
     * delež koproducentov
     * 
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="ep.ponoviKoprZamejo", description="ep.d.ponoviKoprZamejo")   
     * @var double
     */
    protected $ponoviKoprZamejo;

    /**
     * število gostovanj po Sloveniji - delež matičnega JZ
     * 
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="ep.ponoviGost", description="ep.d.ponoviGost")   
     * @var double
     */
    protected $ponoviGost;

    /**
     * število gostovanj po Sloveniji - delež koproducentov
     * 
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="ep.ponoviKoprGost", description="ep.d.ponoviKoprGost")   
     * @var double
     */
    protected $ponoviKoprGost;

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

        $this->celotnaVrednostMat = $this->nasDelez - $this->celotnaVrednostGostovSZ;
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
        $this->validateIntGE0($this->stHonorarnihZun, "", 1000687);
        $this->validateIntGE0($this->stHonorarnihZunIgr, "", 1000688);
        $this->validateIntGE0($this->stHonorarnihZunIgrTujJZ, "", 1000689);
        $this->validateIntGE0($this->stHonorarnihZunSamoz, "", 1000690);
        $this->validateIntGE0($this->obiskDoma, "", 1000691);
        $this->validateIntGE0($this->obiskKopr, "", 1001201);
        $this->validateIntGE0($this->obiskGost, "", 1000692);
        $this->validateIntGE0($this->obiskZamejo, "", 1000693);
        $this->validateIntGE0($this->obiskInt, "", 1000694);
        $this->validateIntGE0($this->ponoviDoma, "", 1000695);
        $this->validateNumberGE0($this->ponoviZamejo, "", 1000696);
        $this->validateNumberGE0($this->ponoviKoprZamejo, "", 1001205);
        $this->validateNumberGE0($this->ponoviGost, "", 1000697);
        $this->validateNumberGE0($this->ponoviKoprGost, "", 1001206);
        $this->validateIntGE0($this->ponoviInt, "", 1000698);
        $this->validateIntGE0($this->ponoviKopr, "", 1001202);
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

        $ah  = \Max\Functions::euroRoundS($this->getAvtorskiHonorarji());
        $ahs = \Max\Functions::euroRoundS($this->getAvtorskiHonorarjiSamoz());
        $this->expect($ahs <= $ah, "Avtorski honorarji samozaposlenih (" . $ahs . ") ne smejo biti večji od avtorskih honorarjev (" . $ah . ")", 1001204);

        /**
         * za tiste ep, ki imajo uprizoritev je lahko obisk doma lahko največ število ponovitev doma * kapaciteta matičnega odra
         */
        if ($this->uprizoritev) {
            $this->expect($this->obiskDoma <= $this->ponoviDoma * $this->uprizoritev->getMaticniOder()->getKapaciteta()
                    , "Obisk doma ne sme biti večji kot št. ponovitev doma * kapaciteta matičnega odra (" . $this->uprizoritev->getMaticniOder()->getKapaciteta() . ")"
                    , 1001203);
        }
    }

    function getId()
    {
        return $this->id;
    }

    function getCelotnaVrednost()
    {
        return $this->celotnaVrednost;
    }

    function getNasDelez()
    {
        return $this->nasDelez;
    }

    function getCelotnaVrednostMat()
    {
        return $this->celotnaVrednostMat;
    }

    function getCelotnaVrednostGostovSZ()
    {
        return $this->celotnaVrednostGostovSZ;
    }

    function getZaproseno()
    {
        return $this->zaproseno;
    }

    function getLastnaSredstva()
    {
        return $this->lastnaSredstva;
    }

    function getAvtorskiHonorarji()
    {
        return $this->avtorskiHonorarji;
    }

    function getAvtorskiHonorarjiSamoz()
    {
        return $this->avtorskiHonorarjiSamoz;
    }

    function getTantieme()
    {
        return $this->tantieme;
    }

    function getAvtorskePravice()
    {
        return $this->avtorskePravice;
    }

    function getMaterialni()
    {
        return $this->materialni;
    }

    function getDrugiViri()
    {
        return $this->drugiViri;
    }

    function getImaKoprodukcije()
    {
        return $this->imaKoprodukcije;
    }

    function getKoprodukcije()
    {
        return $this->koprodukcije;
    }

    function getVlozekGostitelja()
    {
        return $this->vlozekGostitelja;
    }

    function getDrugiJavni()
    {
        return $this->drugiJavni;
    }

    function getStZaposlenih()
    {
        return $this->stZaposlenih;
    }

    function getStZaposUmet()
    {
        return $this->stZaposUmet;
    }

    function getStZaposDrug()
    {
        return $this->stZaposDrug;
    }

    function getStHonorarnihZun()
    {
        return $this->stHonorarnihZun;
    }

    function getStHonorarnihZunIgr()
    {
        return $this->stHonorarnihZunIgr;
    }

    function getStHonorarnihZunIgrTujJZ()
    {
        return $this->stHonorarnihZunIgrTujJZ;
    }

    function getStHonorarnihZunSamoz()
    {
        return $this->stHonorarnihZunSamoz;
    }

    function getObiskDoma()
    {
        return $this->obiskDoma;
    }

    function getObiskKopr()
    {
        return $this->obiskKopr;
    }

    function getObiskGost()
    {
        return $this->obiskGost;
    }

    function getObiskKoprGost()
    {
        return $this->obiskKoprGost;
    }

    function getObiskZamejo()
    {
        return $this->obiskZamejo;
    }

    function getObiskKoprZamejo()
    {
        return $this->obiskKoprZamejo;
    }

    function getObiskInt()
    {
        return $this->obiskInt;
    }

    function getObiskKoprInt()
    {
        return $this->obiskKoprInt;
    }

    function getPonoviDoma()
    {
        return $this->ponoviDoma;
    }

    function getPonoviKopr()
    {
        return $this->ponoviKopr;
    }

    function getPonoviZamejo()
    {
        return $this->ponoviZamejo;
    }

    function getPonoviKoprZamejo()
    {
        return $this->ponoviKoprZamejo;
    }

    function getPonoviGost()
    {
        return $this->ponoviGost;
    }

    function getPonoviKoprGost()
    {
        return $this->ponoviKoprGost;
    }

    function getPonoviKoprInt()
    {
        return $this->ponoviKoprInt;
    }

    function getPonoviInt()
    {
        return $this->ponoviInt;
    }

    function getUprizoritev()
    {
        return $this->uprizoritev;
    }

    function getNaziv()
    {
        return $this->naziv;
    }

    function getTipProgramskeEnote()
    {
        return $this->tipProgramskeEnote;
    }

    function getKpe()
    {
        return $this->kpe;
    }

    function getSort()
    {
        return $this->sort;
    }

    function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    function setCelotnaVrednost($celotnaVrednost)
    {
        $this->celotnaVrednost = $celotnaVrednost;
        return $this;
    }

    function setNasDelez($nasDelez)
    {
        $this->nasDelez = $nasDelez;
        return $this;
    }

    function setCelotnaVrednostMat($celotnaVrednostMat)
    {
        $this->celotnaVrednostMat = $celotnaVrednostMat;
        return $this;
    }

    function setCelotnaVrednostGostovSZ($celotnaVrednostGostovSZ)
    {
        $this->celotnaVrednostGostovSZ = $celotnaVrednostGostovSZ;
        return $this;
    }

    function setZaproseno($zaproseno)
    {
        $this->zaproseno = $zaproseno;
        return $this;
    }

    function setLastnaSredstva($lastnaSredstva)
    {
        $this->lastnaSredstva = $lastnaSredstva;
        return $this;
    }

    function setAvtorskiHonorarji($avtorskiHonorarji)
    {
        $this->avtorskiHonorarji = $avtorskiHonorarji;
        return $this;
    }

    function setAvtorskiHonorarjiSamoz($avtorskiHonorarjiSamoz)
    {
        $this->avtorskiHonorarjiSamoz = $avtorskiHonorarjiSamoz;
        return $this;
    }

    function setTantieme($tantieme)
    {
        $this->tantieme = $tantieme;
        return $this;
    }

    function setAvtorskePravice($avtorskePravice)
    {
        $this->avtorskePravice = $avtorskePravice;
        return $this;
    }

    function setMaterialni($materialni)
    {
        $this->materialni = $materialni;
        return $this;
    }

    function setDrugiViri($drugiViri)
    {
        $this->drugiViri = $drugiViri;
        return $this;
    }

    function setImaKoprodukcije($imaKoprodukcije)
    {
        $this->imaKoprodukcije = $imaKoprodukcije;
        return $this;
    }

    function setKoprodukcije($koprodukcije)
    {
        $this->koprodukcije = $koprodukcije;
        return $this;
    }

    function setVlozekGostitelja($vlozekGostitelja)
    {
        $this->vlozekGostitelja = $vlozekGostitelja;
        return $this;
    }

    function setDrugiJavni($drugiJavni)
    {
        $this->drugiJavni = $drugiJavni;
        return $this;
    }

    function setStZaposlenih($stZaposlenih)
    {
        $this->stZaposlenih = $stZaposlenih;
        return $this;
    }

    function setStZaposUmet($stZaposUmet)
    {
        $this->stZaposUmet = $stZaposUmet;
        return $this;
    }

    function setStZaposDrug($stZaposDrug)
    {
        $this->stZaposDrug = $stZaposDrug;
        return $this;
    }

    function setStHonorarnihZun($stHonorarnihZun)
    {
        $this->stHonorarnihZun = $stHonorarnihZun;
        return $this;
    }

    function setStHonorarnihZunIgr($stHonorarnihZunIgr)
    {
        $this->stHonorarnihZunIgr = $stHonorarnihZunIgr;
        return $this;
    }

    function setStHonorarnihZunIgrTujJZ($stHonorarnihZunIgrTujJZ)
    {
        $this->stHonorarnihZunIgrTujJZ = $stHonorarnihZunIgrTujJZ;
        return $this;
    }

    function setStHonorarnihZunSamoz($stHonorarnihZunSamoz)
    {
        $this->stHonorarnihZunSamoz = $stHonorarnihZunSamoz;
        return $this;
    }

    function setObiskDoma($obiskDoma)
    {
        $this->obiskDoma = $obiskDoma;
        return $this;
    }

    function setObiskKopr($obiskKopr)
    {
        $this->obiskKopr = $obiskKopr;
        return $this;
    }

    function setObiskGost($obiskGost)
    {
        $this->obiskGost = $obiskGost;
        return $this;
    }

    function setObiskKoprGost($obiskKoprGost)
    {
        $this->obiskKoprGost = $obiskKoprGost;
        return $this;
    }

    function setObiskZamejo($obiskZamejo)
    {
        $this->obiskZamejo = $obiskZamejo;
        return $this;
    }

    function setObiskKoprZamejo($obiskKoprZamejo)
    {
        $this->obiskKoprZamejo = $obiskKoprZamejo;
        return $this;
    }

    function setObiskInt($obiskInt)
    {
        $this->obiskInt = $obiskInt;
        return $this;
    }

    function setObiskKoprInt($obiskKoprInt)
    {
        $this->obiskKoprInt = $obiskKoprInt;
        return $this;
    }

    function setPonoviDoma($ponoviDoma)
    {
        $this->ponoviDoma = $ponoviDoma;
        return $this;
    }

    function setPonoviKopr($ponoviKopr)
    {
        $this->ponoviKopr = $ponoviKopr;
        return $this;
    }

    function setPonoviZamejo($ponoviZamejo)
    {
        $this->ponoviZamejo = $ponoviZamejo;
        return $this;
    }

    function setPonoviKoprZamejo($ponoviKoprZamejo)
    {
        $this->ponoviKoprZamejo = $ponoviKoprZamejo;
        return $this;
    }

    function setPonoviGost($ponoviGost)
    {
        $this->ponoviGost = $ponoviGost;
        return $this;
    }

    function setPonoviKoprGost($ponoviKoprGost)
    {
        $this->ponoviKoprGost = $ponoviKoprGost;
        return $this;
    }

    function setPonoviKoprInt($ponoviKoprInt)
    {
        $this->ponoviKoprInt = $ponoviKoprInt;
        return $this;
    }

    function setPonoviInt($ponoviInt)
    {
        $this->ponoviInt = $ponoviInt;
        return $this;
    }

    function setUprizoritev(\Produkcija\Entity\Uprizoritev $uprizoritev=null)
    {
        $this->uprizoritev = $uprizoritev;
        return $this;
    }

    function setNaziv($naziv)
    {
        $this->naziv = $naziv;
        return $this;
    }

    function setTipProgramskeEnote(\ProgramDela\Entity\TipProgramskeEnote $tipProgramskeEnote=null)
    {
        $this->tipProgramskeEnote = $tipProgramskeEnote;
        return $this;
    }

    function setKpe($kpe)
    {
        $this->kpe = $kpe;
        return $this;
    }

    function setSort($sort)
    {
        $this->sort = $sort;
        return $this;
    }


}
