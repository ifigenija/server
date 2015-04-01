<?php
namespace Prodaja\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class Racun
{
    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $id;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\PostavkaRacuna", mappedBy="dokument")
     */
    private $postavke;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\Kupec", inversedBy="racun")
     * @ORM\JoinColumn(name="kupec_id", referencedColumnName="id")
     */
    private $kupec;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\ProdajaPredstave", inversedBy="racun")
     * @ORM\JoinColumn(name="prodaja_predstave_id", referencedColumnName="id")
     */
    private $prodajaPredstave;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\NacinPlacina")
     * @ORM\JoinColumn(name="nacin_placina_id", referencedColumnName="id", nullable=false)
     */
    private $nacinPlacina;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\PlacilniInstrument", inversedBy="racun")
     * @ORM\JoinColumn(name="placilni_instrument_id", referencedColumnName="id")
     */
    private $placilniInstrument;
}