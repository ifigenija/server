<?php

namespace App\Entity;

use App\Repository\Poste;
use Doctrine\ORM\Mapping as ORM;
use Max\Ann\Entity as Max;

/**
 * Entiteta za pošte
 *
 *
 * @ORM\Entity(repositoryClass="App\Repository\Poste")
 * @Max\I18n(label="Pošta",plural="Pošte")
 * @Max\Id(prefix="0005")
 */
class Posta extends \Max\Entity\Base
        
{

    /**
     * ID pošte
     *
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @var string
     */
    protected $id;

    /**
     * Šifra pošte
     *
     * @ORM\Column(unique=true, length=20, nullable=true)
     * @var string
     * @Max\Ui(type="sifra")
     * @Max\I18n(label="Poštna številka", description="Poštna številka")
     */
    protected $sifra;

    /**
     * Naziv pošte
     *
     * @ORM\Column(length=40, nullable=true)
     * @var string
     *
     * @Max\I18n(label="Naziv",description="Naziv")
     */
    protected $naziv;

    function getId()
    {
        return $this->id;
    }

    function getSifra()
    {
        return $this->sifra;
    }

    function getNaziv()
    {
        return $this->naziv;
    }

    function setId($id)
    {
        $this->id = $id;
    }

    function setSifra($sifra)
    {
        $this->sifra = $sifra;
    }

    function setNaziv($naziv)
    {
        $this->naziv = $naziv;
    }


}

