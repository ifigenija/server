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
    private $id;

    /**
     * Odstotek financiranja posameznega koproducenta
     * 
     * @ORM\Column(type="decimal", nullable=true, precision=15, scale=2)
     * @Max\I18n(label="prodel.odstotekFinanciranja", description="prodel.d.odstotekFinanciranja")
     * @var double
     */
    private $odstotekFinanciranja;

    /**
     * delež posameznega koproducenta
     * 
     * = celotna vrednost projekta * %financiranja
     * 
     * @ORM\Column(type="decimal", nullable=true, precision=15, scale=2)
     * @Max\I18n(label="prodel.zaproseno", description="prodel.d.zaproseno")
     * @var double
     */
    private $delez;

    /**
     * % deleza
     * 
     * je <= maksfaktor
     * 
     * @ORM\Column(type="decimal", nullable=true, precision=6, scale=2)
     * @Max\I18n(label="prodel.zaprosenProcent", description="prodel.d.zaprosenProcent")
     * @var double
     */
    private $zaprosenProcent;

    /**
     * zaprošen znesek pri MK
     * 
     * = delez * zaprosen%
     * 
     * @ORM\Column(type="decimal", nullable=true, precision=15, scale=2)
     * @Max\I18n(label="prodel.zaproseno", description="prodel.zaproseno")
     * @var double
     */
    private $zaproseno;

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
    private $koproducent;

    /**
     * @ORM\Column(type="boolean", length=1, nullable=false)
     * @Max\I18n(label="prodel.maticniKop",  description="prodel.d.maticniKop")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    private $maticniKop = false;

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

        $odstFin                    = ($celVrednost !== 0 ? 100 * $this->getDelez() / $celVrednost : 0);
        $odstFin                    = \Max\Functions::procRound($odstFin);   //Zaokrožimo na 2 decimalki predno shranimo
        $this->odstotekFinanciranja = $odstFin;
    }

    public function preracunaj($smer = false)
    {
        if ($this->getMaticniKop()) {
            $this->zaprosenProcent = $this->getEnotaPrograma()->getZaprosenProcent();
            $this->zaproseno       = $this->getEnotaPrograma()->getZaproseno();
            $this->delez           = $this->getEnotaPrograma()->getNasDelez();
        }

        $this->getEnotaPrograma()->preracunajCelotnoVrednost();     // seštevek vseh deležev
//        $this->preracunajOdstotekFinanciranja();    //$$ verjetno ne bi rabili, ker se kliče že v preracunajCelotnoVrednost

        if (!$this->getMaticniKop()) {
            // izračunaj zaprošen znesek
            $zaproseno       = $this->getDelez() * $this->getZaprosenProcent() / 100;
            $zaproseno       = \Max\Functions::euroRound($zaproseno);   //Zaokrožimo na 2 decimalki predno shranimo
            $this->zaproseno = $zaproseno;
        }

        if ($smer == \Max\Consts::UP) {
            if ($this->getEnotaPrograma()) {
                $this->getEnotaPrograma()->preracunaj(\Max\Consts::UP);
                $this->getEnotaPrograma()->validate();
            }
        }
    }

    public function validate($mode = 'update')
    {
        /**
         * validacije za implementirati: $$
         *   . le 1 maticniKop  (tudi pri delete koprodukcije!)
         *   . enotaprograma obvezen podatek  
         *      .. podobno pri drugi viri
         *   . vsota odstotkov Fin <= 100
         *   . zaprošen procent (glede na koeficient)
         */
        //$$ tu bi še naredili kontrole, preračunavanja za ostale prodDelitve iste enote programa ipd.
        // preracunaj odstotkeF
        //    - vsota vseh iste enote programa =100%
        //    - pri matičnem podjetju spremenimo, da je vsota potem 100% 
        //    - pazi! pri delete se validate ne izvede
        // 
        // ta isto enoto programa je lahko le 1 delitev z isto produkcijsko hišo     
        //                
        // // delez= enotaprograma.celotnavrednost * odst.Fin
        // zaproseno= zaprosenProcent * delez
        // 
        $this->expect($this->getEnotaPrograma(), 'Ni enote programa za to koprodukcijo', 1000410);
        $odstFin      = \Max\Functions::procRoundS($this->getOdstotekFinanciranja());
        $this->expect(($odstFin >= 0) && ($odstFin <= 100), 'Odstotek financiranja mora biti med 0 in 100', 1000412);
        $zaprosenProc = \Max\Functions::procRoundS($this->getZaprosenProcent());
        $this->expect(($zaprosenProc >= 0) && ($zaprosenProc <= 100), 'Zaprošen odstotek mora biti med 0 in 100, je pa' . $zaprosenProc, 1000413);

        //$$ kontrole za vsoto procentov
        // za isto enoto programa je lahko le 1 delitev z isto produkcijsko hišo     
        if ($this->getEnotaPrograma()) {
            if (!$this->getEnotaPrograma()->getKoprodukcije()->isEmpty()) {
                $id      = $this->getId();
                $obstaja = $this->getEnotaPrograma()->getKoprodukcije()
                        ->exists(function($key, $kopr) use(&$id) {
                    return ($kopr->getKoproducent() == $this->getKoproducent()) && ($kopr->getId() !== $id); //vrne true, če obstaja drug koprodukcija z istim koproducentom
                });
                $this->expect(!$obstaja, "Koprodukcija z istim koproducentom že obstaja v enoti programa", 1000411);

                $maticniCollection = $this->getEnotaPrograma()->getKoprodukcije()
                        ->filter(function($kopr) {
                    return ($kopr->getMaticniKop());     //vrne vse zapise matičnih koproducentov
                });
                $stMaticnihKoproducentov = $maticniCollection->count();
                $this->expect($stMaticnihKoproducentov == 1, "Dovoljen natanko 1 matični koproducent, jih je pa " . $stMaticnihKoproducentov, 1000414);
                // preveri število matičnih koprodukcij?
            }
        }
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

    public function getZaprosenProcent()
    {
        return $this->zaprosenProcent;
    }

    public function getZaproseno()
    {
        return $this->zaproseno;
    }

    public function getEnotaPrograma()
    {
        return $this->enotaPrograma;
    }

    public function getKoproducent()
    {
        return $this->koproducent;
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

    public function setZaprosenProcent($zaprosenProcent)
    {
        $this->zaprosenProcent = $zaprosenProcent;
        return $this;
    }

    public function setZaproseno($zaproseno)
    {
        $this->zaproseno = $zaproseno;
        return $this;
    }

    public function setEnotaPrograma(\ProgramDela\Entity\EnotaPrograma $enotaPrograma)
    {
        $this->enotaPrograma = $enotaPrograma;
        return $this;
    }

    public function setKoproducent(\ProgramDela\Entity\ProdukcijskaHisa $koproducent)
    {
        $this->koproducent = $koproducent;
        return $this;
    }

    public function getMaticniKop()
    {
        return $this->maticniKop;
    }

    public function setMaticniKop($maticniKop)
    {
        $this->maticniKop = $maticniKop;
        return $this;
    }

}
