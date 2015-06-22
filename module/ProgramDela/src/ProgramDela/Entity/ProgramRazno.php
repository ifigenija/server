<?php

namespace ProgramDela\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="ProgramDela\Repository\ProgramiRazno")
 * @Max\Id(prefix="0049")
 */
class ProgramRazno
        extends \ProgramDela\Entity\EnotaPrograma
{

    /**
     * @ORM\ManyToOne(targetEntity="ProgramDela\Entity\ProgramDela", inversedBy="programiRazno")
     * @ORM\JoinColumn(name="program_dela_id", referencedColumnName="id")
     * @Max\I18n(label="programRazno.dokument", description="Program dela")
     * @Max\Ui(type="hidden")
     * @var \ProgramDela\Entity\ProgramDela
     */
    private $dokument;

    /**
     * @ORM\Column(type="string")
     * @Max\I18n(label="programRazno.naslovPE", description="Naslov programske enote")
     * @var string
     */
    private $naslovPE;

    /**
     * @ORM\Column(type="string")
     * @Max\I18n(label="programRazno.avtorPE", description="Avtor programske enote")
     * @var string
     */
    private $avtorPE;

    /**
     * @ORM\Column(type="string")
     * @Max\I18n(label="programRazno.obsegPE", description="Obseg programske enote")
     * @var string
     */
    private $obsegPE;

    /**
     * @ORM\Column(type="string")
     * @Max\I18n(label="programRazno.mesecPE", description="Mesec programske enote")
     * @var string
     */
    private $mesecPE;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="programRazno.vrednostPE", description="Vrednost programske enote")
     * @var double
     */
    private $vrednostPE;

    /**
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="programRazno.stPE", description="Število programskih enot")
     * @Max\Ui(type="integer")
     * @var integer     
     */
    private $stPE;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Popa")
     * @ORM\JoinColumn(name="gostitelj_id", referencedColumnName="id")
     * @Max\I18n(label="programRazno.soorganizator", description="Soorganizator oz. koproducent")
     * @Max\Ui(type="toone")
     * @var \App\Entity\Popa
     */
    private $soorganizator;

    public function validate($mode = 'update')
    {
        $this->expect(!($this->getTipProgramskeEnote()), "Tip programske enote obstaja, a ne sme obstajati za program razno", 1000451);
        $this->expect(!($this->getUprizoritev()), "Uprizoritev obstaja, a ne sme obstajati za program razno", 1000452);
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
        $this->setVlozekKoproducenta(0);

        parent::validate();
    }

    public function getDokument()
    {
        return $this->dokument;
    }

    public function getNazivSklopa()
    {
        return $this->nazivSklopa;
    }

    public function getNaslovPE()
    {
        return $this->naslovPE;
    }

    public function getAvtorPE()
    {
        return $this->avtorPE;
    }

    public function getObsegPE()
    {
        return $this->obsegPE;
    }

    public function getMesecPE()
    {
        return $this->mesecPE;
    }

    public function getVrednostPE()
    {
        return $this->vrednostPE;
    }

    public function getStPE()
    {
        return $this->stPE;
    }

    public function getSoorganizator()
    {
        return $this->soorganizator;
    }

    public function setDokument(\ProgramDela\Entity\ProgramDela $dokument)
    {
        $this->dokument = $dokument;
        return $this;
    }

    public function setNazivSklopa($nazivSklopa)
    {
        $this->nazivSklopa = $nazivSklopa;
        return $this;
    }

    public function setNaslovPE($naslovPE)
    {
        $this->naslovPE = $naslovPE;
        return $this;
    }

    public function setAvtorPE($avtorPE)
    {
        $this->avtorPE = $avtorPE;
        return $this;
    }

    public function setObsegPE($obsegPE)
    {
        $this->obsegPE = $obsegPE;
        return $this;
    }

    public function setMesecPE($mesecPE)
    {
        $this->mesecPE = $mesecPE;
        return $this;
    }

    public function setVrednostPE($vrednostPE)
    {
        $this->vrednostPE = $vrednostPE;
        return $this;
    }

    public function setStPE($stPE)
    {
        $this->stPE = $stPE;
        return $this;
    }

    public function setSoorganizator(\App\Entity\Popa $soorganizator)
    {
        $this->soorganizator = $soorganizator;
        return $this;
    }

}
