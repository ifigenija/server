<?php

namespace ProgramDela\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="ProgramDela\Repository\ProgramiPonovitevPremiere")
 * @Max\Id(prefix="0048")
 */
class ProgramPonovitevPremiere
        extends \ProgramDela\Entity\EnotaPrograma
{

    /**
     * @ORM\ManyToOne(targetEntity="ProgramDela\Entity\ProgramDela", inversedBy="ponovitvePremiere")
     * @ORM\JoinColumn(name="program_dela_id", referencedColumnName="id")
     * @Max\I18n(label="programPonovitevPremiere.dokument",  description="Dokument")
     * @Max\Ui(type="hiddenid")
     * @var \ProgramDela\Entity\ProgramDela
     */
    protected $dokument;

    public function preracunaj($smer = false)
    {
        // neaktualna polja, ki jih tudi v formi ni:
        $this->setStZaposlenih(0);
        $this->setStZaposUmet(0);
        $this->setStZaposDrug(0);
        $this->setStHonorarnih(0);
        $this->setStHonorarnihIgr(0);
        $this->setStHonorarnihIgrTujJZ(0);
        $this->setPonoviInt(0);
        $this->setObiskInt(0);
        $this->setNaziv("");        // dobimo iz uprizoritve

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
            // preveriti, ali že obstaja program pon. prem. z isto uprizoritvijo
            $obstaja = true;  //init
            if ($this->getDokument()->getPonovitvePremiere()) {
                $id      = $this->getId();
                $obstaja = $this->getDokument()
                        ->getPonovitvePremiere()
                        ->exists(function($key, $ponovitvePremiere) use(&$id) {
                    return ($ponovitvePremiere->getUprizoritev() == $this->getUprizoritev()) && ($ponovitvePremiere->getId() !== $id);     //vrne true, če obstaja drug program pon. prem. z isto uprizoritvijo
                });
                $this->expect(!$obstaja, "Program premiere z isto uprizoritvijo že obstaja v programu dela", 1000450);
            }
        }
        
        $nd     = \Max\Functions::euroRoundS($this->getNasDelez());
        $sumStr = \Max\Functions::euroRoundS($this->avtorskiHonorarji + $this->tantieme + $this->avtorskePravice);
        $this->expect($nd >= $sumStr, "Našega delež (" . $nd . ") mora biti večji ali enak vsoti avtorskih honor, tantiem in avt.pravic (" . $sumStr . ")", 1000451);

        $zaproseno    = \Max\Functions::euroRoundS($this->zaproseno);
        $maxZaproseno = \Max\Functions::euroRoundS(0.70 * ($this->avtorskiHonorarji+$this->tantieme));
        // glede na procent upravičenih stroškov
        $this->expect($nd >= $sumStr, "Zaprošeno (" . $zaproseno . ") je lahko največ 70% vsote avt.honor in tantiem (" . $maxZaproseno . ")", 1000452);

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
