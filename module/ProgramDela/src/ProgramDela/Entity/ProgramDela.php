<?php

namespace ProgramDela\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use Max\Ann\Entity as Max;
use Max\Consts;
use Max\Entity\Base;
use Max\Functions;

/**
 * @ORM\Entity(repositoryClass="ProgramDela\Repository\ProgramiDela")
 * @Max\I18n(label="Program dela",plural="Programi dela")
 * @Max\Id(prefix="0041")
 */
class ProgramDela
        extends Base
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
     * @ORM\OneToMany(targetEntity="ProgramDela\Entity\PostavkaCDve", mappedBy="programDela")
     * @ORM\OrderBy({"skupina" = "ASC", "podskupina" = "ASC"})
     * @var <PostavkeC2>
     */
    protected $postavkeC2;

    /**
     * 
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stPremier", description="programDela.d.stPremier")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stPremier;

    /**
     * 
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stPremierVelikih", description="programDela.d.stPremierVelikih")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stPremierVelikih;

    /**
     * 
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stPremierMalih", description="programDela.d.stPremierMalih")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stPremierMalih;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stPremierMalihKopr", description="programDela.d.stPremierMalihKopr")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stPremierMalihKopr;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stPremierVelikihKopr", description="programDela.d.stPremierVelikihKopr")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stPremierVelikihKopr;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stPremier", description="programDela.d.stPremier")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stPremierSredKopr;

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
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $vrPS1;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.vrPS1Do", description="programDela.d.vrPS1Do")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $vrPS1Do;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.vrPS1Mat", description="programDela.d.vrPS1Mat")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $vrPS1Mat;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.vrPS1GostovSZ", description="programDela.d.vrPS1GostovSZ")   
     * @Max\Ui(icon="fa fa-euro")
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
     * @Max\I18n(label="programDela.stIzvPremDoma", description="programDela.d.stIzvPremDoma")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stIzvPremDoma;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stIzvPremKopr", description="programDela.d.stIzvPremKopr")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stIzvPremKopr;

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
     * @Max\I18n(label="programDela.stObiskPremDoma", description="programDela.d.stObiskPremDoma")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stObiskPremDoma;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stObiskPremKopr", description="programDela.d.stObiskPremKopr")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stObiskPremKopr;

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
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stObiskPonPremGost", description="programDela.d.stObiskPonPremGost")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stObiskPonPremGost;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stObiskPonPremZamejo", description="programDela.d.stObiskPonPremZamejo")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stObiskPonPremZamejo;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stObiskPonPremInt", description="programDela.d.stObiskPonPremInt")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stObiskPonPremInt;

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
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $avgCenaVstopnice;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stProdVstopnic", description="programDela.d.stProdVstopnic")
     * @Max\Ui(type="integer", icon="fa fa-ticket")
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
     * @Max\Ui(type="integer", icon="fa fa-users")
     * @var integer
     */
    protected $stZaposlenih;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stZaposIgralcev", description="programDela.d.stZaposIgralcev")
     * @Max\Ui(type="integer", icon="fa fa-users")
     * @var integer
     */
    protected $stZaposIgralcev;

    /**
     * Povprečna zasedenost zaposlenih igralcev
     * 
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.avgStNastopovIgr", description="programDela.d.avgStNastopovIgr")   
     * @var double
     */
    protected $avgStNastopovIgr;

    /**
     * 
     * Št. honorarnih zunanjih sodelavcev:
     * 
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stHonorarnihZun", description="programDela.d.stHonorarnihZun")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stHonorarnihZun;

    /**
     * Št. honorarnih zunanjih sodelavcev:
     *      - od tega igralcev
     * 
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stHonorarnihZunIgr", description="programDela.d.stHonorarnihZunIgr")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stHonorarnihZunIgr;

    /**
     * Št. honorarnih zunanjih sodelavcev:
     *      - od tega igralcev, zaposlenih v drugih javnih zavodih
     * 
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stHonorarnihZunIgrTujJZ", description="programDela.d.stHonorarnihZunIgrTujJZ")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stHonorarnihZunIgrTujJZ;

    /**
     * Št. honorarnih zunanjih sodelavcev:
     *      - od tega s statusom samozaposlenega v kulturi
     *  
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stHonorarnihZunSamoz", description="programDela.d.stHonorarnihZunSamoz")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stHonorarnihZunSamoz;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaInt", description="programDela.d.sredstvaInt")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $sredstvaInt;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaAvt", description="programDela.d.sredstvaAvt")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $sredstvaAvt;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaZaprosenoPrem", description="programDela.d.sredstvaZaprosenoPrem")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $sredstvaZaprosenoPrem;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaZaprosenoPonPrem", description="programDela.d.sredstvaZaprosenoPonPrem")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $sredstvaZaprosenoPonPrem;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaZaprosenoPonPrej", description="programDela.d.sredstvaZaprosenoPonPrej")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $sredstvaZaprosenoPonPrej;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaZaprosenoGostujo", description="programDela.d.sredstvaZaprosenoGostujo")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $sredstvaZaprosenoGostujo;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaZaprosenoInt", description="programDela.d.sredstvaZaprosenoInt")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $sredstvaZaprosenoInt;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaZaprosenoFest", description="programDela.d.sredstvaZaprosenoFest")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $sredstvaZaprosenoFest;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaZaprosenoRazno", description="programDela.d.sredstvaZaprosenoRazno")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $sredstvaZaprosenoRazno;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaZaprosenoIzjem", description="programDela.d.sredstvaZaprosenoIzjem")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $sredstvaZaprosenoIzjem;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaDrugiJavniPrem", description="programDela.d.sredstvaDrugiJavniPrem")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $sredstvaDrugiJavniPrem;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaDrugiJavniPonPrem", description="programDela.d.sredstvaDrugiJavniPonPrem")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $sredstvaDrugiJavniPonPrem;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaDrugiJavniPonPrej", description="programDela.d.sredstvaDrugiJavniPonPrej")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $sredstvaDrugiJavniPonPrej;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaDrugiJavniGostujo", description="programDela.d.sredstvaDrugiJavniGostujo")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $sredstvaDrugiJavniGostujo;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaDrugiJavniInt", description="programDela.d.sredstvaDrugiJavniInt")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $sredstvaDrugiJavniInt;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaDrugiJavniFest", description="programDela.d.sredstvaDrugiJavniFest")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $sredstvaDrugiJavniFest;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaDrugiJavniRazno", description="programDela.d.sredstvaDrugiJavniRazno")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $sredstvaDrugiJavniRazno;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaDrugiJavniIzjem", description="programDela.d.sredstvaDrugiJavniIzjem")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $sredstvaDrugiJavniIzjem;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaDrugiViriPrem", description="programDela.d.sredstvaDrugiViriPrem")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $sredstvaDrugiViriPrem;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaDrugiViriPonPrem", description="programDela.d.sredstvaDrugiViriPonPrem")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $sredstvaDrugiViriPonPrem;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaDrugiViriPonPrej", description="programDela.d.sredstvaDrugiViriPonPrej")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $sredstvaDrugiViriPonPrej;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaDrugiViriGostujo", description="programDela.d.sredstvaDrugiViriGostujo")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $sredstvaDrugiViriGostujo;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaDrugiViriInt", description="programDela.d.sredstvaDrugiViriInt")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $sredstvaDrugiViriInt;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaDrugiViriFest", description="programDela.d.sredstvaDrugiViriFest")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $sredstvaDrugiViriFest;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaDrugiViriRazno", description="programDela.d.sredstvaDrugiViriRazno")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $sredstvaDrugiViriRazno;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaDrugiViriIzjem", description="programDela.d.sredstvaDrugiViriIzjem")   
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $sredstvaDrugiViriIzjem;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     * @Max\I18n(label="programDela.sredstvaAvtSamoz", description="programDela.d.sredstvaAvtSamoz")   
     * @Max\Ui(icon="fa fa-euro")
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
     * preračunaj število koprodukcij
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

    /**
     * povečaj število nastopov zaposlenih igralcev pri določeni uprizoritvi
     * 
     * @param entiteta $object
     * @param integer $stNastopovZaposIgralcev
     */
    protected function pristejKStNastopovZaposIgr($object, &$stNastopovZaposIgralcev)
    {
        /**
         * uporabi le privzete alternacije in le za zaposlene igralce
         */
        if ($object->getUprizoritev()) {
            foreach ($object->getUprizoritev()->getFunkcije() as $funkcija) {
                if ($funkcija->getPodrocje() == 'igralec') {
                    foreach ($funkcija->getAlternacije() as $alternacija) {
                        if ($alternacija->getPrivzeti() && $alternacija->getZaposlen()) {
                            $stNastopovZaposIgralcev+=$object->getPonoviDoma() + $object->getPonoviKopr() + $object->getPonoviZamejo() + $object->getPonoviGost() + $object->getPonoviInt() + $object->getPonoviKoprInt();
                        }
                    }
                }
            }
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
        $this->postavkeCDve       = new ArrayCollection();
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
        $this->stPonPrejVelikih          = 0;
        $this->stPonPrejMalih            = 0;
        $this->stPonPrejMalihKopr        = 0;
        $this->stPonPrejSredKopr         = 0;
        $this->stPonPrejVelikihKopr      = 0;
        $this->stPremierVelikih          = 0;
        $this->stPremierMalih            = 0;
        $this->stPremierMalihKopr        = 0;
        $this->stPremierSredKopr         = 0;
        $this->stPremierVelikihKopr      = 0;
        $this->vrPS1                     = 0;
        $this->vrPS1Do                   = 0;
        $this->vrPS1Mat                  = 0;
        $this->vrPS1GostovSZ             = 0;
        $this->stIzvNekomerc             = 0;
        $this->stIzvPrem                 = 0;
        $this->stIzvPremDoma             = 0;
        $this->stIzvPremKopr             = 0;
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
        $this->stObiskPremDoma           = 0;
        $this->stObiskPremKopr           = 0;
        $this->stObiskPonPrem            = 0;
        $this->stObiskPonPremDoma        = 0;
        $this->stObiskPonPremKopr        = 0;
        $this->stObiskPonPremKoprInt     = 0;
        $this->stHonorarnihZun           = 0;
        $this->stHonorarnihZunIgr        = 0;
        $this->stHonorarnihZunIgrTujJZ   = 0;
        $this->stHonorarnihZunSamoz      = 0;
        $this->sredstvaAvt               = 0;
        $this->sredstvaAvtSamoz          = 0;
        $this->sredstvaInt               = 0;
        $this->stKoprodukcij             = 0;
        $this->stKoprodukcijInt          = 0;
        $this->stKoprodukcijNVO          = 0;
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

        /**
         * init za izračun  zasedenosti igralcev
         * 
         */
        $stNastopovZaposIgralcev = 0;

        /**
         * init za izračun povprečne zasedenosti dvoran
         */
        $obiskDomaUpriz = 0;
        $maxKapaciteta  = 0;

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
            if ($smer == Consts::DOWN) {
                $object->preracunaj(Consts::DOWN);
            }
            $this->vrPS1 += $object->getCelotnaVrednost();        //$$ tu še preveriti ali celotna vrednost ali le delež matičnega koproducenta
            $this->vrPS1Do += $object->getCelotnaVrednost();        //$$ tu še preveriti ali celotna vrednost ali le delež matičnega koproducenta
            $this->stIzvNekomerc+=$object->getPonoviDoma() + $object->getPonoviKopr();
            $this->stIzvPrem+=$object->getPonoviDoma() + $object->getPonoviKopr();
            $this->stIzvPremDoma+=$object->getPonoviDoma();
            $this->stIzvPremKopr+=$object->getPonoviKopr();
            $this->stObiskNekom +=$object->getObiskDoma() + $object->getObiskKopr();
            $this->stObiskNekomMat +=$object->getObiskDoma();
            $this->stObiskPrem +=$object->getObiskDoma() + $object->getObiskKopr();
            $this->stObiskPremDoma +=$object->getObiskDoma();
            $this->stObiskPremKopr +=$object->getObiskKopr();
            $this->stHonorarnihZun +=$object->getStHonorarnihZun();
            $this->stHonorarnihZunIgr +=$object->getStHonorarnihZunIgr();
            $this->stHonorarnihZunIgrTujJZ +=$object->getStHonorarnihZunIgrTujJZ();
            $this->stHonorarnihZunSamoz +=$object->getStHonorarnihZunSamoz();
            $this->sredstvaZaprosenoPrem+=$object->getZaproseno();
            $this->sredstvaDrugiJavniPrem+=$object->getDrugiJavni();
            $this->sredstvaDrugiViriPrem+=$this->sestejDrugeVire($object);
            $this->sredstvaAvt+=$object->getAvtorskiHonorarji();
            $this->sredstvaAvtSamoz+=$object->getAvtorskiHonorarjiSamoz();
            $this->prerStKopr($object);
            $obiskDomaUpriz+= $object->getObiskDoma();

            $this->expect($object->getUprizoritev(), "Uprizoritev je obvezen podatek", 1000790);
            $this->expect($object->getUprizoritev()->getMaticniOder(), "Matični oder je obvezen podatek", 1000791);
            if ($object->getUprizoritev()->getMaticniOder()) {
                $maxKapaciteta+= $object->getUprizoritev()->getMaticniOder()->getKapaciteta();
            }

            $this->pristejKStNastopovZaposIgr($object, $stNastopovZaposIgralcev);

            switch ($object->getTipProgramskeEnote()->getSifra()) {
                case "01":
                    $this->stPremierVelikih+=1;         // Velike predstave
                    break;
                case "02":
                    $this->stPremierMalih +=1;
                    break;
                case "03":
                    $this->stPremierMalihKopr +=1;
                    break;
                case "04":
                    $this->stPremierSredKopr +=1;
                    break;
                case "05":
                    $this->stPremierVelikihKopr +=1;
                    break;
                default:
                    $this->expect(FALSE, "Premiera ima napačen tip programske enote:" . $object->getTipProgramskeEnote()->getSifra(), 1000491);
            }
        }

        /**
         * ponovitve premier
         */
        foreach ($this->getPonovitvePremiere() as $numObject => $object) {
            if ($smer == Consts::DOWN) {
                $object->preracunaj(Consts::DOWN);
            }
            $this->vrPS1 += $object->getCelotnaVrednost();        //$$ tu še preveriti ali celotna vrednost ali le delež matičnega koproducenta
            $this->vrPS1Mat+= $object->getCelotnaVrednostMat();
            $this->vrPS1GostovSZ+= $object->getCelotnaVrednostGostovSZ();
            $this->stIzvNekomerc+=$object->getPonoviDoma() + $object->getPonoviZamejo() + $object->getPonoviGost() + $object->getPonoviKopr();      //$$ ali prištevvamo tudi mednarodne?
            $this->stIzvPonPrem+=$object->getPonoviDoma() + $object->getPonoviZamejo() + $object->getPonoviGost() + $object->getPonoviKopr();      //$$ ali prištevvamo tudi mednarodne?
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
            $this->stObiskPonPremGost +=$object->getObiskGost();
            $this->stObiskPonPremZamejo +=$object->getObiskZamejo();

            $this->sredstvaAvt+=$object->getAvtorskiHonorarji();
            $this->sredstvaAvtSamoz+=$object->getAvtorskiHonorarjiSamoz();
            $this->sredstvaZaprosenoPonPrem+=$object->getZaproseno();
            $this->sredstvaDrugiJavniPonPrem+=$object->getDrugiJavni();
            $this->sredstvaDrugiViriPonPrem+=$this->sestejDrugeVire($object);
            $this->prerStKopr($object);
            $obiskDomaUpriz+= $object->getObiskDoma();

            $this->expect($object->getUprizoritev(), "Uprizoritev je obvezen podatek", 1000792);
            $this->expect($object->getUprizoritev()->getMaticniOder(), "Matični oder je obvezen podatek", 1000793);
            if ($object->getUprizoritev()->getMaticniOder()) {
                $maxKapaciteta+= $object->getUprizoritev()->getMaticniOder()->getKapaciteta();
            }

            $this->pristejKStNastopovZaposIgr($object, $stNastopovZaposIgralcev);
        }

        /**
         * ponovitve prejšnjih sezon
         */
        foreach ($this->getPonovitvePrejsnjih() as $numObject => $object) {
            if ($smer == Consts::DOWN) {
                $object->preracunaj(Consts::DOWN);
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
            $this->stHonorarnihZun +=$object->getStHonorarnihZun();
            $this->stHonorarnihZunIgr +=$object->getStHonorarnihZunIgr();
            $this->stHonorarnihZunIgrTujJZ +=$object->getStHonorarnihZunIgrTujJZ();
            $this->stHonorarnihZunSamoz +=$object->getStHonorarnihZunSamoz();
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
            $obiskDomaUpriz+= $object->getObiskDoma();

            $this->expect($object->getUprizoritev(), "Uprizoritev je obvezen podatek", 1000794);
            $this->expect($object->getUprizoritev()->getMaticniOder(), "Matični oder je obvezen podatek", 1000795);
            if ($object->getUprizoritev()->getMaticniOder()) {
                $maxKapaciteta+= $object->getUprizoritev()->getMaticniOder()->getKapaciteta();
            }

            $this->pristejKStNastopovZaposIgr($object, $stNastopovZaposIgralcev);
        }

        /**
         * gostujoče predstave
         */
        foreach ($this->getGostujoci() as $numObject => $object) {
            if ($smer == Consts::DOWN) {
                $object->preracunaj(Consts::DOWN);
            }
            $this->stIzvNekomerc+=$object->getPonoviDoma();
            $this->stIzvGostuj+=$object->getPonoviDoma();
            $this->stObiskNekom +=$object->getObiskDoma();
            $this->stObiskNekomMat +=$object->getObiskDoma();
            $this->sredstvaZaprosenoGostujo+=$object->getZaproseno();
            $this->sredstvaDrugiJavniGostujo+=$object->getDrugiJavni();
            $this->sredstvaDrugiViriGostujo+=$this->sestejDrugeVire($object);
            $this->prerStKopr($object);
            $obiskDomaUpriz+= $object->getObiskDoma();

            $this->expect($object->getUprizoritev(), "Uprizoritev je obvezen podatek", 1000796);
            $this->expect($object->getUprizoritev()->getMaticniOder(), "Matični oder je obvezen podatek", 1000797);
            if ($object->getUprizoritev()->getMaticniOder()) {
                $maxKapaciteta+= $object->getUprizoritev()->getMaticniOder()->getKapaciteta();
            }

            $this->pristejKStNastopovZaposIgr($object, $stNastopovZaposIgralcev);
        }

        /**
         * mednarodna gostovanja
         */
        foreach ($this->getGostovanja() as $numObject => $object) {
            if ($smer == Consts::DOWN) {
                $object->preracunaj(Consts::DOWN);
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
                $this->stObiskPonPremInt +=$object->getObiskInt();
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
            $this->pristejKStNastopovZaposIgr($object, $stNastopovZaposIgralcev);
        }

        /**
         * festivali
         */
        foreach ($this->getProgramiFestival() as $numObject => $object) {
            if ($smer == Consts::DOWN) {
                $object->preracunaj(Consts::DOWN);
            }
            $this->stIzvNekomerc+=1;      // 1 festival ena prireditev
            $this->stIzvOstalihNek+=1;      // 1 festival ena prireditev
            $this->stObiskNekom +=$object->getObiskDoma();
            $this->stObiskNekomMat +=$object->getObiskDoma();
            $this->stHonorarnihZun +=$object->getStHonorarnihZun();
            $this->sredstvaZaprosenoFest+=$object->getZaproseno();
            $this->sredstvaDrugiJavniFest+=$object->getDrugiJavni();
            $this->sredstvaDrugiViriFest+=$this->sestejDrugeVire($object);
            $this->prerStKopr($object);
        }

        /**
         * razno
         */
        foreach ($this->getProgramiRazno() as $numObject => $object) {
            if ($smer == Consts::DOWN) {
                $object->preracunaj(Consts::DOWN);
            }
            $this->stIzvNekomerc+=$object->getStPE();     //$$ prištevamo število programskih enot
            $this->stIzvOstalihNek+=$object->getStPE();     //$$ prištevamo število programskih enot
            $this->stObiskNekom +=$object->getObiskDoma();
            $this->stObiskNekomMat +=$object->getObiskDoma();
            $this->stHonorarnihZun +=$object->getStHonorarnihZun();
            $this->sredstvaZaprosenoRazno+=$object->getZaproseno();
            $this->sredstvaDrugiJavniRazno+=$object->getDrugiJavni();
            $this->sredstvaDrugiViriRazno+=$this->sestejDrugeVire($object);
            $this->prerStKopr($object);
        }

        /**
         * izjemni dogodki
         */
        foreach ($this->getIzjemni() as $numObject => $object) {
            if ($smer == Consts::DOWN) {
                $object->preracunaj(Consts::DOWN);
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
            $this->avgObiskPrired = Functions::numberRound($this->stObiskNekom / $this->stIzvNekomerc);
        } else {
            $this->avgObiskPrired = 0;
        }
        $this->avgZasedDvoran   = $maxKapaciteta > 0 ? ($obiskDomaUpriz / $maxKapaciteta) * 100 : 0;  //$$ to je v primeru, če kapacitete prostorov niso vnešene
        $this->avgStNastopovIgr = $this->stZaposIgralcev > 0 ? $stNastopovZaposIgralcev / $this->stZaposIgralcev : 0;
    }

    public function validate($mode = 'update')
    {
        $this->expect($this->zacetek <= $this->konec, "Datum konca mora biti za datumom začetka", 1000500);

        $this->validateIntGE0($this->stFest, "Št. festivalov", 1000710);
        $this->validateIntGE0($this->stGostujo, "Št. gostujočih", 1000711);
        $this->validateIntGE0($this->stHonorarnihZun, "Št. honorarnih", 1000712);
        $this->validateIntGE0($this->stHonorarnihZunIgr, "Št. honorarnih igralcev", 1000713);
        $this->validateIntGE0($this->stHonorarnihZunSamoz, "Št. honorarnih igralcev samozaposenih", 1000714);
        $this->validateIntGE0($this->stHonorarnihZunIgrTujJZ, "Št. honorarnig igralcev tuj JZ", 1000715);
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
        $this->validateIntGE0($this->stPremierMalih, "Št. premier - malih", 1000492);
        $this->validateIntGE0($this->stPremierMalihKopr, "Št. premier - malih koprodukcij", 1000493);
        $this->validateIntGE0($this->stPremierSredKopr, "Št. premier - srednje kopr.", 1000494);
        $this->validateIntGE0($this->stPremierVelikih, "Št. premier - velike", 1000495);
        $this->validateIntGE0($this->stPremierVelikihKopr, "Št. premier - velike kopr.", 100046);
        $this->validateIntGE0($this->stProdVstopnic, "Št. prodanih vstopnic", 1000743);
        $this->validateIntGE0($this->stRazno, "Št. razno", 1000744);
        $this->validateIntGE0($this->stZaposIgralcev, "Št. zaposlenih igralcev", 1000745);
        $this->validateIntGE0($this->stZaposlenih, "Št. zaposlenih", 1000746);
        $this->validateIntGE0($this->stIzvPremDoma, "stIzvPremDoma", 1000785);
        $this->validateIntGE0($this->stIzvPremKopr, "stIzvPremKopr", 1000786);
        $this->validateIntGE0($this->stObiskPremDoma, "stObiskPremDoma", 1000787);
        $this->validateIntGE0($this->stObiskPremKopr, "stObiskPremKopr", 1000788);

        $this->validateEuroGE0($this->avgCenaVstopnice, "avgCenaVstopnice", 1000750);
        $this->validateEuroGE0($this->avgObiskPrired, "avgObiskPrired", 1000751);
        $this->validateNumberGE0($this->avgStNastopovIgr, "avgStNastopovIgr", 1000752);
        $this->validateProcGE0LE100($this->avgZasedDvoran, "avgZasedDvoran", 1000753);
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

    function getId()
    {
        return $this->id;
    }

    function getSifra()
    {
        return $this->sifra;
    }

    function getNaziv()
    {
        return $this->naziv;
    }

    function getZacetek()
    {
        return $this->zacetek;
    }

    function getKonec()
    {
        return $this->konec;
    }

    function getZakljuceno()
    {
        return $this->zakljuceno;
    }

    function getPotrjenProgram()
    {
        return $this->potrjenProgram;
    }

    function getPremiere()
    {
        return $this->premiere;
    }

    function getPonovitvePremiere()
    {
        return $this->ponovitvePremiere;
    }

    function getPonovitvePrejsnjih()
    {
        return $this->ponovitvePrejsnjih;
    }

    function getIzjemni()
    {
        return $this->izjemni;
    }

    function getProgramiFestival()
    {
        return $this->programiFestival;
    }

    function getGostujoci()
    {
        return $this->gostujoci;
    }

    function getGostovanja()
    {
        return $this->gostovanja;
    }

    function getProgramiRazno()
    {
        return $this->programiRazno;
    }

    function getPostavkeC2()
    {
        return $this->postavkeC2;
    }

    function getStPremier()
    {
        return $this->stPremier;
    }

    function getStPremierVelikih()
    {
        return $this->stPremierVelikih;
    }

    function getStPremierMalih()
    {
        return $this->stPremierMalih;
    }

    function getStPremierMalihKopr()
    {
        return $this->stPremierMalihKopr;
    }

    function getStPremierVelikihKopr()
    {
        return $this->stPremierVelikihKopr;
    }

    function getStPremierSredKopr()
    {
        return $this->stPremierSredKopr;
    }

    function getStInt()
    {
        return $this->stInt;
    }

    function getStFest()
    {
        return $this->stFest;
    }

    function getStRazno()
    {
        return $this->stRazno;
    }

    function getStIzjem()
    {
        return $this->stIzjem;
    }

    function getStPonPrem()
    {
        return $this->stPonPrem;
    }

    function getStPonPrej()
    {
        return $this->stPonPrej;
    }

    function getStPonPrejVelikih()
    {
        return $this->stPonPrejVelikih;
    }

    function getStPonPrejMalih()
    {
        return $this->stPonPrejMalih;
    }

    function getStPonPrejMalihKopr()
    {
        return $this->stPonPrejMalihKopr;
    }

    function getStPonPrejSredKopr()
    {
        return $this->stPonPrejSredKopr;
    }

    function getStPonPrejVelikihKopr()
    {
        return $this->stPonPrejVelikihKopr;
    }

    function getStGostujo()
    {
        return $this->stGostujo;
    }

    function getVrPS1()
    {
        return $this->vrPS1;
    }

    function getVrPS1Do()
    {
        return $this->vrPS1Do;
    }

    function getVrPS1Mat()
    {
        return $this->vrPS1Mat;
    }

    function getVrPS1GostovSZ()
    {
        return $this->vrPS1GostovSZ;
    }

    function getStIzvNekomerc()
    {
        return $this->stIzvNekomerc;
    }

    function getStIzvPrem()
    {
        return $this->stIzvPrem;
    }

    function getStIzvPremDoma()
    {
        return $this->stIzvPremDoma;
    }

    function getStIzvPremKopr()
    {
        return $this->stIzvPremKopr;
    }

    function getStIzvPonPrem()
    {
        return $this->stIzvPonPrem;
    }

    function getStIzvPonPremDoma()
    {
        return $this->stIzvPonPremDoma;
    }

    function getStIzvPonPremZamejo()
    {
        return $this->stIzvPonPremZamejo;
    }

    function getStIzvPonPremGost()
    {
        return $this->stIzvPonPremGost;
    }

    function getStIzvPonPremKopr()
    {
        return $this->stIzvPonPremKopr;
    }

    function getStIzvPonPremInt()
    {
        return $this->stIzvPonPremInt;
    }

    function getStIzvPonPremKoprInt()
    {
        return $this->stIzvPonPremKoprInt;
    }

    function getStIzvPonPrej()
    {
        return $this->stIzvPonPrej;
    }

    function getStIzvPonPrejDoma()
    {
        return $this->stIzvPonPrejDoma;
    }

    function getStIzvPonPrejZamejo()
    {
        return $this->stIzvPonPrejZamejo;
    }

    function getStIzvPonPrejGost()
    {
        return $this->stIzvPonPrejGost;
    }

    function getStIzvPonPrejKopr()
    {
        return $this->stIzvPonPrejKopr;
    }

    function getStIzvPonPrejInt()
    {
        return $this->stIzvPonPrejInt;
    }

    function getStIzvPonPrejKoprInt()
    {
        return $this->stIzvPonPrejKoprInt;
    }

    function getStIzvGostuj()
    {
        return $this->stIzvGostuj;
    }

    function getStIzvOstalihNek()
    {
        return $this->stIzvOstalihNek;
    }

    function getStIzvGostovanjSlo()
    {
        return $this->stIzvGostovanjSlo;
    }

    function getStIzvGostovanjZam()
    {
        return $this->stIzvGostovanjZam;
    }

    function getStIzvGostovanjInt()
    {
        return $this->stIzvGostovanjInt;
    }

    function getStObiskNekom()
    {
        return $this->stObiskNekom;
    }

    function getStObiskNekomMat()
    {
        return $this->stObiskNekomMat;
    }

    function getStObiskNekomGostSlo()
    {
        return $this->stObiskNekomGostSlo;
    }

    function getStObiskNekomGostZam()
    {
        return $this->stObiskNekomGostZam;
    }

    function getStObiskNekomGostInt()
    {
        return $this->stObiskNekomGostInt;
    }

    function getStObiskPrem()
    {
        return $this->stObiskPrem;
    }

    function getStObiskPremDoma()
    {
        return $this->stObiskPremDoma;
    }

    function getStObiskPremKopr()
    {
        return $this->stObiskPremKopr;
    }

    function getStObiskPonPrem()
    {
        return $this->stObiskPonPrem;
    }

    function getStObiskPonPremDoma()
    {
        return $this->stObiskPonPremDoma;
    }

    function getStObiskPonPremKopr()
    {
        return $this->stObiskPonPremKopr;
    }

    function getStObiskPonPremKoprInt()
    {
        return $this->stObiskPonPremKoprInt;
    }

    function getStObiskPonPremGost()
    {
        return $this->stObiskPonPremGost;
    }

    function getStObiskPonPremZamejo()
    {
        return $this->stObiskPonPremZamejo;
    }

    function getStObiskPonPremInt()
    {
        return $this->stObiskPonPremInt;
    }

    function getAvgObiskPrired()
    {
        return $this->avgObiskPrired;
    }

    function getAvgZasedDvoran()
    {
        return $this->avgZasedDvoran;
    }

    function getAvgCenaVstopnice()
    {
        return $this->avgCenaVstopnice;
    }

    function getStProdVstopnic()
    {
        return $this->stProdVstopnic;
    }

    function getStKoprodukcij()
    {
        return $this->stKoprodukcij;
    }

    function getStKoprodukcijInt()
    {
        return $this->stKoprodukcijInt;
    }

    function getStKoprodukcijNVO()
    {
        return $this->stKoprodukcijNVO;
    }

    function getStZaposlenih()
    {
        return $this->stZaposlenih;
    }

    function getStZaposIgralcev()
    {
        return $this->stZaposIgralcev;
    }

    function getAvgStNastopovIgr()
    {
        return $this->avgStNastopovIgr;
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

    function getSredstvaInt()
    {
        return $this->sredstvaInt;
    }

    function getSredstvaAvt()
    {
        return $this->sredstvaAvt;
    }

    function getSredstvaZaprosenoPrem()
    {
        return $this->sredstvaZaprosenoPrem;
    }

    function getSredstvaZaprosenoPonPrem()
    {
        return $this->sredstvaZaprosenoPonPrem;
    }

    function getSredstvaZaprosenoPonPrej()
    {
        return $this->sredstvaZaprosenoPonPrej;
    }

    function getSredstvaZaprosenoGostujo()
    {
        return $this->sredstvaZaprosenoGostujo;
    }

    function getSredstvaZaprosenoInt()
    {
        return $this->sredstvaZaprosenoInt;
    }

    function getSredstvaZaprosenoFest()
    {
        return $this->sredstvaZaprosenoFest;
    }

    function getSredstvaZaprosenoRazno()
    {
        return $this->sredstvaZaprosenoRazno;
    }

    function getSredstvaZaprosenoIzjem()
    {
        return $this->sredstvaZaprosenoIzjem;
    }

    function getSredstvaDrugiJavniPrem()
    {
        return $this->sredstvaDrugiJavniPrem;
    }

    function getSredstvaDrugiJavniPonPrem()
    {
        return $this->sredstvaDrugiJavniPonPrem;
    }

    function getSredstvaDrugiJavniPonPrej()
    {
        return $this->sredstvaDrugiJavniPonPrej;
    }

    function getSredstvaDrugiJavniGostujo()
    {
        return $this->sredstvaDrugiJavniGostujo;
    }

    function getSredstvaDrugiJavniInt()
    {
        return $this->sredstvaDrugiJavniInt;
    }

    function getSredstvaDrugiJavniFest()
    {
        return $this->sredstvaDrugiJavniFest;
    }

    function getSredstvaDrugiJavniRazno()
    {
        return $this->sredstvaDrugiJavniRazno;
    }

    function getSredstvaDrugiJavniIzjem()
    {
        return $this->sredstvaDrugiJavniIzjem;
    }

    function getSredstvaDrugiViriPrem()
    {
        return $this->sredstvaDrugiViriPrem;
    }

    function getSredstvaDrugiViriPonPrem()
    {
        return $this->sredstvaDrugiViriPonPrem;
    }

    function getSredstvaDrugiViriPonPrej()
    {
        return $this->sredstvaDrugiViriPonPrej;
    }

    function getSredstvaDrugiViriGostujo()
    {
        return $this->sredstvaDrugiViriGostujo;
    }

    function getSredstvaDrugiViriInt()
    {
        return $this->sredstvaDrugiViriInt;
    }

    function getSredstvaDrugiViriFest()
    {
        return $this->sredstvaDrugiViriFest;
    }

    function getSredstvaDrugiViriRazno()
    {
        return $this->sredstvaDrugiViriRazno;
    }

    function getSredstvaDrugiViriIzjem()
    {
        return $this->sredstvaDrugiViriIzjem;
    }

    function getSredstvaAvtSamoz()
    {
        return $this->sredstvaAvtSamoz;
    }

    function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    function setSifra($sifra)
    {
        $this->sifra = $sifra;
        return $this;
    }

    function setNaziv($naziv)
    {
        $this->naziv = $naziv;
        return $this;
    }

    function setZacetek($zacetek)
    {
        $this->zacetek = $zacetek;
        return $this;
    }

    function setKonec($konec)
    {
        $this->konec = $konec;
        return $this;
    }

    function setZakljuceno($zakljuceno)
    {
        $this->zakljuceno = $zakljuceno;
        return $this;
    }

    function setPotrjenProgram($potrjenProgram)
    {
        $this->potrjenProgram = $potrjenProgram;
        return $this;
    }

    function setPremiere($premiere)
    {
        $this->premiere = $premiere;
        return $this;
    }

    function setPonovitvePremiere($ponovitvePremiere)
    {
        $this->ponovitvePremiere = $ponovitvePremiere;
        return $this;
    }

    function setPonovitvePrejsnjih($ponovitvePrejsnjih)
    {
        $this->ponovitvePrejsnjih = $ponovitvePrejsnjih;
        return $this;
    }

    function setIzjemni($izjemni)
    {
        $this->izjemni = $izjemni;
        return $this;
    }

    function setProgramiFestival($programiFestival)
    {
        $this->programiFestival = $programiFestival;
        return $this;
    }

    function setGostujoci($gostujoci)
    {
        $this->gostujoci = $gostujoci;
        return $this;
    }

    function setGostovanja($gostovanja)
    {
        $this->gostovanja = $gostovanja;
        return $this;
    }

    function setProgramiRazno($programiRazno)
    {
        $this->programiRazno = $programiRazno;
        return $this;
    }

    function setPostavkeC2($postavkeC2)
    {
        $this->postavkeC2 = $postavkeC2;
        return $this;
    }

    function setStPremier($stPremier)
    {
        $this->stPremier = $stPremier;
        return $this;
    }

    function setStPremierVelikih($stPremierVelikih)
    {
        $this->stPremierVelikih = $stPremierVelikih;
        return $this;
    }

    function setStPremierMalih($stPremierMalih)
    {
        $this->stPremierMalih = $stPremierMalih;
        return $this;
    }

    function setStPremierMalihKopr($stPremierMalihKopr)
    {
        $this->stPremierMalihKopr = $stPremierMalihKopr;
        return $this;
    }

    function setStPremierVelikihKopr($stPremierVelikihKopr)
    {
        $this->stPremierVelikihKopr = $stPremierVelikihKopr;
        return $this;
    }

    function setStPremierSredKopr($stPremierSredKopr)
    {
        $this->stPremierSredKopr = $stPremierSredKopr;
        return $this;
    }

    function setStInt($stInt)
    {
        $this->stInt = $stInt;
        return $this;
    }

    function setStFest($stFest)
    {
        $this->stFest = $stFest;
        return $this;
    }

    function setStRazno($stRazno)
    {
        $this->stRazno = $stRazno;
        return $this;
    }

    function setStIzjem($stIzjem)
    {
        $this->stIzjem = $stIzjem;
        return $this;
    }

    function setStPonPrem($stPonPrem)
    {
        $this->stPonPrem = $stPonPrem;
        return $this;
    }

    function setStPonPrej($stPonPrej)
    {
        $this->stPonPrej = $stPonPrej;
        return $this;
    }

    function setStPonPrejVelikih($stPonPrejVelikih)
    {
        $this->stPonPrejVelikih = $stPonPrejVelikih;
        return $this;
    }

    function setStPonPrejMalih($stPonPrejMalih)
    {
        $this->stPonPrejMalih = $stPonPrejMalih;
        return $this;
    }

    function setStPonPrejMalihKopr($stPonPrejMalihKopr)
    {
        $this->stPonPrejMalihKopr = $stPonPrejMalihKopr;
        return $this;
    }

    function setStPonPrejSredKopr($stPonPrejSredKopr)
    {
        $this->stPonPrejSredKopr = $stPonPrejSredKopr;
        return $this;
    }

    function setStPonPrejVelikihKopr($stPonPrejVelikihKopr)
    {
        $this->stPonPrejVelikihKopr = $stPonPrejVelikihKopr;
        return $this;
    }

    function setStGostujo($stGostujo)
    {
        $this->stGostujo = $stGostujo;
        return $this;
    }

    function setVrPS1($vrPS1)
    {
        $this->vrPS1 = $vrPS1;
        return $this;
    }

    function setVrPS1Do($vrPS1Do)
    {
        $this->vrPS1Do = $vrPS1Do;
        return $this;
    }

    function setVrPS1Mat($vrPS1Mat)
    {
        $this->vrPS1Mat = $vrPS1Mat;
        return $this;
    }

    function setVrPS1GostovSZ($vrPS1GostovSZ)
    {
        $this->vrPS1GostovSZ = $vrPS1GostovSZ;
        return $this;
    }

    function setStIzvNekomerc($stIzvNekomerc)
    {
        $this->stIzvNekomerc = $stIzvNekomerc;
        return $this;
    }

    function setStIzvPrem($stIzvPrem)
    {
        $this->stIzvPrem = $stIzvPrem;
        return $this;
    }

    function setStIzvPremDoma($stIzvPremDoma)
    {
        $this->stIzvPremDoma = $stIzvPremDoma;
        return $this;
    }

    function setStIzvPremKopr($stIzvPremKopr)
    {
        $this->stIzvPremKopr = $stIzvPremKopr;
        return $this;
    }

    function setStIzvPonPrem($stIzvPonPrem)
    {
        $this->stIzvPonPrem = $stIzvPonPrem;
        return $this;
    }

    function setStIzvPonPremDoma($stIzvPonPremDoma)
    {
        $this->stIzvPonPremDoma = $stIzvPonPremDoma;
        return $this;
    }

    function setStIzvPonPremZamejo($stIzvPonPremZamejo)
    {
        $this->stIzvPonPremZamejo = $stIzvPonPremZamejo;
        return $this;
    }

    function setStIzvPonPremGost($stIzvPonPremGost)
    {
        $this->stIzvPonPremGost = $stIzvPonPremGost;
        return $this;
    }

    function setStIzvPonPremKopr($stIzvPonPremKopr)
    {
        $this->stIzvPonPremKopr = $stIzvPonPremKopr;
        return $this;
    }

    function setStIzvPonPremInt($stIzvPonPremInt)
    {
        $this->stIzvPonPremInt = $stIzvPonPremInt;
        return $this;
    }

    function setStIzvPonPremKoprInt($stIzvPonPremKoprInt)
    {
        $this->stIzvPonPremKoprInt = $stIzvPonPremKoprInt;
        return $this;
    }

    function setStIzvPonPrej($stIzvPonPrej)
    {
        $this->stIzvPonPrej = $stIzvPonPrej;
        return $this;
    }

    function setStIzvPonPrejDoma($stIzvPonPrejDoma)
    {
        $this->stIzvPonPrejDoma = $stIzvPonPrejDoma;
        return $this;
    }

    function setStIzvPonPrejZamejo($stIzvPonPrejZamejo)
    {
        $this->stIzvPonPrejZamejo = $stIzvPonPrejZamejo;
        return $this;
    }

    function setStIzvPonPrejGost($stIzvPonPrejGost)
    {
        $this->stIzvPonPrejGost = $stIzvPonPrejGost;
        return $this;
    }

    function setStIzvPonPrejKopr($stIzvPonPrejKopr)
    {
        $this->stIzvPonPrejKopr = $stIzvPonPrejKopr;
        return $this;
    }

    function setStIzvPonPrejInt($stIzvPonPrejInt)
    {
        $this->stIzvPonPrejInt = $stIzvPonPrejInt;
        return $this;
    }

    function setStIzvPonPrejKoprInt($stIzvPonPrejKoprInt)
    {
        $this->stIzvPonPrejKoprInt = $stIzvPonPrejKoprInt;
        return $this;
    }

    function setStIzvGostuj($stIzvGostuj)
    {
        $this->stIzvGostuj = $stIzvGostuj;
        return $this;
    }

    function setStIzvOstalihNek($stIzvOstalihNek)
    {
        $this->stIzvOstalihNek = $stIzvOstalihNek;
        return $this;
    }

    function setStIzvGostovanjSlo($stIzvGostovanjSlo)
    {
        $this->stIzvGostovanjSlo = $stIzvGostovanjSlo;
        return $this;
    }

    function setStIzvGostovanjZam($stIzvGostovanjZam)
    {
        $this->stIzvGostovanjZam = $stIzvGostovanjZam;
        return $this;
    }

    function setStIzvGostovanjInt($stIzvGostovanjInt)
    {
        $this->stIzvGostovanjInt = $stIzvGostovanjInt;
        return $this;
    }

    function setStObiskNekom($stObiskNekom)
    {
        $this->stObiskNekom = $stObiskNekom;
        return $this;
    }

    function setStObiskNekomMat($stObiskNekomMat)
    {
        $this->stObiskNekomMat = $stObiskNekomMat;
        return $this;
    }

    function setStObiskNekomGostSlo($stObiskNekomGostSlo)
    {
        $this->stObiskNekomGostSlo = $stObiskNekomGostSlo;
        return $this;
    }

    function setStObiskNekomGostZam($stObiskNekomGostZam)
    {
        $this->stObiskNekomGostZam = $stObiskNekomGostZam;
        return $this;
    }

    function setStObiskNekomGostInt($stObiskNekomGostInt)
    {
        $this->stObiskNekomGostInt = $stObiskNekomGostInt;
        return $this;
    }

    function setStObiskPrem($stObiskPrem)
    {
        $this->stObiskPrem = $stObiskPrem;
        return $this;
    }

    function setStObiskPremDoma($stObiskPremDoma)
    {
        $this->stObiskPremDoma = $stObiskPremDoma;
        return $this;
    }

    function setStObiskPremKopr($stObiskPremKopr)
    {
        $this->stObiskPremKopr = $stObiskPremKopr;
        return $this;
    }

    function setStObiskPonPrem($stObiskPonPrem)
    {
        $this->stObiskPonPrem = $stObiskPonPrem;
        return $this;
    }

    function setStObiskPonPremDoma($stObiskPonPremDoma)
    {
        $this->stObiskPonPremDoma = $stObiskPonPremDoma;
        return $this;
    }

    function setStObiskPonPremKopr($stObiskPonPremKopr)
    {
        $this->stObiskPonPremKopr = $stObiskPonPremKopr;
        return $this;
    }

    function setStObiskPonPremKoprInt($stObiskPonPremKoprInt)
    {
        $this->stObiskPonPremKoprInt = $stObiskPonPremKoprInt;
        return $this;
    }

    function setStObiskPonPremGost($stObiskPonPremGost)
    {
        $this->stObiskPonPremGost = $stObiskPonPremGost;
        return $this;
    }

    function setStObiskPonPremZamejo($stObiskPonPremZamejo)
    {
        $this->stObiskPonPremZamejo = $stObiskPonPremZamejo;
        return $this;
    }

    function setStObiskPonPremInt($stObiskPonPremInt)
    {
        $this->stObiskPonPremInt = $stObiskPonPremInt;
        return $this;
    }

    function setAvgObiskPrired($avgObiskPrired)
    {
        $this->avgObiskPrired = $avgObiskPrired;
        return $this;
    }

    function setAvgZasedDvoran($avgZasedDvoran)
    {
        $this->avgZasedDvoran = $avgZasedDvoran;
        return $this;
    }

    function setAvgCenaVstopnice($avgCenaVstopnice)
    {
        $this->avgCenaVstopnice = $avgCenaVstopnice;
        return $this;
    }

    function setStProdVstopnic($stProdVstopnic)
    {
        $this->stProdVstopnic = $stProdVstopnic;
        return $this;
    }

    function setStKoprodukcij($stKoprodukcij)
    {
        $this->stKoprodukcij = $stKoprodukcij;
        return $this;
    }

    function setStKoprodukcijInt($stKoprodukcijInt)
    {
        $this->stKoprodukcijInt = $stKoprodukcijInt;
        return $this;
    }

    function setStKoprodukcijNVO($stKoprodukcijNVO)
    {
        $this->stKoprodukcijNVO = $stKoprodukcijNVO;
        return $this;
    }

    function setStZaposlenih($stZaposlenih)
    {
        $this->stZaposlenih = $stZaposlenih;
        return $this;
    }

    function setStZaposIgralcev($stZaposIgralcev)
    {
        $this->stZaposIgralcev = $stZaposIgralcev;
        return $this;
    }

    function setAvgStNastopovIgr($avgStNastopovIgr)
    {
        $this->avgStNastopovIgr = $avgStNastopovIgr;
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

    function setSredstvaInt($sredstvaInt)
    {
        $this->sredstvaInt = $sredstvaInt;
        return $this;
    }

    function setSredstvaAvt($sredstvaAvt)
    {
        $this->sredstvaAvt = $sredstvaAvt;
        return $this;
    }

    function setSredstvaZaprosenoPrem($sredstvaZaprosenoPrem)
    {
        $this->sredstvaZaprosenoPrem = $sredstvaZaprosenoPrem;
        return $this;
    }

    function setSredstvaZaprosenoPonPrem($sredstvaZaprosenoPonPrem)
    {
        $this->sredstvaZaprosenoPonPrem = $sredstvaZaprosenoPonPrem;
        return $this;
    }

    function setSredstvaZaprosenoPonPrej($sredstvaZaprosenoPonPrej)
    {
        $this->sredstvaZaprosenoPonPrej = $sredstvaZaprosenoPonPrej;
        return $this;
    }

    function setSredstvaZaprosenoGostujo($sredstvaZaprosenoGostujo)
    {
        $this->sredstvaZaprosenoGostujo = $sredstvaZaprosenoGostujo;
        return $this;
    }

    function setSredstvaZaprosenoInt($sredstvaZaprosenoInt)
    {
        $this->sredstvaZaprosenoInt = $sredstvaZaprosenoInt;
        return $this;
    }

    function setSredstvaZaprosenoFest($sredstvaZaprosenoFest)
    {
        $this->sredstvaZaprosenoFest = $sredstvaZaprosenoFest;
        return $this;
    }

    function setSredstvaZaprosenoRazno($sredstvaZaprosenoRazno)
    {
        $this->sredstvaZaprosenoRazno = $sredstvaZaprosenoRazno;
        return $this;
    }

    function setSredstvaZaprosenoIzjem($sredstvaZaprosenoIzjem)
    {
        $this->sredstvaZaprosenoIzjem = $sredstvaZaprosenoIzjem;
        return $this;
    }

    function setSredstvaDrugiJavniPrem($sredstvaDrugiJavniPrem)
    {
        $this->sredstvaDrugiJavniPrem = $sredstvaDrugiJavniPrem;
        return $this;
    }

    function setSredstvaDrugiJavniPonPrem($sredstvaDrugiJavniPonPrem)
    {
        $this->sredstvaDrugiJavniPonPrem = $sredstvaDrugiJavniPonPrem;
        return $this;
    }

    function setSredstvaDrugiJavniPonPrej($sredstvaDrugiJavniPonPrej)
    {
        $this->sredstvaDrugiJavniPonPrej = $sredstvaDrugiJavniPonPrej;
        return $this;
    }

    function setSredstvaDrugiJavniGostujo($sredstvaDrugiJavniGostujo)
    {
        $this->sredstvaDrugiJavniGostujo = $sredstvaDrugiJavniGostujo;
        return $this;
    }

    function setSredstvaDrugiJavniInt($sredstvaDrugiJavniInt)
    {
        $this->sredstvaDrugiJavniInt = $sredstvaDrugiJavniInt;
        return $this;
    }

    function setSredstvaDrugiJavniFest($sredstvaDrugiJavniFest)
    {
        $this->sredstvaDrugiJavniFest = $sredstvaDrugiJavniFest;
        return $this;
    }

    function setSredstvaDrugiJavniRazno($sredstvaDrugiJavniRazno)
    {
        $this->sredstvaDrugiJavniRazno = $sredstvaDrugiJavniRazno;
        return $this;
    }

    function setSredstvaDrugiJavniIzjem($sredstvaDrugiJavniIzjem)
    {
        $this->sredstvaDrugiJavniIzjem = $sredstvaDrugiJavniIzjem;
        return $this;
    }

    function setSredstvaDrugiViriPrem($sredstvaDrugiViriPrem)
    {
        $this->sredstvaDrugiViriPrem = $sredstvaDrugiViriPrem;
        return $this;
    }

    function setSredstvaDrugiViriPonPrem($sredstvaDrugiViriPonPrem)
    {
        $this->sredstvaDrugiViriPonPrem = $sredstvaDrugiViriPonPrem;
        return $this;
    }

    function setSredstvaDrugiViriPonPrej($sredstvaDrugiViriPonPrej)
    {
        $this->sredstvaDrugiViriPonPrej = $sredstvaDrugiViriPonPrej;
        return $this;
    }

    function setSredstvaDrugiViriGostujo($sredstvaDrugiViriGostujo)
    {
        $this->sredstvaDrugiViriGostujo = $sredstvaDrugiViriGostujo;
        return $this;
    }

    function setSredstvaDrugiViriInt($sredstvaDrugiViriInt)
    {
        $this->sredstvaDrugiViriInt = $sredstvaDrugiViriInt;
        return $this;
    }

    function setSredstvaDrugiViriFest($sredstvaDrugiViriFest)
    {
        $this->sredstvaDrugiViriFest = $sredstvaDrugiViriFest;
        return $this;
    }

    function setSredstvaDrugiViriRazno($sredstvaDrugiViriRazno)
    {
        $this->sredstvaDrugiViriRazno = $sredstvaDrugiViriRazno;
        return $this;
    }

    function setSredstvaDrugiViriIzjem($sredstvaDrugiViriIzjem)
    {
        $this->sredstvaDrugiViriIzjem = $sredstvaDrugiViriIzjem;
        return $this;
    }

    function setSredstvaAvtSamoz($sredstvaAvtSamoz)
    {
        $this->sredstvaAvtSamoz = $sredstvaAvtSamoz;
        return $this;
    }

}
