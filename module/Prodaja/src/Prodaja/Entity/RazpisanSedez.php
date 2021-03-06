<?php
namespace Prodaja\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class RazpisanSedez
{
    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     */
    protected $id;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    protected $status;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\PostavkaRacuna", inversedBy="prodanSedez")
     * @ORM\JoinColumn(name="postavka_racuna_id", referencedColumnName="id", nullable=false)
     */
    protected $postavkaRacuna;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\Sedez", inversedBy="prodanSedez")
     * @ORM\JoinColumn(name="sedez_id", referencedColumnName="id")
     */
    protected $sedez;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\ProdajaPredstave", inversedBy="razpisanSedez")
     * @ORM\JoinColumn(name="prodaja_predstave_id", referencedColumnName="id")
     */
    protected $prodajaPredstave;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\Rezervacija", inversedBy="razpisaniSedezi")
     * @ORM\JoinColumn(name="rezervacija_id", referencedColumnName="id")
     */
    protected $rezervacija;
}