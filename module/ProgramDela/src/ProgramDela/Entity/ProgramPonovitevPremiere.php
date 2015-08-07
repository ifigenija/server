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

    /**
     * preračuna polja, ki se uporabljajo v matični koprodukciji
     * 
     * naš delež in ostala polja kot zaprošeno morajo biti nastavljena še predno se prenesejo v matično koprodukcijo
     */
    public function preracunajPoljaZaMatKoprodukcijo()
    {
        // že sam klient zagotavlja, da so vsi zneski na 2 decimalki
        $this->nasDelez = $this->avtorskiHonorarji + $this->tantieme + $this->avtorskePravice + $this->materialni;
    }

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

    public function setDokument(\ProgramDela\Entity\ProgramDela $dokument)
    {
        $this->dokument = $dokument;
        return $this;
    }

}
