<?php

namespace ProgramDela\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="ProgramDela\Repository\ProgramiFestival")
 * @Max\I18n(label="Program festival",plural="Programi festival")
 * @Max\Id(prefix="0044")
 */
class ProgramFestival
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID programa festivala")
     * @Max\Ui(type="id")
     * @var string    
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="ProgramDela\Entity\ProgramDela", inversedBy="programiFestival")
     * @ORM\JoinColumn(name="program_dela_id", referencedColumnName="id")
     * @Max\I18n(label="programFestival.programDela", description="Program dela")
     * @Max\Ui(type="hidden")
     * @var \ProgramDela\Entity\ProgramDela
     */
    private $programDela;

    /**
     * @ORM\Column(length=50, nullable=true)
     * @Max\I18n(label="programFestival.naziv", description="Naziv festivala")
     * @Max\Ui(type="naziv",ident=true )
     * @var string
     */
    private $naziv;

    /**
     * @ORM\Column(type="string")
     * @Max\I18n(label="programFestival.zvrst", description="Zvrst festivala")
     * @var string
     */
    private $zvrst;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programFestival.stPredstav", description="Število predstav")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stPredstav;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programFestival.stPredavanj", description="Število predavanj")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stPredavanj;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programFestival.stPredstavitev", description="Število predstavitev")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stPredstavitev;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programFestival.stDelavnic", description="Število delavnic")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stDelavnic;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programFestival.stDrugiDogodki", description="Število drugih dogodkov")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stDrugiDogodki;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="programFestival.opredelitevDrugiDogodki", description="Opredelitev drugih dogodkov")
     * @var string
     */
    private $opredelitevDrugiDogodki;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programFestival.stProdukcij", description="Skupno število festivalskih produkcij")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stProdukcij;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programFestival.stObisk", description="Pričakovano število obiskovalcev")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stObisk;

    /**
     * $$ preveri mersko enoto; ali v mesecih, dnevih , človek dnevih?
     * 
     * @ORM\Column(type="string")
     * @Max\I18n(label="programFestival.casPriprave", description="Čas priprave festivala")
     * @var string
     */
    private $casPriprave;

    /**
     * $$ preveri mersko enoto; ali v mesecih, dnevih , človek dnevih?
     * 
     * @ORM\Column(type="string")
     * @Max\I18n(label="programFestival.casIzvedbe", description="Čas izvedbe festivala")
     * @var string
     */
    private $casIzvedbe;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="programFestival.prizorisca", description="Prizorišča")
     * @var string
     */
    private $prizorisca;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="programFestival.umetVodja", description="Umetniški vodja festivala")
     * @var string
     */
    private $umetVodja;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="programFestival.programskoTelo", description="Programsko telo festivala")
     * @var string
     */
    private $programskoTelo;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="programFestival.soorganizatorji", description="Soorganizatorji")
     * @var string
     */
    private $soorganizatorji;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programFestival.stTujihSelektorjev", description="Predvideno število tujih selektorjev-gostov")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stTujihSelektorjev;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programFestival.stZaposlenih", description="Število zaposlenih, ki sodelujejo pri izvedbi festivala")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stZaposlenih;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="programFestival.stHonorarnih", description="Število vseh, ki sodelujejo honorarno pri izvedbi festivala in jim honorar izplačuje JZ")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stHonorarnih;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="programFestival.zaproseno", description="Zaprošena sredstva Ministrstva za kulturo")   
     * @var double
     */
    private $zaproseno;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="programFestival.celotnaVrednost", description="Celotna vrednost")   
     * @var double
     */
    private $celotnaVrednost;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="programFestival.lastnaSredstva", description="Lastna sredstva")   
     * @var double
     */
    private $lastnaSredstva;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="programFestival.drugiViri", description="Drugi viri")   
     * @var double
     */
    private $drugiViri;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="programFestival.opredelitevDrugiViri", description="Opredelitev drugih virov")
     * @var string
     */
    private $opredelitevDrugiViri;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="programFestival.vlozekKoproducenta", description="Vložek koproducenta")   
     * @var double
     */
    private $vlozekKoproducenta;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="programFestival.drugiJavni", description="Vir druga ministrstva in lokalna skupnost")   
     * @var double
     */
    private $drugiJavni;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="entiteta.sort", description="ep.d.sort")
     * @Max\Ui(type="integer", icon="fa fa-sort")
     * @var integer
     */
    private $sort;

    public function validate($mode = 'update')
    {
        
    }

    public function getId()
    {
        return $this->id;
    }

    public function getProgramDela()
    {
        return $this->programDela;
    }

    public function getNaziv()
    {
        return $this->naziv;
    }

    public function getZvrst()
    {
        return $this->zvrst;
    }

    public function getStPredstav()
    {
        return $this->stPredstav;
    }

    public function getStPredavanj()
    {
        return $this->stPredavanj;
    }

    public function getStPredstavitev()
    {
        return $this->stPredstavitev;
    }

    public function getStDelavnic()
    {
        return $this->stDelavnic;
    }

    public function getStDrugiDogodki()
    {
        return $this->stDrugiDogodki;
    }

    public function getOpredelitevDrugiDogodki()
    {
        return $this->opredelitevDrugiDogodki;
    }

    public function getStProdukcij()
    {
        return $this->stProdukcij;
    }

    public function getStObisk()
    {
        return $this->stObisk;
    }

    public function getCasPriprave()
    {
        return $this->casPriprave;
    }

    public function getCasIzvedbe()
    {
        return $this->casIzvedbe;
    }

    public function getPrizorisca()
    {
        return $this->prizorisca;
    }

    public function getUmetVodja()
    {
        return $this->umetVodja;
    }

    public function getProgramskoTelo()
    {
        return $this->programskoTelo;
    }

    public function getSoorganizatorji()
    {
        return $this->soorganizatorji;
    }

    public function getStTujihSelektorjev()
    {
        return $this->stTujihSelektorjev;
    }

    public function getStZaposlenih()
    {
        return $this->stZaposlenih;
    }

    public function getStHonorarnih()
    {
        return $this->stHonorarnih;
    }

    public function getZaproseno()
    {
        return $this->zaproseno;
    }

    public function getCelotnaVrednost()
    {
        return $this->celotnaVrednost;
    }

    public function getLastnaSredstva()
    {
        return $this->lastnaSredstva;
    }

    public function getDrugiViri()
    {
        return $this->drugiViri;
    }

    public function getOpredelitevDrugiViri()
    {
        return $this->opredelitevDrugiViri;
    }

    public function getVlozekKoproducenta()
    {
        return $this->vlozekKoproducenta;
    }

    public function getDrugiJavni()
    {
        return $this->drugiJavni;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setProgramDela(\ProgramDela\Entity\ProgramDela $programDela)
    {
        $this->programDela = $programDela;
        return $this;
    }

    public function setNaziv($naziv)
    {
        $this->naziv = $naziv;
        return $this;
    }

    public function setZvrst($zvrst)
    {
        $this->zvrst = $zvrst;
        return $this;
    }

    public function setStPredstav($stPredstav)
    {
        $this->stPredstav = $stPredstav;
        return $this;
    }

    public function setStPredavanj($stPredavanj)
    {
        $this->stPredavanj = $stPredavanj;
        return $this;
    }

    public function setStPredstavitev($stPredstavitev)
    {
        $this->stPredstavitev = $stPredstavitev;
        return $this;
    }

    public function setStDelavnic($stDelavnic)
    {
        $this->stDelavnic = $stDelavnic;
        return $this;
    }

    public function setStDrugiDogodki($stDrugiDogodki)
    {
        $this->stDrugiDogodki = $stDrugiDogodki;
        return $this;
    }

    public function setOpredelitevDrugiDogodki($opredelitevDrugiDogodki)
    {
        $this->opredelitevDrugiDogodki = $opredelitevDrugiDogodki;
        return $this;
    }

    public function setStProdukcij($stProdukcij)
    {
        $this->stProdukcij = $stProdukcij;
        return $this;
    }

    public function setStObisk($stObisk)
    {
        $this->stObisk = $stObisk;
        return $this;
    }

    public function setCasPriprave($casPriprave)
    {
        $this->casPriprave = $casPriprave;
        return $this;
    }

    public function setCasIzvedbe($casIzvedbe)
    {
        $this->casIzvedbe = $casIzvedbe;
        return $this;
    }

    public function setPrizorisca($prizorisca)
    {
        $this->prizorisca = $prizorisca;
        return $this;
    }

    public function setUmetVodja($umetVodja)
    {
        $this->umetVodja = $umetVodja;
        return $this;
    }

    public function setProgramskoTelo($programskoTelo)
    {
        $this->programskoTelo = $programskoTelo;
        return $this;
    }

    public function setSoorganizatorji($soorganizatorji)
    {
        $this->soorganizatorji = $soorganizatorji;
        return $this;
    }

    public function setStTujihSelektorjev($stTujihSelektorjev)
    {
        $this->stTujihSelektorjev = $stTujihSelektorjev;
        return $this;
    }

    public function setStZaposlenih($stZaposlenih)
    {
        $this->stZaposlenih = $stZaposlenih;
        return $this;
    }

    public function setStHonorarnih($stHonorarnih)
    {
        $this->stHonorarnih = $stHonorarnih;
        return $this;
    }

    public function setZaproseno($zaproseno)
    {
        $this->zaproseno = $zaproseno;
        return $this;
    }

    public function setCelotnaVrednost($celotnaVrednost)
    {
        $this->celotnaVrednost = $celotnaVrednost;
        return $this;
    }

    public function setLastnaSredstva($lastnaSredstva)
    {
        $this->lastnaSredstva = $lastnaSredstva;
        return $this;
    }

    public function setDrugiViri($drugiViri)
    {
        $this->drugiViri = $drugiViri;
        return $this;
    }

    public function setOpredelitevDrugiViri($opredelitevDrugiViri)
    {
        $this->opredelitevDrugiViri = $opredelitevDrugiViri;
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
    public function getSort()
    {
        return $this->sort;
    }

    public function setSort($sort)
    {
        $this->sort = $sort;
        return $this;
    }


}
