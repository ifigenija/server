<?php

namespace Koledar\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * @ORM\Entity(repositoryClass="Koledar\Repository\Prazniki")
 * @Max\I18n(label="Praznik",plural="Prazniki")
 * @Max\Id(prefix="0067")
 */
class Praznik
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID sezone")
     * @Max\Ui(type="id")
     * @var string     */
    protected $id;

    /**
     * @ORM\Column(type="string")
     * @Max\I18n(label="praznik.ime", description="praznik.d.ime")
     * @var string   
     */
    private $ime;

    /**
     * @ORM\Column()
     * @Max\I18n(label="praznik.dan", description="praznik.d.dan")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $dan;

    /**
     * @ORM\Column(type="integer")
     * @Max\I18n(label="praznik.mesec", description="praznik.d.mesec")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $mesec;

    /**
     * če je leto=null potem velja praznik vsa leta (gleda se le dan in mesec)
     * 
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="praznik.leto", description="praznik.d.leto")
     * @Max\Ui(type="integer")
     * @var integer
     */
    private $leto = null;

    /**
     * ali je dela prost dan
     * 
     * @ORM\Column(type="boolean")
     * @Max\I18n(label="praznik.delaProst", description="praznik.d.delaProst")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    private $delaProst;

    public function validate($mode = 'update')
    {
        $this->expect($this->dan && $this->dan >= 1 && $this->dan <= 31, "Dan je lahko le med 1 in 31, je pa $this->dan", 1001100);
        $this->expect($this->mesec && $this->mesec >= 1 && $this->mesec <= 12, "Dan je lahko le med 1 in 12, je pa $this->mesec", 1001101);

        /**
         * ker checkdate ne deluje z leto=null
         */
        $letoprim = is_null($this->leto) ? 2001 : $this->leto;  // vzamemo npr. 2001 kot tipično leto (neprestopno)
        $this->expect(checkdate($this->mesec, $this->dan, $letoprim), "Datum ni veljaven $this->dan $this->mesec $this->leto", 1001102);
    }

    function getId()
    {
        return $this->id;
    }

    function getIme()
    {
        return $this->ime;
    }

    function getDan()
    {
        return $this->dan;
    }

    function getMesec()
    {
        return $this->mesec;
    }

    function getLeto()
    {
        return $this->leto;
    }

    function getDelaProst()
    {
        return $this->delaProst;
    }

    function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    function setIme($ime)
    {
        $this->ime = $ime;
        return $this;
    }

    function setDan($dan)
    {
        $this->dan = $dan;
        return $this;
    }

    function setMesec($mesec)
    {
        $this->mesec = $mesec;
        return $this;
    }

    function setLeto($leto)
    {
        $this->leto = $leto;
        return $this;
    }

    function setDelaProst($delaProst)
    {
        $this->delaProst = $delaProst;
        return $this;
    }

}
