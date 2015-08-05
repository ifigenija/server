<?php

namespace ProgramDela\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="ProgramDela\Repository\ProgramiGostujoca")
 * @Max\Id(prefix="0042")
 */
class ProgramGostujoca
        extends \ProgramDela\Entity\EnotaPrograma
{

    /**
     * @ORM\ManyToOne(targetEntity="ProgramDela\Entity\ProgramDela", inversedBy="gostujoci")
     * @ORM\JoinColumn(name="program_dela_id", referencedColumnName="id")
     * @Max\I18n(label="programGostujoca.dokument",  description="Dokument")
     * @Max\Ui(type="hiddenid")
     * @var \ProgramDela\Entity\ProgramDela
     */
    protected $dokument;

    /**
     * Strošek odkupa predstave 
     * 
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="ep.strosekOdkPred", description="ep.d.strosekOdkPred")   
     * @var double
     */
    protected $strosekOdkPred;

    public function preracunaj($smer = false)
    {
        // neaktualna polja, ki tudi v formi niso:
        $this->celotnaVrednostGostovSZ=0;
        $this->avtorskiHonorarji=0;
        $this->avtorskiHonorarjiSamoz=0;
        $this->tantieme=0;
        $this->avtorskePravice=0;
        $this->obiskGost=0;
        $this->obiskZamejo=0;
        $this->obiskInt=0;
        $this->ponoviZamejo=0;
        $this->ponoviGost=0;
        $this->ponoviInt=0;
        $this->vlozekGostitelja=0;  // kot vir
        $this->stZaposlenih=0;
        $this->stZaposUmet=0;
        $this->stZaposDrug=0;
        $this->stHonorarnih=0;
        $this->stHonorarnihIgr=0;
        $this->stHonorarnihIgrTujJZ=0;
        $this->naziv="";        // dobimo iz uprizoritve

        parent::preracunaj($smer);
        if ($smer == \Max\Consts::UP) {
            if ($this->getDokument()) {
                $this->getDokument()->preracunaj(\Max\Consts::UP);
            }
        }
    }

    public function validate($mode = 'update')
    {
        $this->validateEuroGE0($this->strosekOdkPred, "Strošek odkupa predstave", 1000433);

        if ($this->getDokument()) {
            // preveriti, ali že obstaja programgostujoča z isto uprizoritvijo
            $obstaja = true;  //init
            if (!$this->getDokument()->getGostujoci()->isEmpty()) {
                $id      = $this->getId();
                $obstaja = $this->getDokument()
                        ->getGostujoci()
                        ->exists(function($key, $progGostujoca) use(&$id) {
                    return ($progGostujoca->getUprizoritev() == $this->getUprizoritev()) && ($progGostujoca->getId() !== $id);     //vrne true, če obstaja drug programGostujoča z isto uprizoritvijo
                });
                $this->expect(!$obstaja, "Program gostujoča z isto uprizoritvijo že obstaja v programu dela", 1000430);
            }
        }
        $this->expect(!($this->getTipProgramskeEnote()), "Tip programske enote obstaja, a ne sme obstajati za gostujočo", 1000431);

        $zaproseno    = \Max\Functions::euroRoundS($this->zaproseno);
        $maxZaproseno = \Max\Functions::euroRoundS(0.50 * $this->strosekOdkPred);
        // glede na procent upravičenih stroškov
        $this->expect($zaproseno <= $maxZaproseno, "Zaprošeno (" . $zaproseno . ") je lahko največ 50% stroška odkupa predstave (" . $maxZaproseno . ")", 1000432);

        parent::validate();
    }

    public function getDokument()
    {
        return $this->dokument;
    }

    public function setDokument(\ProgramDela\Entity\ProgramDela $dokument)
    {
        $this->dokument = $dokument;
        return $this;
    }

    function getStrosekOdkPred()
    {
        return $this->strosekOdkPred;
    }

    function setStrosekOdkPred($strosekOdkPred)
    {
        $this->strosekOdkPred = $strosekOdkPred;
    }

}
