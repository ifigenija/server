<?php

namespace ProgramDela\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * @ORM\Entity(repositoryClass="ProgramDela\Repository\ProgramiDela")
 * @Max\I18n(label="Program dela",plural="Programi dela")
 * @Max\Id(prefix="0041")
 */
class ProgramDela
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID programa dela")
     * @Max\Ui(type="id")
     * @var string   
     */
    private $id;

    /**
     * @ORM\Column(type="string", nullable=false)
     * @Max\I18n(label="entiteta.sifra", description="entiteta.sifra")
     * @Max\Ui(type="sifra",ident=true )
     * @var string     
     */
    private $sifra;

    /**
     * @ORM\Column(type="string", nullable=false)
     * @Max\I18n(label="entiteta.naziv", description="entiteta.naziv")
     * @Max\Ui(type="naziv",ident=true )
     * @var string
     */
    private $naziv;

    /**
     * @ORM\Column(type="date", nullable=false)
     * @Max\I18n(label="entiteta.zacetek", description="entiteta.zacetek")
     * @var string
     */
    private $zacetek;

    /**
     * @ORM\Column(type="date", nullable=false)
     * @Max\I18n(label="entiteta.konec", description="entiteta.konec")
     * @var string
     */
    private $konec;

    /**
     * @ORM\Column(type="boolean", nullable=false)
     * @Max\I18n(label="programDela.potrjenProgram", description="programDela.potrjenProgram")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    private $potrjenProgram;

    /**
     * @ORM\OneToMany(targetEntity="ProgramDela\Entity\ProgramPremiera", mappedBy="dokument")
     * @var <Premiere>
     */
    private $premiere;

    /**
     * @ORM\OneToMany(targetEntity="ProgramDela\Entity\ProgramPonovitevPremiere", mappedBy="dokument")
     * @var <PonovitvePremiere>
     */
    private $ponovitvePremiere;

    /**
     * @ORM\OneToMany(targetEntity="ProgramDela\Entity\ProgramPonovitevPrejsnjih", mappedBy="dokument")
     * @var <PonovitvePrejsnjih>
     */
    private $ponovitvePrejsnjih;

    /**
     * @ORM\OneToMany(targetEntity="ProgramDela\Entity\ProgramIzjemni", mappedBy="dokument")
     * @var <Izjemni>
     */
    private $izjemni;

    /**
     * @ORM\OneToMany(targetEntity="ProgramDela\Entity\ProgramFestival", mappedBy="programDela")
     * @var <ProgramiFestival>
     */
    private $programiFestival;

    /**
     * @ORM\OneToMany(targetEntity="ProgramDela\Entity\ProgramGostujoca", mappedBy="dokument")
     * @var <Gostujoci>
     */
    private $gostujoci;

    /**
     * @ORM\OneToMany(targetEntity="ProgramDela\Entity\ProgramGostovanje", mappedBy="dokument")
     * @var <Gostovanja>
     */
    private $gostovanja;

    /**
     * @ORM\OneToMany(targetEntity="ProgramDela\Entity\ProgramRazno", mappedBy="dokument")
     * @var <ProgramiRazno>
     */
    private $programiRazno;

    /**
     * @ORM\ManyToOne(targetEntity="Koledar\Entity\Sezona")
     * @ORM\JoinColumn(name="sezona_id", referencedColumnName="id")
     * @Max\I18n(label="programDela.sezona", description="programDela.sezona")
     * @Max\Ui(type="toone")
     * @var \Koledar\Entity\Sezona
     */
    private $sezona;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stPremier", description="programDela.d.stPremier")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stPremier;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stPonPrej", description="programDela.d.stPonPrej")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stPonPrej;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stPonPrejVelikih", description="programDela.d.stPonPrejVelikih")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stPonPrejVelikih;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stPonPrejMalih", description="programDela.d.stPonPrejMalih")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stPonPrejMalih;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stPonPrejMalihKopr", description="programDela.d.stPonPrejMalihKopr")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stPonPrejMalihKopr;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stPonPrejSredKopr", description="programDela.d.stPonPrejSredKopr")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stPonPrejSredKopr;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stPonPrejVelikihKopr", description="programDela.d.stPonPrejVelikihKopr")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stPonPrejVelikihKopr;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.vrPS1", description="programDela.vrPS1")   
     * @var double
     */
    private $vrPS1;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.vrPS1Do", description="programDela.vrPS1Do")   
     * @var double
     */
    private $vrPS1Do;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.vrPS1Mat", description="programDela.vrPS1Mat")   
     * @var double
     */
    private $vrPS1Mat;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.vrPS1GostovSZ", description="programDela.vrPS1GostovSZ")   
     * @var double
     */
    private $vrPS1GostovSZ;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stNekomerc", description="programDela.d.stNekomerc")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stNekomerc;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stPonPrem", description="programDela.d.stPonPrem")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stPonPrem;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stPrej", description="programDela.d.stPrej")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stPrej;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stGostuj", description="programDela.d.stGostuj")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stGostuj;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stOstalihNek", description="programDela.d.stOstalihNek")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stOstalihNek;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stGostovanjSlo", description="programDela.d.stGostovanjSlo")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stGostovanjSlo;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stGostovanjZam", description="programDela.d.stGostovanjZam")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stGostovanjZam;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stGostovanjInt", description="programDela.d.stGostovanjInt")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stGostovanjInt;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stObiskNekom", description="programDela.d.stObiskNekom")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stObiskNekom;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stObiskNekomMat", description="programDela.d.stObiskNekomMat")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stObiskNekomMat;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stObiskNekomGostSlo", description="programDela.d.stObiskNekomGostSlo")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stObiskNekomGostSlo;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stObiskNekomGostZam", description="programDela.d.stObiskNekomGostZam")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stObiskNekomGostZam;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stObiskNekomGostInt", description="programDela.d.stObiskNekomGostInt")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stObiskNekomGostInt;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.avgObiskPrired", description="programDela.avgObiskPrired")   
     * @var double
     */
    private $avgObiskPrired;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.avgZasedDvoran", description="programDela.avgZasedDvoran")   
     * @var double
     */
    private $avgZasedDvoran;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.avgCenaVstopnice", description="programDela.avgCenaVstopnice")   
     * @var double
     */
    private $avgCenaVstopnice;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stProdVstopnic", description="programDela.stProdVstopnic")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stProdVstopnic;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stKoprodukcij", description="programDela.stKoprodukcij")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stKoprodukcij;
    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stKoprodukcijInt", description="programDela.stKoprodukcijInt")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stKoprodukcijInt;
    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stKoprodukcijNVO", description="programDela.stKoprodukcijNVO")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stKoprodukcijNVO;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stZaposlenih", description="programDela.stZaposlenih")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stZaposlenih;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stZaposIgralcev", description="programDela.stZaposIgralcev")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stZaposIgralcev;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.avgStNastopovIgr", description="programDela.d.avgStNastopovIgr")   
     * @var double
     */
    private $avgStNastopovIgr;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stHonorarnih", description="programDela.d.stHonorarnih")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stHonorarnih;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stHonorarnihIgr", description="programDela.d.stHonorarnihIgr")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stHonorarnihIgr;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stHonorarnihIgrTujJZ", description="programDela.d.stHonorarnihIgrTujJZ")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stHonorarnihIgrTujJZ;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaInt", description="programDela.sredstvaInt")   
     * @var double
     */
    private $sredstvaInt;
    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaAvt", description="programDela.sredstvaAvt")   
     * @var double
     */
    private $sredstvaAvt;

    //$$ rb morda še bodo kakšna polja za dodati oz. odvzeti - odvisno glede na to, ali jih lahko pridobimo iz drugih entitet ali ne
    public function __construct()
    {
        $this->premiere           = new ArrayCollection();
        $this->ponovitvePremiere  = new ArrayCollection();
        $this->ponovitvePrejsnjih = new ArrayCollection();
        $this->izjemni            = new ArrayCollection();
        $this->programiFestival   = new ArrayCollection();
        $this->gostujoci          = new ArrayCollection();
        $this->gostovanja         = new ArrayCollection();
        $this->programiRazno      = new ArrayCollection();
    }

    public function validate($mode = 'update')
    {
        
    }

    public function getId()
    {
        return $this->id;
    }

    public function getSifra()
    {
        return $this->sifra;
    }

    public function getNaziv()
    {
        return $this->naziv;
    }

    public function getZacetek()
    {
        return $this->zacetek;
    }

    public function getKonec()
    {
        return $this->konec;
    }

    public function getPotrjenProgram()
    {
        return $this->potrjenProgram;
    }

    public function getPremiere()
    {
        return $this->premiere;
    }

    public function getPonovitvePremiere()
    {
        return $this->ponovitvePremiere;
    }

    public function getPonovitvePrejsnjih()
    {
        return $this->ponovitvePrejsnjih;
    }

    public function getIzjemni()
    {
        return $this->izjemni;
    }

    public function getProgramiFestival()
    {
        return $this->programiFestival;
    }

    public function getGostujoci()
    {
        return $this->gostujoci;
    }

    public function getGostovanja()
    {
        return $this->gostovanja;
    }

    public function getProgramiRazno()
    {
        return $this->programiRazno;
    }

    public function getSezona()
    {
        return $this->sezona;
    }

    public function getAvgZasedDvoran()
    {
        return $this->avgZasedDvoran;
    }

    public function getAvgCenaVstopnice()
    {
        return $this->avgCenaVstopnice;
    }

    public function getStProdVstopnic()
    {
        return $this->stProdVstopnic;
    }

    public function getStZaposlenih()
    {
        return $this->stZaposlenih;
    }

    public function getStZaposIgralcev()
    {
        return $this->stZaposIgralcev;
    }

    public function getAvgStNastopovIgr()
    {
        return $this->avgStNastopovIgr;
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

    public function getSredstvaInt()
    {
        return $this->sredstvaInt;
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

    public function setNaziv($naziv)
    {
        $this->naziv = $naziv;
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

    public function setPotrjenProgram($potrjenProgram)
    {
        $this->potrjenProgram = $potrjenProgram;
        return $this;
    }

    public function setPremiere($premiere)
    {
        $this->premiere = $premiere;
        return $this;
    }

    public function setPonovitvePremiere($ponovitvePremiere)
    {
        $this->ponovitvePremiere = $ponovitvePremiere;
        return $this;
    }

    public function setPonovitvePrejsnjih($ponovitvePrejsnjih)
    {
        $this->ponovitvePrejsnjih = $ponovitvePrejsnjih;
        return $this;
    }

    public function setIzjemni($izjemni)
    {
        $this->izjemni = $izjemni;
        return $this;
    }

    public function setProgramiFestival($programiFestival)
    {
        $this->programiFestival = $programiFestival;
        return $this;
    }

    public function setGostujoci($gostujoci)
    {
        $this->gostujoci = $gostujoci;
        return $this;
    }

    public function setGostovanja($gostovanja)
    {
        $this->gostovanja = $gostovanja;
        return $this;
    }

    public function setProgramiRazno($programiRazno)
    {
        $this->programiRazno = $programiRazno;
        return $this;
    }

    public function setSezona(\Koledar\Entity\Sezona $sezona)
    {
        $this->sezona = $sezona;
        return $this;
    }

    public function setAvgZasedDvoran($avgZasedDvoran)
    {
        $this->avgZasedDvoran = $avgZasedDvoran;
        return $this;
    }

    public function setAvgCenaVstopnice($avgCenaVstopnice)
    {
        $this->avgCenaVstopnice = $avgCenaVstopnice;
        return $this;
    }

    public function setStProdVstopnic($stProdVstopnic)
    {
        $this->stProdVstopnic = $stProdVstopnic;
        return $this;
    }

    public function setStZaposlenih($stZaposlenih)
    {
        $this->stZaposlenih = $stZaposlenih;
        return $this;
    }

    public function setStZaposIgralcev($stZaposIgralcev)
    {
        $this->stZaposIgralcev = $stZaposIgralcev;
        return $this;
    }

    public function setAvgStNastopovIgr($avgStNastopovIgr)
    {
        $this->avgStNastopovIgr = $avgStNastopovIgr;
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

    public function setSredstvaInt($sredstvaInt)
    {
        $this->sredstvaInt = $sredstvaInt;
        return $this;
    }

}
