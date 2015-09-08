<?php

namespace ProgramDela\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;
use Doctrine\Common\Collections\ArrayCollection;
use Max\Functions;

/**
 * @ORM\Entity(repositoryClass="ProgramDela\Repository\ProdukcijaDelitve")
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
    protected $id;

    /**
     * Odstotek financiranja posameznega koproducenta
     * 
     * @ORM\Column(type="decimal", nullable=true, precision=15, scale=2)
     * @Max\I18n(label="prodel.odstotekFinanciranja", description="prodel.d.odstotekFinanciranja")
     * @var double
     */
    protected $odstotekFinanciranja;

    /**
     * delež posameznega koproducenta
     * 
     * = celotna vrednost projekta * %financiranja
     * 
     * @ORM\Column(type="decimal", nullable=true, precision=15, scale=2)
     * @Max\I18n(label="prodel.delez", description="prodel.d.delez")
     * @Max\Ui(icon="fa fa-euro")
     * @var double
     */
    protected $delez;

    /**
     * @ORM\ManyToOne(targetEntity="ProgramDela\Entity\EnotaPrograma", inversedBy="koprodukcije")
     * @Max\I18n(label="prodel.enotaPrograma", description="prodel.d.enotaPrograma")   
     * @Max\Ui(type="hiddenid")
     * @var \ProgramDela\Entity\EnotaPrograma
     */
    protected $enotaPrograma;

    /**
     * @ORM\ManyToOne(targetEntity="ProgramDela\Entity\ProdukcijskaHisa", inversedBy="koprodukcije")
     * @ORM\JoinColumn(name="koproducent_id", referencedColumnName="id", nullable=false)
     * @Max\I18n(label="prodel.koproducent",  description="prodel.d.koproducent")
     * @Max\Ui(type="toone", required=true)
     * @var \ProgramDela\Entity\ProdukcijskaHisa
     */
    protected $koproducent;

    /**
     * @ORM\Column(type="boolean", length=1, nullable=false)
     * @Max\I18n(label="prodel.maticniKop",  description="prodel.d.maticniKop")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    protected $maticniKop = false;

    /**
     * koeficient programske enote - le pri premierah
     * 
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="prodel.kpe", description="prodel.d.kpe")   
     * @var double
     */
    protected $kpe = 0;

    /**
     * Izračuna odstotekFinanciranja
     * 
     * potrebno na novo izračunati vedno, ko se celotna vrednost spremeni
     */
    public function preracunajOdstotekFinanciranja()
    {
        /**
         * izračunaj % financiranja
         */
        $celVrednost = $this->getEnotaPrograma()->getCelotnaVrednost();

        $odstFin                    = (!($celVrednost == 0) ? 100 * $this->getDelez() / $celVrednost : 0);
        $odstFin                    = \Max\Functions::procRound($odstFin);   //Zaokrožimo na 2 decimalki predno shranimo
        $this->odstotekFinanciranja = $odstFin;
    }

    public function preracunaj($smer = false)
    {
        if ($this->getMaticniKop()) {
            $this->delez = $this->getEnotaPrograma()->getNasDelez();
            $this->kpe = $this->getEnotaPrograma()->getKpe();
        }

        $this->getEnotaPrograma()->preracunajCelotnoVrednost();     // seštevek vseh deležev
//        $this->preracunajOdstotekFinanciranja();    //$$ verjetno ne bi rabili, ker se kliče že v preracunajCelotnoVrednost


        if ($smer == \Max\Consts::UP) {
            if ($this->getEnotaPrograma()) {
                $this->getEnotaPrograma()->preracunaj(\Max\Consts::UP);
                $this->getEnotaPrograma()->validate();
            }
        }
    }

    public function validate($mode = 'update')
    {
        $this->expect($this->getEnotaPrograma(), 'Ni enote programa za to koprodukcijo', 1000410);

                $this->validateNumberGE0($this->kpe, "Koeficient programske enote", 1000417);

        $this->validateProcGE0LE100($this->odstotekFinanciranja, "Odstotek financiranja", 1000412);
        $this->validateEuroGE0($this->delez, "Delež", 1000416);
        $delez = \Max\Functions::procRoundS($this->delez);

        //$$ kontrole za vsoto procentov
        // za isto enoto programa je lahko le 1 delitev z isto produkcijsko hišo     
        if (!$this->getEnotaPrograma()->getKoprodukcije()->isEmpty()) {
            $id      = $this->getId();
            $obstaja = $this->getEnotaPrograma()->getKoprodukcije()
                    ->exists(function($key, $kopr) use(&$id) {
                return ($kopr->getKoproducent() == $this->getKoproducent()) && ($kopr->getId() !== $id); //vrne true, če obstaja drug koprodukcija z istim koproducentom
            });
            $this->expect(!$obstaja, "Koprodukcija z istim koproducentom že obstaja v enoti programa", 1000411);

            /**
             *  preveri število matičnih koprodukcij?
             */
            $maticniCollection = $this->getEnotaPrograma()->getKoprodukcije()
                    ->filter(function($kopr) {
                return ($kopr->getMaticniKop());     //vrne vse zapise matičnih koproducentov
            });
            $stMaticnihKoproducentov = $maticniCollection->count();
            $this->expect($stMaticnihKoproducentov == 1, "Dovoljen natanko 1 matični koproducent, jih je pa " . $stMaticnihKoproducentov, 1000414);
        }

        /**
         * pri premieri mora biti vsota kpe vseh koproducentov <= maksimalnemu koeficientu iz tabele
         */
        $sumkpe = 0;  //init
        /**
         * $$ if program premiera 
         *  pri drugih ne bi smel biti problem, ker so KPE-ji =0  $$?
         */
        foreach ($this->getEnotaPrograma()->getKoprodukcije() as $numObject => $kopr) {
            $sumkpe += $kopr->getKpe();
        }
        $sumkpe       = \Max\Functions::numberRoundS($sumkpe);
        $maxvsifaktor= ($this->getEnotaPrograma()->getTipProgramskeEnote()) ? $this->getEnotaPrograma()->getTipProgramskeEnote()->getMaxVsi() :0;
        $maxvsifaktor = \Max\Functions::numberRoundS($maxvsifaktor);
        $this->expect($sumkpe <= $maxvsifaktor, "Vsota kpe vseh koproducentov (" . $sumkpe . ") ne sme biti večji kot maks. koeficient (" . $maxvsifaktor . ")", 1000415);
    }

    public function getNaziv()
    {
        return $this->getKoproducent()->getPopa()->getNaziv();
    }

    public function getId()
    {
        return $this->id;
    }

    public function getOdstotekFinanciranja()
    {
        return $this->odstotekFinanciranja;
    }

    public function getDelez()
    {
        return $this->delez;
    }

    public function getEnotaPrograma()
    {
        return $this->enotaPrograma;
    }

    public function getKoproducent()
    {
        return $this->koproducent;
    }

    public function getMaticniKop()
    {
        return $this->maticniKop;
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

    public function setDelez($delez)
    {
        $this->delez = $delez;
        return $this;
    }

    public function setEnotaPrograma(\ProgramDela\Entity\EnotaPrograma $enotaPrograma=null)
    {
        $this->enotaPrograma = $enotaPrograma;
        return $this;
    }

    public function setKoproducent(\ProgramDela\Entity\ProdukcijskaHisa $koproducent=null)
    {
        $this->koproducent = $koproducent;
        return $this;
    }

    public function setMaticniKop($maticniKop)
    {
        $this->maticniKop = $maticniKop;
        return $this;
    }

    public function getKpe()
    {
        return $this->kpe;
    }

    public function setKpe($kpe)
    {
        $this->kpe = $kpe;
        return $this;
    }

}
