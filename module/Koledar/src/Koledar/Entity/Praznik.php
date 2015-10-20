<?php

namespace Koledar\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * @ORM\Entity(repositoryClass="Koledar\Repository\Sezone")
 * @Max\Lookup(ident="sifra",label="ime",search={"ime","sifra"},)
 * @Max\I18n(label="Praznik",plural="Sezone")
 * @Max\Id(prefix="0031")
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
     * @ORM\Column(type="string", unique=true, nullable=false)
     * @Max\I18n(label="sezona.sifra", description="sezona.d.sifra")
     * @Max\Ui(type="sifra",ident=true,icon="fa fa-barcode")
     * @var string
     */
    protected $sifra;

    
    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="sezona.ime", description="sezona.d.ime")
     * @Max\Ui(type="naziv",ident=true )
     * @var string     
     */
    protected $ime;

    /**
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="sezona.zacetek", description="sezona.d.zacetek")
     * @var DateTime
     */
    protected $zacetek;

    /**
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="sezona.konec", description="sezona.d.konec")
     * @var string
     */
    protected $konec;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="sezona.aktivna", description="sezona.d.aktivna")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    protected $aktivna;

    /**
     * @ORM\OneToMany(targetEntity="Koledar\Entity\Dogodek", mappedBy="sezona")
     * @var <Dogodki>
     */
    protected $dogodki;

    public function __construct()
    {
        $this->dogodki = new ArrayCollection();
    }

    public function validate($mode = 'update')
    {
        
    }

}
