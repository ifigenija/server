<?php

namespace ProgramDela\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;

/**
 * Mednarodno gostovanje
 * 
 * @ORM\Entity(repositoryClass="ProgramDela\Repository\ProgramiGostovanje")
 * @Max\Id(prefix="0045")
 */
class ProgramGostovanje
        extends \ProgramDela\Entity\EnotaPrograma
{

    /**
     * @ORM\Column(type="string", nullable=false)
     * @Max\I18n(label="gostovanje.krajGostovanja", description="gostovanje.d.krajGostovanja")
     * @var string
     */
    protected $krajGostovanja;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Drzava")
     * @Max\I18n(label="gostovanje.drzava",  description="gostovanje.d.drzava")
     * @Max\Ui(type="toone")
     * @var \App\Entity\Drzava
     */
    protected $drzavaGostovanja;

    /**
     * @ORM\Column(type="string", nullable=false)
     * @Max\I18n(label="gostovanje.ustanova", description="gostovanje.d.ustanova")
     * @var string
     */
    protected $ustanova;

    /**
     * 
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="gostovanje.datumGostovanja", description="gostovanje.d.datumGostovanja")
     * @var string
     */
    protected $datumGostovanja;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2)
     * @Max\I18n(label="gostovanje.transportniStroski", description="gostovanje.d.transportniStroski")   
     * @var double     
     */
    protected $transportniStroski;

    /**
     * dnevnice za prvi in zadnji dan
     * 
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2)
     * @Max\I18n(label="gostovanje.dnevPrvZad", description="gostovanje.d.dnevPrvZad")   
     * @var double     
     */
    protected $dnevPrvZad;

    /**
     * @ORM\ManyToOne(targetEntity="ProgramDela\Entity\ProgramDela", inversedBy="gostovanja")
     * @ORM\JoinColumn(name="program_dela_id", referencedColumnName="id")
     * @Max\I18n(label="gostovanje.programDela", description="gostovanje.d.programDela")
     * @Max\Ui(type="hiddenid")
     * @var \ProgramDela\Entity\ProgramDela
     */
    protected $dokument;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Popa")
     * @ORM\JoinColumn(name="gostitelj_id", referencedColumnName="id")
     * @Max\I18n(label="gostovanje.gostitelj", description="gostovanje.d.gostitelj")
     * @Max\Ui(type="toone")
     * @var \App\Entity\Popa
     */
    protected $gostitelj;

    /**
     * preračuna polja, ki se uporabljajo v matični koprodukciji
     * 
     * naš delež in ostala polja kot zaprošeno morajo biti nastavljena še predno se prenesejo v matično koprodukcijo
     */
    public function preracunajPoljaZaMatKoprodukcijo()
    {
        $this->nasDelez = $this->avtorskiHonorarji + $this->tantieme + $this->avtorskePravice + $this->materialni + $this->transportniStroski + $this->dnevPrvZad;
    }

    public function preracunaj($smer = false)
    {
        // neaktualna polja, ki jih tudi v formi ni:
        $this->setCelotnaVrednostGostovSZ(0);
        $this->setObiskDoma(0);
        $this->setObiskGost(0);
        $this->setObiskZamejo(0);
        $this->setPonoviDoma(0);
        $this->setPonoviZamejo(0);
        $this->setPonoviGost(0);
        $this->setStHonorarnih(0);
        $this->setStHonorarnihIgr(0);
        $this->setStHonorarnihIgrTujJZ(0);
        $this->setStZaposlenih(0);
        $this->setStZaposUmet(0);
        $this->setStZaposDrug(0);
        $this->setNaziv("");        // dobimo iz uprizoritve

        $this->preracunajPoljaZaMatKoprodukcijo();

        parent::preracunaj($smer);
        if ($smer == \Max\Consts::UP) {
            if ($this->getDokument()) {
                $this->getDokument()->preracunaj(\Max\Consts::UP);
            }
        }
        $this->celotnaVrednostMat = 0;    // izjema pri gostovanju - ponovno damo na 0 po tem, ko je preracunaj za enoto programa izveden
    }

    public function validate($mode = 'update')
    {
        $this->expect($this->getUprizoritev(), "Uprizoritev je obvezen podatek", 1001303);
        $this->expect($this->getGostitelj(), "Gostitelj je obvezen podatek", 1001304);
        $this->expect($this->getDrzavaGostovanja(), "Država gostovanja je obvezen podatek", 1001305);

        $this->validateEuroGE0($this->transportniStroski, "Transportni stroški", 1001300);
        $this->validateEuroGE0($this->dnevPrvZad, "Dnevnice za prvi in zadnji dan", 1001301);

        $this->expect(!($this->getTipProgramskeEnote()), "Tip programske enote obstaja, a ne sme obstajati za gostovanje", 1001302);

        $zaproseno    = \Max\Functions::euroRoundS($this->zaproseno);
        $maxZaproseno = \Max\Functions::euroRoundS(0.60 * $this->avtorskiHonorarji + 1.00 * $this->transportniStroski + 1.00 * $this->dnevPrvZad);
        // glede na procent upravičenih stroškov
        $this->expect($zaproseno <= $maxZaproseno, "Zaprošeno (" . $zaproseno . ") je lahko največ 60% avtorskih in tantiem in 70% odkupa avtorskih pravic in transportnih stroskov in dnevnic za 1. in zadnji dan (" . $maxZaproseno . ")", 1001304);

        parent::validate();
    }

    public function getKrajGostovanja()
    {
        return $this->krajGostovanja;
    }

    public function getUstanova()
    {
        return $this->ustanova;
    }

    public function getDatumGostovanja()
    {
        return $this->datumGostovanja;
    }

    public function getTransportniStroski()
    {
        return $this->transportniStroski;
    }

    public function getDokument()
    {
        return $this->dokument;
    }

    public function getGostitelj()
    {
        return $this->gostitelj;
    }

    public function setKrajGostovanja($krajGostovanja)
    {
        $this->krajGostovanja = $krajGostovanja;
        return $this;
    }

    public function setUstanova($ustanova)
    {
        $this->ustanova = $ustanova;
        return $this;
    }

    public function setDatumGostovanja($datumGostovanja)
    {
        $this->datumGostovanja = $datumGostovanja;
        return $this;
    }

    public function setTransportniStroski($transportniStroski)
    {
        $this->transportniStroski = $transportniStroski;
        return $this;
    }

    public function setDokument(\ProgramDela\Entity\ProgramDela $dokument)
    {
        $this->dokument = $dokument;
        return $this;
    }

    public function setGostitelj(\App\Entity\Popa $gostitelj)
    {
        $this->gostitelj = $gostitelj;
        return $this;
    }

    public function getDrzavaGostovanja()
    {
        return $this->drzavaGostovanja;
    }

    public function setDrzavaGostovanja(\App\Entity\Drzava $drzavaGostovanja)
    {
        $this->drzavaGostovanja = $drzavaGostovanja;
        return $this;
    }

    function getDnevPrvZad()
    {
        return $this->dnevPrvZad;
    }

    function setDnevPrvZad($dnevPrvZad)
    {
        $this->dnevPrvZad = $dnevPrvZad;
    }

}
