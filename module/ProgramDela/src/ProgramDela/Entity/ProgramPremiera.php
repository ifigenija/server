<?php

namespace ProgramDela\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;
use Doctrine\Common\Collections\Criteria;

/**
 * @ORM\Entity(repositoryClass="ProgramDela\Repository\ProgramiPremiere")
 * @Max\Id(prefix="0047")
 */
class ProgramPremiera
        extends \ProgramDela\Entity\EnotaPrograma
{

    /**
     * @ORM\ManyToOne(targetEntity="ProgramDela\Entity\ProgramDela", inversedBy="premiere")
     * @ORM\JoinColumn(name="program_dela_id", referencedColumnName="id")
     * @Max\I18n(label="programPremiera.dokument",  description="Dokument")
     * @Max\I18n(label="programPremiera.dokument",  description="programPremiera.d.dokument")
     * @Max\Ui(type="hiddenid")
     * @var \ProgramDela\Entity\ProgramDela
     */
    protected $dokument;

    public function preracunaj($smer = false)
    {
        // neaktualna polja, ki jih tudi v formi ni:
        $this->setStZaposlenih(0);
        $this->setCelotnaVrednostMat(0);
        $this->setCelotnaVrednostGostovSZ(0);
        $this->setObiskGost(0);
        $this->setObiskZamejo(0);
        $this->setObiskInt(0);
        $this->setPonoviZamejo(0);
        $this->setPonoviGost(0);
        $this->setPonoviInt(0);
        $this->setVlozekGostitelja(0);
        $this->setNaziv("");        // dobimo iz uprizoritve

        $this->setPonoviDoma(1);        // le premiera

        parent::preracunaj($smer);
        if ($smer == \Max\Consts::UP) {
            if ($this->getDokument()) {
                $this->getDokument()->preracunaj(\Max\Consts::UP);
            }
        }
    }
    
    public function validate($mode = 'update')
    {
        if ($this->getDokument()) {
// preveriti, ali že obstaja programpremiere z isto uprizoritvijo
            $obstaja = true;  //init
            if (!$this->getDokument()->getPremiere()->isEmpty()) {
                $id      = $this->getId();
                $obstaja = $this->getDokument()
                        ->getPremiere()
                        ->exists(function($key, $progPremiere) use(&$id) {
                    return (!empty($this->getUprizoritev())) && ($progPremiere->getUprizoritev() == $this->getUprizoritev()) && ($progPremiere->getId() !== $id
                            );     //vrne true, če obstaja drug programpremiere z isto uprizoritvijo
                });
                $this->expect(!$obstaja, "Program premiere z isto uprizoritvijo že obstaja v programu dela", 1000440);
            }
        }

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
