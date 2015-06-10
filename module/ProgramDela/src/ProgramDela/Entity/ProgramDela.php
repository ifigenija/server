<?php

namespace ProgramDela\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;

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
     * @Max\I18n(label="programDela.sifra", description="Šifra programa dela")
     * @Max\Ui(type="sifra",ident=true )
     * @var string     
     */
    private $sifra;

    /**
     * @ORM\Column(type="string", nullable=false)
     * @Max\I18n(label="programDela.naziv", description="Naziv programa dela")
     * @Max\Ui(type="naziv",ident=true )
     * @var string
     */
    private $naziv;

    /**
     * @ORM\Column(type="date", nullable=false)
     * @Max\I18n(label="programDela.zacetek", description="Začetek")
     * @var string
     */
    private $zacetek;

    /**
     * @ORM\Column(type="date", nullable=false)
     * @Max\I18n(label="programDela.konec", description="Konec")
     * @var string
     */
    private $konec;

    /**
     * @ORM\Column(type="boolean", nullable=false)
     * @Max\I18n(label="programDela.potrjenProgram", description="Potrjen program")
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
     * @Max\I18n(label="programDela.sezona", description="Sezona")
     * @Max\Ui(type="toone")
     * @var \Koledar\Entity\Sezona
     */
    private $sezona;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.avgZasedDvoran", description="Povprečna zasedenost lastnih dvoran")   
     * @var double
     */
    private $avgZasedDvoran;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.avgCenaVstopnice", description="Povprečna cena vstopnice")   
     * @var double
     */
    private $avgCenaVstopnice;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stProdVstopnic", description="Število prodanih vstopnic")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stProdVstopnic;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stZaposlenih", description="Število vseh zaposlenih v javnem zavodu")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stZaposlenih;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stZaposIgralcev", description="Število zaposlenih igralcev")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stZaposIgralcev;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.avgStNastopovIgr", description="Povprečna zasedenost zaposlenih igralcev (popvprečno št. nastopov v letu)")   
     * @var double
     */
    private $avgStNastopovIgr;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stHonorarnih", description="Načrtovano število honorarnih zunanjih sodelavcev")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stHonorarnih;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stHonorarnihIgr", description="Načrtovano število honorarnih zunanjih sodelavcev - od tega igralcev")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stHonorarnihIgr;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stHonorarnihIgrTujJZ", description="Načrtovano število honorarnih zunanjih sodelavcev - od tega igralcev - od tega igralcev, zaposlenih v drugih JZ")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stHonorarnihIgrTujJZ;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaInt", description="Višina sredstev iz mednarodnih virov")   
     * @var double
     */
    private $sredstvaInt;

    //$$ rb morda še bodo kakšna polja za dodati oz. odvzeti - odvisno glede na to, ali jih lahko pridobimo iz drugih entitet ali ne

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
