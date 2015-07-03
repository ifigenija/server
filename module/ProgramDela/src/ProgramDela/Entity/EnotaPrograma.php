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
    private $id;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="ep.celotnaVrednost", description="ep.d.celotnaVrednost")   
     * @var double
     */
    private $celotnaVrednost;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="ep.celotnaVrednostMat", description="ep.d.celotnaVrednostMat")   
     * @var double
     */
    private $celotnaVrednostMat;
    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="ep.celotnaVrednostGostovSZ", description="ep.d.celotnaVrednostGostovSZ")   
     * @var double
     */
    private $celotnaVrednostGostovSZ;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="ep.zaproseno", description="ep.zaproseno")   
     * @var double
     */
    private $zaproseno;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="ep.lastnaSredstva", description="ep.lastnaSredstva")   
     * @var double
     */
    private $lastnaSredstva;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2,options={"default":0})
     * @Max\I18n(label="ep.avtorskiHonorarji", description="ep.avtorskiHonorarji")   
     * @var double
     */
    private $avtorskiHonorarji;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="ep.tantieme", description="ep.tantieme")   
     * @var double
     */
    private $tantieme;

    /**
     * @ORM\OneToMany(targetEntity="ProgramDela\Entity\DrugiVir", mappedBy="enotaPrograma", orphanRemoval=true)
     * @var <drugiViri>
     */
    private $drugiViri;

    /**
     * @ORM\OneToMany(targetEntity="ProgramDela\Entity\ProdukcijaDelitev", mappedBy="enotaPrograma", orphanRemoval=true)
     * @var <Koprodukcije>
     */
    private $koprodukcije;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="ep.vlozekGostitelja", description="ep.d.vlozekGostitelja")   
     * @var double
     */
    private $vlozekGostitelja;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="ep.vlozekKoproducenta", description="ep.d.vlozekKoproducenta")   
     * @var double
     */
    private $vlozekKoproducenta;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="ep.drugiJavni", description="ep.drugiJavni")   
     * @var double
     */
    private $drugiJavni;

    /**
     * Št. zaposlenih čl. umetniškega ansambla, ki sodelujejo pri uprizoritvi:
     * 
     * obstaja naj možnost da se podatek prepišejo iz uprizoritve in njenih relacij $$ 
     * 
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="ep.stZaposlenih", description="Število zaposlenih, ki sodelujejo pri izvedbi projekta")
     * @Max\Ui(type="integer")
     * @var integer     
     */
    private $stZaposlenih;

    /**
     * Št. drugih zaposlenih, ki sodelujejo pri uprizoritvi (brez upravno-administrativnih delavcev):
     * 
     * obstaja naj možnost da se podatek prepišejo iz uprizoritve in njenih relacij
     * 
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="ep.stDrugih", description="ep.d.stDrugih")
     * @Max\Ui(type="integer")
     * @var integer     
     */
    private $stDrugih;

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
    private $stHonorarnih;

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
    private $stHonorarnihIgr;

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
    private $stHonorarnihIgrTujJZ;

    /**
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="ep.obiskDoma", description="ep.obiskDoma")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    private $obiskDoma;

    /**
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="ep.obiskGost", description="ep.obiskGost")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    private $obiskGost;

    /**
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="ep.obiskZamejo", description="ep.obiskZamejo")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    private $obiskZamejo;

    /**
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="ep.obiskInt", description="ep.obiskInt")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    private $obiskInt;

    /**
     * @ORM\Column(type="integer", nullable=false, options={"default":" 0"})
     * @Max\I18n(label="ep.ponoviDoma", description="ep.ponoviDoma")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    private $ponoviDoma;

    /**
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="ep.ponoviZamejo", description="ep.ponoviZamejo")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    private $ponoviZamejo;

    /**
     * število gostovanj po Sloveniji
     * 
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="ep.ponoviGost", description="ep.ponoviGost")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    private $ponoviGost;

    /**
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="ep.ponoviInt", description="ep.d.ponoviInt")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    private $ponoviInt;

    /**
     * @ORM\Column(type="text", nullable=false)
     * @Max\I18n(label="ep.utemeljitev", description="ep.utemeljitev")   
     * @var string     
     */
    private $utemeljitev;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Uprizoritev")
     * @Max\I18n(label="entiteta.uprizoritev", description="entiteta.uprizoritev")   
     * @Max\Ui(type="toone")
     * @var \Produkcija\Entity\Uprizoritev
     */
    private $uprizoritev;

    /**
     * Naziv dogodka za tiste programe, ki nimajo uprizoritve
     * Naziv festivala za festival,
     * Naziv sklopa za razno,
     * Naziv dogodka za izjemnidogodek.
     *
     * @ORM\Column(length=50, nullable=true)
     * @Max\I18n(label="entiteta.naziv", description="ep.d.naziv")
     * @var string
     */
    protected $naziv;

    /**
     * @ORM\ManyToOne(targetEntity="ProgramDela\Entity\TipProgramskeEnote", inversedBy="enotePrograma")
     * @Max\I18n(label="ep.tipProgramskeEnote", description="ep.tipProgramskeEnote")   
     * @Max\Ui(type="select")
     * @var \ProgramDela\Entity\TipProgramskeEnote
     */
    private $tipProgramskeEnote;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="entiteta.sort", description="ep.d.sort")
     * @Max\Ui(type="integer", icon="fa fa-sort")
     * @var integer
     */
    private $sort;

    public function __construct()
    {
        $this->drugiViri = new ArrayCollection();
        $this->koprodukcije = new ArrayCollection();
    }

    public function preracunaj($smer = false)
    {
    }

    
    public function validate($mode = 'update')
    {
        
    }

    public function getId()
    {
        return $this->id;
    }

    public function getCelotnaVrednost()
    {
        return $this->celotnaVrednost;
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

    public function getVlozekGostitelja()
    {
        return $this->vlozekGostitelja;
    }

    public function getVlozekKoproducenta()
    {
        return $this->vlozekKoproducenta;
    }

    public function getDrugiJavni()
    {
        return $this->drugiJavni;
    }

    public function getStZaposlenih()
    {
        return $this->stZaposlenih;
    }

    public function getStDrugih()
    {
        return $this->stDrugih;
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

    public function setVlozekGostitelja($vlozekGostitelja)
    {
        $this->vlozekGostitelja = $vlozekGostitelja;
        return $this;
    }

    public function setVlozekKoproducenta($vlozekKoproducenta)
    {
        $this->vlozekKoproducenta = $vlozekKoproducenta;
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

    public function setStDrugih($stDrugih)
    {
        $this->stDrugih = $stDrugih;
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

    public function getKoprodukcije()
    {
        return $this->koprodukcije;
    }

    public function setKoprodukcije($koprodukcije)
    {
        $this->koprodukcije = $koprodukcije;
        return $this;
    }
    public function getCelotnaVrednostMat()
    {
        return $this->celotnaVrednostMat;
    }

    public function getCelotnaVrednostGostovSZ()
    {
        return $this->celotnaVrednostGostovSZ;
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


}
