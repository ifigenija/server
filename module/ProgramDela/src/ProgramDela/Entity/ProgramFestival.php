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
     * @Max\I18n(label="festival.programDela", description="festival.programDela")
     * @Max\Ui(type="hidden")
     * @var \ProgramDela\Entity\ProgramDela
     */
    private $programDela;

    /**
     * @ORM\Column(type="string")
     * @Max\I18n(label="entiteta.zvrst", description="entiteta.zvrst")
     * @var string
     */
    private $zvrst;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="festival.stPredstav", description="festival.stPredstav")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stPredstav;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="festival.stPredavanj", description="festival.stPredavanj")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stPredavanj;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="festival.stPredstavitev", description="festival.stPredstavitev")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stPredstavitev;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="festival.stDelavnic", description="festival.stDelavnic")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stDelavnic;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="festival.stDrugiDogodki", description="festival.stDrugiDogodki")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stDrugiDogodki;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="festival.opredelitevDrugiDogodki", description="festival.opredelitevDrugiDogodki")
     * @var string
     */
    private $opredelitevDrugiDogodki;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="festival.stProdukcij", description="festival.d.stProdukcij")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stProdukcij;

    /**
     * $$ preveri mersko enoto; ali v mesecih, dnevih , človek dnevih?
     * 
     * @ORM\Column(type="string")
     * @Max\I18n(label="festival.casPriprave", description="festival.casPriprave")
     * @var string
     */
    private $casPriprave;

    /**
     * $$ preveri mersko enoto; ali v mesecih, dnevih , človek dnevih?
     * 
     * @ORM\Column(type="string")
     * @Max\I18n(label="festival.casIzvedbe", description="festival.casIzvedbe")
     * @var string
     */
    private $casIzvedbe;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="festival.prizorisca", description="festival.prizorisca")
     * @var string
     */
    private $prizorisca;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="festival.umetVodja", description="festival.umetVodja")
     * @var string
     */
    private $umetVodja;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="festival.programskoTelo", description="festival.programskoTelo")
     * @var string
     */
    private $programskoTelo;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="festival.soorganizatorji", description="festival.soorganizatorji")
     * @var string
     */
    private $soorganizatorji;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="festival.stTujihSelektorjev", description="festival.d.stTujihSelektorjev")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $stTujihSelektorjev;

    public function validate($mode = 'update')
    {
        $this->expect(!($this->getTipProgramskeEnote()), "Tip programske enote obstaja, a ne sme obstajati za program festival", 1000461);
        $this->expect(!($this->getUprizoritev()), "Uprizoritev obstaja, a ne sme obstajati za program festival", 1000462);

        // neaktualna polja, ki jih tudi v formi ni:
        $this->setAvtorskiHonorarji(0);
        $this->setObiskGost(0);
        $this->setObiskInt(0);
        $this->setObiskZamejo(0);
        $this->setPonoviDoma(0);
        $this->setPonoviGost(0);
        $this->setPonoviInt(0);
        $this->setPonoviZamejo(0);
        $this->setStDrugih(0);
        $this->setStHonorarnihIgr(0);
        $this->setStHonorarnihIgrTujJZ(0);
        $this->setTantieme(0);
        $this->setUtemeljitev("");
        $this->setVlozekGostitelja(0);

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

}
