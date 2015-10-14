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
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="programIzjemni.prizorisce", description="programIzjemni.d.prizorisce")
     * @Max\Ui(type="naziv",required=true)
     * @var string
     */
    protected $prizorisce;

    /**
     * Trajanje priprave dogodka (od-do)
     * 
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="programIzjemni.trajanje", description="programIzjemni.d.trajanje")
     * @Max\Ui(type="naziv",required=true)
     * @var string
     */
    protected $trajanje;

    /**
     * @ORM\Column(type="string")
     * @Max\I18n(label="programIzjemni.zvrst", description="programIzjemni.d.zvrst")
     * @var string
     */
    protected $zvrst;

    /**
     * @ORM\Column(type="string")
     * @Max\I18n(label="programIzjemni.avtor", description="programIzjemni.d.avtor")
     * @var string
     */
    protected $avtor;

    /**
     * @ORM\Column(type="string")
     * @Max\I18n(label="programIzjemni.reziser", description="programIzjemni.d.reziser")
     * @var string
     */
    protected $reziser;

    /**
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="programIzjemni.datum", description="programIzjemni.d.datum")
     * @var string
     */
    protected $datum;

    /**
     * Drugi pomembni soustvarjalci dogodka:
     * 
     * @ORM\Column(type="string")
     * @Max\I18n(label="programIzjemni.soustvarjalci", description="programIzjemni.d.soustvarjalci")
     * @var string
     */
    protected $soustvarjalci;

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
        $this->expect($this->getTrajanje(), "Trajanje ne sme biti prazno", 1000546);
        $this->expect($this->getPrizorisce(), "Prizorišče ne sme biti prazno", 1000547);
        $this->expect($this->getZvrst(), "Zvrst je obvezen podatek", 1000548);
        $this->expect($this->getAvtor(), "Avtor je obvezen podatek", 1001230);
        $this->expect($this->getReziser(), "Režiser je obvezen podatek", 1001231);
        $this->expect($this->getDatum(), "Datum je obvezen podatek", 1001232);

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

    public function setDokument(\ProgramDela\Entity\ProgramDela $dokument = null)
    {
        $this->dokument = $dokument;
        return $this;
    }

    public function getPrizorisce()
    {
        return $this->prizorisce;
    }

    public function setPrizorisce($prizorisce)
    {
        $this->prizorisce = $prizorisce;
        return $this;
    }

    public function getTrajanje()
    {
        return $this->trajanje;
    }

    public function setTrajanje($trajanje)
    {
        $this->trajanje = $trajanje;
        return $this;
    }

    function getZvrst()
    {
        return $this->zvrst;
    }

    function getAvtor()
    {
        return $this->avtor;
    }

    function getReziser()
    {
        return $this->reziser;
    }

    function getDatum()
    {
        return $this->datum;
    }

    function setZvrst($zvrst)
    {
        $this->zvrst = $zvrst;
        return $this;
    }

    function setAvtor($avtor)
    {
        $this->avtor = $avtor;
        return $this;
    }

    function setReziser($reziser)
    {
        $this->reziser = $reziser;
        return $this;
    }

    function setDatum($datum)
    {
        $this->datum = $datum;
        return $this;
    }

    function getSoustvarjalci()
    {
        return $this->soustvarjalci;
    }

    function setSoustvarjalci($soustvarjalci)
    {
        $this->soustvarjalci = $soustvarjalci;
        return $this;
    }

}
