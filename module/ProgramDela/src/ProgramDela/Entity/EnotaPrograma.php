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
 *     "festival"="ProgramDela\Entity\ProgramFestival"
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
     * @var double
     */
    protected $celotnaVrednost;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="ep.nasDelez", description="ep.d.nasDelez")   
     * @var double
     */
    protected $nasDelez;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="ep.celotnaVrednostMat", description="ep.d.celotnaVrednostMat")   
     * @var double
     */
    protected $celotnaVrednostMat;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="ep.celotnaVrednostGostovSZ", description="ep.d.celotnaVrednostGostovSZ")   
     * @var double
     */
    protected $celotnaVrednostGostovSZ;

    /**
     * % nasega deleža
     * 
     * je <= maksfaktor
     * 
     * @ORM\Column(type="decimal", nullable=true, precision=6, scale=2)
     * @Max\I18n(label="ep.zaprosenProcent", description="ep.d.zaprosenProcent")
     * @var double
     */
    protected $zaprosenProcent;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="ep.zaproseno", description="ep.d.zaproseno")   
     * @var double
     */
    protected $zaproseno;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="ep.lastnaSredstva", description="ep.d.lastnaSredstva")   
     * @var double
     */
    protected $lastnaSredstva;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2,options={"default":0})
     * @Max\I18n(label="ep.avtorskiHonorarji", description="ep.d.avtorskiHonorarji")   
     * @var double
     */
    protected $avtorskiHonorarji;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="ep.tantieme", description="ep.d.tantieme")   
     * @var double
     */
    protected $tantieme;

    /**
     * @ORM\OneToMany(targetEntity="ProgramDela\Entity\DrugiVir", mappedBy="enotaPrograma", orphanRemoval=true)
     * @var <drugiViri>
     */
    protected $drugiViri;

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
     * @var double
     */
    protected $vlozekGostitelja;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="ep.drugiJavni", description="ep.d.drugiJavni")   
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
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="ep.obiskDoma", description="ep.d.obiskDoma")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    protected $obiskDoma;

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
     * @ORM\Column(type="integer", nullable=false, options={"default":" 0"})
     * @Max\I18n(label="ep.ponoviDoma", description="ep.d.ponoviDoma")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    protected $ponoviDoma;

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
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="ep.ponoviInt", description="ep.d.ponoviInt")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    protected $ponoviInt;

    /**
     * @ORM\Column(type="text", nullable=false)
     * @Max\I18n(label="ep.utemeljitev", description="ep.d.utemeljitev")   
     * @var string     
     */
    protected $utemeljitev;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Uprizoritev")
     * @Max\I18n(label="ep.uprizoritev", description="ep.d.uprizoritev")   
     * @Max\Ui(type="toone")
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
     * @Max\Ui(type="select")
     * @var \ProgramDela\Entity\TipProgramskeEnote
     */
    protected $tipProgramskeEnote;

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

    public function preracunaj($smer = false)
    {
        $this->preracunajCelotnoVrednost();     //$$ verjetno malo redundantno

        /**
         * izračunaj zaprošen znesek
         */
        $zaproseno       = $this->getNasDelez() * $this->getZaprosenProcent() / 100;
        $zaproseno       = \Max\Functions::euroRound($zaproseno);   //Zaokrožimo na 2 decimalki predno shranimo
        $this->zaproseno = $zaproseno;

        // preračunamo navzdol
        foreach ($this->getKoprodukcije() as $numObject => $koprodukcija) {
            $koprodukcija->preracunaj();        // se ne zacikla, ker ni smer=up
        }
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
        /**
         * pred primerjanjem damo števila s plavajočo vejico v string
         */
        $ls           = \Max\Functions::euroRoundS($this->getLastnaSredstva());
        $nd           = \Max\Functions::euroRoundS($this->getNasDelez());
        $cv           = \Max\Functions::euroRoundS($this->getCelotnaVrednost());
        $this->expect($ls <= $nd, "Lastna sredstva ne smejo biti večja od našega deleža", 1000620);
        $this->expect($nd <= $cv, "Naš delež (" . $nd . ") ne sme biti večji od celotne vrednosti (" . $cv . ")", 1000621);
        /**
         * $$ morda še validacija   nd = ls + drugi viri  + zapr mk + ...??
         */
        $zaprosenProc = \Max\Functions::procRoundS($this->getZaprosenProcent());
        $this->expect(($zaprosenProc >= 0) && ($zaprosenProc <= 100), 'Zaprošen odstotek mora biti med 0 in 100, je pa ' . $zaprosenProc, 1000622);
        if ($this->tipProgramskeEnote) {
            $maxFaktor   = \Max\Functions::numberRoundS($this->getTipProgramskeEnote()->getMaxFaktor());
            $maxFaktor00 = \Max\Functions::numberRoundS($this->getTipProgramskeEnote()->getMaxFaktor() * 100);
            $maxVsi      = \Max\Functions::numberRoundS($this->getTipProgramskeEnote()->getMaxVsi());
            $maxVsi00    = \Max\Functions::numberRoundS($this->getTipProgramskeEnote()->getMaxVsi() * 100);
            $this->expect($zaprosenProc <= $maxFaktor00, 'Zaprošen odstotek ne sme biti večji kot koeficient programske enote ' . $maxFaktor, 1000623);

            // še kontrola na skupni koeficient
            if (!$this->getKoprodukcije()->isEmpty()) {
                $vsiZaprProc = 0; //init
                foreach ($this->getKoprodukcije() as $numObject => $koprodukcija) {
                    $vsiZaprProc+= $koprodukcija->getZaprosenProcent();
                }
                $vsiZaprProc = \Max\Functions::procRoundS($vsiZaprProc);
                $this->expect(($vsiZaprProc <= $maxVsi00), 'Vsota zaprošenih odstotkov koproducentov ne sme biti večji kot skupni koeficient ' . $maxFaktor, 1000624);
            }

            /**
             * $$ tu bi lahko še validirali tip programske enote, npr:
             *   - če obstajajo koprodukcije, je tip programske enote lahko le med 3-5
             */
        }
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

    public function getZaprosenProcent()
    {
        return $this->zaprosenProcent;
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

    public function getUtemeljitev()
    {
        return $this->utemeljitev;
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

    public function setZaprosenProcent($zaprosenProcent)
    {
        $this->zaprosenProcent = $zaprosenProcent;
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

    public function setUtemeljitev($utemeljitev)
    {
        $this->utemeljitev = $utemeljitev;
        return $this;
    }

    public function setUprizoritev(\Produkcija\Entity\Uprizoritev $uprizoritev)
    {
        $this->uprizoritev = $uprizoritev;
        return $this;
    }

    public function setNaziv($naziv)
    {
        $this->naziv = $naziv;
        return $this;
    }

    public function setTipProgramskeEnote(\ProgramDela\Entity\TipProgramskeEnote $tipProgramskeEnote)
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

}
