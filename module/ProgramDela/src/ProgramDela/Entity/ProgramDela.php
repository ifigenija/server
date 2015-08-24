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
    protected $id;

    /**
     * @ORM\Column(type="string", nullable=false)
     * @Max\I18n(label="programDela.sifra", description="programDela.d.sifra")
     * @Max\Ui(type="sifra",ident=true )
     * @var string     
     */
    protected $sifra;

    /**
     * @ORM\Column(type="string", nullable=false)
     * @Max\I18n(label="programDela.naziv", description="programDela.d.naziv")
     * @Max\Ui(type="naziv",ident=true )
     * @var string
     */
    protected $naziv;

    /**
     * @ORM\Column(type="date", nullable=false)
     * @Max\I18n(label="programDela.zacetek", description="programDela.d.zacetek")
     * @var string
     */
    protected $zacetek;

    /**
     * @ORM\Column(type="date", nullable=false)
     * @Max\I18n(label="programDela.konec", description="programDela.d.konec")
     * @var string
     */
    protected $konec;

    /**
     * polje se nastavi na true potem, ko se pošlje na MK, da se PD pomotoma   ne bi spreminjal
     * 
     * @ORM\Column(type="boolean", nullable=false)
     * @Max\I18n(label="programDela.zakljuceno", description="programDela.d.zakljuceno")
     * @Max\Ui(type="boolcheckbox")         //$$ verjetno mora biti na nek način hidden, ker ni v formi
     * @var boolean
     */
    protected $zakljuceno = false;

    /**
     * @ORM\Column(type="boolean", nullable=false)
     * @Max\I18n(label="programDela.potrjenProgram", description="programDela.d.potrjenProgram")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    protected $potrjenProgram;

    /**
     * @ORM\OneToMany(targetEntity="ProgramDela\Entity\ProgramPremiera", mappedBy="dokument")
     * @var <Premiere>
     */
    protected $premiere;

    /**
     * @ORM\OneToMany(targetEntity="ProgramDela\Entity\ProgramPonovitevPremiere", mappedBy="dokument")
     * @var <PonovitvePremiere>
     */
    protected $ponovitvePremiere;

    /**
     * @ORM\OneToMany(targetEntity="ProgramDela\Entity\ProgramPonovitevPrejsnjih", mappedBy="dokument")
     * @var <PonovitvePrejsnjih>
     */
    protected $ponovitvePrejsnjih;

    /**
     * @ORM\OneToMany(targetEntity="ProgramDela\Entity\ProgramIzjemni", mappedBy="dokument")
     * @var <Izjemni>
     */
    protected $izjemni;

    /**
     * @ORM\OneToMany(targetEntity="ProgramDela\Entity\ProgramFestival", mappedBy="programDela")
     * @var <ProgramiFestival>
     */
    protected $programiFestival;

    /**
     * @ORM\OneToMany(targetEntity="ProgramDela\Entity\ProgramGostujoca", mappedBy="dokument")
     * @var <Gostujoci>
     */
    protected $gostujoci;

    /**
     * @ORM\OneToMany(targetEntity="ProgramDela\Entity\ProgramGostovanje", mappedBy="dokument")
     * @var <Gostovanja>
     */
    protected $gostovanja;

    /**
     * @ORM\OneToMany(targetEntity="ProgramDela\Entity\ProgramRazno", mappedBy="dokument")
     * @var <ProgramiRazno>
     */
    protected $programiRazno;

    /**
     * @ORM\ManyToOne(targetEntity="Koledar\Entity\Sezona")
     * @ORM\JoinColumn(name="sezona_id", referencedColumnName="id")
     * @Max\I18n(label="programDela.sezona", description="programDela.d.sezona")
     * @Max\Ui(type="toone", required=true)
     * @var \Koledar\Entity\Sezona
     */
    protected $sezona;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stPremier", description="programDela.d.stPremier")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stPremier;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stInt", description="programDela.d.stInt")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stInt;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stFest", description="programDela.d.stFest")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stFest;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stRazno", description="programDela.d.stRazno")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stRazno;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stIzjem", description="programDela.d.stIzjem")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stIzjem;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stPonPrem", description="programDela.d.stPonPrem")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stPonPrem;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stPonPrej", description="programDela.d.stPonPrej")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stPonPrej;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stPonPrejVelikih", description="programDela.d.stPonPrejVelikih")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stPonPrejVelikih;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stPonPrejMalih", description="programDela.d.stPonPrejMalih")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stPonPrejMalih;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stPonPrejMalihKopr", description="programDela.d.stPonPrejMalihKopr")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stPonPrejMalihKopr;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stPonPrejSredKopr", description="programDela.d.stPonPrejSredKopr")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stPonPrejSredKopr;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stPonPrejVelikihKopr", description="programDela.d.stPonPrejVelikihKopr")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stPonPrejVelikihKopr;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stGostujo", description="programDela.d.stGostujo")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stGostujo;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.vrPS1", description="programDela.d.vrPS1")   
     * @var double
     */
    protected $vrPS1;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.vrPS1Do", description="programDela.d.vrPS1Do")   
     * @var double
     */
    protected $vrPS1Do;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.vrPS1Mat", description="programDela.d.vrPS1Mat")   
     * @var double
     */
    protected $vrPS1Mat;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.vrPS1GostovSZ", description="programDela.d.vrPS1GostovSZ")   
     * @var double
     */
    protected $vrPS1GostovSZ;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stIzvNekomerc", description="programDela.d.stIzvNekomerc")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stIzvNekomerc;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stIzvPrem", description="programDela.d.stIzvPrem")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stIzvPrem;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stIzvPonPrem", description="programDela.d.stIzvPonPrem")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stIzvPonPrem;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stIzvPonPremDoma", description="programDela.d.stIzvPonPremDoma")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stIzvPonPremDoma;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stIzvPonPremZamejo", description="programDela.d.stIzvPonPremZamejo")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stIzvPonPremZamejo;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stIzvPonPremGost", description="programDela.d.stIzvPonPremGost")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stIzvPonPremGost;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stIzvPonPremKopr", description="programDela.d.stIzvPonPremKopr")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stIzvPonPremKopr;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stIzvPonPremInt", description="programDela.d.stIzvPonPremInt")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stIzvPonPremInt;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stIzvPonPremKoprInt", description="programDela.d.stIzvPonPremKoprInt")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stIzvPonPremKoprInt;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stIzvPonPrej", description="programDela.d.stIzvPonPrej")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stIzvPonPrej;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stIzvPonPrejDoma", description="programDela.d.stIzvPonPrejDoma")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stIzvPonPrejDoma;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stIzvPonPrejZamejo", description="programDela.d.stIzvPonPrejZamejo")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stIzvPonPrejZamejo;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stIzvPonPrejGost", description="programDela.d.stIzvPonPrejGost")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stIzvPonPrejGost;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stIzvPonPrejKopr", description="programDela.d.stIzvPonPrejKopr")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stIzvPonPrejKopr;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stIzvPonPrejInt", description="programDela.d.stIzvPonPrejInt")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stIzvPonPrejInt;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stIzvPonPrejKoprInt", description="programDela.d.stIzvPonPrejKoprInt")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stIzvPonPrejKoprInt;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stIzvGostuj", description="programDela.d.stIzvGostuj")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stIzvGostuj;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stIzvOstalihNek", description="programDela.d.stIzvOstalihNek")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stIzvOstalihNek;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stIzvGostovanjSlo", description="programDela.d.stIzvGostovanjSlo")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stIzvGostovanjSlo;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stIzvGostovanjZam", description="programDela.d.stIzvGostovanjZam")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stIzvGostovanjZam;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stIzvGostovanjInt", description="programDela.d.stIzvGostovanjInt")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stIzvGostovanjInt;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stObiskNekom", description="programDela.d.stObiskNekom")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stObiskNekom;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stObiskNekomMat", description="programDela.d.stObiskNekomMat")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stObiskNekomMat;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stObiskNekomGostSlo", description="programDela.d.stObiskNekomGostSlo")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stObiskNekomGostSlo;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stObiskNekomGostZam", description="programDela.d.stObiskNekomGostZam")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stObiskNekomGostZam;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stObiskNekomGostInt", description="programDela.d.stObiskNekomGostInt")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stObiskNekomGostInt;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stObiskPrem", description="programDela.d.stObiskPrem")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stObiskPrem;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stObiskPonPrem", description="programDela.d.stObiskPonPrem")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stObiskPonPrem;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stObiskPonPremDoma", description="programDela.d.stObiskPonPremDoma")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stObiskPonPremDoma;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stObiskPonPremKopr", description="programDela.d.stObiskPonPremKopr")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stObiskPonPremKopr;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stObiskPonPremKoprInt", description="programDela.d.stObiskPonPremKoprInt")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stObiskPonPremKoprInt;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.avgObiskPrired", description="programDela.d.avgObiskPrired")   
     * @var double
     */
    protected $avgObiskPrired;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.avgZasedDvoran", description="programDela.d.avgZasedDvoran")   
     * @var double
     */
    protected $avgZasedDvoran;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.avgCenaVstopnice", description="programDela.d.avgCenaVstopnice")   
     * @var double
     */
    protected $avgCenaVstopnice;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stProdVstopnic", description="programDela.d.stProdVstopnic")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stProdVstopnic;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stKoprodukcij", description="programDela.d.stKoprodukcij")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stKoprodukcij;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stKoprodukcijInt", description="programDela.d.stKoprodukcijInt")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stKoprodukcijInt;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stKoprodukcijNVO", description="programDela.d.stKoprodukcijNVO")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stKoprodukcijNVO;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stZaposlenih", description="programDela.d.stZaposlenih")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stZaposlenih;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stZaposIgralcev", description="programDela.d.stZaposIgralcev")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stZaposIgralcev;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.avgStNastopovIgr", description="programDela.d.avgStNastopovIgr")   
     * @var double
     */
    protected $avgStNastopovIgr;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stHonorarnih", description="programDela.d.stHonorarnih")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stHonorarnih;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stHonorarnihIgr", description="programDela.d.stHonorarnihIgr")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stHonorarnihIgr;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stHonorarnihIgrTujJZ", description="programDela.d.stHonorarnihIgrTujJZ")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stHonorarnihIgrTujJZ;

    /**
     * 
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stHonorarnihIgrSamoz", description="programDela.d.stHonorarnihIgrSamoz")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stHonorarnihIgrSamoz;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaInt", description="programDela.d.sredstvaInt")   
     * @var double
     */
    protected $sredstvaInt;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaAvt", description="programDela.d.sredstvaAvt")   
     * @var double
     */
    protected $sredstvaAvt;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaZaprosenoPrem", description="programDela.d.sredstvaZaprosenoPrem")   
     * @var double
     */
    protected $sredstvaZaprosenoPrem;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaZaprosenoPonPrem", description="programDela.d.sredstvaZaprosenoPonPrem")   
     * @var double
     */
    protected $sredstvaZaprosenoPonPrem;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaZaprosenoPonPrej", description="programDela.d.sredstvaZaprosenoPonPrej")   
     * @var double
     */
    protected $sredstvaZaprosenoPonPrej;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaZaprosenoGostujo", description="programDela.d.sredstvaZaprosenoGostujo")   
     * @var double
     */
    protected $sredstvaZaprosenoGostujo;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaZaprosenoInt", description="programDela.d.sredstvaZaprosenoInt")   
     * @var double
     */
    protected $sredstvaZaprosenoInt;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaZaprosenoFest", description="programDela.d.sredstvaZaprosenoFest")   
     * @var double
     */
    protected $sredstvaZaprosenoFest;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaZaprosenoRazno", description="programDela.d.sredstvaZaprosenoRazno")   
     * @var double
     */
    protected $sredstvaZaprosenoRazno;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaZaprosenoIzjem", description="programDela.d.sredstvaZaprosenoIzjem")   
     * @var double
     */
    protected $sredstvaZaprosenoIzjem;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaDrugiJavniPrem", description="programDela.d.sredstvaDrugiJavniPrem")   
     * @var double
     */
    protected $sredstvaDrugiJavniPrem;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaDrugiJavniPonPrem", description="programDela.d.sredstvaDrugiJavniPonPrem")   
     * @var double
     */
    protected $sredstvaDrugiJavniPonPrem;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaDrugiJavniPonPrej", description="programDela.d.sredstvaDrugiJavniPonPrej")   
     * @var double
     */
    protected $sredstvaDrugiJavniPonPrej;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaDrugiJavniGostujo", description="programDela.d.sredstvaDrugiJavniGostujo")   
     * @var double
     */
    protected $sredstvaDrugiJavniGostujo;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaDrugiJavniInt", description="programDela.d.sredstvaDrugiJavniInt")   
     * @var double
     */
    protected $sredstvaDrugiJavniInt;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaDrugiJavniFest", description="programDela.d.sredstvaDrugiJavniFest")   
     * @var double
     */
    protected $sredstvaDrugiJavniFest;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaDrugiJavniRazno", description="programDela.d.sredstvaDrugiJavniRazno")   
     * @var double
     */
    protected $sredstvaDrugiJavniRazno;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaDrugiJavniIzjem", description="programDela.d.sredstvaDrugiJavniIzjem")   
     * @var double
     */
    protected $sredstvaDrugiJavniIzjem;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaDrugiViriPrem", description="programDela.d.sredstvaDrugiViriPrem")   
     * @var double
     */
    protected $sredstvaDrugiViriPrem;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaDrugiViriPonPrem", description="programDela.d.sredstvaDrugiViriPonPrem")   
     * @var double
     */
    protected $sredstvaDrugiViriPonPrem;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaDrugiViriPonPrej", description="programDela.d.sredstvaDrugiViriPonPrej")   
     * @var double
     */
    protected $sredstvaDrugiViriPonPrej;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaDrugiViriGostujo", description="programDela.d.sredstvaDrugiViriGostujo")   
     * @var double
     */
    protected $sredstvaDrugiViriGostujo;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaDrugiViriInt", description="programDela.d.sredstvaDrugiViriInt")   
     * @var double
     */
    protected $sredstvaDrugiViriInt;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaDrugiViriFest", description="programDela.d.sredstvaDrugiViriFest")   
     * @var double
     */
    protected $sredstvaDrugiViriFest;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaDrugiViriRazno", description="programDela.d.sredstvaDrugiViriRazno")   
     * @var double
     */
    protected $sredstvaDrugiViriRazno;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaDrugiViriIzjem", description="programDela.d.sredstvaDrugiViriIzjem")   
     * @var double
     */
    protected $sredstvaDrugiViriIzjem;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaAvtSamoz", description="programDela.d.sredstvaAvtSamoz")   
     * @var double
     */
    protected $sredstvaAvtSamoz;

    /**
     * 
     * 
     * @param enotaPrograma $object
     */
    protected function sestejDrugeVire($object)
    {
        $znesekVseh = 0;  //init
        foreach ($object->getDrugiViri() as $numobjDV => $objDV) {
            $znesekVseh+=$objDV->getZnesek();
            if ($objDV->getMednarodni()) {
                $this->sredstvaInt +=$objDV->getZnesek();
            }
        }
        return $znesekVseh;
    }

    /**
     * 
     * 
     * @param enotaPrograma $object
     */
    protected function prerStKopr($object)
    {
        $kopr    = $koprInt = $koprNvo = false;   //init
        foreach ($object->getKoprodukcije() as $numobjPD => $objPD) {
            if (!$objPD->getMaticniKop() && ($objPD->getDelez() > 0)) {
                $kopr = true;
                if ($popa = $objPD->getKoproducent()->getPopa()) {
                    if ($popa->getDrzava()->getSifra() !== 'SI') { //$$ SI - Slovenija; če uporaba programa izven Slovenije, potrebno prilogoditi (verjetno s pomočjo opcij)  
                        $koprInt = true;
                    }
                    if ($popa->getNvo()) {
                        $koprNvo = true;
                    }
                };
            }
        }
        // v $kopr*  je true, če je ustrezen tip koprodukcije
        if ($kopr) {
            $this->stKoprodukcij +=1;
        };
        if ($koprInt) {
            $this->stKoprodukcijInt +=1;
        }
        if ($koprNvo) {
            $this->stKoprodukcijNVO +=1;
        }
    }

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

    /**
     * preračun kazalnikov
     * 
     * @param type $smer
     */
    public function preracunaj($smer = false)
    {
        /**
         * init
         */
        $this->stPonPrejMalih            = 0;
        $this->stPonPrejMalihKopr        = 0;
        $this->stPonPrejSredKopr         = 0;
        $this->stPonPrejVelikihKopr      = 0;
        $this->vrPS1                     = 0;
        $this->vrPS1Do                   = 0;
        $this->vrPS1Mat                  = 0;
        $this->vrPS1GostovSZ             = 0;
        $this->stIzvNekomerc             = 0;
        $this->stIzvPrem                 = 0;
        $this->stIzvPonPrem              = 0;
        $this->stIzvPonPremDoma          = 0;
        $this->stIzvPonPremZamejo        = 0;
        $this->stIzvPonPremGost          = 0;
        $this->stIzvPonPremKopr          = 0;
        $this->stIzvPonPremInt           = 0;
        $this->stIzvPonPremKoprInt       = 0;
        $this->stIzvPonPrej              = 0;
        $this->stIzvPonPrejDoma          = 0;
        $this->stIzvPonPrejZamejo        = 0;
        $this->stIzvPonPrejGost          = 0;
        $this->stIzvPonPrejKopr          = 0;
        $this->stIzvPonPrejInt           = 0;
        $this->stIzvPonPrejKoprInt       = 0;
        $this->stIzvGostuj               = 0;
        $this->stIzvOstalihNek           = 0;
        $this->stIzvGostovanjSlo         = 0;
        $this->stIzvGostovanjZam         = 0;
        $this->stIzvGostovanjInt         = 0;
        $this->stObiskNekom              = 0;
        $this->stObiskNekomMat           = 0;
        $this->stObiskNekomGostSlo       = 0;
        $this->stObiskNekomGostZam       = 0;
        $this->stObiskNekomGostInt       = 0;
        $this->stObiskPrem               = 0;
        $this->stObiskPonPrem            = 0;
        $this->stObiskPonPremDoma        = 0;
        $this->stObiskPonPremKopr        = 0;
        $this->stObiskPonPremKoprInt     = 0;
        $this->stHonorarnih              = 0;
        $this->stHonorarnihIgr           = 0;
        $this->stHonorarnihIgrTujJZ      = 0;
        $this->stHonorarnihIgrSamoz      = 0;
        $this->sredstvaAvt               = 0;
        $this->sredstvaAvtSamoz          = 0;
        $this->sredstvaInt               = 0;
        $this->stKoprodukcij             = 0;
        $this->stKoprodukcijInt          = 0;
        $this->stKoprodukcijNVO          = 0;
        $this->stPonPrejVelikih          = 0;
        $this->sredstvaZaprosenoPrem     = 0;
        $this->sredstvaZaprosenoPonPrem  = 0;
        $this->sredstvaZaprosenoPonPrej  = 0;
        $this->sredstvaZaprosenoGostujo  = 0;
        $this->sredstvaZaprosenoInt      = 0;
        $this->sredstvaZaprosenoFest     = 0;
        $this->sredstvaZaprosenoRazno    = 0;
        $this->sredstvaZaprosenoIzjem    = 0;
        $this->sredstvaDrugiJavniPrem    = 0;
        $this->sredstvaDrugiJavniPonPrem = 0;
        $this->sredstvaDrugiJavniPonPrej = 0;
        $this->sredstvaDrugiJavniGostujo = 0;
        $this->sredstvaDrugiJavniInt     = 0;
        $this->sredstvaDrugiJavniFest    = 0;
        $this->sredstvaDrugiJavniRazno   = 0;
        $this->sredstvaDrugiJavniIzjem   = 0;
        $this->sredstvaDrugiViriPrem     = 0;
        $this->sredstvaDrugiViriPonPrem  = 0;
        $this->sredstvaDrugiViriPonPrej  = 0;
        $this->sredstvaDrugiViriGostujo  = 0;
        $this->sredstvaDrugiViriInt      = 0;
        $this->sredstvaDrugiViriFest     = 0;
        $this->sredstvaDrugiViriRazno    = 0;
        $this->sredstvaDrugiViriIzjem    = 0;


        $this->stPremier = $this->getPremiere()->count();
        $this->stPonPrem = $this->getPonovitvePremiere()->count();
        $this->stPonPrej = $this->getPonovitvePrejsnjih()->count();
        $this->stGostujo = $this->getGostujoci()->count();
        $this->stInt     = $this->getGostovanja()->count();
        $this->stFest    = $this->getProgramiFestival()->count();
        $this->stRazno   = $this->getProgramiRazno()->count();
        $this->stIzjem   = $this->getIzjemni()->count();

        /**
         * premiere
         */
        foreach ($this->getPremiere() as $numObject => $object) {
            if ($smer == \Max\Consts::DOWN) {
                $object->preracunaj(\Max\Consts::DOWN);
            }
            $this->vrPS1 += $object->getCelotnaVrednost();        //$$ tu še preveriti ali celotna vrednost ali le delež matičnega koproducenta
            $this->vrPS1Do += $object->getCelotnaVrednost();        //$$ tu še preveriti ali celotna vrednost ali le delež matičnega koproducenta
            $this->stIzvNekomerc+=$object->getPonoviDoma();
            $this->stIzvPrem+=$object->getPonoviDoma();
            $this->stObiskNekom +=$object->getObiskDoma();
            $this->stObiskNekomMat +=$object->getObiskDoma();
            $this->stObiskPrem +=$object->getObiskDoma();

            $this->stHonorarnih +=$object->getStHonorarnih();
            $this->stHonorarnihIgr +=$object->getStHonorarnihIgr();
            $this->stHonorarnihIgrTujJZ +=$object->getStHonorarnihIgrTujJZ();
            $this->stHonorarnihIgrSamoz +=$object->getStHonorarnihIgrSamoz();
            $this->sredstvaZaprosenoPrem+=$object->getZaproseno();
            $this->sredstvaDrugiJavniPrem+=$object->getDrugiJavni();
            $this->sredstvaDrugiViriPrem+=$this->sestejDrugeVire($object);
            $this->sredstvaAvt+=$object->getAvtorskiHonorarji();
            $this->sredstvaAvtSamoz+=$object->getAvtorskiHonorarjiSamoz();
            $this->prerStKopr($object);
        }

        /**
         * ponovitve premier
         */
        foreach ($this->getPonovitvePremiere() as $numObject => $object) {
            if ($smer == \Max\Consts::DOWN) {
                $object->preracunaj(\Max\Consts::DOWN);
            }
            $this->vrPS1 += $object->getCelotnaVrednost();        //$$ tu še preveriti ali celotna vrednost ali le delež matičnega koproducenta
            $this->vrPS1Mat+= $object->getCelotnaVrednostMat();
            $this->vrPS1GostovSZ+= $object->getCelotnaVrednostGostovSZ();
            $this->stIzvNekomerc+=$object->getPonoviDoma() + $object->getPonoviZamejo() + $object->getPonoviGost();      //$$ ali prištevvamo tudi mednarodne?
            $this->stIzvPonPrem+=$object->getPonoviDoma() + $object->getPonoviZamejo() + $object->getPonoviGost();      //$$ ali prištevvamo tudi mednarodne?
            $this->stIzvPonPremDoma+=$object->getPonoviDoma();
            $this->stIzvPonPremZamejo+=$object->getPonoviZamejo();
            $this->stIzvPonPremGost+=$object->getPonoviGost();
            $this->stIzvPonPremKopr = $object->getPonoviKopr();
            $this->stIzvGostovanjSlo +=$object->getPonoviGost();
            $this->stIzvGostovanjZam +=$object->getPonoviZamejo();
            $this->stObiskNekom +=$object->getObiskDoma() + $object->getObiskGost() + $object->getObiskZamejo();
            $this->stObiskNekomMat +=$object->getObiskDoma();
            $this->stObiskNekomGostSlo +=$object->getObiskGost();
            $this->stObiskNekomGostZam +=$object->getObiskZamejo();
            $this->stObiskPonPrem +=$object->getObiskDoma() + $object->getObiskGost() + $object->getObiskZamejo();
            $this->stObiskPonPremDoma +=$object->getObiskDoma();
            $this->stObiskPonPremKopr +=$object->getObiskKopr();

            $this->sredstvaAvt+=$object->getAvtorskiHonorarji();
            $this->sredstvaAvtSamoz+=$object->getAvtorskiHonorarjiSamoz();
            $this->sredstvaZaprosenoPonPrem+=$object->getZaproseno();
            $this->sredstvaDrugiJavniPonPrem+=$object->getDrugiJavni();
            $this->sredstvaDrugiViriPonPrem+=$this->sestejDrugeVire($object);
            $this->prerStKopr($object);
        }


        /**
         * ponovitve prejšnjih sezon
         */
        foreach ($this->getPonovitvePrejsnjih() as $numObject => $object) {
            if ($smer == \Max\Consts::DOWN) {
                $object->preracunaj(\Max\Consts::DOWN);
            }
            $this->vrPS1 += $object->getCelotnaVrednost();        //$$ tu še preveriti ali celotna vrednost ali le delež matičnega koproducenta
            $this->vrPS1Mat+= $object->getCelotnaVrednostMat();
            $this->vrPS1GostovSZ+= $object->getCelotnaVrednostGostovSZ();
            $this->stIzvNekomerc+=$object->getPonoviDoma() + $object->getPonoviZamejo() + $object->getPonoviGost();      //$$ ali prištevvamo tudi mednarodne?
            $this->stIzvPonPrej+=$object->getPonoviDoma() + $object->getPonoviZamejo() + $object->getPonoviGost();      //$$ ali prištevvamo tudi mednarodne?
            $this->stIzvPonPrejDoma+=$object->getPonoviDoma();
            $this->stIzvPonPrejZamejo+=$object->getPonoviZamejo();
            $this->stIzvPonPrejGost+=$object->getPonoviGost();
            $this->stIzvPonPrejKopr = $object->getPonoviKopr();
            $this->stIzvGostovanjSlo +=$object->getPonoviGost();
            $this->stIzvGostovanjZam +=$object->getPonoviZamejo();
            $this->stObiskNekom +=$object->getObiskDoma() + $object->getObiskGost() + $object->getObiskZamejo();
            $this->stObiskNekomMat +=$object->getObiskDoma();
            $this->stObiskNekomGostSlo +=$object->getObiskGost();
            $this->stObiskNekomGostZam +=$object->getObiskZamejo();
            $this->stHonorarnih +=$object->getStHonorarnih();
            $this->stHonorarnihIgr +=$object->getStHonorarnihIgr();
            $this->stHonorarnihIgrTujJZ +=$object->getStHonorarnihIgrTujJZ();
            $this->stHonorarnihIgrSamoz +=$object->getStHonorarnihIgrSamoz();
            $this->sredstvaAvt+=$object->getAvtorskiHonorarji();
            $this->sredstvaAvtSamoz+=$object->getAvtorskiHonorarjiSamoz();

            switch ($object->getTipProgramskeEnote()->getSifra()) {
                case "01":
                    $this->stPonPrejVelikih+=1;         // Velike predstave
                    break;
                case "02":
                    $this->stPonPrejMalih +=1;
                    break;
                case "03":
                    $this->stPonPrejMalihKopr +=1;
                    break;
                case "04":
                    $this->stPonPrejSredKopr +=1;
                    break;
                case "05":
                    $this->stPonPrejVelikihKopr +=1;
                    break;
                default:
                    $this->expect(FALSE, "Ponovitev prejšnjih ima napačen tip programske enote:" . $object->getTipProgramskeEnote()->getSifra(), 1000490);
            }
            $this->sredstvaZaprosenoPonPrej+=$object->getZaproseno();
            $this->sredstvaDrugiJavniPonPrej+=$object->getDrugiJavni();
            $this->sredstvaDrugiViriPonPrej+=$this->sestejDrugeVire($object);
            $this->prerStKopr($object);
        }

        /**
         * gostujoče predstave
         */
        foreach ($this->getGostujoci() as $numObject => $object) {
            if ($smer == \Max\Consts::DOWN) {
                $object->preracunaj(\Max\Consts::DOWN);
            }
            $this->stIzvNekomerc+=$object->getPonoviDoma();
            $this->stIzvGostuj+=$object->getPonoviDoma();
            $this->stObiskNekom +=$object->getObiskDoma();
            $this->stObiskNekomMat +=$object->getObiskDoma();
            $this->sredstvaZaprosenoGostujo+=$object->getZaproseno();
            $this->sredstvaDrugiJavniGostujo+=$object->getDrugiJavni();
            $this->sredstvaDrugiViriGostujo+=$this->sestejDrugeVire($object);
            $this->prerStKopr($object);
        }

        /**
         * mednarodna gostovanja
         */
        foreach ($this->getGostovanja() as $numObject => $object) {
            if ($smer == \Max\Consts::DOWN) {
                $object->preracunaj(\Max\Consts::DOWN);
            }
            $this->stIzvNekomerc+=$object->getPonoviInt();
            $this->stIzvGostovanjInt += $object->getPonoviInt();
            $this->stObiskNekom +=$object->getObiskInt();
            $this->stObiskNekomGostInt +=$object->getObiskInt();
            $this->sredstvaAvt+=$object->getAvtorskiHonorarji();
            $this->sredstvaAvtSamoz+=$object->getAvtorskiHonorarjiSamoz();

            // $$ glede na to, ali je mednarodno gostovanje za premiero, ki bo letos, ali iz prejšnjih sezon
            $idUpr          = $object->getUprizoritev();
            $obstajaPonPrem = false;  //init
            if (!empty($idUpr)) {
                $obstajaPonPrem = $this->getPonovitvePremiere()
                        ->exists(function($key, $ponovitvePrem) use(&$idUpr) {
                    return ($ponovitvePrem->getUprizoritev() == $idUpr); //vrne true, če obstaja ponovitev premiere z isto uprizoritvijo
                });
            }
            if ($obstajaPonPrem) {
                $this->stIzvPonPrem+=$object->getPonoviInt();
                $this->stIzvPonPremInt+=$object->getPonoviInt();
                $this->stIzvPonPremKoprInt+=$object->getPonoviKoprInt();
                $this->stObiskPonPremKoprInt+=$object->getObiskKoprInt();
            } else {
                // če ni uprizoritev iz ponovitve (letošnje) premiere je najverjetneje  iz ponovitve premiere prejšnjih sezon
                $this->stIzvPonPrej+=$object->getPonoviInt();
                $this->stIzvPonPrejInt+=$object->getPonoviInt();
                $this->stIzvPonPrejKoprInt+=$object->getPonoviKoprInt();
            }
            $this->sredstvaZaprosenoInt+=$object->getZaproseno();
            $this->sredstvaDrugiJavniInt+=$object->getDrugiJavni();
            $this->sredstvaDrugiViriInt+=$this->sestejDrugeVire($object);
            $this->prerStKopr($object);
        }

        /**
         * festivali
         */
        foreach ($this->getProgramiFestival() as $numObject => $object) {
            if ($smer == \Max\Consts::DOWN) {
                $object->preracunaj(\Max\Consts::DOWN);
            }
            $this->stIzvNekomerc+=1;      // 1 festival ena prireditev
            $this->stIzvOstalihNek+=1;      // 1 festival ena prireditev
            $this->stObiskNekom +=$object->getObiskDoma();
            $this->stObiskNekomMat +=$object->getObiskDoma();
            $this->stHonorarnih +=$object->getStHonorarnih();
            $this->sredstvaZaprosenoFest+=$object->getZaproseno();
            $this->sredstvaDrugiJavniFest+=$object->getDrugiJavni();
            $this->sredstvaDrugiViriFest+=$this->sestejDrugeVire($object);
            $this->prerStKopr($object);
        }

        /**
         * razno
         */
        foreach ($this->getProgramiRazno() as $numObject => $object) {
            if ($smer == \Max\Consts::DOWN) {
                $object->preracunaj(\Max\Consts::DOWN);
            }
            $this->stIzvNekomerc+=$object->getStPE();     //$$ prištevamo število programskih enot
            $this->stIzvOstalihNek+=$object->getStPE();     //$$ prištevamo število programskih enot
            $this->stObiskNekom +=$object->getObiskDoma();
            $this->stObiskNekomMat +=$object->getObiskDoma();
            $this->stHonorarnih +=$object->getStHonorarnih();
            $this->sredstvaZaprosenoRazno+=$object->getZaproseno();
            $this->sredstvaDrugiJavniRazno+=$object->getDrugiJavni();
            $this->sredstvaDrugiViriRazno+=$this->sestejDrugeVire($object);
            $this->prerStKopr($object);
        }

        /**
         * izjemni dogodki
         */
        foreach ($this->getIzjemni() as $numObject => $object) {
            if ($smer == \Max\Consts::DOWN) {
                $object->preracunaj(\Max\Consts::DOWN);
            }
            $this->stIzvNekomerc+=$object->getPonoviDoma() + $object->getPonoviZamejo() + $object->getPonoviGost() + $object->getPonoviInt();
            $this->stIzvOstalihNek+=$object->getPonoviDoma() + $object->getPonoviZamejo() + $object->getPonoviGost() + $object->getPonoviInt();
            $this->stObiskNekom +=$object->getObiskDoma() + $object->getObiskGost() + $object->getObiskZamejo() + $object->getObiskInt();
            $this->stObiskNekomMat +=$object->getObiskDoma();
            $this->stObiskNekomGostSlo +=$object->getObiskGost();
            $this->stObiskNekomGostZam +=$object->getObiskZamejo();
            $this->sredstvaAvt+=$object->getAvtorskiHonorarji();
            $this->sredstvaAvtSamoz+=$object->getAvtorskiHonorarjiSamoz();
            $this->sredstvaZaprosenoIzjem+=$object->getZaproseno();
            $this->sredstvaDrugiJavniIzjem+=$object->getDrugiJavni();
            $this->sredstvaDrugiViriIzjem+=$this->sestejDrugeVire($object);
            $this->prerStKopr($object);
        }

        if ($this->stIzvNekomerc > 0) {
            $this->avgObiskPrired = \Max\Functions::numberRound($this->stObiskNekom / $this->stIzvNekomerc);
        } else {
            $this->avgObiskPrired = 0;
        }
    }

    public function validate($mode = 'update')
    {
        $this->expect($this->zacetek <= $this->konec, "Datum konca mora biti za datumom začetka", 1000500);

        $this->validateIntGE0($this->stFest, "Št. festivalov", 1000710);
        $this->validateIntGE0($this->stGostujo, "Št. gostujočih", 1000711);
        $this->validateIntGE0($this->stHonorarnih, "Št. honorarnih", 1000712);
        $this->validateIntGE0($this->stHonorarnihIgr, "Št. honorarnih igralcev", 1000713);
        $this->validateIntGE0($this->stHonorarnihIgrSamoz, "Št. honorarnih igralcev samozaposenih", 1000714);
        $this->validateIntGE0($this->stHonorarnihIgrTujJZ, "Št. honorarnig igralcev tuj JZ", 1000715);
        $this->validateIntGE0($this->stInt, "Št. dogodkov mednarodnih gostovanj", 1000716);
        $this->validateIntGE0($this->stIzjem, "Št. izjemnih dogodkov", 1000717);
        $this->validateIntGE0($this->stIzvGostovanjInt, "Št. izvedb mednaronih gostovanj", 1000718);
        $this->validateIntGE0($this->stIzvGostovanjSlo, "Št. izvedb gostovanj v Sloveniji", 1000719);
        $this->validateIntGE0($this->stIzvGostovanjZam, "Št. izvedb gostovanj v zamejstvu", 1000720);
        $this->validateIntGE0($this->stIzvGostuj, "Št izvedb gostujočih", 1000721);
        $this->validateIntGE0($this->stIzvNekomerc, "Št. izvedb nekomercialnih", 1000722);
        $this->validateIntGE0($this->stIzvOstalihNek, "Št. izvedb ostalih nekomercialnih", 1000723);
        $this->validateIntGE0($this->stIzvPonPrej, "Št. izvedb ponov. prejšnjih", 1000724);
        $this->validateIntGE0($this->stIzvPonPrem, "Št. izvedb ponov. premiernih upr.", 1000725);
        $this->validateIntGE0($this->stIzvPrem, "Št. izvedb premiere", 1000726);
        $this->validateIntGE0($this->stKoprodukcij, "Št. koprodukcij", 1000727);
        $this->validateIntGE0($this->stKoprodukcijInt, "Št. medn. koprodukcij", 1000728);
        $this->validateIntGE0($this->stKoprodukcijNVO, "Št. koprodukcij z NVO", 1000729);
        $this->validateIntGE0($this->stObiskNekom, "Št. obiskovalcev v nekom.", 1000730);
        $this->validateIntGE0($this->stObiskNekomGostInt, "Št. obiskovalcev v nekom. -mednarodna gostovanja", 1000731);
        $this->validateIntGE0($this->stObiskNekomGostSlo, "Št. obiskovalcev v nekom.- gostovanja v Slo", 1000732);
        $this->validateIntGE0($this->stObiskNekomGostZam, "Št. obiskovalcev v nekom. - gostovanja v zamejstvu", 1000733);
        $this->validateIntGE0($this->stObiskNekomMat, "Št. obiskovalcev nekom na matičnem odru", 1000734);
        $this->validateIntGE0($this->stPonPrej, "Št. ponovitev prejšnjih", 1000735);
        $this->validateIntGE0($this->stPonPrejMalih, "Št. ponovitev prejšnjih - malih", 1000736);
        $this->validateIntGE0($this->stPonPrejMalihKopr, "Št. ponovitev prejšnjih - malih koprodukcij", 1000737);
        $this->validateIntGE0($this->stPonPrejSredKopr, "Št. ponovitev prejšnjih - srednje kopr.", 1000738);
        $this->validateIntGE0($this->stPonPrejVelikih, "Št. ponovitev prejšnjih - velike", 1000739);
        $this->validateIntGE0($this->stPonPrejVelikihKopr, "Št. ponovitev prejšnjih - velike kopr.", 1000740);
        $this->validateIntGE0($this->stPonPrem, "Št. ponovitev premiere", 1000741);
        $this->validateIntGE0($this->stPremier, "Št. premier", 1000742);
        $this->validateIntGE0($this->stProdVstopnic, "Št. prodanih vstopnic", 1000743);
        $this->validateIntGE0($this->stRazno, "Št. razno", 1000744);
        $this->validateIntGE0($this->stZaposIgralcev, "Št. zaposlenih igralcev", 1000745);
        $this->validateIntGE0($this->stZaposlenih, "Št. zaposlenih", 1000746);

        $this->validateEuroGE0($this->avgCenaVstopnice, "avgCenaVstopnice", 1000750);
        $this->validateEuroGE0($this->avgObiskPrired, "avgObiskPrired", 1000751);
        $this->validateEuroGE0($this->avgStNastopovIgr, "avgStNastopovIgr", 1000752);
        $this->validateEuroGE0($this->avgZasedDvoran, "avgZasedDvoran", 1000753);
        $this->validateEuroGE0($this->sredstvaAvt, "sredstvaAvt", 1000754);
        $this->validateEuroGE0($this->sredstvaAvtSamoz, "sredstvaAvtSamoz", 1000755);
        $this->validateEuroGE0($this->sredstvaDrugiJavniFest, "sredstvaDrugiJavniFest", 1000756);
        $this->validateEuroGE0($this->sredstvaDrugiJavniGostujo, "sredstvaDrugiJavniGostujo", 1000757);
        $this->validateEuroGE0($this->sredstvaDrugiJavniInt, "sredstvaDrugiJavniInt", 1000758);
        $this->validateEuroGE0($this->sredstvaDrugiJavniIzjem, "sredstvaDrugiJavniIzjem", 1000759);
        $this->validateEuroGE0($this->sredstvaDrugiJavniPonPrej, "sredstvaDrugiJavniPonPrej", 1000760);
        $this->validateEuroGE0($this->sredstvaDrugiJavniPonPrem, "sredstvaDrugiJavniPonPrem", 1000761);
        $this->validateEuroGE0($this->sredstvaDrugiJavniPrem, "sredstvaDrugiJavniPrem", 1000762);
        $this->validateEuroGE0($this->sredstvaDrugiJavniRazno, "sredstvaDrugiJavniRazno", 1000763);
        $this->validateEuroGE0($this->sredstvaDrugiViriFest, "sredstvaDrugiViriFest", 1000764);
        $this->validateEuroGE0($this->sredstvaDrugiViriGostujo, "sredstvaDrugiViriGostujo", 1000765);
        $this->validateEuroGE0($this->sredstvaDrugiViriInt, "sredstvaDrugiViriInt", 1000766);
        $this->validateEuroGE0($this->sredstvaDrugiViriIzjem, "sredstvaDrugiViriIzjem", 1000767);
        $this->validateEuroGE0($this->sredstvaDrugiViriPonPrej, "sredstvaDrugiViriPonPrej", 1000768);
        $this->validateEuroGE0($this->sredstvaDrugiViriPonPrem, "sredstvaDrugiViriPonPrem", 1000769);
        $this->validateEuroGE0($this->sredstvaDrugiViriPrem, "sredstvaDrugiViriPrem", 1000770);
        $this->validateEuroGE0($this->sredstvaDrugiViriRazno, "sredstvaDrugiViriRazno", 1000771);
        $this->validateEuroGE0($this->sredstvaInt, "sredstvaInt", 1000772);
        $this->validateEuroGE0($this->sredstvaZaprosenoFest, "sredstvaZaprosenoFest", 1000773);
        $this->validateEuroGE0($this->sredstvaZaprosenoGostujo, "sredstvaZaprosenoGostujo", 1000774);
        $this->validateEuroGE0($this->sredstvaZaprosenoInt, "sredstvaZaprosenoInt", 1000775);
        $this->validateEuroGE0($this->sredstvaZaprosenoIzjem, "sredstvaZaprosenoIzjem", 1000776);
        $this->validateEuroGE0($this->sredstvaZaprosenoPonPrej, "sredstvaZaprosenoPonPrej", 1000777);
        $this->validateEuroGE0($this->sredstvaZaprosenoPonPrem, "sredstvaZaprosenoPonPrem", 1000778);
        $this->validateEuroGE0($this->sredstvaZaprosenoPrem, "sredstvaZaprosenoPrem", 1000779);
        $this->validateEuroGE0($this->sredstvaZaprosenoRazno, "sredstvaZaprosenoRazno", 1000780);
        $this->validateEuroGE0($this->vrPS1, "vrPS1", 1000781);
        $this->validateEuroGE0($this->vrPS1Do, "vrPS1Do", 1000782);
        $this->validateEuroGE0($this->vrPS1GostovSZ, "vrPS1GostovSZ", 1000783);
        $this->validateEuroGE0($this->vrPS1Mat, "vrPS1Mat", 1000784);
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

    public function getZakljuceno()
    {
        return $this->zakljuceno;
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

    public function getStPremier()
    {
        return $this->stPremier;
    }

    public function getStInt()
    {
        return $this->stInt;
    }

    public function getStFest()
    {
        return $this->stFest;
    }

    public function getStRazno()
    {
        return $this->stRazno;
    }

    public function getStIzjem()
    {
        return $this->stIzjem;
    }

    public function getStPonPrem()
    {
        return $this->stPonPrem;
    }

    public function getStPonPrej()
    {
        return $this->stPonPrej;
    }

    public function getStPonPrejVelikih()
    {
        return $this->stPonPrejVelikih;
    }

    public function getStPonPrejMalih()
    {
        return $this->stPonPrejMalih;
    }

    public function getStPonPrejMalihKopr()
    {
        return $this->stPonPrejMalihKopr;
    }

    public function getStPonPrejSredKopr()
    {
        return $this->stPonPrejSredKopr;
    }

    public function getStPonPrejVelikihKopr()
    {
        return $this->stPonPrejVelikihKopr;
    }

    public function getStGostujo()
    {
        return $this->stGostujo;
    }

    public function getVrPS1()
    {
        return $this->vrPS1;
    }

    public function getVrPS1Do()
    {
        return $this->vrPS1Do;
    }

    public function getVrPS1Mat()
    {
        return $this->vrPS1Mat;
    }

    public function getVrPS1GostovSZ()
    {
        return $this->vrPS1GostovSZ;
    }

    public function getStIzvNekomerc()
    {
        return $this->stIzvNekomerc;
    }

    public function getStIzvPrem()
    {
        return $this->stIzvPrem;
    }

    public function getStIzvPonPrem()
    {
        return $this->stIzvPonPrem;
    }

    public function getStIzvPonPremDoma()
    {
        return $this->stIzvPonPremDoma;
    }

    public function getStIzvPonPremZamejo()
    {
        return $this->stIzvPonPremZamejo;
    }

    public function getStIzvPonPremGost()
    {
        return $this->stIzvPonPremGost;
    }

    public function getStIzvPonPremKopr()
    {
        return $this->stIzvPonPremKopr;
    }

    public function getStIzvPonPremInt()
    {
        return $this->stIzvPonPremInt;
    }

    public function getStIzvPonPremKoprInt()
    {
        return $this->stIzvPonPremKoprInt;
    }

    public function getStIzvPonPrej()
    {
        return $this->stIzvPonPrej;
    }

    public function getStIzvPonPrejDoma()
    {
        return $this->stIzvPonPrejDoma;
    }

    public function getStIzvPonPrejZamejo()
    {
        return $this->stIzvPonPrejZamejo;
    }

    public function getStIzvPonPrejGost()
    {
        return $this->stIzvPonPrejGost;
    }

    public function getStIzvPonPrejKopr()
    {
        return $this->stIzvPonPrejKopr;
    }

    public function getStIzvPonPrejInt()
    {
        return $this->stIzvPonPrejInt;
    }

    public function getStIzvPonPrejKoprInt()
    {
        return $this->stIzvPonPrejKoprInt;
    }

    public function getStIzvGostuj()
    {
        return $this->stIzvGostuj;
    }

    public function getStIzvOstalihNek()
    {
        return $this->stIzvOstalihNek;
    }

    public function getStIzvGostovanjSlo()
    {
        return $this->stIzvGostovanjSlo;
    }

    public function getStIzvGostovanjZam()
    {
        return $this->stIzvGostovanjZam;
    }

    public function getStIzvGostovanjInt()
    {
        return $this->stIzvGostovanjInt;
    }

    public function getStObiskNekom()
    {
        return $this->stObiskNekom;
    }

    public function getStObiskNekomMat()
    {
        return $this->stObiskNekomMat;
    }

    public function getStObiskNekomGostSlo()
    {
        return $this->stObiskNekomGostSlo;
    }

    public function getStObiskNekomGostZam()
    {
        return $this->stObiskNekomGostZam;
    }

    public function getStObiskNekomGostInt()
    {
        return $this->stObiskNekomGostInt;
    }

    public function getStObiskPrem()
    {
        return $this->stObiskPrem;
    }

    public function getStObiskPonPremDoma()
    {
        return $this->stObiskPonPremDoma;
    }

    public function getStObiskPonPremKopr()
    {
        return $this->stObiskPonPremKopr;
    }

    public function getStObiskPonPremKoprInt()
    {
        return $this->stObiskPonPremKoprInt;
    }

    public function getAvgObiskPrired()
    {
        return $this->avgObiskPrired;
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

    public function getStKoprodukcij()
    {
        return $this->stKoprodukcij;
    }

    public function getStKoprodukcijInt()
    {
        return $this->stKoprodukcijInt;
    }

    public function getStKoprodukcijNVO()
    {
        return $this->stKoprodukcijNVO;
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

    public function getStHonorarnihIgrSamoz()
    {
        return $this->stHonorarnihIgrSamoz;
    }

    public function getSredstvaInt()
    {
        return $this->sredstvaInt;
    }

    public function getSredstvaAvt()
    {
        return $this->sredstvaAvt;
    }

    public function getSredstvaZaprosenoPrem()
    {
        return $this->sredstvaZaprosenoPrem;
    }

    public function getSredstvaZaprosenoPonPrem()
    {
        return $this->sredstvaZaprosenoPonPrem;
    }

    public function getSredstvaZaprosenoPonPrej()
    {
        return $this->sredstvaZaprosenoPonPrej;
    }

    public function getSredstvaZaprosenoGostujo()
    {
        return $this->sredstvaZaprosenoGostujo;
    }

    public function getSredstvaZaprosenoInt()
    {
        return $this->sredstvaZaprosenoInt;
    }

    public function getSredstvaZaprosenoFest()
    {
        return $this->sredstvaZaprosenoFest;
    }

    public function getSredstvaZaprosenoRazno()
    {
        return $this->sredstvaZaprosenoRazno;
    }

    public function getSredstvaZaprosenoIzjem()
    {
        return $this->sredstvaZaprosenoIzjem;
    }

    public function getSredstvaDrugiJavniPrem()
    {
        return $this->sredstvaDrugiJavniPrem;
    }

    public function getSredstvaDrugiJavniPonPrem()
    {
        return $this->sredstvaDrugiJavniPonPrem;
    }

    public function getSredstvaDrugiJavniPonPrej()
    {
        return $this->sredstvaDrugiJavniPonPrej;
    }

    public function getSredstvaDrugiJavniGostujo()
    {
        return $this->sredstvaDrugiJavniGostujo;
    }

    public function getSredstvaDrugiJavniInt()
    {
        return $this->sredstvaDrugiJavniInt;
    }

    public function getSredstvaDrugiJavniFest()
    {
        return $this->sredstvaDrugiJavniFest;
    }

    public function getSredstvaDrugiJavniRazno()
    {
        return $this->sredstvaDrugiJavniRazno;
    }

    public function getSredstvaDrugiJavniIzjem()
    {
        return $this->sredstvaDrugiJavniIzjem;
    }

    public function getSredstvaDrugiViriPrem()
    {
        return $this->sredstvaDrugiViriPrem;
    }

    public function getSredstvaDrugiViriPonPrem()
    {
        return $this->sredstvaDrugiViriPonPrem;
    }

    public function getSredstvaDrugiViriPonPrej()
    {
        return $this->sredstvaDrugiViriPonPrej;
    }

    public function getSredstvaDrugiViriGostujo()
    {
        return $this->sredstvaDrugiViriGostujo;
    }

    public function getSredstvaDrugiViriInt()
    {
        return $this->sredstvaDrugiViriInt;
    }

    public function getSredstvaDrugiViriFest()
    {
        return $this->sredstvaDrugiViriFest;
    }

    public function getSredstvaDrugiViriRazno()
    {
        return $this->sredstvaDrugiViriRazno;
    }

    public function getSredstvaDrugiViriIzjem()
    {
        return $this->sredstvaDrugiViriIzjem;
    }

    public function getSredstvaAvtSamoz()
    {
        return $this->sredstvaAvtSamoz;
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

    public function setZakljuceno($zakljuceno)
    {
        $this->zakljuceno = $zakljuceno;
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

    public function setStPremier($stPremier)
    {
        $this->stPremier = $stPremier;
        return $this;
    }

    public function setStInt($stInt)
    {
        $this->stInt = $stInt;
        return $this;
    }

    public function setStFest($stFest)
    {
        $this->stFest = $stFest;
        return $this;
    }

    public function setStRazno($stRazno)
    {
        $this->stRazno = $stRazno;
        return $this;
    }

    public function setStIzjem($stIzjem)
    {
        $this->stIzjem = $stIzjem;
        return $this;
    }

    public function setStPonPrem($stPonPrem)
    {
        $this->stPonPrem = $stPonPrem;
        return $this;
    }

    public function setStPonPrej($stPonPrej)
    {
        $this->stPonPrej = $stPonPrej;
        return $this;
    }

    public function setStPonPrejVelikih($stPonPrejVelikih)
    {
        $this->stPonPrejVelikih = $stPonPrejVelikih;
        return $this;
    }

    public function setStPonPrejMalih($stPonPrejMalih)
    {
        $this->stPonPrejMalih = $stPonPrejMalih;
        return $this;
    }

    public function setStPonPrejMalihKopr($stPonPrejMalihKopr)
    {
        $this->stPonPrejMalihKopr = $stPonPrejMalihKopr;
        return $this;
    }

    public function setStPonPrejSredKopr($stPonPrejSredKopr)
    {
        $this->stPonPrejSredKopr = $stPonPrejSredKopr;
        return $this;
    }

    public function setStPonPrejVelikihKopr($stPonPrejVelikihKopr)
    {
        $this->stPonPrejVelikihKopr = $stPonPrejVelikihKopr;
        return $this;
    }

    public function setStGostujo($stGostujo)
    {
        $this->stGostujo = $stGostujo;
        return $this;
    }

    public function setVrPS1($vrPS1)
    {
        $this->vrPS1 = $vrPS1;
        return $this;
    }

    public function setVrPS1Do($vrPS1Do)
    {
        $this->vrPS1Do = $vrPS1Do;
        return $this;
    }

    public function setVrPS1Mat($vrPS1Mat)
    {
        $this->vrPS1Mat = $vrPS1Mat;
        return $this;
    }

    public function setVrPS1GostovSZ($vrPS1GostovSZ)
    {
        $this->vrPS1GostovSZ = $vrPS1GostovSZ;
        return $this;
    }

    public function setStIzvNekomerc($stIzvNekomerc)
    {
        $this->stIzvNekomerc = $stIzvNekomerc;
        return $this;
    }

    public function setStIzvPrem($stIzvPrem)
    {
        $this->stIzvPrem = $stIzvPrem;
        return $this;
    }

    public function setStIzvPonPrem($stIzvPonPrem)
    {
        $this->stIzvPonPrem = $stIzvPonPrem;
        return $this;
    }

    public function setStIzvPonPremDoma($stIzvPonPremDoma)
    {
        $this->stIzvPonPremDoma = $stIzvPonPremDoma;
        return $this;
    }

    public function setStIzvPonPremZamejo($stIzvPonPremZamejo)
    {
        $this->stIzvPonPremZamejo = $stIzvPonPremZamejo;
        return $this;
    }

    public function setStIzvPonPremGost($stIzvPonPremGost)
    {
        $this->stIzvPonPremGost = $stIzvPonPremGost;
        return $this;
    }

    public function setStIzvPonPremKopr($stIzvPonPremKopr)
    {
        $this->stIzvPonPremKopr = $stIzvPonPremKopr;
        return $this;
    }

    public function setStIzvPonPremInt($stIzvPonPremInt)
    {
        $this->stIzvPonPremInt = $stIzvPonPremInt;
        return $this;
    }

    public function setStIzvPonPremKoprInt($stIzvPonPremKoprInt)
    {
        $this->stIzvPonPremKoprInt = $stIzvPonPremKoprInt;
        return $this;
    }

    public function setStIzvPonPrej($stIzvPonPrej)
    {
        $this->stIzvPonPrej = $stIzvPonPrej;
        return $this;
    }

    public function setStIzvPonPrejDoma($stIzvPonPrejDoma)
    {
        $this->stIzvPonPrejDoma = $stIzvPonPrejDoma;
        return $this;
    }

    public function setStIzvPonPrejZamejo($stIzvPonPrejZamejo)
    {
        $this->stIzvPonPrejZamejo = $stIzvPonPrejZamejo;
        return $this;
    }

    public function setStIzvPonPrejGost($stIzvPonPrejGost)
    {
        $this->stIzvPonPrejGost = $stIzvPonPrejGost;
        return $this;
    }

    public function setStIzvPonPrejKopr($stIzvPonPrejKopr)
    {
        $this->stIzvPonPrejKopr = $stIzvPonPrejKopr;
        return $this;
    }

    public function setStIzvPonPrejInt($stIzvPonPrejInt)
    {
        $this->stIzvPonPrejInt = $stIzvPonPrejInt;
        return $this;
    }

    public function setStIzvPonPrejKoprInt($stIzvPonPrejKoprInt)
    {
        $this->stIzvPonPrejKoprInt = $stIzvPonPrejKoprInt;
        return $this;
    }

    public function setStIzvGostuj($stIzvGostuj)
    {
        $this->stIzvGostuj = $stIzvGostuj;
        return $this;
    }

    public function setStIzvOstalihNek($stIzvOstalihNek)
    {
        $this->stIzvOstalihNek = $stIzvOstalihNek;
        return $this;
    }

    public function setStIzvGostovanjSlo($stIzvGostovanjSlo)
    {
        $this->stIzvGostovanjSlo = $stIzvGostovanjSlo;
        return $this;
    }

    public function setStIzvGostovanjZam($stIzvGostovanjZam)
    {
        $this->stIzvGostovanjZam = $stIzvGostovanjZam;
        return $this;
    }

    public function setStIzvGostovanjInt($stIzvGostovanjInt)
    {
        $this->stIzvGostovanjInt = $stIzvGostovanjInt;
        return $this;
    }

    public function setStObiskNekom($stObiskNekom)
    {
        $this->stObiskNekom = $stObiskNekom;
        return $this;
    }

    public function setStObiskNekomMat($stObiskNekomMat)
    {
        $this->stObiskNekomMat = $stObiskNekomMat;
        return $this;
    }

    public function setStObiskNekomGostSlo($stObiskNekomGostSlo)
    {
        $this->stObiskNekomGostSlo = $stObiskNekomGostSlo;
        return $this;
    }

    public function setStObiskNekomGostZam($stObiskNekomGostZam)
    {
        $this->stObiskNekomGostZam = $stObiskNekomGostZam;
        return $this;
    }

    public function setStObiskNekomGostInt($stObiskNekomGostInt)
    {
        $this->stObiskNekomGostInt = $stObiskNekomGostInt;
        return $this;
    }

    public function setStObiskPrem($stObiskPrem)
    {
        $this->stObiskPrem = $stObiskPrem;
        return $this;
    }

    public function setStObiskPonPremDoma($stObiskPonPremDoma)
    {
        $this->stObiskPonPremDoma = $stObiskPonPremDoma;
        return $this;
    }

    public function setStObiskPonPremKopr($stObiskPonPremKopr)
    {
        $this->stObiskPonPremKopr = $stObiskPonPremKopr;
        return $this;
    }

    public function setStObiskPonPremKoprInt($stObiskPonPremKoprInt)
    {
        $this->stObiskPonPremKoprInt = $stObiskPonPremKoprInt;
        return $this;
    }

    public function setAvgObiskPrired($avgObiskPrired)
    {
        $this->avgObiskPrired = $avgObiskPrired;
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

    public function setStKoprodukcij($stKoprodukcij)
    {
        $this->stKoprodukcij = $stKoprodukcij;
        return $this;
    }

    public function setStKoprodukcijInt($stKoprodukcijInt)
    {
        $this->stKoprodukcijInt = $stKoprodukcijInt;
        return $this;
    }

    public function setStKoprodukcijNVO($stKoprodukcijNVO)
    {
        $this->stKoprodukcijNVO = $stKoprodukcijNVO;
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

    public function setStHonorarnihIgrSamoz($stHonorarnihIgrSamoz)
    {
        $this->stHonorarnihIgrSamoz = $stHonorarnihIgrSamoz;
        return $this;
    }

    public function setSredstvaInt($sredstvaInt)
    {
        $this->sredstvaInt = $sredstvaInt;
        return $this;
    }

    public function setSredstvaAvt($sredstvaAvt)
    {
        $this->sredstvaAvt = $sredstvaAvt;
        return $this;
    }

    public function setSredstvaZaprosenoPrem($sredstvaZaprosenoPrem)
    {
        $this->sredstvaZaprosenoPrem = $sredstvaZaprosenoPrem;
        return $this;
    }

    public function setSredstvaZaprosenoPonPrem($sredstvaZaprosenoPonPrem)
    {
        $this->sredstvaZaprosenoPonPrem = $sredstvaZaprosenoPonPrem;
        return $this;
    }

    public function setSredstvaZaprosenoPonPrej($sredstvaZaprosenoPonPrej)
    {
        $this->sredstvaZaprosenoPonPrej = $sredstvaZaprosenoPonPrej;
        return $this;
    }

    public function setSredstvaZaprosenoGostujo($sredstvaZaprosenoGostujo)
    {
        $this->sredstvaZaprosenoGostujo = $sredstvaZaprosenoGostujo;
        return $this;
    }

    public function setSredstvaZaprosenoInt($sredstvaZaprosenoInt)
    {
        $this->sredstvaZaprosenoInt = $sredstvaZaprosenoInt;
        return $this;
    }

    public function setSredstvaZaprosenoFest($sredstvaZaprosenoFest)
    {
        $this->sredstvaZaprosenoFest = $sredstvaZaprosenoFest;
        return $this;
    }

    public function setSredstvaZaprosenoRazno($sredstvaZaprosenoRazno)
    {
        $this->sredstvaZaprosenoRazno = $sredstvaZaprosenoRazno;
        return $this;
    }

    public function setSredstvaZaprosenoIzjem($sredstvaZaprosenoIzjem)
    {
        $this->sredstvaZaprosenoIzjem = $sredstvaZaprosenoIzjem;
        return $this;
    }

    public function setSredstvaDrugiJavniPrem($sredstvaDrugiJavniPrem)
    {
        $this->sredstvaDrugiJavniPrem = $sredstvaDrugiJavniPrem;
        return $this;
    }

    public function setSredstvaDrugiJavniPonPrem($sredstvaDrugiJavniPonPrem)
    {
        $this->sredstvaDrugiJavniPonPrem = $sredstvaDrugiJavniPonPrem;
        return $this;
    }

    public function setSredstvaDrugiJavniPonPrej($sredstvaDrugiJavniPonPrej)
    {
        $this->sredstvaDrugiJavniPonPrej = $sredstvaDrugiJavniPonPrej;
        return $this;
    }

    public function setSredstvaDrugiJavniGostujo($sredstvaDrugiJavniGostujo)
    {
        $this->sredstvaDrugiJavniGostujo = $sredstvaDrugiJavniGostujo;
        return $this;
    }

    public function setSredstvaDrugiJavniInt($sredstvaDrugiJavniInt)
    {
        $this->sredstvaDrugiJavniInt = $sredstvaDrugiJavniInt;
        return $this;
    }

    public function setSredstvaDrugiJavniFest($sredstvaDrugiJavniFest)
    {
        $this->sredstvaDrugiJavniFest = $sredstvaDrugiJavniFest;
        return $this;
    }

    public function setSredstvaDrugiJavniRazno($sredstvaDrugiJavniRazno)
    {
        $this->sredstvaDrugiJavniRazno = $sredstvaDrugiJavniRazno;
        return $this;
    }

    public function setSredstvaDrugiJavniIzjem($sredstvaDrugiJavniIzjem)
    {
        $this->sredstvaDrugiJavniIzjem = $sredstvaDrugiJavniIzjem;
        return $this;
    }

    public function setSredstvaDrugiViriPrem($sredstvaDrugiViriPrem)
    {
        $this->sredstvaDrugiViriPrem = $sredstvaDrugiViriPrem;
        return $this;
    }

    public function setSredstvaDrugiViriPonPrem($sredstvaDrugiViriPonPrem)
    {
        $this->sredstvaDrugiViriPonPrem = $sredstvaDrugiViriPonPrem;
        return $this;
    }

    public function setSredstvaDrugiViriPonPrej($sredstvaDrugiViriPonPrej)
    {
        $this->sredstvaDrugiViriPonPrej = $sredstvaDrugiViriPonPrej;
        return $this;
    }

    public function setSredstvaDrugiViriGostujo($sredstvaDrugiViriGostujo)
    {
        $this->sredstvaDrugiViriGostujo = $sredstvaDrugiViriGostujo;
        return $this;
    }

    public function setSredstvaDrugiViriInt($sredstvaDrugiViriInt)
    {
        $this->sredstvaDrugiViriInt = $sredstvaDrugiViriInt;
        return $this;
    }

    public function setSredstvaDrugiViriFest($sredstvaDrugiViriFest)
    {
        $this->sredstvaDrugiViriFest = $sredstvaDrugiViriFest;
        return $this;
    }

    public function setSredstvaDrugiViriRazno($sredstvaDrugiViriRazno)
    {
        $this->sredstvaDrugiViriRazno = $sredstvaDrugiViriRazno;
        return $this;
    }

    public function setSredstvaDrugiViriIzjem($sredstvaDrugiViriIzjem)
    {
        $this->sredstvaDrugiViriIzjem = $sredstvaDrugiViriIzjem;
        return $this;
    }

    public function setSredstvaAvtSamoz($sredstvaAvtSamoz)
    {
        $this->sredstvaAvtSamoz = $sredstvaAvtSamoz;
        return $this;
    }

    public function getStObiskPonPrem()
    {
        return $this->stObiskPonPrem;
    }

    public function setStObiskPonPrem($stObiskPonPrem)
    {
        $this->stObiskPonPrem = $stObiskPonPrem;
        return $this;
    }

}
