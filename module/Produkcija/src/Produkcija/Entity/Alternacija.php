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
    protected $id;

    /**
     * @ORM\Column(type="string", unique=true, nullable=false)
     * @Max\I18n(label="alternacija.sifra", description="alternacija.d.sifra")
     * @Max\Ui(type="sifra",ident=true,icon="fa fa-barcode" )
     * @var string
     */
    protected $sifra;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="alternacija.zaposlen", description="alternacija.d.zaposlen")
     * @Max\Ui(type="boolcheckbox")     
     * @var boolean
     */
    protected $zaposlen;

    /**
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="alternacija.zacetek", description="alternacija.d.zacetek")
     * @var string
     */
    protected $zacetek;

    /**
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="alternacija.konec", description="alternacija.d.konec")
     * @var string
     */
    protected $konec;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="alternacija.opomba", description="alternacija.d.opomba")
     * @var string
     */
    protected $opomba;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="alternacija.sort", description="alternacija.d.sort")
     * @Max\Ui(type="integer",icon="fa fa-sort")
     * @var integer
     */
    protected $sort;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="alternacija.privzeti", description="alternacija.d.privzeti")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    protected $privzeti;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="alternacija.aktivna", description="alternacija.d.aktivna")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    protected $aktivna;

    /**
     * @ORM\OneToMany(targetEntity="Prisotnost\Entity\TerminStoritve", mappedBy="alternacija", fetch="EXTRA_LAZY")
     * @var <Storitve>
     */
    protected $storitve;

    /**
     * 
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Funkcija", inversedBy="alternacije")
     * @ORM\JoinColumn(name="funkcija_id", referencedColumnName="id")
     * @Max\I18n(label="alternacija.funkcija",  description="alternacija.d.funkcija")
     * @Max\Ui(type="toone", required=true);
     * @var \Produkcija\Entity\Funkcija
     */
    protected $funkcija;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Zaposlitev", inversedBy="alternacije")
     * @ORM\JoinColumn(name="zaposlitev_id", referencedColumnName="id")
     * @Max\I18n(label="alternacija.zaposlitev",  description="alternacija.d.zaposlitev")
     * @Max\Ui(type="toone")
     * @var \Produkcija\Entity\Zaposlitev
     */
    protected $zaposlitev;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Oseba", inversedBy="alternacije")
     * @ORM\JoinColumn(name="oseba_id", referencedColumnName="id")
     * @Max\I18n(label="alternacija.oseba",  description="alternacija.d.oseba")
     * @Max\Ui(type="toone")
     * @var \App\Entity\Oseba
     */
    protected $oseba;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Pogodba", inversedBy="alternacije")
     * @ORM\JoinColumn(name="pogodba_id", referencedColumnName="id")
     * @Max\I18n(label="alternacija.pogodba",  description="alternacija.d.pogodba")
     * @Max\Ui(type="toone")
     * @var \Produkcija\Entity\Pogodba      
     */
    protected $pogodba;

    /**
     * @ORM\Column(type="boolean", length=1, nullable=true)
     * @Max\I18n(label="alternacija.jeeu", description="alternacija.d.jeeu")
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

    function getId()
    {
        return $this->id;
    }

    function getSifra()
    {
        return $this->sifra;
    }

    function getZaposlen()
    {
        return $this->zaposlen;
    }

    function getZacetek()
    {
        return $this->zacetek;
    }

    function getKonec()
    {
        return $this->konec;
    }

    function getOpomba()
    {
        return $this->opomba;
    }

    function getSort()
    {
        return $this->sort;
    }

    function getPrivzeti()
    {
        return $this->privzeti;
    }

    function getAktivna()
    {
        return $this->aktivna;
    }

    function getStoritve()
    {
        return $this->storitve;
    }

    function getFunkcija()
    {
        return $this->funkcija;
    }

    function getZaposlitev()
    {
        return $this->zaposlitev;
    }

    function getOseba()
    {
        return $this->oseba;
    }

    function getPogodba()
    {
        return $this->pogodba;
    }

    function getImaPogodbo()
    {
        return $this->imaPogodbo;
    }

    function getPomembna()
    {
        return $this->pomembna;
    }

    function setId($id)
    {
        $this->id = $id;
    }

    function setSifra($sifra)
    {
        $this->sifra = $sifra;
    }

    function setZaposlen($zaposlen)
    {
        $this->zaposlen = $zaposlen;
    }

    function setZacetek($zacetek)
    {
        $this->zacetek = $zacetek;
    }

    function setKonec($konec)
    {
        $this->konec = $konec;
    }

    function setOpomba($opomba)
    {
        $this->opomba = $opomba;
    }

    function setSort($sort)
    {
        $this->sort = $sort;
    }

    function setPrivzeti($privzeti)
    {
        $this->privzeti = $privzeti;
    }

    function setAktivna($aktivna)
    {
        $this->aktivna = $aktivna;
    }

    function setStoritve($storitve)
    {
        $this->storitve = $storitve;
    }

    function setFunkcija(\Produkcija\Entity\Funkcija $funkcija)
    {
        $this->funkcija = $funkcija;
    }

    function setZaposlitev(\Produkcija\Entity\Zaposlitev $zaposlitev)
    {
        $this->zaposlitev = $zaposlitev;
    }

    function setOseba(\App\Entity\Oseba $oseba)
    {
        $this->oseba = $oseba;
    }

    function setPogodba(\Produkcija\Entity\Pogodba $pogodba)
    {
        $this->pogodba = $pogodba;
    }

    function setImaPogodbo($imaPogodbo)
    {
        $this->imaPogodbo = $imaPogodbo;
    }

    function setPomembna($pomembna)
    {
        $this->pomembna = $pomembna;
    }

}
