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
     * @Max\I18n(label="gostovanje.krajGostovanja", description="gostovanje.krajGostovanja")
     * @var string
     */
    protected $krajGostovanja;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Drzava")
     * @Max\I18n(label="Država",  description="Država")
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
     * @Max\I18n(label="gostovanje.datumGostovanja", description="gostovanje.datumGostovanja")
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
     * @Max\I18n(label="gostovanje.programDela", description="gostovanje.programDela")
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
        $this->expect(!($this->getTipProgramskeEnote()), "Tip programske enote obstaja, a ne sme obstajati za gostovanje", 1000441);

        $nd     = \Max\Functions::euroRoundS($this->getNasDelez());
        $sumStr = \Max\Functions::euroRoundS($this->avtorskiHonorarji + $this->tantieme + $this->avtorskePravice + $this->transportniStroski + $this->dnevPrvZad);
        $this->expect($nd >= $sumStr, "Našega delež (" . $nd . ") mora biti večji ali enak vsoti avtorskih honor, tantiem, avt.pravic, transp. str. in dnevnic za 1. in zadnji dan (" . $sumStr . ")", 1000441);

        $zaproseno    = \Max\Functions::euroRoundS($this->zaproseno);
        $maxZaproseno = \Max\Functions::euroRoundS(0.60 * $this->avtorskiHonorarji + 0.60 * $this->tantieme+ 0.70 * $this->avtorskePravice+ 1.00 * $this->transportniStroski + 1.00 * $this->dnevPrvZad);
        // glede na procent upravičenih stroškov
        $this->expect($zaproseno <= $maxZaproseno, "Zaprošeno (" . $zaproseno . ") je lahko največ 60% avtorskih in tantiem in 70% odkupa avtorskih pravic in transportnih stroskov in dnevnic za 1. in zadnji dan (" . $maxZaproseno . ")", 1000442);

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
