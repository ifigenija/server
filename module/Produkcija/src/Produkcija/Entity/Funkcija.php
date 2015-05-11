<?php

namespace Produkcija\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity
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
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="Področje", description="Področje funkcije")
     * @var integer 
     */
    private $podrocje;          //$$ rb - ali to rabimo oz. ali naredimo opcijo

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Naziv", description="Naziv funkcije")
     * @Max\Ui(type="naziv",ident=true )
     * @var string
     */
    private $naziv;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Velikost", description="Velikost funkcije")
     * @var string
     */
    private $velikost;

    /**
     * 
     * @Max\I18n(label="pomembna", description="Ali je funkcija pomembna")
     * @var
     * @ORM\Column(type="boolean", nullable=true) boolean
     */
    private $pomembna;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="Sort", description="Soort funkcije")
     * @var integer
     */
    private $sort;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Alternacija", mappedBy="vloga")
     * @var <Alternacije>
     * 
     */
    private $alternacije;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Uprizoritev", inversedBy="vloge")
     * @ORM\JoinColumn(name="uprizoritev_id", referencedColumnName="id", nullable=false)
     * @Max\I18n(label="Uprizoritev",  description="Uprizoritev")
     * @Max\Ui(type="toone")
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
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\TipFunkcije", inversedBy="vloge", fetch="EAGER")
     * @ORM\JoinColumn(name="tip_vloge_id", referencedColumnName="id")
     * @Max\I18n(label="TipVloge",  description="TipVloge")
     * @Max\Ui(type="toone")
     * @var \Produkcija\Entity\TipFunkcije
     */
    private $tipVloge;

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

    public function getTipVloge()
    {
        return $this->tipVloge;
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

    public function setTipVloge(\Produkcija\Entity\TipFunkcije $tipVloge)
    {
        $this->tipVloge = $tipVloge;
        return $this;
    }

}
