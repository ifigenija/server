<?php

namespace ProgramDela\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;
use Doctrine\Common\Collections\ArrayCollection;

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
     * @ORM\OneToMany(targetEntity="ProgramskaEnotaSklopa", mappedBy="programRazno", orphanRemoval=true)
     * @var <programskeEnoteSklopa>
     */
    protected $programskeEnoteSklopa;

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

    public function __construct()
    {
        $this->programskeEnoteSklopa = new ArrayCollection();
        parent::__construct();
    }

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
        $this->setAvtorskePravice(0);
        $this->setUtemeljitev("");
        $this->setVlozekGostitelja(0);

        $this->stPE = 0;
        foreach ($this->getProgramskeEnoteSklopa() as $numObject => $object) {
            $this->stPE += 1;
        }
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
        $this->expect($this->naziv, "Nima naziva. Naziv je obvezen podatek", 1000453);

        parent::validate();
    }

    public function getDokument()
    {
        return $this->dokument;
    }

    public function getProgramskeEnoteSklopa()
    {
        return $this->programskeEnoteSklopa;
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

    public function setProgramskeEnoteSklopa($programskeEnoteSklopa)
    {
        $this->programskeEnoteSklopa = $programskeEnoteSklopa;
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
