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
     * @Max\I18n(label="programDela.stIzvPonPrem", description="programDela.d.stIzvPonPrem")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stIzvPonPrem;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stIzvPrej", description="programDela.d.stIzvPrej")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stIzvPrej;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stIzvGostuj", description="programDela.d.stIzvGostuj")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stIzvGostuj;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programDela.stIzvOstalihNek", description="programDela.d.stIzvOstalihNek")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stIzvOstalihNek;

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

    /**
     * 
     * 
     * @param enotaPrograma $object
     */
    private function prerSredstva($object)
    {
        foreach ($object->getDrugiViri() as $numobjDV => $objDV) {
            if ($objDV->getMednarodni()) {
                $this->sredstvaInt +=$objDV->getZnesek();
            }
        }
    }

    /**
     * 
     * 
     * @param enotaPrograma $object
     */
    private function prerStKopr($object)
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

    public function preracunaj($smer = false)
    {


// preračun kazalnikov:
//                   - stPremier
//                   - stPonPrej
//                   - stPonPrejVelikih
//                   - stPonPrejMalih
//                   - stPonPrejMalihKopr
//                   - stPonPrejSredKopr
//                   - stPonPrejVelikihKopr
//                   - vrPS1
//                   - vrPS1Do  
//            - vrPS1Mat    $$ ni vrednosti v enoti programa
//            - vrPS1GostovSZ       $$ ni vrednosti v enoti programa
//                   - stNekomerc
//                   - stIzvPonPrem
//                   - stIzvPrej
//                   - stIzvGostuj
//                   - stIzvOstalihNek
//                   - stGostovanjSlo
//                   - stGostovanjZam
//                   - stGostovanjInt
//                   - stObiskNekom
//                   - stObiskNekomMat
//                   - stObiskNekomGostSlo
//                   - stObiskNekomGostZam
//                   - stObiskNekomGostInt
//                   - avgObiskPrired
//                   - stKoprodukcij
//                   - stKoprodukcijInt
//                   - stKoprodukcijNVO
//                   - stHonorarnih
//                   - stHonorarnihIgr
//                   - stHonorarnihIgrTujJZ
//                   - sredstvaInt
//                   - sredstvaAvt
        $this->stPonPrejMalih       = 0;  //init
        $this->stPonPrejMalihKopr   = 0;  //init
        $this->stPonPrejSredKopr    = 0;  //init
        $this->stPonPrejVelikihKopr = 0;  //init
        $this->vrPS1                = 0;  //init
        $this->vrPS1Do              = 0;  //init
        $this->vrPS1Mat             = 0;  //init
        $this->vrPS1GostovSZ        = 0;  //init
        $this->stNekomerc           = 0;  //init
        $this->stIzvPonPrem         = 0;  //init
        $this->stIzvPrej            = 0;  //init
        $this->stIzvGostuj          = 0;  //init
        $this->stIzvOstalihNek      = 0;  //init
        $this->stGostovanjSlo       = 0;  //init
        $this->stGostovanjZam       = 0;  //init
        $this->stGostovanjInt       = 0;  //init
        $this->stObiskNekom         = 0;  //init
        $this->stObiskNekomMat      = 0;  //init
        $this->stObiskNekomGostSlo  = 0;  //init
        $this->stObiskNekomGostZam  = 0;  //init
        $this->stObiskNekomGostInt  = 0;  //init
        $this->stHonorarnih         = 0;  //init
        $this->stHonorarnihIgr      = 0;  //init
        $this->stHonorarnihIgrTujJZ = 0;  //init
        $this->sredstvaAvt          = 0;  //init
        $this->sredstvaInt          = 0;  //init
        $this->stKoprodukcij        = 0;  //init
        $this->stKoprodukcijInt     = 0;  //init
        $this->stKoprodukcijNVO     = 0;  //init
        $this->stPonPrejVelikih     = 0;  //init


        $this->stPremier = $this->getPremiere()->count();
        $stPonPrej       = $this->getPonovitvePrejsnjih()->count();        //$$ začasno
        $this->stPonPrej = $this->getPonovitvePrejsnjih()->count();

        // premiere
        foreach ($this->getPremiere() as $numObject => $object) {
            if ($smer == \Max\Consts::DOWN) {
                $object->preracunaj(\Max\Consts::DOWN);
            }
            $this->vrPS1 += $object->getCelotnaVrednost();        //$$ tu še preveriti ali celotna vrednost ali le delež matičnega koproducenta
            $this->vrPS1Do += $object->getCelotnaVrednost();        //$$ tu še preveriti ali celotna vrednost ali le delež matičnega koproducenta
            $this->stHonorarnih +=$object->getStHonorarnih();
            $this->stHonorarnihIgr +=$object->getStHonorarnihIgr();
            $this->stHonorarnihIgrTujJZ +=$object->getStHonorarnihIgrTujJZ();
            $this->sredstvaAvt+=$object->getAvtorskiHonorarji();
            $this->prerSredstva($object);
            $this->prerStKopr($object);
        }

        // ponovitve premier
        foreach ($this->getPonovitvePremiere() as $numObject => $object) {
            if ($smer == \Max\Consts::DOWN) {
                $object->preracunaj(\Max\Consts::DOWN);
            }
            $this->vrPS1 += $object->getCelotnaVrednost();        //$$ tu še preveriti ali celotna vrednost ali le delež matičnega koproducenta
            $this->stNekomerc+=$object->getPonoviDoma() + $object->getPonoviZamejo() + $object->getPonoviGost();      //$$ ali prištevvamo tudi mednarodne?
            $this->stIzvPonPrem+=$object->getPonoviDoma() + $object->getPonoviZamejo() + $object->getPonoviGost();      //$$ ali prištevvamo tudi mednarodne?
            $this->stGostovanjSlo +=$object->getPonoviGost();
            $this->stGostovanjZam +=$object->getPonoviZamejo();
            $this->stObiskNekom +=$object->getObiskDoma() + $object->getObiskGost() + $object->getObiskZamejo();
            $this->stObiskNekomMat +=$object->getObiskDoma();
            $this->stObiskNekomGostSlo +=$object->getObiskGost();
            $this->stObiskNekomGostZam +=$object->getObiskZamejo();
            $this->sredstvaAvt+=$object->getAvtorskiHonorarji();
            $this->prerSredstva($object);
            $this->prerStKopr($object);
        }

// ponovitve prejšnjih sezon
        foreach ($this->getPonovitvePrejsnjih() as $numObject => $object) {
            if ($smer == \Max\Consts::DOWN) {
                $object->preracunaj(\Max\Consts::DOWN);
            }
            $this->vrPS1 += $object->getCelotnaVrednost();        //$$ tu še preveriti ali celotna vrednost ali le delež matičnega koproducenta
            $this->stNekomerc+=$object->getPonoviDoma() + $object->getPonoviZamejo() + $object->getPonoviGost();      //$$ ali prištevvamo tudi mednarodne?
            $this->stIzvPrej+=$object->getPonoviDoma() + $object->getPonoviZamejo() + $object->getPonoviGost();      //$$ ali prištevvamo tudi mednarodne?
            $this->stGostovanjSlo +=$object->getPonoviGost();
            $this->stGostovanjZam +=$object->getPonoviZamejo();
            $this->stObiskNekom +=$object->getObiskDoma() + $object->getObiskGost() + $object->getObiskZamejo();
            $this->stObiskNekomMat +=$object->getObiskDoma();
            $this->stObiskNekomGostSlo +=$object->getObiskGost();
            $this->stObiskNekomGostZam +=$object->getObiskZamejo();
            $this->stHonorarnih +=$object->getStHonorarnih();
            $this->stHonorarnihIgr +=$object->getStHonorarnihIgr();
            $this->stHonorarnihIgrTujJZ +=$object->getStHonorarnihIgrTujJZ();
            $this->sredstvaAvt+=$object->getAvtorskiHonorarji();

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
            $this->prerSredstva($object);
            $this->prerStKopr($object);
        }

// gostujoče predstave
        foreach ($this->getGostujoci() as $numObject => $object) {
            if ($smer == \Max\Consts::DOWN) {
                $object->preracunaj(\Max\Consts::DOWN);
            }
            $this->stNekomerc+=$object->getPonoviDoma();
            $this->stIzvGostuj+=$object->getPonoviDoma();
            $this->stObiskNekom +=$object->getObiskDoma();
            $this->stObiskNekomMat +=$object->getObiskDoma();
            $this->prerSredstva($object);
            $this->prerStKopr($object);
        }

// mednarodna gostovanja
        foreach ($this->getGostovanja() as $numObject => $object) {
            if ($smer == \Max\Consts::DOWN) {
                $object->preracunaj(\Max\Consts::DOWN);
            }
            $this->stNekomerc+=$object->getPonoviInt();
            $this->stGostovanjInt += $object->getPonoviInt();
            $this->stObiskNekom +=$object->getObiskInt();
            $this->stObiskNekomGostInt +=$object->getObiskInt();
            $this->sredstvaAvt+=$object->getAvtorskiHonorarji();

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
            } else {
                // če ni uprizoritev iz ponovitve (letošnje) premiere je najverjetneje  iz ponovitve premiere prejšnjih sezon
                $this->stIzvPrej+=$object->getPonoviInt();
            }
            $this->prerSredstva($object);
            $this->prerStKopr($object);
        }

        // festivali
        foreach ($this->getProgramiFestival() as $numObject => $object) {
            if ($smer == \Max\Consts::DOWN) {
                $object->preracunaj(\Max\Consts::DOWN);
            }
            $this->stNekomerc+=1;      // 1 festival ena prireditev
            $this->stIzvOstalihNek+=1;      // 1 festival ena prireditev
            $this->stObiskNekom +=$object->getObiskDoma();
            $this->stObiskNekomMat +=$object->getObiskDoma();
            $this->stHonorarnih +=$object->getStHonorarnih();
            $this->prerSredstva($object);
            $this->prerStKopr($object);
        }

        // razno
        foreach ($this->getProgramiRazno() as $numObject => $object) {
            if ($smer == \Max\Consts::DOWN) {
                $object->preracunaj(\Max\Consts::DOWN);
            }
            $this->stNekomerc+=$object->getStPE();     //$$ prištevamo število programskih enot
            $this->stIzvOstalihNek+=$object->getStPE();     //$$ prištevamo število programskih enot
            $this->stObiskNekom +=$object->getObiskDoma();
            $this->stObiskNekomMat +=$object->getObiskDoma();
            $this->stHonorarnih +=$object->getStHonorarnih();
            $this->prerSredstva($object);
            $this->prerStKopr($object);
        }

// izjemni dogodki
        foreach ($this->getIzjemni() as $numObject => $object) {
            if ($smer == \Max\Consts::DOWN) {
                $object->preracunaj(\Max\Consts::DOWN);
            }
            $this->stNekomerc+=$object->getPonoviDoma();
            $this->stIzvOstalihNek+=$object->getPonoviDoma();
            $this->stObiskNekom +=$object->getObiskDoma();
            $this->stObiskNekomMat +=$object->getObiskDoma();
            $this->prerSredstva($object);
            $this->prerStKopr($object);
        }

        if ($this->stNekomerc > 0) {
            $this->avgObiskPrired = \Max\Functions::numberRound($this->stObiskNekom / $this->stNekomerc);
        } else {
            $this->avgObiskPrired = 0;
        }
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

    public function getStPremier()
    {
        return $this->stPremier;
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

    public function getStNekomerc()
    {
        return $this->stNekomerc;
    }

    public function getStIzvPonPrem()
    {
        return $this->stIzvPonPrem;
    }

    public function getStIzvPrej()
    {
        return $this->stIzvPrej;
    }

    public function getStIzvGostuj()
    {
        return $this->stIzvGostuj;
    }

    public function getStIzvOstalihNek()
    {
        return $this->stIzvOstalihNek;
    }

    public function getStGostovanjSlo()
    {
        return $this->stGostovanjSlo;
    }

    public function getStGostovanjZam()
    {
        return $this->stGostovanjZam;
    }

    public function getStGostovanjInt()
    {
        return $this->stGostovanjInt;
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

    public function getSredstvaInt()
    {
        return $this->sredstvaInt;
    }

    public function getSredstvaAvt()
    {
        return $this->sredstvaAvt;
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

    public function setStPremier($stPremier)
    {
        $this->stPremier = $stPremier;
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

    public function setStNekomerc($stNekomerc)
    {
        $this->stNekomerc = $stNekomerc;
        return $this;
    }

    public function setStIzvPonPrem($stIzvPonPrem)
    {
        $this->stIzvPonPrem = $stIzvPonPrem;
        return $this;
    }

    public function setStIzvPrej($stIzvPrej)
    {
        $this->stIzvPrej = $stIzvPrej;
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

    public function setStGostovanjSlo($stGostovanjSlo)
    {
        $this->stGostovanjSlo = $stGostovanjSlo;
        return $this;
    }

    public function setStGostovanjZam($stGostovanjZam)
    {
        $this->stGostovanjZam = $stGostovanjZam;
        return $this;
    }

    public function setStGostovanjInt($stGostovanjInt)
    {
        $this->stGostovanjInt = $stGostovanjInt;
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

}
