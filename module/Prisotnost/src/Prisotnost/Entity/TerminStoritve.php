<?php

namespace Prisotnost\Entity;

use Doctrine\ORM\Mapping as ORM;
use Max\Ann\Entity as Max;
use Max\Entity\Base;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * @ORM\Entity(repositoryClass="Prisotnost\Repository\TerminiStoritve")
 * @Max\I18n(label="Termin storitve",plural="Termini storitve")
 * @Max\Id(prefix="0026")
 */
class TerminStoritve
        extends Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID termina storitve")
     * @Max\Ui(type="id")
     * @var string   
     */
    protected $id;

    /**
     * število minut med začetkom dogodka in planiranim začetkom
     * 
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="Delta planiranega začetka", description="Delta planiran začetek termina")
     * @Max\Ui(type="integer")
     * @var string
     */
    protected $deltaPlaniranZacetek;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     * @Max\I18n(label="Planiran začetek", description="Planiran začetek termina")
     * @var string
     */
    protected $planiranZacetek;

    /**
     * število minut med začetkom dogodka in planiranim začetkom
     * 
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="Delta planiranega začetka", description="Delta planiran začetek termina")
     * @Max\Ui(type="integer")
     * @var string
     */
    protected $deltaPlaniranKonec;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     * @Max\I18n(label="Planiran konec", description="Planiran konec termina")
     * @var string
     */
    protected $planiranKonec;

    /**
     * @ORM\ManyToOne(targetEntity="Koledar\Entity\Dogodek", inversedBy="terminiStoritve")
     * @ORM\JoinColumn(name="dogodek_id", referencedColumnName="id")
     * @Max\I18n(label="terminStoritve.dogodek",  description="terminStoritve.d.dogodek")
     * @Max\Ui(type="toone")
     * @var \Koledar\Entity\Dogodek
     */
    protected $dogodek;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Alternacija", inversedBy="storitve")
     * @ORM\JoinColumn(name="alternacija_id", referencedColumnName="id")
     * @Max\I18n(label="terminStoritve.alternacija",  description="terminStoritve.d.alternacija")
     * @Max\Ui(type="toone")
     * @var \Produkcija\Entity\Alternacija
     */
    protected $alternacija;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Oseba", inversedBy="terminiStoritev")
     * @ORM\JoinColumn(name="oseba_id", referencedColumnName="id", nullable=false)
     * @Max\I18n(label="terminStoritve.oseba",  description="terminStoritve.d.oseba")
     * @Max\Ui(type="toone")
     * @var \App\Entity\Oseba
     */
    protected $oseba;

    /**
     * Ali je dežurni na predstavi?
     * 
     * $$ razčistiti še moramo, ali bo pripet na alternacijo ali ne. 
     * V SLOGI-jevem hierarhičnem seznamu funkcij dežurnega ni
     * 
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="terminStoritve.dezurni",  description="terminStoritve.d.dezurni")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    protected $dezurni;

    /**
     * Ali je gost na vaji?
     * 
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="terminStoritve.oseba",  description="terminStoritve.d.oseba")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    protected $gost;

    /**
     * Ali je sodelujoča oseba, ki ni alternacija in ni ne gost ne dežurni
     * 
     * npr. povabljen na Tehnični dogodek ali kakšen drug Dogodek
     * 
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="terminStoritve.sodelujoc",  description="terminStoritve.d.sodelujoc")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    protected $sodelujoc;

    /**
     * Ali je zasedenost osebe?
     * 
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="terminStoritve.oseba",  description="terminStoritve.d.oseba")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    protected $zasedenost;

    /**
     * Ali je virtualna zasedenost osebe?
     * 
     * Virtualno zasedenost bomo morda uporabljali, da ugotavljamo ali je že preteklko 11 ur. 12 ur?
     * 
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="terminStoritve.oseba",  description="terminStoritve.d.oseba")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    protected $virtZasedenost;

    /**
     * @ORM\OneToOne(targetEntity="Prisotnost\Entity\Ura",mappedBy="terminStoritve")
     * @Max\I18n(label = "terminStoritve.ura", description = "terminStoritve.d.ura")
     * @Max\Ui(type="toone")
     * @var \Prisotnost\Entity\Ura
     */
    protected $ura;

    public function validate($mode = 'update')
    {
        $this->expect(!$this->ura, "Ure so že vnešene, spreminjanje terminov storitev ni mogoče", 1001088);
        $i = 0;
        if ($this->alternacija) {
            $i++;
        }
        if ($this->dezurni) {
            $i++;
        }
        if ($this->gost) {
            $i++;
        }
        if ($this->zasedenost) {
            $i++;
        }
        if ($this->virtZasedenost) {
            $i++;
        }
        if ($this->sodelujoc) {
            $i++;
        }
        $this->expect($i === 1
                , "Napačno število referenc ($i) v terminu storitve. Dovoljen natanko eden od alternacija/dezurni/gost/sodelujoč/zasedenost/virt.zasedenost"
                , 1001080);
        $this->expect($this->planiranZacetek, "Planiran začetek  mora obstajati", 1001084);
        $this->expect($this->planiranKonec, "Planiran konec mora obstajati", 1001085);
        $this->expect($this->planiranZacetek < $this->planiranKonec, "Planiran konec mora biti za planiranim začetkom", 1001087);

        if ($this->alternacija) {
            /**
             * preveri, če je alternacija od uprizoritve dogodka
             */
            $this->expect(method_exists($this->dogodek->getPodrobno(), "getUprizoritev") &&
                    $this->dogodek->getPodrobno()->getUprizoritev()
                    , "Dogodek nima uprizoritve, termin storitve ima alternacijo", 1001089);
            $aId = $this->alternacija->getId();
            $this->expect(
                    $this->dogodek->getPodrobno()->getUprizoritev()->getFunkcije()
                            ->exists(function($key, $f) use(&$aId) {
                                return (
                                        $f->getAlternacije()->exists(function($k, $a) use(&$aId) {
                                            return ($a->getId() === $aId);    // vrne true, če alternacija obstaja v uprizoritvi
                                        }
                                ));
                            })
                    , "Alternacija (" . $this->alternacija->getSifra() . ") ne pripada uprizoritvi dogodka", 1001090);
            $this->oseba = $this->alternacija->getOseba();
        }
        if ($this->gost) {
            $this->expect($this->dogodek->getRazred() === \Koledar\Entity\Dogodek::VAJA
                    , "Gost je dovoljen le na vaji", 1001091);
        }
        if ($this->dezurni) {
            $this->expect($this->dogodek->getRazred() === \Koledar\Entity\Dogodek::PREDSTAVA
                    , "Dežurni je dovoljen le na predstavi", 1001092);
        }
        if ($this->alternacija || $this->gost || $this->dezurni || $this->sodelujoc) {
            /*
             * izračunamo delti glede na čase v dogodku
             */
            $this->expect($this->dogodek, "Dogodek pri takem tipu termina storitve mora biti prisoten", 1001081);
            $this->expect($this->dogodek->getZacetek(), "Začetek dogodka mora obstajati", 1001082);

            /*
             * izračunamo delti, ki sta v minutah
             */
            $this->deltaPlaniranZacetek = (int) (($this->planiranZacetek->getTimestamp() - $this->dogodek->getZacetek()->getTimestamp()) / 60);
            $this->deltaPlaniranKonec   = (int) (($this->planiranKonec->getTimestamp() - $this->dogodek->getKonec()->getTimestamp()) / 60);
        } else {
            $this->dogodek = null;
        }
    }

    public function getUprizoritev()
    {
        if ($this->dogodek && $this->dogodek->getPodrobno()) {
            return $this->dogodek->getPodrobno()->getUprizoritev();
        }
        return null;
    }

    public function getId()
    {
        return $this->id;
    }

    public function getPlaniranZacetek()
    {
        return $this->planiranZacetek;
    }

    public function getPlaniranKonec()
    {
        return $this->planiranKonec;
    }

    public function getDogodek()
    {
        return $this->dogodek;
    }

    public function getAlternacija()
    {
        return $this->alternacija;
    }

    public function getOseba()
    {
        return $this->oseba;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setPlaniranZacetek($planiranZacetek)
    {
        $this->planiranZacetek = $planiranZacetek;
        return $this;
    }

    public function setPlaniranKonec($planiranKonec)
    {
        $this->planiranKonec = $planiranKonec;
        return $this;
    }

    public function setDogodek(\Koledar\Entity\Dogodek $dogodek = null)
    {
        $this->dogodek = $dogodek;
        return $this;
    }

    public function setAlternacija(\Produkcija\Entity\Alternacija $alternacija = null)
    {
        $this->alternacija = $alternacija;
        return $this;
    }

    public function setOseba(\App\Entity\Oseba $oseba = null)
    {
        $this->oseba = $oseba;
        return $this;
    }

    function getDezurni()
    {
        return $this->dezurni;
    }

    function getGost()
    {
        return $this->gost;
    }

    function setDezurni($dezurni)
    {
        $this->dezurni = $dezurni;
        return $this;
    }

    function setGost($gost)
    {
        $this->gost = $gost;
        return $this;
    }

    function getZasedenost()
    {
        return $this->zasedenost;
    }

    function getVirtZasedenost()
    {
        return $this->virtZasedenost;
    }

    function setZasedenost($zasedenost)
    {
        $this->zasedenost = $zasedenost;
        return $this;
    }

    function setVirtZasedenost($virtZasedenost)
    {
        $this->virtZasedenost = $virtZasedenost;
        return $this;
    }

    function getDeltaPlaniranZacetek()
    {
        return $this->deltaPlaniranZacetek;
    }

    function getDeltaPlaniranKonec()
    {
        return $this->deltaPlaniranKonec;
    }

    function setDeltaPlaniranZacetek($deltaPlaniranZacetek)
    {
        $this->deltaPlaniranZacetek = $deltaPlaniranZacetek;
        return $this;
    }

    function setDeltaPlaniranKonec($deltaPlaniranKonec)
    {
        $this->deltaPlaniranKonec = $deltaPlaniranKonec;
        return $this;
    }

    function getUra()
    {
        return $this->ura;
    }

    function setUra(\Prisotnost\Entity\Ura $ura = null)
    {
        $this->ura = $ura;
        return $this;
    }

    function getSodelujoc()
    {
        return $this->sodelujoc;
    }

    function setSodelujoc($sodelujoc)
    {
        $this->sodelujoc = $sodelujoc;
        return $this;
    }

}
