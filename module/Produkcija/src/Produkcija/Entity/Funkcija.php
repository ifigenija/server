<?php

namespace Produkcija\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="Produkcija\Repository\Funkcije")
 * @Max\I18n(label="Funkcija",plural="Funkcije")
 * @Max\Id(prefix="0013")
 */
class Funkcija
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID funkcije")
     * @Max\Ui(type="id")
     * @var string
     */
    private $id;

    /**
     * $$ rb ali sploh rabimo to polje - saj je v tipih funkcij, ki bi jih fixturji skreirali,  že pripravljeno
     * 
     * @ORM\Column(type="string", length=20, nullable=true)
     * @Max\I18n(label="Področje", description="Področje funkcije")
     * @Max\Ui(type="select", opts="funkcija.podrocje")
     * @var string
     */
    private $podrocje;

    /**
     * V to polje se vpiše poljubno - bolj specifično ime funkcije za to uprizoritev,
     * kot je tip funkcije, ki je standariziran glede na SLOGI (Slovenski gledališki inštitut) 
     * 
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Naziv", description="Naziv funkcije")
     * @Max\Ui(type="naziv",ident=true )
     * @var string
     */
    private $naziv;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Velikost", description="Velikost funkcije")
     * @Max\Ui(type="select", opts="funkcija.velikost")
     * @var string
     */
    private $velikost;

    /**
     * Če je funkcija pomembna, je tudi vsebovana v osebni izkaznici 
     * Če pomembna=false, potem se ne izpiše v osebni izkaznici, ampak le v gledališkem listu
     * 
     * Smiselno je, da imajo pomembne funkcije tudi večjo utež oz. sortno vrednost ($sort)
     * 
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="pomembna", description="Ali je funkcija pomembna")
     * @var boolean
     */
    private $pomembna;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="Sort", description="Sort funkcije oz. utež")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $sort;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Alternacija", mappedBy="funkcija")
     * @var <Alternacije>
     * 
     */
    private $alternacije;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Uprizoritev", inversedBy="vloge")
     * @ORM\JoinColumn(name="uprizoritev_id", referencedColumnName="id", nullable=false)
     * @Max\I18n(label="Uprizoritev",  description="Uprizoritev")
     * @Max\Ui(type="hiddenid")
     * @var \Produkcija\Entity\Uprizoritev
     */
    private $uprizoritev;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Alternacija")
     * @ORM\JoinColumn(name="alternacija_id", referencedColumnName="id")
     * @Max\I18n(label="Privzeta alternacija",  description="Privzeta alternacija")
     * @Max\Ui(type="toone")
     * @var \Produkcija\Entity\Alternacija
     */
    private $privzeti;

    /**
     * tipi funkcij, ki so standarizirani glede na SLOGI (Slovenski gledališki inštitut)
     * 
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\TipFunkcije", inversedBy="funkcije", fetch="EAGER")
     * @ORM\JoinColumn(name="tip_vloge_id", referencedColumnName="id")
     * @Max\I18n(label="TipVloge",  description="TipVloge")
     * @Max\Ui(type="toone")
     * @var \Produkcija\Entity\TipFunkcije
     */
    private $tipFunkcije;

    public function validate($mode = 'update')
    {
        
    }

    public function getId()
    {
        return $this->id;
    }

    public function getPodrocje()
    {
        return $this->podrocje;
    }

    public function getNaziv()
    {
        return $this->naziv;
    }

    public function getVelikost()
    {
        return $this->velikost;
    }

    public function getPomembna()
    {
        return $this->pomembna;
    }

    public function getSort()
    {
        return $this->sort;
    }

    public function getAlternacije()
    {
        return $this->alternacije;
    }

    public function getUprizoritev()
    {
        return $this->uprizoritev;
    }

    public function getPrivzeti()
    {
        return $this->privzeti;
    }

    public function getTipFunkcije()
    {
        return $this->tipFunkcije;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setPodrocje($podrocje)
    {
        $this->podrocje = $podrocje;
        return $this;
    }

    public function setNaziv($naziv)
    {
        $this->naziv = $naziv;
        return $this;
    }

    public function setVelikost($velikost)
    {
        $this->velikost = $velikost;
        return $this;
    }

    public function setPomembna($pomembna)
    {
        $this->pomembna = $pomembna;
        return $this;
    }

    public function setSort($sort)
    {
        $this->sort = $sort;
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

    public function setPrivzeti(\Produkcija\Entity\Alternacija $privzeti)
    {
        $this->privzeti = $privzeti;
        return $this;
    }

    public function setTipFunkcije(\Produkcija\Entity\TipFunkcije $tipFunkcije)
    {
        $this->tipFunkcije = $tipFunkcije;
        return $this;
    }

}
