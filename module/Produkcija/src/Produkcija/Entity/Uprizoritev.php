<?php

namespace Produkcija\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="Produkcija\Repository\Uprizoritve")
 * @Max\I18n(label="Uprizoritev",plural="Uprizoritve")
 * @Max\Id(prefix="0014")
 */
class Uprizoritev
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID uprizoritve")
     * @Max\Ui(type="id")
     * @var string   
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=20, nullable=true)
     * @Max\I18n(label="Faza", description="Faza uprizoritve")
     * @var string
     */
    private $faza;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Naslov", description="Naslov uprizoritve")
     * @Max\Ui(type="naziv",ident=true )
     * @var string
     */
    private $naslov;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Podnaslov", description="Podnaslov uprizoritve")
     * @var string
     */
    private $podnaslov;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Delovni naslov", description="Delovni naslov uprizoritve")
     * @var string
     */
    private $delovniNaslov;

    /**
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="Datum premiere", description="Datum premiere uprizoritve")
     * @var string
     */
    private $datumPremiere;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="Št. odmorov", description="Število odmorov uprizoritve")
     * @var integer
     */
    private $stOdmorov;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Avtor", description="Avtor uprizoritve")
     * @Max\Ui(type="naziv")
     * @var string
     */
    private $avtor;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="Gostujoča", description="Ali je uprizoritev gostujoča")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    private $gostujoca;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="Trajanje", description="Trajanje uprizoritve")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $trajanje;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="Opis", description="Opis uprizoritve")
     * @var string
     */
    private $opis;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Id za arhiv", description="Id uprizoritve za arhiv")
     * @var string
     */
    private $arhIdent;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Opomba za arhiv", description="Opomba pri uprizoritvi za arhiv")
     * @var string
     */
    private $arhOpomba;

    /**
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="Datum zaključka", description="Opomba pri uprizoritvi za arhiv")
     * @var string
     */
    private $datumZakljucka;                // $$ rb - ali je sploh kdaj datum zaključka, glede na to, da se lahko ponovi?

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="Slovenski avtor", description="Ali je slovenski avtor uprizoritve")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    private $sloAvtor;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Kratki naslov", description="Kratki naslov uprizoritve")
     * @var string
     */
    private $kratkiNaslov;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\ProdukcijaDelitev", mappedBy="uprizoritev")
     * @var <Koprodukcije>
     */
    private $koprodukcije;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Funkcija", mappedBy="uprizoritev")
     * @var <Funkcije>
     */
    private $funkcije;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Arhivalija", mappedBy="uprizoritev")
     * @var <Arhiv>
     */
    private $arhiv;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Rekviziterstvo", mappedBy="uprizoritev")
     * @var <Rekviziti>
     */
    private $rekviziti;

    /**
     * @ORM\OneToMany(targetEntity="Koledar\Entity\Vaja", mappedBy="uprizoritev")
     * @var <Vaje>
     */
    private $vaje;

    /**
     * @ORM\OneToMany(targetEntity="Koledar\Entity\Predstava", mappedBy="uprizoritev")
     * @var <Predstave>
     */
    private $predstave;

    /**
     * @ORM\OneToMany(targetEntity="Koledar\Entity\Gostujoca", mappedBy="uprizoritev")
     * @var <Gostujoce>
     */
    private $gostujoce;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Besedilo")
     * @ORM\JoinColumn(name="besedilo_id", referencedColumnName="id")
     * @Max\I18n(label="Besedilo",  description="Besedilo uprizoritve")
     * @Max\Ui(type="toone")
     * @var \Produkcija\Entity\Besedilo
     */
    private $besedilo;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\ZvrstUprizoritve")
     * @ORM\JoinColumn(name="zvrst_uprizoritve_id", referencedColumnName="id")
     * @Max\I18n(label="Zvrst uprizoritve",  description="Zvrst uprizoritve")
     * @Max\Ui(type="toone")
     * @var \Produkcija\Entity\ZvrstUprizoritve
     */
    private $zvrstUprizoritve;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\ZvrstSurs")
     * @ORM\JoinColumn(name="zvrst_surs_id", referencedColumnName="id")
     * @Max\I18n(label="Zvrst SURS",  description="Zvrst SURS")
     * @Max\Ui(type="toone")
     * @var \Produkcija\Entity\ZvrstSurs
     */
    private $zvrstSurs;

    public function validate($mode = 'update')
    {
        
    }
    public function getId()
    {
        return $this->id;
    }

    public function getFaza()
    {
        return $this->faza;
    }

    public function getNaslov()
    {
        return $this->naslov;
    }

    public function getPodnaslov()
    {
        return $this->podnaslov;
    }

    public function getDelovniNaslov()
    {
        return $this->delovniNaslov;
    }

    public function getDatumPremiere()
    {
        return $this->datumPremiere;
    }

    public function getStOdmorov()
    {
        return $this->stOdmorov;
    }

    public function getAvtor()
    {
        return $this->avtor;
    }

    public function getGostujoca()
    {
        return $this->gostujoca;
    }

    public function getTrajanje()
    {
        return $this->trajanje;
    }

    public function getOpis()
    {
        return $this->opis;
    }

    public function getArhIdent()
    {
        return $this->arhIdent;
    }

    public function getArhOpomba()
    {
        return $this->arhOpomba;
    }

    public function getDatumZakljucka()
    {
        return $this->datumZakljucka;
    }

    public function getSloAvtor()
    {
        return $this->sloAvtor;
    }

    public function getKratkiNaslov()
    {
        return $this->kratkiNaslov;
    }

    public function getKoprodukcije()
    {
        return $this->koprodukcije;
    }

    public function getFunkcije()
    {
        return $this->funkcije;
    }

    public function getArhiv()
    {
        return $this->arhiv;
    }

    public function getRekviziti()
    {
        return $this->rekviziti;
    }

    public function getVaje()
    {
        return $this->vaje;
    }

    public function getPredstave()
    {
        return $this->predstave;
    }

    public function getGostujoce()
    {
        return $this->gostujoce;
    }

    public function getBesedilo()
    {
        return $this->besedilo;
    }

    public function getZvrstUprizoritve()
    {
        return $this->zvrstUprizoritve;
    }

    public function getZvrstSurs()
    {
        return $this->zvrstSurs;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setFaza($faza)
    {
        $this->faza = $faza;
        return $this;
    }

    public function setNaslov($naslov)
    {
        $this->naslov = $naslov;
        return $this;
    }

    public function setPodnaslov($podnaslov)
    {
        $this->podnaslov = $podnaslov;
        return $this;
    }

    public function setDelovniNaslov($delovniNaslov)
    {
        $this->delovniNaslov = $delovniNaslov;
        return $this;
    }

    public function setDatumPremiere($datumPremiere)
    {
        $this->datumPremiere = $datumPremiere;
        return $this;
    }

    public function setStOdmorov($stOdmorov)
    {
        $this->stOdmorov = $stOdmorov;
        return $this;
    }

    public function setAvtor($avtor)
    {
        $this->avtor = $avtor;
        return $this;
    }

    public function setGostujoca($gostujoca)
    {
        $this->gostujoca = $gostujoca;
        return $this;
    }

    public function setTrajanje($trajanje)
    {
        $this->trajanje = $trajanje;
        return $this;
    }

    public function setOpis($opis)
    {
        $this->opis = $opis;
        return $this;
    }

    public function setArhIdent($arhIdent)
    {
        $this->arhIdent = $arhIdent;
        return $this;
    }

    public function setArhOpomba($arhOpomba)
    {
        $this->arhOpomba = $arhOpomba;
        return $this;
    }

    public function setDatumZakljucka($datumZakljucka)
    {
        $this->datumZakljucka = $datumZakljucka;
        return $this;
    }

    public function setSloAvtor($sloAvtor)
    {
        $this->sloAvtor = $sloAvtor;
        return $this;
    }

    public function setKratkiNaslov($kratkiNaslov)
    {
        $this->kratkiNaslov = $kratkiNaslov;
        return $this;
    }

    public function setKoprodukcije($koprodukcije)
    {
        $this->koprodukcije = $koprodukcije;
        return $this;
    }

    public function setFunkcije($funkcije)
    {
        $this->funkcije = $funkcije;
        return $this;
    }

    public function setArhiv($arhiv)
    {
        $this->arhiv = $arhiv;
        return $this;
    }

    public function setRekviziti($rekviziti)
    {
        $this->rekviziti = $rekviziti;
        return $this;
    }

    public function setVaje($vaje)
    {
        $this->vaje = $vaje;
        return $this;
    }

    public function setPredstave($predstave)
    {
        $this->predstave = $predstave;
        return $this;
    }

    public function setGostujoce($gostujoce)
    {
        $this->gostujoce = $gostujoce;
        return $this;
    }

    public function setBesedilo(\Produkcija\Entity\Besedilo $besedilo)
    {
        $this->besedilo = $besedilo;
        return $this;
    }

    public function setZvrstUprizoritve(\Produkcija\Entity\ZvrstUprizoritve $zvrstUprizoritve)
    {
        $this->zvrstUprizoritve = $zvrstUprizoritve;
        return $this;
    }

    public function setZvrstSurs(\Produkcija\Entity\ZvrstSurs $zvrstSurs)
    {
        $this->zvrstSurs = $zvrstSurs;
        return $this;
    }


}
