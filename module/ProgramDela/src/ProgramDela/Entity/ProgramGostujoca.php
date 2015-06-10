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
     * @Max\Ui(type="toone")
     * @var \ProgramDela\Entity\ProgramDela
     */
    private $dokument;

    public function validate($mode = 'update')
    {
        // neaktualna polja, ki tudi v formi niso:
        $this->expect(!($this->getTipProgramskeEnote()), "Tip programske enote obstaja, a ne sme obstajati za gostujočo", 1000431);
        $this->setAvtorskiHonorarji(0);
        $this->setTantieme(0);
        $this->setObiskGost(0);
        $this->setObiskZamejo(0);
        $this->setObiskInt(0);
        $this->setPonoviZamejo(0);
        $this->setPonoviGost(0);
        $this->setPonoviInt(0);

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
