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
     * @Max\Ui(type="hiddenid")
     * @var \ProgramDela\Entity\ProgramDela
     */
    protected $dokument;

    /**
     * @ORM\Column(type="string")
     * @Max\I18n(label="programRazno.naslovPE", description="programRazno.d.naslovPE")
     * @var string
     */
    protected $naslovPE;

    /**
     * @ORM\Column(type="string")
     * @Max\I18n(label="programRazno.avtorPE", description="programRazno.d.avtorPE")
     * @var string
     */
    protected $avtorPE;

    /**
     * @ORM\Column(type="string")
     * @Max\I18n(label="programRazno.obsegPE", description="programRazno.d.obsegPE")
     * @var string
     */
    protected $obsegPE;

    /**
     * @ORM\Column(type="string")
     * @Max\I18n(label="programRazno.mesecPE", description="programRazno.d.mesecPE")
     * @var string
     */
    protected $mesecPE;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="programRazno.vrednostPE", description="programRazno.d.vrednostPE")
     * @var double
     */
    protected $vrednostPE;

    /**
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="programRazno.stPE", description="programRazno.d.stPE")
     * @Max\Ui(type="integer")
     * @var integer     
     */
    protected $stPE;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Popa")
     * @ORM\JoinColumn(name="gostitelj_id", referencedColumnName="id")
     * @Max\I18n(label="programRazno.soorganizator", description="programRazno.d.soorganizator")
     * @Max\Ui(type="toone")
     * @var \App\Entity\Popa
     */
    protected $soorganizator;

    public function preracunaj($smer = false)
    {
        $this->setCelotnaVrednostMat(0);
        $this->setCelotnaVrednostGostovSZ(0);
        $this->setAvtorskiHonorarji(0);
        $this->setObiskGost(0);
        $this->setObiskInt(0);
        $this->setObiskZamejo(0);
        $this->setPonoviDoma(0);
        $this->setPonoviGost(0);
        $this->setPonoviInt(0);
        $this->setPonoviZamejo(0);
        $this->setStZaposUmet(0);
        $this->setStZaposDrug(0);
         $this->setStHonorarnihIgr(0);
        $this->setStHonorarnihIgrTujJZ(0);
        $this->setTantieme(0);
        $this->setUtemeljitev("");
        $this->setVlozekGostitelja(0);
        $this->setVlozekKoproducenta(0);

        parent::preracunaj($smer);
        if ($smer == \Max\Consts::UP) {
            if ($this->getDokument()) {
                $this->getDokument()->preracunaj(\Max\Consts::UP);
            }
        }
    }

    public function validate($mode = 'update')
    {
        $this->expect(!($this->getTipProgramskeEnote()), "Tip programske enote obstaja, a ne sme obstajati za program razno", 1000451);
        $this->expect(!($this->getUprizoritev()), "Uprizoritev obstaja, a ne sme obstajati za program razno", 1000452);

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
