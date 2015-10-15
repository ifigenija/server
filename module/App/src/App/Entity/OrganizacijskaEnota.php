<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use Max\Ann\Entity as Max;
use Max\Entity\Base;

/**
 * @ORM\Entity(repositoryClass="App\Repository\OrganizacijskeEnote")
 * @Max\I18n(label="Organizacijska enota",plural="Organizacijske enote")
 * @Max\Id(prefix="0065")
 * @Max\Lookup
 */
class OrganizacijskaEnota
        extends Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\Ui(type="id")
     * @Max\I18n(label="ID",  description="ID organizacijske enote")
     * @var string
     */
    protected $id;

    /**
     * Šifra organizacijske enote
     * @ORM\Column(unique=true, length=2, nullable=true)
     * @Max\I18n(label="orgEnota.sifra",description="orgEnota.d.sifra")
     * @Max\Ui(type="sifra",class="sifra",icon="fa fa-flag",ident=true)
     * @var string
     */
    protected $sifra;

    /**
     * Naziv organizacijske enote
     * @ORM\Column(length=50, nullable=true)
     * @Max\I18n(label="orgEnota.naziv",description="orgEnota.d.naziv")
     * @Max\Ui(class="naziv", required=true)
     * @var string
     */
    protected $naziv;

    /**
     * Drevesna struktura organizacijske enote(starš)
     * @ORM\ManyToOne(targetEntity="OrganizacijskaEnota", inversedBy="children")
     * @Max\Ui(type="hiddenid",required=true)
     * @var OrganizacijskaEnota
     */
    protected $parent;

    /**
     * Drevesna struktura organizacijske enote(otroci)
     * @ORM\OneToMany(targetEntity="OrganizacijskaEnota", mappedBy="parent")
     * @var <Children>
     */
    protected $children;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Zaposlitev", inversedBy="vodjaOrganizacijskihEnot")
     * @Max\I18n(label="orgEnota.vodja",  description="orgEnota.d.vodja")
     * @Max\Ui(type="toone",required=true)
     * @var \Produkcija\Entity\Zaposlitev
     */
    protected $vodja;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Zaposlitev", inversedBy="namestnikOrganizacijskihEnot")
     * @Max\I18n(label="orgEnota.namestnik",  description="orgEnota.d.namestnik")
     * @Max\Ui(type="toone",required=true)
     * @var \Produkcija\Entity\Zaposlitev
     */
    protected $namestnik;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Zaposlitev", mappedBy="organizacijskaEnota")
     * @var <Zaposlitve>
     */
    protected $zaposlitve;

    public function __construct($name = '')
    {
        $this->children   = new ArrayCollection();
        $this->zaposlitve = new ArrayCollection();
    }

    public function validate($mode = 'update')
    {
        $this->expect($this->naziv, "Naziv organizacijske enote je obvezen podatek.", 1002101);
        $this->expect($this->vodja, "Vodja organizacijske enote je obvezen podatek.", 1002102);
        $this->expect($this->namestnik, "Namestnik organizacijske enote je obvezen podatek.", 1002103);
    }

    function getId()
    {
        return $this->id;
    }

    function getSifra()
    {
        return $this->sifra;
    }

    function getNaziv()
    {
        return $this->naziv;
    }

    function getParent()
    {
        return $this->parent;
    }

    function getChildren()
    {
        return $this->children;
    }

    function getVodja()
    {
        return $this->vodja;
    }

    function getNamestnik()
    {
        return $this->namestnik;
    }

    function getZaposlitve()
    {
        return $this->zaposlitve;
    }

    function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    function setSifra($sifra)
    {
        $this->sifra = $sifra;
        return $this;
    }

    function setNaziv($naziv)
    {
        $this->naziv = $naziv;
        return $this;
    }

    function setParent(OrganizacijskaEnota $parent = null)
    {
        $this->parent = $parent;
        return $this;
    }

    function setChildren($children)
    {
        $this->children = $children;
        return $this;
    }

    function setVodja(\Produkcija\Entity\Zaposlitev $vodja = null)
    {
        $this->vodja = $vodja;
        return $this;
    }

    function setNamestnik(\Produkcija\Entity\Zaposlitev $namestnik = null)
    {
        $this->namestnik = $namestnik;
        return $this;
    }

    function setZaposlitve($zaposlitve)
    {
        $this->zaposlitve = $zaposlitve;
        return $this;
    }

}
