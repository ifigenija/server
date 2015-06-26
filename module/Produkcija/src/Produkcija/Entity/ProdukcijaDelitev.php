<?php

namespace Produkcija\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * @ORM\Entity(repositoryClass="Produkcija\Repository\ProdukcijaDelitve")
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
     * @ORM\Column(type="decimal", nullable=true)
     * @Max\I18n(label="prodel.odstotekFinanciranja", description="prodel.odstotekFinanciranja")
     * @var double
     */
    private $odstotekFinanciranja;

    /**
     * delež posameznega koproducenta
     * 
     * = celotna vrednost projekta * %financiranja
     * 
     * @ORM\Column(type="decimal", nullable=true, precision=15, scale=2)
     * @Max\I18n(label="prodel.zaproseno", description="prodel.zaproseno")
     * @var double
     */
    private $delez;

    /**
     * % deleza
     * 
     * je <= maksfaktor
     * 
     * @ORM\Column(type="decimal", nullable=true, precision=6, scale=2)
     * @Max\I18n(label="prodel.zaprosenProcent", description="prodel.zaprosenProcent")
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
     * @Max\Ui(type="toone")
     * @var \ProgramDela\Entity\EnotaPrograma
     */
    protected $enotaPrograma;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\ProdukcijskaHisa", inversedBy="koprodukcije")
     * @ORM\JoinColumn(name="koproducent_id", referencedColumnName="id", nullable=false)
     * @Max\I18n(label="prodel.koproducent",  description="prodel.koproducent")
     * @Max\Ui(type="toone", required=true)
     * @var \Produkcija\Entity\ProdukcijskaHisa
     */
    private $koproducent;

    public function validate($mode = 'update')
    {
        //$$ tu bi še naredili kontrole, preračunavanja za ostale prodDelitve iste enote programa ipd.
        // preracunaj odstotkeF
        //    - vsota vseh iste enote programa =100%
        //    - pri matičnem podjetju spremenimo, da je vsota potem 100% 
        //      
        // // delez= enotaprograma.celotnavrednost * odst.Fin
        // zaproseno= zaprosenProcent * delez
        /**
         * Pri pogodbi preverim, če je nosilec pogodbe oseba na alternaciji
         * Če je nosilec pogodbe poslovni partner grem čez kontaktne osebe 
         * in preverim ,da je oseba kontakt na poslovnem partnerju
         */
        $this->expect($this->getEnotaPrograma(), 'Ni enote programa za to koprodukcijo', 1000410);


        // preračunaj procente oz. odstotek financiranja matičnega podjetja:
        $skupniOdstFin = 0;
        foreach ($this->getEnotaPrograma()->getKoprodukcije() as $kopr) {
            $skupniOdstFin += $kopr->getOdstotekFinanciranja(); //$$ uporabi bcmath
            
        }      

        // izračunaj delež
        $delez = $this->getEnotaPrograma()->getCelotnaVrednost() * $this->getOdstotekFinanciranja() / 100; //$$ uporabi bcmath
        $this->setDelez($delez);

        // izračunaj zaprošen znesek
        $zaproseno = $delez * $this->getZaprosenProcent() / 100;           //$$ uporabi bcmath
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

    public function setKoproducent(\Produkcija\Entity\ProdukcijskaHisa $koproducent)
    {
        $this->koproducent = $koproducent;
        return $this;
    }

}
