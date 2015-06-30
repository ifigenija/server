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
    private $krajGostovanja;

    /**
     * @ORM\Column(type="string", nullable=false)
     * @Max\I18n(label="gostovanje.ustanova", description="gostovanje.d.ustanova")
     * @var string
     */
    private $ustanova;

    /**
     * 
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="gostovanje.datumGostovanja", description="gostovanje.datumGostovanja")
     * @var string
     */
    private $datumGostovanja;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2)
     * @Max\I18n(label="gostovanje.transportniStroski", description="gostovanje.d.transportniStroski")   
     * @var double     
     */
    private $transportniStroski;

    /**
     * @ORM\Column(type="decimal", nullable=true, precision=15, scale=2)
     * @Max\I18n(label="gostovanje.odkup", description="gostovanje.d.odkup")   
     * @var double     
     */
    private $odkup;

    /**
     * @ORM\ManyToOne(targetEntity="ProgramDela\Entity\ProgramDela", inversedBy="gostovanja")
     * @ORM\JoinColumn(name="program_dela_id", referencedColumnName="id")
     * @Max\I18n(label="gostovanje.programDela", description="gostovanje.programDela")
     * @Max\Ui(type="hidden")
     * @var \ProgramDela\Entity\ProgramDela
     */
    private $dokument;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Popa")
     * @ORM\JoinColumn(name="gostitelj_id", referencedColumnName="id")
     * @Max\I18n(label="gostovanje.gostitelj", description="gostovanje.d.gostitelj")
     * @Max\Ui(type="toone")
     * @var \App\Entity\Popa
     */
    private $gostitelj;

    public function validate($mode = 'update')
    {
        // neaktualna polja, ki jih tudi v formi ni:
        $this->expect(!($this->getTipProgramskeEnote()), "Tip programske enote obstaja, a ne sme obstajati za gostovanje", 1000441);
        $this->setObiskDoma(0);
        $this->setObiskGost(0);
        $this->setObiskZamejo(0);
        $this->setPonoviDoma(0);
        $this->setPonoviZamejo(0);
        $this->setPonoviGost(0);
        $this->setStHonorarnih(0);
        $this->setStHonorarnihIgr(0);
        $this->setStHonorarnihIgrTujJZ(0);
        $this->setStDrugih(0);
        $this->setStZaposlenih(0);
        $this->setTantieme(0);
        $this->setUtemeljitev("");
        $this->setVlozekGostitelja(0);
        $this->setVlozekKoproducenta(0);
        $this->setNaziv("");        // dobimo iz uprizoritve

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

    public function getOdkup()
    {
        return $this->odkup;
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

    public function setOdkup($odkup)
    {
        $this->odkup = $odkup;
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

}
