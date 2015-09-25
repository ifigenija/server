<?php

namespace Produkcija\Entity;

use App\Entity\Oseba;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use Max\Ann\Entity as Max;
use Max\Entity\Base;

/**
 * @ORM\Entity(repositoryClass="Produkcija\Repository\Alternacije")
 * @Max\Lookup(ident="sifra", label="sifra", search={"sifra"})
 * @Max\I18n(label="Alternacija",plural="Alternacije")
 * @Max\Id(prefix="0012")
 */
class Alternacija
        extends Base
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
     * @Max\Ui(type="hiddenid", required=true);
     * @var Funkcija
     */
    protected $funkcija;

    /**
     * $$ začasno
     */
    /* @var $variable Alternacija */
    private $tmp1;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Zaposlitev", inversedBy="alternacije")
     * @ORM\JoinColumn(name="zaposlitev_id", referencedColumnName="id")
     * @Max\I18n(label="alternacija.zaposlitev",  description="alternacija.d.zaposlitev")
     * @Max\Ui(type="lookupselect", empty="Izberi zaposlitev", required=false, filters={"oseba":{"element":"oseba"}})
     * @var Zaposlitev
     */
    protected $zaposlitev = null;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Oseba", inversedBy="alternacije")
     * @ORM\JoinColumn(name="oseba_id", referencedColumnName="id")
     * @Max\I18n(label="alternacija.oseba",  description="alternacija.d.oseba")
     * @Max\Ui(type="hiddenid")
     * @var Oseba
     */
    protected $oseba;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Pogodba", inversedBy="alternacije")
     * @ORM\JoinColumn(name="pogodba_id", referencedColumnName="id")
     * @Max\I18n(label="alternacija.pogodba",  description="alternacija.d.pogodba")
     * @Max\Ui(type="toone", required=false, filters={"oseba" : {"element":"oseba"}})
     * @var Pogodba
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
    protected $pomembna = true;

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
            $this->expect($this->getOseba() === $this->getZaposlitev()->getOseba()
                    , 'Oseba na zaposlitvi ni enaka kot oseba na alternaciji'
                    , 1000338);
            ;
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

        $zacetek = empty($this->zacetek) ? "" : $this->zacetek->format('c');
        $konec   = empty($this->konec) ? "" : $this->konec->format('c');
        if (!empty($zacetek)) {
            if (!empty($konec)) {
                $this->expect($konec >= $zacetek
                        , 'Konec ne sme biti pred začetkom'
                        , 1000337);
            }
        }

        if ($this->privzeti) {
            // le ena alternacija je lahko privzeta
            // postavi privzeto ostalih alternacij iste funkcije na false:
            $idAlt = $this->id;
            if ($this->getFunkcija()) {
                $this->getFunkcija()->getAlternacije()
                        ->map(function($alt) use(&$idAlt) {
                            return $alt->setPrivzeti($alt->getId() === $idAlt ? true : false);
                        });

                /**
                 * $$ še implementiraj
                 */
                $this->getFunkcija()->setPrivzeti($this);
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

    public function getTmp1()
    {
        return $this->tmp1;
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

    public function setFunkcija(Funkcija $funkcija = null)
    {
        $this->funkcija = $funkcija;
        return $this;
    }

    public function setTmp1($tmp1)
    {
        $this->tmp1 = $tmp1;
        return $this;
    }

    public function setZaposlitev(Zaposlitev $zaposlitev = null)
    {
        $this->zaposlitev = $zaposlitev;
        return $this;
    }

    public function setOseba(Oseba $oseba = null)
    {
        $this->oseba = $oseba;
        return $this;
    }

    public function setPogodba(Pogodba $pogodba = null)
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
