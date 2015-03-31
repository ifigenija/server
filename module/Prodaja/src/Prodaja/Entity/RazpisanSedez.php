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
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $status;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\PostavkaRacuna", inversedBy="prodanSedez")
     * @ORM\JoinColumn(name="postavka_racuna_id", referencedColumnName="id", nullable=false)
     */
    private $postavkaRacuna;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\Sedez", inversedBy="prodanSedez")
     * @ORM\JoinColumn(name="sedez_id", referencedColumnName="id")
     */
    private $sedez;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\ProdajaPredstave", inversedBy="razpisanSedez")
     * @ORM\JoinColumn(name="prodaja_predstave_id", referencedColumnName="id")
     */
    private $prodajaPredstave;
}