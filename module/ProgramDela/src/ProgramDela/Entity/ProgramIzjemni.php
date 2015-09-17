<?php

namespace ProgramDela\Entity;

use Doctrine\ORM\Mapping as ORM;
use Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="ProgramDela\Repository\ProgramiIzjemni")
 * @Max\Id(prefix="0046")
 */
class ProgramIzjemni
        extends EnotaPrograma
{

    /**
     * @ORM\ManyToOne(targetEntity="ProgramDela\Entity\ProgramDela", inversedBy="izjemni")
     * @ORM\JoinColumn(name="program_dela_id", referencedColumnName="id")
     * @Max\I18n(label="programIzjemni.dokument",  description="Dokument")
     * @Max\Ui(type="hiddenid")
     * @var \ProgramDela\Entity\ProgramDela
     */
    protected $dokument;

    /**
     * preračuna polja, ki se uporabljajo v matični koprodukciji
     * 
     * naš delež in ostala polja kot zaprošeno morajo biti nastavljena še predno se prenesejo v matično koprodukcijo
     */
    public function preracunajPoljaZaMatKoprodukcijo()
    {
        $this->nasDelez = $this->avtorskiHonorarji + $this->tantieme + $this->avtorskePravice + $this->materialni;
    }

    public function preracunaj($smer = false)
    {
        // neaktualna polja, ki jih tudi v formi ni:
        $this->celotnaVrednostGostovSZ = 0;
        $this->stZaposUmet             = 0;
        $this->stZaposDrug             = 0;
        $this->vlozekGostitelja        = 0;
        $this->obiskKopr               = 0;
        $this->ponoviKopr              = 0;
        $this->obiskKoprInt            = 0;
        $this->ponoviKoprInt           = 0;
        $this->kpe                     = 0;

        $this->preracunajPoljaZaMatKoprodukcijo();

        parent::preracunaj($smer);
        if ($smer == \Max\Consts::UP) {
            if ($this->getDokument()) {
                $this->getDokument()->preracunaj(\Max\Consts::UP);
            }
        }
    }

    public function validate($mode = 'update')
    {
        $this->expect(!($this->getTipProgramskeEnote()), "Tip programske enote obstaja, a ne sme obstajati za program izjemni", 1000541);
        $this->expect(!($this->getUprizoritev()), "Uprizoritev obstaja, a ne sme obstajati za program izjemni", 1000542);
        $this->expect($this->getNaziv(), "Naziv ne sme biti prazen", 1000545);

        $nd     = \Max\Functions::euroRoundS($this->getNasDelez());
        $sumStr = \Max\Functions::euroRoundS($this->avtorskiHonorarji + $this->tantieme + $this->avtorskePravice + $this->materialni);
        $this->expect($nd >= $sumStr, "Našega delež (" . $nd . ") mora biti večji ali enak vsoti avtorskih honor, tantiem, avt.pravic in mat. str. (" . $sumStr . ")", 1000543);

        $zaproseno    = \Max\Functions::euroRoundS($this->zaproseno);
        $maxZaproseno = \Max\Functions::euroRoundS(1.00 * $this->nasDelez);
        // glede na procent upravičenih stroškov
        $this->expect($zaproseno <= $maxZaproseno, "Zaprošeno (" . $zaproseno . ") je lahko največ 100% deleža mat. JZ(" . $maxZaproseno . ")", 1000544);

        parent::validate();
    }

    public function getDokument()
    {
        return $this->dokument;
    }

    public function setDokument(\ProgramDela\Entity\ProgramDela $dokument=null)
    {
        $this->dokument = $dokument;
        return $this;
    }

}
