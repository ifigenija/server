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
        $this->stZaposlenih            = 0;
        $this->celotnaVrednostGostovSZ = 0;
        $this->obiskKopr               = 0;
        $this->obiskGost               = 0;
        $this->obiskZamejo             = 0;
        $this->obiskKoprInt            = 0;
        $this->obiskInt                = 0;
        $this->ponoviKopr              = 0;
        $this->ponoviZamejo            = 0;
        $this->ponoviGost              = 0;
        $this->ponoviKoprInt           = 0;
        $this->ponoviInt               = 0;
        $this->vlozekGostitelja        = 0;
        $this->naziv                   = "";        // dobimo iz uprizoritve

        $this->setPonoviDoma(1);        // le premiera
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
        $this->expect(($this->getTipProgramskeEnote()), "Tip programske enote ne obstaja", 1000443);
        $this->expect($this->getUprizoritev(), "Uprizoritev je obvezen podatek", 1000444);


        /**
         * preveri vrednost za tip programske enote
         * - glede na vrednost matičnega
         * - glede na vsoto koproducentov  (v entiteti prod. delitev)
         */
        $this->validateNumberGE0($this->kpe, "Koeficient programske enote", 1000445);
        $kpe       = \Max\Functions::numberRoundS($this->kpe);
        $maxfaktor = \Max\Functions::numberRoundS($this->getTipProgramskeEnote()->getMaxFaktor());
        $this->expect($kpe <= $maxfaktor, "Koeficient programske enote (" . $kpe . ") ne sme biti večji kot maks. koeficient (" . $maxfaktor . ")", 1000446);

        if ($this->getDokument()) {
            /**
             *  preveriti, ali že obstaja programpremiere z isto uprizoritvijo
             */
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

        $zaproseno    = \Max\Functions::euroRoundS($this->zaproseno);
        $maxZaproseno = \Max\Functions::euroRoundS(0.70 * $this->nasDelez);
        // glede na procent upravičenih stroškov
        $this->expect($zaproseno <= $maxZaproseno, "Zaprošeno (" . $zaproseno . ") je lahko največ 70% deleža mat. JZ(" . $maxZaproseno . ")", 1000442);

        parent::validate();
    }

    function getDokument()
    {
        return $this->dokument;
    }

    function setDokument(\ProgramDela\Entity\ProgramDela $dokument)
    {
        $this->dokument = $dokument;
    }

}
