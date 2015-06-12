<?php

namespace ProgramDela\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="ProgramDela\Repository\ProgramiRazno")
 * @Max\I18n(label="Program festival",plural="Programi festival")
 * @Max\Id(prefix="0049")
 */
class ProgramRazno
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID programa festivala")
     * @Max\Ui(type="id")
     * @var string    
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="ProgramDela\Entity\ProgramDela", inversedBy="programiRazno")
     * @ORM\JoinColumn(name="program_dela_id", referencedColumnName="id")
     * @Max\I18n(label="programRazno.dokument", description="Program dela")
     * @Max\Ui(type="hidden")
     * @var \ProgramDela\Entity\ProgramDela
     */
    private $dokument;

    /**
     * @ORM\Column(type="string", nullable=false)
     * @Max\I18n(label="programRazno.nazivSklopa", description="Naziv sklopa")
     * @var string
     */
    private $nazivSklopa;

    /**
     * @ORM\Column(type="string")
     * @Max\I18n(label="programRazno.naslovPE", description="Naslov programske enote")
     * @var string
     */
    private $naslovPE;

    /**
     * @ORM\Column(type="string")
     * @Max\I18n(label="programRazno.avtorPE", description="Avtor programske enote")
     * @var string
     */
    private $avtorPE;

    /**
     * @ORM\Column(type="string")
     * @Max\I18n(label="programRazno.obsegPE", description="Obseg programske enote")
     * @var string
     */
    private $obsegPE;

    /**
     * @ORM\Column(type="string")
     * @Max\I18n(label="programRazno.mesecPE", description="Mesec programske enote")
     * @var string
     */
    private $mesecPE;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="programRazno.vrednostPE", description="Vrednost programske enote")
     * @var double
     */
    private $vrednostPE;

    /**
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="programRazno.stPE", description="Število programskih enot")
     * @Max\Ui(type="integer")
     * @var integer     
     */
    private $stPE;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Popa")
     * @ORM\JoinColumn(name="gostitelj_id", referencedColumnName="id")
     * @Max\I18n(label="programRazno.soorganizator", description="Soorganizator oz. koproducent")
     * @Max\Ui(type="toone")
     * @var \App\Entity\Popa
     */
    private $soorganizator;

    /**
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="programRazno.stObiskovalcev", description="Število obiskovalcev")
     * @Max\Ui(type="integer")
     * @var integer     
     */
    private $stObiskovalcev;

    /**
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="programRazno.stZaposlenih", description="Število zaposlenih, ki sodelujejo pri izvedbi projekta")
     * @Max\Ui(type="integer")
     * @var integer     
     */
    private $stZaposlenih;

    /**
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="programRazno.stHonoranih", description="Število vseh, ki sodelujejo honorarno pri izvjedbi projekta in jim honorar izplačuje javni zavod")
     * @Max\Ui(type="integer")
     * @var integer     
     */
    private $stHonoranih;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="programRazno.zaproseno", description="Zaprošena sredstva Ministrstva za kulturo")   
     * @var double
     */
    private $zaproseno;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="programRazno.celotnaVrednost", description="Celotna vrednost sklopa")   
     * @var double
     */
    private $celotnaVrednost;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="programRazno.lastnaSredstva", description="Lastna sredstva")   
     * @var double
     */
    private $lastnaSredstva;

    /**
     * $$ manjka opredelitev. Ali je potrebno specificirati druge vire (npr. pari string, double)? 
     * 
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="programRazno.drugiViri", description="Drugi viri")   
     * @var double
     */
    private $drugiViri;

    /**
     * $$ Ali dovolj le ena vrednos  ali je potrebno specificirati vire (npr. pari string, double)? 
     * 
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="programRazno.viriDMinLok", description="Viri druga ministrstva in lokalna skupnost")   
     * @var double
     */
    private $viriDMinLok;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="entiteta.sort", description="ep.d.sort")
     * @Max\Ui(type="integer", icon="fa fa-sort")
     * @var integer
     */
    private $sort;

    public function validate($mode = 'update')
    {
        
    }

    public function getId()
    {
        return $this->id;
    }

    public function getDokument()
    {
        return $this->dokument;
    }

    public function getNazivSklopa()
    {
        return $this->nazivSklopa;
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

    public function getStPE()
    {
        return $this->stPE;
    }

    public function getSoorganizator()
    {
        return $this->soorganizator;
    }

    public function getStObiskovalcev()
    {
        return $this->stObiskovalcev;
    }

    public function getStZaposlenih()
    {
        return $this->stZaposlenih;
    }

    public function getStHonoranih()
    {
        return $this->stHonoranih;
    }

    public function getZaproseno()
    {
        return $this->zaproseno;
    }

    public function getCelotnaVrednost()
    {
        return $this->celotnaVrednost;
    }

    public function getLastnaSredstva()
    {
        return $this->lastnaSredstva;
    }

    public function getDrugiViri()
    {
        return $this->drugiViri;
    }

    public function getViriDMinLok()
    {
        return $this->viriDMinLok;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setDokument(\ProgramDela\Entity\ProgramDela $dokument)
    {
        $this->dokument = $dokument;
        return $this;
    }

    public function setNazivSklopa($nazivSklopa)
    {
        $this->nazivSklopa = $nazivSklopa;
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

    public function setStPE($stPE)
    {
        $this->stPE = $stPE;
        return $this;
    }

    public function setSoorganizator(\App\Entity\Popa $soorganizator)
    {
        $this->soorganizator = $soorganizator;
        return $this;
    }

    public function setStObiskovalcev($stObiskovalcev)
    {
        $this->stObiskovalcev = $stObiskovalcev;
        return $this;
    }

    public function setStZaposlenih($stZaposlenih)
    {
        $this->stZaposlenih = $stZaposlenih;
        return $this;
    }

    public function setStHonoranih($stHonoranih)
    {
        $this->stHonoranih = $stHonoranih;
        return $this;
    }

    public function setZaproseno($zaproseno)
    {
        $this->zaproseno = $zaproseno;
        return $this;
    }

    public function setCelotnaVrednost($celotnaVrednost)
    {
        $this->celotnaVrednost = $celotnaVrednost;
        return $this;
    }

    public function setLastnaSredstva($lastnaSredstva)
    {
        $this->lastnaSredstva = $lastnaSredstva;
        return $this;
    }

    public function setDrugiViri($drugiViri)
    {
        $this->drugiViri = $drugiViri;
        return $this;
    }

    public function setViriDMinLok($viriDMinLok)
    {
        $this->viriDMinLok = $viriDMinLok;
        return $this;
    }

    public function getSort()
    {
        return $this->sort;
    }

    public function setSort($sort)
    {
        $this->sort = $sort;
        return $this;
    }

}
