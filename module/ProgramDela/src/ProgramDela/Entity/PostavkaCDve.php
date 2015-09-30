<?php

namespace ProgramDela\Entity;

use Doctrine\ORM\Mapping as ORM;
use Max\Ann\Entity as Max;
use Max\Entity\Base;

/**
 * Postavka za prilogo C2
 * 
 * @ORM\Entity(repositoryClass="ProgramDela\Repository\PostavkeCDve")
 * @Max\I18n(label="Postavka C2",plural="Postavke C2")
 * @Max\Id(prefix="0060")
 */
class PostavkaCDve
        extends Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID tipa stroška")
     * @Max\Ui(type="id")
     * @var string    
     */
    protected $id;

    /**
     * @ORM\ManyToOne(targetEntity="ProgramDela\Entity\ProgramDela", inversedBy="postavkeC2")
     * @Max\I18n(label="postavkaCDve.programDela", description="postavkaCDve.d.programDela")
     * @Max\Ui(type="hiddenid")
     * @var ProgramDela
     */
    protected $programDela;

    /**
     * nekaj polj, ki se prepišejo iz vrste stroška
     */

    /**
     * Skupina je lahko poleg številke tudi H in T
     * 
     * @ORM\Column(type="string", length=2 )
     * @Max\I18n(label="postavkaCdve.skupina", description="postavkaCdve.d.skupina")
     * @Max\Ui(type="hidden",icon="fa fa-sort")
     * @var string
     */
    protected $skupina;

    /**
     * če je 0 se uporablja kotglava npr. ime skupine ali kot seštevek
     * 
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="postavkaCdve.podskupina", description="postavkaCdve.d.podskupina")
     * @Max\Ui(type="hidden",icon="fa fa-sort")
     * @var integer
     */
    protected $podskupina;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="postavkaCdve.naziv", description="postavkaCdve.d.naziv")
     * @Max\Ui(type="hidden",ident=true, required=true)
     * @var string
     */
    protected $naziv;

    /**
     * vrednosti po posameznih stolpcih:
     */

    /**
     * @ORM\Column(type="decimal", nullable=true, precision=15, scale=2)
     * @Max\I18n(label="postavkaCdve.vrPremiere", description="postavkaCdve.d.vrPremiere")
     * @Max\Ui(required=true, icon="fa fa-euro")
     * @var double
     */
    protected $vrPremiere;

    /**
     * @ORM\Column(type="decimal", nullable=true, precision=15, scale=2)
     * @Max\I18n(label="postavkaCdve.vrPonovitvePremier", description="postavkaCdve.d.vrPonovitvePremier")
     * @Max\Ui(required=true, icon="fa fa-euro")
     * @var double
     */
    protected $vrPonovitvePremier;

    /**
     * @ORM\Column(type="decimal", nullable=true, precision=15, scale=2)
     * @Max\I18n(label="postavkaCdve.vrPonovitvePrejsnjih", description="postavkaCdve.d.vrPonovitvePrejsnjih")
     * @Max\Ui(required=true, icon="fa fa-euro")
     * @var double
     */
    protected $vrPonovitvePrejsnjih;

    /**
     * @ORM\Column(type="decimal", nullable=true, precision=15, scale=2)
     * @Max\I18n(label="postavkaCdve.vrGostovanjaZamejstvo", description="postavkaCdve.d.vrGostovanjaZamejstvo")
     * @Max\Ui(required=true, icon="fa fa-euro")
     * @var double
     */
    protected $vrGostovanjaZamejstvo;

    /**
     * @ORM\Column(type="decimal", nullable=true, precision=15, scale=2)
     * @Max\I18n(label="postavkaCdve.vrFestivali", description="postavkaCdve.d.vrFestivali")
     * @Max\Ui(required=true, icon="fa fa-euro")
     * @var double
     */
    protected $vrFestivali;

    /**
     * @ORM\Column(type="decimal", nullable=true, precision=15, scale=2)
     * @Max\I18n(label="postavkaCdve.vrGostovanjaInt", description="postavkaCdve.d.vrGostovanjaInt")
     * @Max\Ui(required=true, icon="fa fa-euro")
     * @var double
     */
    protected $vrGostovanjaInt;

    /**
     * @ORM\Column(type="decimal", nullable=true, precision=15, scale=2)
     * @Max\I18n(label="postavkaCdve.vrOstalo", description="postavkaCdve.d.vrOstalo")
     * @Max\Ui(required=true, icon="fa fa-euro")
     * @var double
     */
    protected $vrOstalo;

    public function validate($mode = 'update')
    {
        
    }

    public function getRazred()
    {
        return $this->getSkupina() . '.' . $this->getPodskupina();
    }

    public function getId()
    {
        return $this->id;
    }

    public function getProgramDela()
    {
        return $this->programDela;
    }

    public function getPodskupina()
    {
        return $this->podskupina;
    }

    public function getNaziv()
    {
        return $this->naziv;
    }

    public function getVrPremiere()
    {
        return $this->vrPremiere;
    }

    public function getVrPonovitvePremier()
    {
        return $this->vrPonovitvePremier;
    }

    public function getVrPonovitvePrejsnjih()
    {
        return $this->vrPonovitvePrejsnjih;
    }

    public function getVrGostovanjaZamejstvo()
    {
        return $this->vrGostovanjaZamejstvo;
    }

    public function getVrFestivali()
    {
        return $this->vrFestivali;
    }

    public function getVrGostovanjaInt()
    {
        return $this->vrGostovanjaInt;
    }

    public function getVrOstalo()
    {
        return $this->vrOstalo;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setProgramDela(ProgramDela $programDela = null)
    {
        $this->programDela = $programDela;
        return $this;
    }

    public function getSkupina()
    {
        return $this->skupina;
    }

    public function setSkupina($skupina)
    {
        $this->skupina = $skupina;
        return $this;
    }

    public function setPodskupina($podskupina)
    {
        $this->podskupina = $podskupina;
        return $this;
    }

    public function setNaziv($naziv)
    {
        $this->naziv = $naziv;
        return $this;
    }

    public function setVrPremiere($vrPremiere)
    {
        $this->vrPremiere = $vrPremiere;
        return $this;
    }

    public function setVrPonovitvePremier($vrPonovitvePremier)
    {
        $this->vrPonovitvePremier = $vrPonovitvePremier;
        return $this;
    }

    public function setVrPonovitvePrejsnjih($vrPonovitvePrejsnjih)
    {
        $this->vrPonovitvePrejsnjih = $vrPonovitvePrejsnjih;
        return $this;
    }

    public function setVrGostovanjaZamejstvo($vrGostovanjaZamejstvo)
    {
        $this->vrGostovanjaZamejstvo = $vrGostovanjaZamejstvo;
        return $this;
    }

    public function setVrFestivali($vrFestivali)
    {
        $this->vrFestivali = $vrFestivali;
        return $this;
    }

    public function setVrGostovanjaInt($vrGostovanjaInt)
    {
        $this->vrGostovanjaInt = $vrGostovanjaInt;
        return $this;
    }

    public function setVrOstalo($vrOstalo)
    {
        $this->vrOstalo = $vrOstalo;
        return $this;
    }

}
