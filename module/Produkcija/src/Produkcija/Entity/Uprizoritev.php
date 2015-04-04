<?php
namespace Produkcija\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class Uprizoritev
{
    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=20, nullable=true)
     */
    private $faza;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $naslov;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $podnaslov;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $delovniNaslov;

    /**
     * @ORM\Column(type="date", nullable=true)
     */
    private $datumPremiere;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $stOdmorov;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $avtor;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $gostujoca;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $trajanje;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $opis;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $arhIdent;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $arhOpomba;

    /**
     * @ORM\Column(type="date", nullable=true)
     */
    private $datumZaključka;

    /**
     * 
     */
    private $datumZaključka;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $sloAvtor;

    /**
     * 
     */
    private $sodelovanje;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\ProdukcijaDelitev", mappedBy="uprizoritev")
     */
    private $koprodukcija;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Funkcija", mappedBy="uprizoritev")
     */
    private $vloge;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Arhivalija", mappedBy="uprizoritev")
     */
    private $arhiv;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Rekviziterstvo", mappedBy="uprizoritev")
     */
    private $rekviziti;

    /**
     * @ORM\OneToMany(targetEntity="Koledar\Entity\Vaja", mappedBy="uprizoritev")
     */
    private $vaje;

    /**
     * @ORM\OneToMany(targetEntity="Koledar\Entity\Predstava", mappedBy="uprizoritev")
     */
    private $predstave;

    /**
     * @ORM\OneToMany(targetEntity="Koledar\Entity\Gostujoca", mappedBy="uprizoritev")
     */
    private $gostujoc;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Besedilo")
     * @ORM\JoinColumn(name="besedilo_id", referencedColumnName="id")
     */
    private $besedilo;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\ZvrstUprizoritve")
     * @ORM\JoinColumn(name="zvrst_uprizoritve_id", referencedColumnName="id")
     */
    private $zvrstUprizoritve;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\ZvrstSurs")
     * @ORM\JoinColumn(name="zvrst_surs_id", referencedColumnName="id")
     */
    private $zvrstSurs;

    /**
     * 
     */
    private $rekvizit;
}