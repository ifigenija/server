<?php

namespace ProgramDela\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="ProgramDela\Repository\ProgramiIzjemni")
 * @Max\Id(prefix="0046")
 */
class ProgramIzjemni
        extends \ProgramDela\Entity\EnotaPrograma
{

    /**
     * @ORM\ManyToOne(targetEntity="ProgramDela\Entity\ProgramDela", inversedBy="izjemni")
     * @ORM\JoinColumn(name="program_dela_id", referencedColumnName="id")
     * @Max\I18n(label="programIzjemni.dokument",  description="Dokument")
     * @Max\Ui(type="hiddenid")
     * @var \ProgramDela\Entity\ProgramDela
     */
    protected $dokument;

    public function preracunaj($smer = false)
    {
        // neaktualna polja, ki jih tudi v formi ni:
        $this->setCelotnaVrednostMat(0);
        $this->setCelotnaVrednostGostovSZ(0);
        $this->setStZaposUmet(0);
        $this->setStZaposDrug(0);
        $this->setVlozekGostitelja(0);

        parent::preracunaj($smer);
        if ($smer == \Max\Consts::UP) {
            if ($this->getDokument()) {
                $this->getDokument()->preracunaj(\Max\Consts::UP);
            }
        }
    }

    public function validate($mode = 'update')
    {
        $this->expect(!($this->getTipProgramskeEnote()), "Tip programske enote obstaja, a ne sme obstajati za program festival", 1000461);
        $this->expect(!($this->getUprizoritev()), "Uprizoritev obstaja, a ne sme obstajati za program festival", 1000462);

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

}
