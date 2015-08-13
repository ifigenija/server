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
        $this->setNaziv("");        // dobimo iz uprizoritve ?
        $this->setStZaposlenih(0);
        $this->setPonoviInt(0);
        $this->setObiskInt(0);

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
        $this->expect($this->getUprizoritev(), "Uprizoritev je obvezen podatek", 1000562);
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
                $this->expect(!$obstaja, "Program premiere z isto uprizoritvijo že obstaja v programu dela", 1000560);
            }
        }

        $zaproseno    = \Max\Functions::euroRoundS($this->zaproseno);
        $maxZaproseno = \Max\Functions::euroRoundS(0.60 * ($this->avtorskiHonorarji + $this->tantieme));
        // glede na procent upravičenih stroškov
        $this->expect($zaproseno <= $maxZaproseno, "Zaprošeno (" . $zaproseno . ") je lahko največ 60% vsote avt.honor in tantiem (" . $maxZaproseno . ")", 1000561);

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
