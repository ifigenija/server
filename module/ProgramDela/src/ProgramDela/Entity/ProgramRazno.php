<?php

namespace ProgramDela\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="ProgramDela\Repository\ProgramiRazno")
 * @Max\Id(prefix="0049")
 */
class ProgramRazno
        extends EnotaPrograma
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

    public function __construct()
    {
        $this->programskeEnoteSklopa = new ArrayCollection();
        parent::__construct();
    }

    /**
     * preračuna polja, ki se uporabljajo v matični koprodukciji
     * 
     * naš delež in ostala polja kot zaprošeno morajo biti nastavljena še predno se prenesejo v matično koprodukcijo
     */
    public function preracunajPoljaZaMatKoprodukcijo()
    {
        $this->nasDelez = 0;    //init
        foreach ($this->getProgramskeEnoteSklopa() as $numObject => $pes) {
            $this->nasDelez += $pes->getVrednostPE();
        }
    }

    public function preracunaj($smer = false)
    {
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
        $this->avtorskePravice         = 0;
        $this->vlozekGostitelja        = 0;
        $this->obiskKopr               = 0;
        $this->ponoviKopr              = 0;
        $this->obiskKoprInt            = 0;
        $this->ponoviKoprInt           = 0;
        $this->kpe                     = 0;

        $this->preracunajPoljaZaMatKoprodukcijo();

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
        $this->validateIntGE0($this->stPE, "Št. PE", 1000555);

        $this->expect(!($this->getTipProgramskeEnote()), "Tip programske enote obstaja, a ne sme obstajati za program razno", 1000551);
        $this->expect(!($this->getUprizoritev()), "Uprizoritev obstaja, a ne sme obstajati za program razno", 1000552);
        $this->expect($this->naziv, "Nima naziva. Naziv je obvezen podatek", 1000553);

        $zaproseno    = \Max\Functions::euroRoundS($this->zaproseno);
        $maxZaproseno = \Max\Functions::euroRoundS(0.70 * $this->nasDelez);
        // glede na procent upravičenih stroškov
        $this->expect($zaproseno <= $maxZaproseno, "Zaprošeno (" . $zaproseno . ") je lahko največ 70% deleža mat. JZ(" . $maxZaproseno . ")", 1000554);

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

    public function setDokument(\ProgramDela\Entity\ProgramDela $dokument=null)
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

}
