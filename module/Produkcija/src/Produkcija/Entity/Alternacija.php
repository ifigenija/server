<?php

namespace Produkcija\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;
use Doctrine\Common\Collections\ArrayCollection;

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
     * @Max\I18n(label="entiteta.sifra", description="entiteta.d.sifra")
     * @Max\Ui(type="sifra",ident=true,icon="fa fa-barcode" )
     * @var string
     */
    private $sifra;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="alternacija.zaposlen", description="alternacija.d.zaposlen")
     * @Max\Ui(type="boolcheckbox")     
     * @var boolean
     */
    private $zaposlen;

    /**
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="entiteta.zacetek", description="alternacija.d.zacetek")
     * @var string
     */
    private $zacetek;

    /**
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="entiteta.konec", description="alternacija.d.konec")
     * @var string
     */
    private $konec;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="entiteta.opomba", description="alternacija.d.opomba")
     * @var string
     */
    private $opomba;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="entiteta.sort", description="alternacija.d.sort")
     * @Max\Ui(type="integer",icon="fa fa-sort")
     * @var integer
     */
    private $sort;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="alternacija.privzeti", description="alternacija.d.privzeti")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    private $privzeti;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="entiteta.aktivna", description="alternacija.d.aktivna")
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
     * @Max\I18n(label="entiteta.funkcija",  description="alternacija.d.funkcija")
     * @Max\Ui(type="toone", required=true);
     * @var \Produkcija\Entity\Funkcija
     */
    private $funkcija;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Zaposlitev", inversedBy="alternacije")
     * @ORM\JoinColumn(name="zaposlitev_id", referencedColumnName="id")
     * @Max\I18n(label="alternacija.zaposlitev",  description="alternacija.d.zaposlitev")
     * @Max\Ui(type="toone")
     * @var \Produkcija\Entity\Zaposlitev
     */
    private $zaposlitev;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Oseba", inversedBy="alternacije")
     * @ORM\JoinColumn(name="oseba_id", referencedColumnName="id")
     * @Max\I18n(label="entiteta.oseba",  description="alternacija.d.oseba")
     * @Max\Ui(type="toone")
     * @var \App\Entity\Oseba
     */
    private $oseba;

    /**
     * @ORM\OneToOne(targetEntity="Produkcija\Entity\Pogodba", inversedBy="alternacija")
     * @ORM\JoinColumn(name="pogodba_id", referencedColumnName="id")
     * @Max\I18n(label="alternacija.pogodba",  description="alternacija.d.pogodba")
     * @Max\Ui(type="toone")
     * var \Produkcija\Entity\Pogodba       - izpustimo tip, da ga lahko s set metodo postavimo na null v primeru izbrisa pogodbe
     */
    private $pogodba;

    /**
     * @ORM\Column(type="boolean", length=1, nullable=true)
     * @Max\I18n(label="entiteta.jeeu", description="alternacija.d.jeeu")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    protected $imaPogodbo;

    /**
     * Če je alternacija pomembna, jo prikaže v programu dela,
     * 
     * $$ za doreči -katero sortno polje se po uporabljalo za program dela, ali od alternacije, ali od funkcije? - zaenkrat smo vzeli od alternacije
     * 
     * @ORM\Column(type="boolean", length=1, nullable=true)
     * @Max\I18n(label="alternacija.pomembna", description="alternacija.d.pomembna")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    protected $pomembna;

    public function __construct()
    {
        $this->storitve = new ArrayCollection();
    }

    public function preracunaj($smer = false)
    {
        $this->imaPogodbo = ($this->getPogodba()) ? true : false;
//        $this->zaposlen   se nastavi že v repozitoriju
    }

    public function validate($mode = 'update')
    {
        if ($this->getZaposlitev()) {
            $this->expect($this->getOseba() === $this->getZaposlitev()->getOseba());
            $this->setZaposlen(true);
        } else {
            $this->setZaposlen(false);
        }

        /**
         * Pri pogodbi preverim, če je nosilec pogodbe oseba na alternaciji
         * Če je nosilec pogodbe poslovni partner grem čez kontaktne osebe 
         * in preverim ,da je oseba kontakt na poslovnem partnerju
         */
        if ($this->getPogodba()) {
            $this->setImaPogodbo(true);
            if ($this->getPogodba()->getOseba()) {
                $this->expect($this->getOseba() === $this->getPogodba()->getOseba()
                        , 'Oseba na pogodbi ni enaka kot oseba na alternaciji'
                        , 1000335);
            }

            $popa = $this->getPogodba()->getPopa();
            if ($popa) {
                $found = FALSE;
                foreach ($popa->getKontaktneOsebe() as $kon) {
                    if ($kon->getOseba() === $this->getOseba()) {
                        $found = true;
                        break;
                    }
                }
                $this->expect($found
                        , 'Oseba na alternaciji ni kontakt na poslovnem partnerju, ki je nosilec pogodbe'
                        , 1000336);
            }
        }
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

    public function getZaposlitev()
    {
        return $this->zaposlitev;
    }

    public function getOseba()
    {
        return $this->oseba;
    }

    public function getPogodba()
    {
        return $this->pogodba;
    }

    public function getImaPogodbo()
    {
        return $this->imaPogodbo;
    }

    public function getPomembna()
    {
        return $this->pomembna;
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

    public function setZaposlitev(\Produkcija\Entity\Zaposlitev $zaposlitev)
    {
        $this->zaposlitev = $zaposlitev;
        return $this;
    }

    public function setOseba(\App\Entity\Oseba $oseba)
    {
        $this->oseba = $oseba;
        return $this;
    }

    public function setPogodba($pogodba)
    {
        $this->pogodba = $pogodba;
        return $this;
    }

    public function setImaPogodbo($imaPogodbo)
    {
        $this->imaPogodbo = $imaPogodbo;
        return $this;
    }

    public function setPomembna($pomembna)
    {
        $this->pomembna = $pomembna;
        return $this;
    }

}
