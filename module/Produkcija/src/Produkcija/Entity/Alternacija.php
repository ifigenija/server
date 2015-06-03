<?php

namespace Produkcija\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="Produkcija\Repository\Alternacije")
 * @Max\Lookup(ident="sifra", label="sifra", search={"sifra"})
 * @Max\I18n(label="Alternacija",plural="Alternacije")
 * @Max\Id(prefix="0012")
 */
class Alternacija
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="ID", description="ID alternacije")
     * @Max\Ui(type="id")
     * @var string
     */
    private $id;

    /**
     * @ORM\Column(type="string", unique=true, nullable=false)
     * @Max\I18n(label="entiteta.sifra", description="Šifra alternacije")
     * @Max\Ui(type="sifra",ident=true )
     * @var string
     */
    private $sifra;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="alternacija.zaposlen", description="Ali je zaposlen")
     * @Max\Ui(type="boolcheckbox")     
     * @var boolean
     */
    private $zaposlen;

    /**
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="entiteta.zacetek", description="Začetni datum")
     * @var string
     */
    private $zacetek;

    /**
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="entiteta.konec", description="Končni datum")
     * @var string
     */
    private $konec;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="entiteta.opomba", description="Opomba")
     * @var string
     */
    private $opomba;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="entiteta.sort", description="Sort")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $sort;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="alternacija.privzeti", description="Privzeti")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    private $privzeti;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="entiteta.aktivna", description="Aktivna")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    private $aktivna;

    /**
     * @ORM\OneToMany(targetEntity="Prisotnost\Entity\TerminStoritve", mappedBy="alternacija", fetch="EXTRA_LAZY")
     * @var <Storitve>
     */
    private $storitve;

    /**
     * 
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Funkcija", inversedBy="alternacije")
     * @ORM\JoinColumn(name="funkcija_id", referencedColumnName="id")
     * @Max\I18n(label="entiteta.funkcija",  description="Funkcija pri alternaciji")
     * @Max\Ui(type="toone", required=true);
     * @var \Produkcija\Entity\Funkcija
     */
    private $funkcija;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Zaposlitev", inversedBy="alternacije")
     * @ORM\JoinColumn(name="sodelovanje_id", referencedColumnName="id")
     * @Max\I18n(label="alternacija.sodelovanje",  description="Sodelovanje oz. zaposlitev")
     * @Max\Ui(type="toone")
     * @var \Produkcija\Entity\Zaposlitev
     */
    private $sodelovanje;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Oseba", inversedBy="alternacije")
     * @ORM\JoinColumn(name="oseba_id", referencedColumnName="id")
     * @Max\I18n(label="entiteta.oseba",  description="Oseba pri alternaciji")
     * @Max\Ui(type="toone")
     * @var \App\Entity\Oseba
     */
    private $oseba;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\ProdukcijaDelitev", inversedBy="alternacije")
     * @Max\I18n(label="alternacija.koprodukcija",  description="Koprodukcija pri alternaciji")
     * @Max\Ui(type="toone")
     * @var \Produkcija\Entity\ProdukcijaDelitev
     */
    private $koprodukcija;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Pogodba", inversedBy="alternacije")
     * @ORM\JoinColumn(name="pogodba_id", referencedColumnName="id")
     * @Max\I18n(label="alternacija.pogodba",  description="Pogodba pri alternaciji")
     * @Max\Ui(type="toone")
     * @var \Produkcija\Entity\Pogodba
     */
    private $pogodba;

    public function validate($mode = 'update')
    {
        
    }

    public function getId()
    {
        return $this->id;
    }

    public function getSifra()
    {
        return $this->sifra;
    }

    public function getZaposlen()
    {
        return $this->zaposlen;
    }

    public function getZacetek()
    {
        return $this->zacetek;
    }

    public function getKonec()
    {
        return $this->konec;
    }

    public function getOpomba()
    {
        return $this->opomba;
    }

    public function getSort()
    {
        return $this->sort;
    }

    public function getPrivzeti()
    {
        return $this->privzeti;
    }

    public function getAktivna()
    {
        return $this->aktivna;
    }

    public function getStoritve()
    {
        return $this->storitve;
    }

    public function getFunkcija()
    {
        return $this->funkcija;
    }

    public function getSodelovanje()
    {
        return $this->sodelovanje;
    }

    public function getOseba()
    {
        return $this->oseba;
    }

    public function getKoprodukcija()
    {
        return $this->koprodukcija;
    }

    public function getPogodba()
    {
        return $this->pogodba;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setSifra($sifra)
    {
        $this->sifra = $sifra;
        return $this;
    }

    public function setZaposlen($zaposlen)
    {
        $this->zaposlen = $zaposlen;
        return $this;
    }

    public function setZacetek($zacetek)
    {
        $this->zacetek = $zacetek;
        return $this;
    }

    public function setKonec($konec)
    {
        $this->konec = $konec;
        return $this;
    }

    public function setOpomba($opomba)
    {
        $this->opomba = $opomba;
        return $this;
    }

    public function setSort($sort)
    {
        $this->sort = $sort;
        return $this;
    }

    public function setPrivzeti($privzeti)
    {
        $this->privzeti = $privzeti;
        return $this;
    }

    public function setAktivna($aktivna)
    {
        $this->aktivna = $aktivna;
        return $this;
    }

    public function setStoritve($storitve)
    {
        $this->storitve = $storitve;
        return $this;
    }

    public function setFunkcija(\Produkcija\Entity\Funkcija $funkcija)
    {
        $this->funkcija = $funkcija;
        return $this;
    }

    public function setSodelovanje(\Produkcija\Entity\Zaposlitev $sodelovanje)
    {
        $this->sodelovanje = $sodelovanje;
        return $this;
    }

    public function setOseba(\App\Entity\Oseba $oseba)
    {
        $this->oseba = $oseba;
        return $this;
    }

    public function setKoprodukcija(\Produkcija\Entity\ProdukcijaDelitev $koprodukcija)
    {
        $this->koprodukcija = $koprodukcija;
        return $this;
    }

    public function setPogodba(\Produkcija\Entity\Pogodba $pogodba)
    {
        $this->pogodba = $pogodba;
        return $this;
    }

}
