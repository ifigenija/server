<?php

namespace ProgramDela\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;

/**
 * Mednarodno gostovanje
 * 
 * @ORM\Entity(repositoryClass="ProgramDela\Repository\ProgramiGostovanje")
 * @Max\I18n(label="Program gostovanje",plural="Programi gostovanje")
 * @Max\Id(prefix="0045")
 */
class ProgramGostovanje
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID programa gostovanja")
     * @Max\Ui(type="id")
     * @var string    
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Uprizoritev")
     * @Max\I18n(label="entiteta.uprizoritev", description="entiteta.uprizoritev")   
     * @Max\Ui(type="toone")
     * @var \Produkcija\Entity\Uprizoritev
     */
    private $uprizoritev;

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
     * @ORM\Column(type="integer", nullable=false, options={"default":" 0"})
     * @Max\I18n(label="gostovanje.stPonovitev", description="ostovanje.d.stPonovitev")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    private $stPonovitev;

    /**
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="gostovanje.stGledalcev", description="gostovanje.d.stGledalcev")
     * @Max\Ui(type="integer")
     * @var integer     
     */
    private $stGledalcev;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="ep.zaproseno", description="ep.d.zaproseno")   
     * @var double
     */
    private $zaproseno;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="ep.celotnaVrednost", description="ep.d.celotnaVrednost")   
     * @var double
     */
    private $celotnaVrednost;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2)
     * @Max\I18n(label="gostovanje.transportniStroski", description="gostovanje.d.transportniStroski")   
     * @var double     
     */
    private $transportniStroski;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2)
     * @Max\I18n(label="gostovanje.stroskiAvtorZun", description="gostovanje.stroskiAvtorZun")   
     * @var double     
     */
    private $stroskiAvtorZun;

    /**
     * @ORM\Column(type="decimal", nullable=true, precision=15, scale=2)
     * @Max\I18n(label="gostovanje.odkup", description="gostovanje.d.odkup")   
     * @var double     
     */
    private $odkup;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="ep.lastnaSredstva", description="ep.lastnaSredstva")   
     * @var double
     */
    private $lastnaSredstva;

    /**
     * $$ manjka opredelitev. Ali je potrebno specificirati druge vire (npr. pari string, double)? 
     * 
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="ep.drugiViri", description="ep.drugiViri")   
     * @var double
     */
    private $drugiViri;

    /**
     * $$ Ali dovolj le ena vrednos  ali je potrebno specificirati vire (npr. pari string, double)? 
     * 
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="gostovanje.viriDMinLok", description="gostovanje.d.viriDMinLok")   
     * @var double
     */
    private $viriDMinLok;

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

    public function getUprizoritev()
    {
        return $this->uprizoritev;
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

    public function getStPonovitev()
    {
        return $this->stPonovitev;
    }

    public function getStGledalcev()
    {
        return $this->stGledalcev;
    }

    public function getZaproseno()
    {
        return $this->zaproseno;
    }

    public function getCelotnaVrednost()
    {
        return $this->celotnaVrednost;
    }

    public function getTransportniStroski()
    {
        return $this->transportniStroski;
    }

    public function getStroskiAvtorZun()
    {
        return $this->stroskiAvtorZun;
    }

    public function getOdkup()
    {
        return $this->odkup;
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

    public function getDokument()
    {
        return $this->dokument;
    }

    public function getGostitelj()
    {
        return $this->gostitelj;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setUprizoritev(\Produkcija\Entity\Uprizoritev $uprizoritev)
    {
        $this->uprizoritev = $uprizoritev;
        return $this;
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

    public function setStPonovitev($stPonovitev)
    {
        $this->stPonovitev = $stPonovitev;
        return $this;
    }

    public function setStGledalcev($stGledalcev)
    {
        $this->stGledalcev = $stGledalcev;
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

    public function setTransportniStroski($transportniStroski)
    {
        $this->transportniStroski = $transportniStroski;
        return $this;
    }

    public function setStroskiAvtorZun($stroskiAvtorZun)
    {
        $this->stroskiAvtorZun = $stroskiAvtorZun;
        return $this;
    }

    public function setOdkup($odkup)
    {
        $this->odkup = $odkup;
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
