<?php

namespace Produkcija\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * @ORM\Entity(repositoryClass="Produkcija\Repository\ProdukcijaDelitve")
 * @Max\I18n(label="Delitev produkcije",plural="Delitev produkcij")
 * @Max\Id(prefix="0017")
 */
class ProdukcijaDelitev
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID poštnega naslova")
     * @Max\Ui(type="id")
     * @var string
     */
    private $id;

    /**
     * @ORM\Column(type="decimal", nullable=true)
     * @Max\I18n(label="prodel.odstotekFinanciranja", description="prodel.odstotekFinanciranja")
     * @var double
     */
    private $odstotekFinanciranja;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="prodel.nasStrosek", description="prodel.d.nasStrosek")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    private $nasStrosek;

    /**
     * @ORM\Column(type="decimal", nullable=true, precision=15, scale=2)
     * @Max\I18n(label="prodel.lastnaSredstva", description="prodel.lastnaSredstva")
     * @var double
     */
    private $lastnaSredstva;

    /**
     * @ORM\Column(type="decimal", nullable=true, precision=15, scale=2)
     * @Max\I18n(label="prodel.zaproseno", description="prodel.zaproseno")
     * @var double
     */
    private $zaproseno;

    /**
     * @ORM\Column(type="decimal", nullable=true, precision=15, scale=2)
     * @Max\I18n(label="prodel.drugiJavni", description="prodel.drugiJavni")
     * @var double
     */
    private $drugiJavni;

    /**
     * @ORM\Column(type="decimal", nullable=true, precision=15, scale=2)
     * @Max\I18n(label="prodel.avtorskih", description="prodel.d.avtorskih")
     * @var double
     */
    private $avtorskih;

    /**
     *  $$ rb ali ni to isto kot avtorski honorar?
     * 
     * @ORM\Column(type="decimal", nullable=true, precision=15, scale=2)
     * @Max\I18n(label="prodel.tantiemi", description="prodel.tantiemi")
     * @var double
     */
    private $tantiemi;

    /**
     * @ORM\Column(type="decimal", nullable=true, precision=15, scale=2)
     * @Max\I18n(label="prodel.skupniStrosek", description="prodel.skupniStrosek")
     * @var double
     */
    private $skupniStrosek;

    /**
     * @ORM\Column(type="decimal", nullable=true, precision=6, scale=2)
     * @Max\I18n(label="prodel.zaprosenProcent", description="prodel.zaprosenProcent")
     * @var double
     */
    private $zaprosenProcent;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Alternacija", mappedBy="koprodukcija")
     * @var <Alternacije>
     * 
     */
    private $alternacije;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Uprizoritev", inversedBy="koprodukcije")
     * @ORM\JoinColumn(name="uprizoritev_id", referencedColumnName="id", nullable=false)
     * @Max\I18n(label="entiteta.uprizoritev",  description="entiteta.uprizoritev")
     * @Max\Ui(type="hiddenid",required=true)
     * @var \Produkcija\Entity\Uprizoritev
     */
    private $uprizoritev;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\ProdukcijskaHisa", inversedBy="koprodukcije")
     * @ORM\JoinColumn(name="koproducent_id", referencedColumnName="id", nullable=false)
     * @Max\I18n(label="prodel.koproducent",  description="prodel.koproducent")
     * @Max\Ui(type="toone", required=true)
     * @var \Produkcija\Entity\ProdukcijskaHisa
     */
    private $koproducent;

    public function __construct()
    {
        $this->alternacije = new ArrayCollection();
    }

    public function validate($mode = 'update')
    {
        
    }

    public function getId()
    {
        return $this->id;
    }

    public function getOdstotekFinanciranja()
    {
        return $this->odstotekFinanciranja;
    }

    public function getNasStrosek()
    {
        return $this->nasStrosek;
    }

    public function getLastnaSredstva()
    {
        return $this->lastnaSredstva;
    }

    public function getZaproseno()
    {
        return $this->zaproseno;
    }

    public function getDrugiJavni()
    {
        return $this->drugiJavni;
    }

    public function getAvtorskih()
    {
        return $this->avtorskih;
    }

    public function getTantiemi()
    {
        return $this->tantiemi;
    }

    public function getSkupniStrosek()
    {
        return $this->skupniStrosek;
    }

    public function getZaprosenProcent()
    {
        return $this->zaprosenProcent;
    }

    public function getAlternacije()
    {
        return $this->alternacije;
    }

    public function getUprizoritev()
    {
        return $this->uprizoritev;
    }

    public function getKoproducent()
    {
        return $this->koproducent;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setOdstotekFinanciranja($odstotekFinanciranja)
    {
        $this->odstotekFinanciranja = $odstotekFinanciranja;
        return $this;
    }

    public function setNasStrosek($nasStrosek)
    {
        $this->nasStrosek = $nasStrosek;
        return $this;
    }

    public function setLastnaSredstva($lastnaSredstva)
    {
        $this->lastnaSredstva = $lastnaSredstva;
        return $this;
    }

    public function setZaproseno($zaproseno)
    {
        $this->zaproseno = $zaproseno;
        return $this;
    }

    public function setDrugiJavni($drugiJavni)
    {
        $this->drugiJavni = $drugiJavni;
        return $this;
    }

    public function setAvtorskih($avtorskih)
    {
        $this->avtorskih = $avtorskih;
        return $this;
    }

    public function setTantiemi($tantiemi)
    {
        $this->tantiemi = $tantiemi;
        return $this;
    }

    public function setSkupniStrosek($skupniStrosek)
    {
        $this->skupniStrosek = $skupniStrosek;
        return $this;
    }

    public function setZaprosenProcent($zaprosenProcent)
    {
        $this->zaprosenProcent = $zaprosenProcent;
        return $this;
    }

    public function setAlternacije($alternacije)
    {
        $this->alternacije = $alternacije;
        return $this;
    }

    public function setUprizoritev(\Produkcija\Entity\Uprizoritev $uprizoritev)
    {
        $this->uprizoritev = $uprizoritev;
        return $this;
    }

    public function setKoproducent(\Produkcija\Entity\ProdukcijskaHisa $koproducent)
    {
        $this->koproducent = $koproducent;
        return $this;
    }

}
