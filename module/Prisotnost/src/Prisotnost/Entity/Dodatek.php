<?php

namespace Prisotnost\Entity;

use Doctrine\ORM\Mapping as ORM;
use Max\Ann\Entity as Max;
use Max\Entity\Base;

/**
 * @ORM\Entity(repositoryClass="Prisotnost\Repository\Dodatki")
 * @Max\I18n(label="Dodatek",plural="Dodatki")
 * @Max\Id(prefix="0069")
 */
class Dodatek
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
     * za koliko časa velja dodatek.
     * 
     * npr. delo na višini le za 30 minut, celotni termin storitve 60 minut
     * 
     * $$ ali tip delta time ali morda integer?
     * 
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="dodatek.trajanje", description="dodatek.d.trajanje")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $trajanje;

    /**
     * @ORM\ManyToOne(targetEntity="Prisotnost\Entity\Ura", inversedBy="dodatki")
     * @Max\I18n(label="dodatek.ura",  description="dodatek.d.ura")
     * @Max\Ui(type="toone", required=true)
     * @var \Prisotnost\Entity\Ura
     */
    protected $ura;

    /**
     * @ORM\ManyToOne(targetEntity="Prisotnost\Entity\TipDodatka", inversedBy="dodatki", fetch="EAGER")
     * @Max\I18n(label = "dodatek.tipdodatka", description = "dodatek.d.tipdodatka")
     * @Max\Ui(type="lookupselect", empty="Izberite tip dodatka", required=true)
     * @var \Prisotnost\Entity\TipDodatka
     */
    protected $tipdodatka;

    public function validate($mode = 'update')
    {
        $this->validateIntGE0($this->trajanje, 'trajanje ne sme biti negativno', 1001730);

        /*
         * termin storitve ima lahko največ 1 dodatek z istim tipom dodatka 
         */
        foreach ($this->ura->getDodatki() as $dod) {
            /*
             *  samega sebe ne sme primerjati
             */
            if ($this->getId() != $dod->getId()) {
                $this->expect($this->tipdodatka != $dod->getTipdodatka()
                        , "Ure ne smejo imeti 2 dodatka z istim tipom", 1001731);
            }
        }
    }

    function getId()
    {
        return $this->id;
    }

    function getTrajanje()
    {
        return $this->trajanje;
    }

    function getTipdodatka()
    {
        return $this->tipdodatka;
    }

    function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    function setTrajanje($trajanje)
    {
        $this->trajanje = $trajanje;
        return $this;
    }

    function setTipdodatka(\Prisotnost\Entity\TipDodatka $tipdodatka)
    {
        $this->tipdodatka = $tipdodatka;
        return $this;
    }

    function getUra()
    {
        return $this->ura;
    }

    function setUra(\Prisotnost\Entity\Ura $ura)
    {
        $this->ura = $ura;
        return $this;
    }

}
