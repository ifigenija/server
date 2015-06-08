<?php

namespace ProgramDela\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="ProgramDela\Repository\EnotePrograma")
 * @ORM\InheritanceType("SINGLE_TABLE")
 * @ORM\DiscriminatorColumn(name="tip", length=15, type="string")
 * @ORM\DiscriminatorMap(
 *     {
 *     "premiera"="ProgramDela\Entity\ProgramPremiera",
 *     "ponovitev"="ProgramDela\Entity\ProgramPonovitev",
 *     "izjemni"="ProgramDela\Entity\ProgramIzjemni",
 *     "gostujoci"="ProgramDela\Entity\ProgramGostujoca"
 * }
 * )
 * 
 * @Max\I18n(label="Enota programa",plural="Enote programa")
 * @Max\Id(prefix="0042")
 */
class EnotaPrograma
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID enote programa")
     * @Max\Ui(type="id")
     * @var string   
     */
    private $id;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     */
    private $celotnaVrednost;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="enotaPrograma.zaproseno", description="Zaprošeno")   
     * @var double
     */
    private $zaproseno;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="enotaPrograma.lastnaSredstva", description="Lastna sredstva")   
     * @var double
     */
    private $lastnaSredstva;

    /**
     * @ORM\Column(type="decimal", nullable=false, options={"default":0})
     * @Max\I18n(label="enotaPrograma.avtorskiHonorarji", description="Avtorski honorarji")   
     * @var double
     */
    private $avtorskiHonorarji;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="enotaPrograma.tantieme", description="Tantieme")   
     * @var double
     */
    private $tantieme;

    /**
     * @ORM\Column(type="decimal", nullable=false, options={"default":0})
     * @Max\I18n(label="enotaPrograma.drugiViri", description="Drugi viri")   
     * @var double
     */
    private $drugiViri;

    /**
     * @ORM\Column(type="decimal", nullable=false, options={"default":0})
     * @Max\I18n(label="enotaPrograma.drugiJavni", description="Drugi javni")   
     * @var double
     */
    private $drugiJavni;

    /**
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="enotaPrograma.obiskDoma", description="Obisk doma")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    private $obiskDoma;

    /**
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="enotaPrograma.obiskGost", description="Obisk gost")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    private $obiskGost;

    /**
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="enotaPrograma.obiskZamejo", description="Obisk za mejo")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    private $obiskZamejo;

    /**
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="enotaPrograma.obiskInt", description="Obisk internacionalni")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    private $obiskInt;

    /**
     * @ORM\Column(type="integer", nullable=false, options={"default":" 0"})
     * @Max\I18n(label="enotaPrograma.ponoviDoma", description="Ponovi doma")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    private $ponoviDoma;

    /**
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="enotaPrograma.ponoviZamejo", description="Ponovi za mejo")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    private $ponoviZamejo;

    /**
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="enotaPrograma.ponoviGost", description="Ponovi gost")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    private $ponoviGost;

    /**
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     * @Max\I18n(label="enotaPrograma.ponoviInt", description="Ponovi internacionalno")   
     * @Max\Ui(type="integer")
     * @var integer     
     */
    private $ponoviInt;

    /**
     * @ORM\Column(type="text", nullable=false)
     * @Max\I18n(label="enotaPrograma.utemeljitev", description="Utemeljitev")   
     * @var string     
     */
    private $utemeljitev;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Uprizoritev")
     * @Max\I18n(label="enotaPrograma.uprizoritev", description="Uprizoritev")   
     * @Max\Ui(type="toone")
     * @var \Produkcija\Entity\Uprizoritev
     */
    private $uprizoritev;

    /**
     * @ORM\ManyToOne(targetEntity="ProgramDela\Entity\TipProgramskeEnote", inversedBy="enotaPrograma")
     * @Max\I18n(label="enotaPrograma.tipProgramskeEnote", description="Tip programske enote")   
     * @Max\Ui(type="toone")
     * @var \ProgramDela\Entity\TipProgramskeEnote
     */
    private $tipProgramskeEnote;

    public function validate($mode = 'update')
    {
        
    }

    public function getId()
    {
        return $this->id;
    }

    public function getCelotnaVrednost()
    {
        return $this->celotnaVrednost;
    }

    public function getZaproseno()
    {
        return $this->zaproseno;
    }

    public function getLastnaSredstva()
    {
        return $this->lastnaSredstva;
    }

    public function getAvtorskiHonorarji()
    {
        return $this->avtorskiHonorarji;
    }

    public function getTantieme()
    {
        return $this->tantieme;
    }

    public function getDrugiViri()
    {
        return $this->drugiViri;
    }

    public function getDrugiJavni()
    {
        return $this->drugiJavni;
    }

    public function getObiskDoma()
    {
        return $this->obiskDoma;
    }

    public function getObiskGost()
    {
        return $this->obiskGost;
    }

    public function getObiskZamejo()
    {
        return $this->obiskZamejo;
    }

    public function getObiskInt()
    {
        return $this->obiskInt;
    }

    public function getPonoviDoma()
    {
        return $this->ponoviDoma;
    }

    public function getPonoviZamejo()
    {
        return $this->ponoviZamejo;
    }

    public function getPonoviGost()
    {
        return $this->ponoviGost;
    }

    public function getPonoviInt()
    {
        return $this->ponoviInt;
    }

    public function getUtemeljitev()
    {
        return $this->utemeljitev;
    }

    public function getUprizoritev()
    {
        return $this->uprizoritev;
    }

    public function getTipProgramskeEnote()
    {
        return $this->tipProgramskeEnote;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setCelotnaVrednost($celotnaVrednost)
    {
        $this->celotnaVrednost = $celotnaVrednost;
        return $this;
    }

    public function setZaproseno($zaproseno)
    {
        $this->zaproseno = $zaproseno;
        return $this;
    }

    public function setLastnaSredstva($lastnaSredstva)
    {
        $this->lastnaSredstva = $lastnaSredstva;
        return $this;
    }

    public function setAvtorskiHonorarji($avtorskiHonorarji)
    {
        $this->avtorskiHonorarji = $avtorskiHonorarji;
        return $this;
    }

    public function setTantieme($tantieme)
    {
        $this->tantieme = $tantieme;
        return $this;
    }

    public function setDrugiViri($drugiViri)
    {
        $this->drugiViri = $drugiViri;
        return $this;
    }

    public function setDrugiJavni($drugiJavni)
    {
        $this->drugiJavni = $drugiJavni;
        return $this;
    }

    public function setObiskDoma($obiskDoma)
    {
        $this->obiskDoma = $obiskDoma;
        return $this;
    }

    public function setObiskGost($obiskGost)
    {
        $this->obiskGost = $obiskGost;
        return $this;
    }

    public function setObiskZamejo($obiskZamejo)
    {
        $this->obiskZamejo = $obiskZamejo;
        return $this;
    }

    public function setObiskInt($obiskInt)
    {
        $this->obiskInt = $obiskInt;
        return $this;
    }

    public function setPonoviDoma($ponoviDoma)
    {
        $this->ponoviDoma = $ponoviDoma;
        return $this;
    }

    public function setPonoviZamejo($ponoviZamejo)
    {
        $this->ponoviZamejo = $ponoviZamejo;
        return $this;
    }

    public function setPonoviGost($ponoviGost)
    {
        $this->ponoviGost = $ponoviGost;
        return $this;
    }

    public function setPonoviInt($ponoviInt)
    {
        $this->ponoviInt = $ponoviInt;
        return $this;
    }

    public function setUtemeljitev($utemeljitev)
    {
        $this->utemeljitev = $utemeljitev;
        return $this;
    }

    public function setUprizoritev(\Produkcija\Entity\Uprizoritev $uprizoritev)
    {
        $this->uprizoritev = $uprizoritev;
        return $this;
    }

    public function setTipProgramskeEnote(\ProgramDela\Entity\TipProgramskeEnote $tipProgramskeEnote)
    {
        $this->tipProgramskeEnote = $tipProgramskeEnote;
        return $this;
    }

}
