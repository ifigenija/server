<?php

namespace ProgramDela\Entity;

use Doctrine\ORM\Mapping as ORM;
use Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="ProgramDela\Repository\ProgramiPonovitevPremiere")
 * @Max\Id(prefix="0048")
 */
class ProgramPonovitevPremiere
        extends EnotaPrograma
{

    /**
     * @ORM\ManyToOne(targetEntity="ProgramDela\Entity\ProgramDela", inversedBy="ponovitvePremiere")
     * @ORM\JoinColumn(name="program_dela_id", referencedColumnName="id")
     * @Max\I18n(label="programPonovitevPremiere.dokument",  description="Dokument")
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
        // že sam klient zagotavlja, da so vsi zneski na 2 decimalki
        $this->nasDelez = $this->avtorskiHonorarji + $this->tantieme + $this->materialni;
    }

    public function preracunaj($smer = false)
    {
        // neaktualna polja, ki jih tudi v formi ni:
        $this->avtorskePravice = 0;
        $this->stZaposlenih    = 0;
        $this->ponoviKoprInt   = 0;
        $this->ponoviInt       = 0;
        $this->obiskKoprInt    = 0;
        $this->obiskInt        = 0;
        $this->kpe             = 0;
        $this->naziv           = "";        // dobimo iz uprizoritve

        /**
         * ne velja za ponov. prejšnjih:
         */
        $this->stZaposUmet             = 0;
        $this->stZaposDrug             = 0;
        $this->stHonorarnihZun         = 0;
        $this->stHonorarnihZunIgr      = 0;
        $this->stHonorarnihZunIgrTujJZ = 0;
        $this->stHonorarnihZunSamoz    = 0;

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
        $this->expect($this->getUprizoritev(), "Uprizoritev je obvezen podatek", 1000452);
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

        $zaproseno    = \Max\Functions::euroRoundS($this->zaproseno);
        $maxZaproseno = \Max\Functions::euroRoundS(0.70 * ($this->avtorskiHonorarji + $this->tantieme));
        // glede na procent upravičenih stroškov
        $this->expect($zaproseno <= $maxZaproseno, "Zaprošeno (" . $zaproseno . ") je lahko največ 70% vsote avt.honor in tantiem (" . $maxZaproseno . ")", 1000452);

        parent::validate();
    }

    public function getDokument()
    {
        return $this->dokument;
    }

    public function setDokument(\ProgramDela\Entity\ProgramDela $dokument = null)
    {
        $this->dokument = $dokument;
        return $this;
    }

}
