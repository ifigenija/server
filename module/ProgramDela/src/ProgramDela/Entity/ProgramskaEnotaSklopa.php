<?php

namespace ProgramDela\Entity;

use Doctrine\ORM\Mapping as ORM;
use Max\Ann\Entity as Max;
use Max\Entity\Base;

/**
 * @ORM\Entity(repositoryClass="ProgramDela\Repository\ProgramskeEnoteSklopa")
 * @Max\Id(prefix="0052")
 */
class ProgramskaEnotaSklopa
        extends Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID poštnega naslova")
     * @Max\Ui(type="id")
     * @var string
     */
    protected $id;

    /**
     * @ORM\Column(type="string")
     * @Max\I18n(label="peSklopa.naslovPE", description="peSklopa.d.naslovPE")
     * @var string
     */
    protected $naslovPE;

    /**
     * @ORM\Column(type="string")
     * @Max\I18n(label="peSklopa.avtorPE", description="peSklopa.d.avtorPE")
     * @var string
     */
    protected $avtorPE;

    /**
     * @ORM\Column(type="string")
     * @Max\I18n(label="peSklopa.obsegPE", description="peSklopa.d.obsegPE")
     * @Max\Ui(required=false)
     * @var string
     */
    protected $obsegPE;

    /**
     * @ORM\Column(type="string")
     * @Max\I18n(label="peSklopa.mesecPE", description="peSklopa.d.mesecPE")
     * @var string
     */
    protected $mesecPE;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="peSklopa.vrednostPE", description="peSklopa.d.vrednostPE")
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $vrednostPE;

    /**
     * 
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="peSklopa.obiskDoma", description="peSklopa.d.obiskDoma")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    protected $obiskDoma;

    /**
     * 
     * @ORM\Column(type="integer", nullable=false, options={"default":1})
     * @Max\I18n(label="peSklopa.stDogodkov", description="peSklopa.d.stDogodkov")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    protected $stDogodkov;

    /**
     * @ORM\ManyToOne(targetEntity="ProgramDela\Entity\ProgramRazno", inversedBy="programskeEnoteSklopa")
     * @Max\I18n(label="peSklopa.programRazno", description="peSklopa.d.programRazno")   
     * @Max\Ui(type="hiddenid")
     * @var \ProgramDela\Entity\ProgramRazno
     */
    protected $programRazno;

    public function preracunaj($smer = false)
    {
        if ($smer == \Max\Consts::UP) {
            if ($this->getProgramRazno()) {
                $this->getProgramRazno()->preracunaj(\Max\Consts::UP);
            }
        }
    }

    public function validate($mode = 'update')
    {
        $this->expect($this->naslovPE, "Nima naslova PE. Naslov programske enote je obvezen podatek", 1000650);
        $this->validateEuroGE0($this->vrednostPE, "Vrednost PE", 1000651);
        $this->validateIntGE0($this->obiskDoma, "", 1000652);
        $this->validateIntGE0($this->stDogodkov, "", 1000653);
    }

    public function getId()
    {
        return $this->id;
    }

    public function getNaslovPE()
    {
        return $this->naslovPE;
    }

    public function getAvtorPE()
    {
        return $this->avtorPE;
    }

    public function getObsegPE()
    {
        return $this->obsegPE;
    }

    public function getMesecPE()
    {
        return $this->mesecPE;
    }

    public function getVrednostPE()
    {
        return $this->vrednostPE;
    }

    public function getProgramRazno()
    {
        return $this->programRazno;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setNaslovPE($naslovPE)
    {
        $this->naslovPE = $naslovPE;
        return $this;
    }

    public function setAvtorPE($avtorPE)
    {
        $this->avtorPE = $avtorPE;
        return $this;
    }

    public function setObsegPE($obsegPE)
    {
        $this->obsegPE = $obsegPE;
        return $this;
    }

    public function setMesecPE($mesecPE)
    {
        $this->mesecPE = $mesecPE;
        return $this;
    }

    public function setVrednostPE($vrednostPE)
    {
        $this->vrednostPE = $vrednostPE;
        return $this;
    }

    public function setProgramRazno(\ProgramDela\Entity\ProgramRazno $programRazno = null)
    {
        $this->programRazno = $programRazno;
        return $this;
    }

    public function getObiskDoma()
    {
        return $this->obiskDoma;
    }

    public function setObiskDoma($obiskDoma)
    {
        $this->obiskDoma = $obiskDoma;
        return $this;
    }

    function getStDogodkov()
    {
        return $this->stDogodkov;
    }

    function setStDogodkov($stDogodkov)
    {
        $this->stDogodkov = $stDogodkov;
        return $this;
    }

}
