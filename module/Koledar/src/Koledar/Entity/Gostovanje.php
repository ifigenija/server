<?php

namespace Koledar\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use Max\Ann\Entity as Max;
use Max\Entity\Base;

/**
 * @ORM\Entity(repositoryClass="Koledar\Repository\Gostovanja")
 * @Max\I18n(label="Gostovanje",plural="Gostovanja")
 * @Max\Id(prefix="0028")
 */
class Gostovanje
        extends Base
{

    use DogodekTrait;

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID gostovanja")
     * @Max\Ui(type="id")
     * @var string
     */
    protected $id;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Vrsta", description="Vrsta gostovanja")
     * @var string
     */
    protected $vrsta;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="Zamejstvo", description="Zamejstvo")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    protected $zamejstvo;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Kraj", description="Kraj")
     * @Max\Ui(type="naziv")
     * @var string
     */
    protected $kraj;

    /**
     * @ORM\OneToOne(targetEntity="Koledar\Entity\Dogodek", mappedBy="gostovanje", cascade={"persist"})
     * @Max\I18n(label="Dogodek",  description="Dogodek")
     * @Max\Ui(type="toone")
     * @var \Koledar\Entity\Dogodek
     */
    protected $dogodek;

    /**
     * @ORM\OneToMany(targetEntity="Koledar\Entity\Dogodek", mappedBy="nadrejenoGostovanje")
     * @var <PodrejeniDogodki>
     */
    protected $podrejeniDogodki;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Drzava")
     * @ORM\JoinColumn(name="drzava_id", referencedColumnName="id", nullable=false)
     * @Max\I18n(label="Država",  description="Država")
     * @Max\Ui(type="toone")
     * @var \App\Entity\Drzava
     */
    protected $drzava;

    public function __construct()
    {
        $this->podrejeniDogodki = new ArrayCollection();
    }

    public function validate($mode = 'update')
    {
        foreach ($this->podrejeniDogodki as $poddog) {
            /*
             *  - poddogodek ne sme biti gostovanje
             */
            $this->expect($poddog->getRazred() != \Koledar\Entity\Dogodek::GOSTOVANJE
                    , "Poddogodek gostovanja ne sme biti gostovanje(" . $poddog->getTitle() . ")"
                    , 1001971);

            /*
             *  interval poddogodka mora biti v intervalu gostovanja
             */
            $this->expect(
                    $poddog->getZacetek() >= $this->getZacetek() && $poddog->getKonec() <= $this->getKonec()
                    , "Interval poddogodka gostovanja (" . $poddog->getTitle() . ")" . " mora biti v celoti znotraj intervala gostovanja"
                    , 1001970);

            /*
             * isti poddogodek lahko največ 1x 
             */
            $pdA = $this->podrejeniDogodki->filter(function($ent) use(&$poddog) {
                return ($ent === $poddog);
            });
            $this->expect(count($pdA) == 1, "V gostovanju je lahko poddogodek le enkrat prisoten (" . $poddog->getTitle() . ")", 1001972);
        }
    }

    function dodajDogodek()
    {
        $this->dogodek = new Dogodek();
        $this->dogodek->setGostovanje($this);
        $this->dogodek->setRazred(Dogodek::GOSTOVANJE);
    }

    function getId()
    {
        return $this->id;
    }

    function getVrsta()
    {
        return $this->vrsta;
    }

    function getZamejstvo()
    {
        return $this->zamejstvo;
    }

    function getKraj()
    {
        return $this->kraj;
    }

    function getDogodek()
    {
        return $this->dogodek;
    }

    function getPodrejeniDogodki()
    {
        return $this->podrejeniDogodki;
    }

    function getDrzava()
    {
        return $this->drzava;
    }

    function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    function setVrsta($vrsta)
    {
        $this->vrsta = $vrsta;
        return $this;
    }

    function setZamejstvo($zamejstvo)
    {
        $this->zamejstvo = $zamejstvo;
        return $this;
    }

    function setKraj($kraj)
    {
        $this->kraj = $kraj;
        return $this;
    }

    function setDogodek(\Koledar\Entity\Dogodek $dogodek = null)
    {
        $this->dogodek = $dogodek;
        return $this;
    }

    function setPodrejeniDogodki($podrejeniDogodki)
    {
        $this->podrejeniDogodki = $podrejeniDogodki;
        return $this;
    }

    function setDrzava(\App\Entity\Drzava $drzava = null)
    {
        $this->drzava = $drzava;
        return $this;
    }

}
