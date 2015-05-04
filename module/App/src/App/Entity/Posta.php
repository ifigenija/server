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
class Posta
        extends \Max\Entity\Base
{

    /**
     * ID pošte
     *
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\Ui(type="id")
     *  * @var string
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
     * @Max\Ui(type="naziv")
     */
    protected $naziv;

    public function getId()
    {
        return $this->id;
    }

    public function getSifra()
    {
        return $this->sifra;
    }

    public function getNaziv()
    {
        return $this->naziv;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setSifra($sifra)
    {
        $this->sifra = $sifra;
        return $this;
    }

    public function setNaziv($naziv)
    {
        $this->naziv = $naziv;
        return $this;
    }

}
