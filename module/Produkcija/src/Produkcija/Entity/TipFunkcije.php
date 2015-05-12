<?php

namespace Produkcija\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="Produkcija\Repository\TipiFunkcije")
 * @Max\I18n(label="Tip funkcije",plural="Tipi funkcije")
 * @Max\Id(prefix="0015")
 */
class TipFunkcije
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID tipa funkcije")
     * @Max\Ui(type="id")
     * @var string
     */
    private $id;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Ime", description="Ime tipa funkcije")
     * @Max\Ui(type="naziv",ident=true )
     * @var string
     */
    private $ime;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="Opis", description="Opis tipa funkcije")
     * @var string
     */
    private $opis;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="Dovoli prekrivanje", description="Ali dovoli prekrivanje tipa funkcije")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    private $dovoliPrekrivanje;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="Maks. prekrivanj", description="Maksimalno število prekrivanj tipa funkcije")
     * @var integer
     */
    private $maxPrekrivanj;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="Nastopajoč", description="Ali je nastopajoč")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    private $nastopajoc;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Žensko ime", description="Žensko ime funkcije")
     * @var string
     */
    private $imeZenski;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Področje", description="Področje")
     * @var string
     */
    private $podrocje;

    /**
     * 
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Pomembnost", description="Pomembnost funkcije")
     * @var string
     */
    private $pomembnost;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Funkcija", mappedBy="tipFunkcije", fetch="EXTRA_LAZY")
     * @var <Funkcije>
     */
    private $funkcije;

    public function validate($mode = 'update')
    {
        
    }

    public function getId()
    {
        return $this->id;
    }

    public function getIme()
    {
        return $this->ime;
    }

    public function getOpis()
    {
        return $this->opis;
    }

    public function getDovoliPrekrivanje()
    {
        return $this->dovoliPrekrivanje;
    }

    public function getMaxPrekrivanj()
    {
        return $this->maxPrekrivanj;
    }

    public function getNastopajoc()
    {
        return $this->nastopajoc;
    }

    public function getImeZenski()
    {
        return $this->imeZenski;
    }

    public function getPodrocje()
    {
        return $this->podrocje;
    }

    public function getPomembnost()
    {
        return $this->pomembnost;
    }

    public function getFunkcije()
    {
        return $this->funkcije;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setIme($ime)
    {
        $this->ime = $ime;
        return $this;
    }

    public function setOpis($opis)
    {
        $this->opis = $opis;
        return $this;
    }

    public function setDovoliPrekrivanje($dovoliPrekrivanje)
    {
        $this->dovoliPrekrivanje = $dovoliPrekrivanje;
        return $this;
    }

    public function setMaxPrekrivanj($maxPrekrivanj)
    {
        $this->maxPrekrivanj = $maxPrekrivanj;
        return $this;
    }

    public function setNastopajoc($nastopajoc)
    {
        $this->nastopajoc = $nastopajoc;
        return $this;
    }

    public function setImeZenski($imeZenski)
    {
        $this->imeZenski = $imeZenski;
        return $this;
    }

    public function setPodrocje($podrocje)
    {
        $this->podrocje = $podrocje;
        return $this;
    }

    public function setPomembnost($pomembnost)
    {
        $this->pomembnost = $pomembnost;
        return $this;
    }

    public function setFunkcije($funkcije)
    {
        $this->funkcije = $funkcije;
        return $this;
    }


}
