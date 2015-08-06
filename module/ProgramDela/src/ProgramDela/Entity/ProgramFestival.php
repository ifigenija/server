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
        extends \ProgramDela\Entity\EnotaPrograma
{

    /**
     * @ORM\ManyToOne(targetEntity="ProgramDela\Entity\ProgramDela", inversedBy="programiFestival")
     * @ORM\JoinColumn(name="program_dela_id", referencedColumnName="id")
     * @Max\I18n(label="festival.programDela", description="festival.d.programDela")
     * @Max\Ui(type="hiddenid")
     * @var \ProgramDela\Entity\ProgramDela
     */
    protected $programDela;

    /**
     * @ORM\Column(type="string")
     * @Max\I18n(label="festival.zvrst", description="festival.d.zvrst")
     * @var string
     */
    protected $zvrst;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="festival.stPredstav", description="festival.d.stPredstav")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stPredstav;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="festival.stOkroglihMiz", description="festival.d.stOkroglihMiz")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stOkroglihMiz;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="festival.stPredstavitev", description="festival.d.stPredstavitev")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stPredstavitev;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="festival.stDelavnic", description="festival.d.stDelavnic")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stDelavnic;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="festival.stDrugiDogodki", description="festival.d.stDrugiDogodki")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stDrugiDogodki;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="festival.opredelitevDrugiDogodki", description="festival.d.opredelitevDrugiDogodki")
     * @var string
     */
    protected $opredelitevDrugiDogodki;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="festival.stProdukcij", description="festival.d.stProdukcij")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stProdukcij;

    /**
     * $$ preveri mersko enoto; ali v mesecih, dnevih , človek dnevih?
     * 
     * @ORM\Column(type="string")
     * @Max\I18n(label="festival.casPriprave", description="festival.d.casPriprave")
     * @var string
     */
    protected $casPriprave;

    /**
     * $$ preveri mersko enoto; ali v mesecih, dnevih , človek dnevih?
     * 
     * @ORM\Column(type="string")
     * @Max\I18n(label="festival.casIzvedbe", description="festival.d.casIzvedbe")
     * @var string
     */
    protected $casIzvedbe;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="festival.prizorisca", description="festival.d.prizorisca")
     * @var string
     */
    protected $prizorisca;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="festival.umetVodja", description="festival.d.umetVodja")
     * @var string
     */
    protected $umetVodja;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="festival.programskoTelo", description="festival.d.programskoTelo")
     * @var string
     */
    protected $programskoTelo;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="festival.stTujihSelektorjev", description="festival.d.stTujihSelektorjev")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $stTujihSelektorjev;

    public function preracunaj($smer = false)
    {
        // neaktualna polja, ki jih tudi v formi ni:
        $this->celotnaVrednostGostovSZ = 0;
        $this->avtorskiHonorarji       = 0;
        $this->avtorskiHonorarjiSamoz  = 0;
        $this->obiskGost               = 0;
        $this->obiskInt                = 0;
        $this->obiskZamejo             = 0;
        $this->ponoviDoma              = 0;
        $this->ponoviGost              = 0;
        $this->ponoviInt               = 0;
        $this->ponoviZamejo            = 0;
        $this->stZaposUmet             = 0;
        $this->stZaposDrug             = 0;
        $this->stHonorarnihIgr         = 0;
        $this->stHonorarnihIgrTujJZ    = 0;
        $this->tantieme                = 0;
        $this->materialni              = 0;
        $this->avtorskePravice         = 0;
        $this->vlozekGostitelja        = 0;

        parent::preracunaj($smer);
        if ($smer == \Max\Consts::UP) {
            if ($this->getProgramDela()) {
                $this->getProgramDela()->preracunaj(\Max\Consts::UP);
            }
        }
    }

    public function validate($mode = 'update')
    {
        $this->validateIntGE0($this->stPredstav, "Št. predstav", 1000534);
        $this->validateIntGE0($this->stOkroglihMiz, "Št. okroglih miz", 1000535);
        $this->validateIntGE0($this->stPredstavitev, "Št. predstavitev", 1000536);
        $this->validateIntGE0($this->stDelavnic, "Št. delavnic", 1000537);
        $this->validateIntGE0($this->stDrugiDogodki, "Št. drugih dogodkov", 1000538);
        $this->validateIntGE0($this->stProdukcij, "Št. produkcij", 1000539);
        $this->validateIntGE0($this->stTujihSelektorjev, "Št. tujih selektorev", 1000700);

        $this->expect(!($this->getTipProgramskeEnote()), "Tip programske enote obstaja, a ne sme obstajati za program festival", 1000531);
        $this->expect(!($this->getUprizoritev()), "Uprizoritev obstaja, a ne sme obstajati za program festival", 1000532);

        $zaproseno    = \Max\Functions::euroRoundS($this->zaproseno);
        $maxZaproseno = \Max\Functions::euroRoundS(0.70 * $this->nasDelez);
        // glede na procent upravičenih stroškov
        $this->expect($zaproseno <= $maxZaproseno, "Zaprošeno (" . $zaproseno . ") je lahko največ 70% deleža mat. JZ(" . $maxZaproseno . ")", 1000533);


        parent::validate();
    }

    public function getProgramDela()
    {
        return $this->programDela;
    }

    public function getZvrst()
    {
        return $this->zvrst;
    }

    public function getStPredstav()
    {
        return $this->stPredstav;
    }

    public function getStOkroglihMiz()
    {
        return $this->stOkroglihMiz;
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


    public function getStTujihSelektorjev()
    {
        return $this->stTujihSelektorjev;
    }

    public function setProgramDela(\ProgramDela\Entity\ProgramDela $programDela)
    {
        $this->programDela = $programDela;
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

    public function setStOkroglihMiz($stOkroglihMiz)
    {
        $this->stOkroglihMiz = $stOkroglihMiz;
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

    public function setStTujihSelektorjev($stTujihSelektorjev)
    {
        $this->stTujihSelektorjev = $stTujihSelektorjev;
        return $this;
    }

}
