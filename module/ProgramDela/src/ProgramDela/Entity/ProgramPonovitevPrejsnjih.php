<?php

namespace ProgramDela\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="ProgramDela\Repository\ProgramiPonovitevPrejsnjih")
 * @Max\Id(prefix="0050")
 */
class ProgramPonovitevPrejsnjih
        extends \ProgramDela\Entity\EnotaPrograma
{

    /**
     * @ORM\ManyToOne(targetEntity="ProgramDela\Entity\ProgramDela", inversedBy="ponovitvePrejsnjih")
     * @ORM\JoinColumn(name="program_dela_id", referencedColumnName="id")
     * @Max\I18n(label="programPonovitevPrejsnjih.dokument",  description="Dokument")
     * @Max\Ui(type="hiddenid")
     * @var \ProgramDela\Entity\ProgramDela
     */
    protected $dokument;

    public function preracunaj($smer = false)
    {
        $this->setNaziv("");        // dobimo iz uprizoritve ?
        $this->setStZaposlenih(0);
        $this->setPonoviInt(0);
        $this->setObiskInt(0);

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
            // preveriti, ali že obstaja program pon. prejšnjih z isto uprizoritvijo
            $obstaja = true;  //init
            if ($this->getDokument()->getPonovitvePrejsnjih()) {
                $id      = $this->getId();
                $obstaja = $this->getDokument()
                        ->getPonovitvePrejsnjih()
                        ->exists(function($key, $ponovitvePrejsnjih) use(&$id) {
                    return ($ponovitvePrejsnjih->getUprizoritev() == $this->getUprizoritev()) && ($ponovitvePrejsnjih->getId() !== $id);     //vrne true, če obstaja drug program pon. pr. z isto uprizoritvijo
                });
                $this->expect(!$obstaja, "Program premiere z isto uprizoritvijo že obstaja v programu dela", 1000460);
            }
        }

        $nd     = \Max\Functions::euroRoundS($this->getNasDelez());
        $sumStr = \Max\Functions::euroRoundS($this->avtorskiHonorarji + $this->tantieme + $this->avtorskePravice +$this->materialni);
        $this->expect($nd >= $sumStr, "Našega delež (" . $nd . ") mora biti večji ali enak vsoti avtorskih honor., tantiem, avt.pravic in mat. stroškov (" . $sumStr . ")", 1000461);   //$$ morda lahko pride do te napake zaradi napake v izračunih in zaokrožitvah če v UI vnašajo več kot na 2 decimalki?

        $zaproseno    = \Max\Functions::euroRoundS($this->zaproseno);
        $maxZaproseno = \Max\Functions::euroRoundS(0.60 * ($this->avtorskiHonorarji+$this->tantieme));
        // glede na procent upravičenih stroškov
        $this->expect($zaproseno <= $maxZaproseno, "Zaprošeno (" . $zaproseno . ") je lahko največ 60% vsote avt.honor in tantiem (" . $maxZaproseno . ")", 1000462);
        
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
