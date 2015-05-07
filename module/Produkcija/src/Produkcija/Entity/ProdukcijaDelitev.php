<?php
namespace Produkcija\Entity;
use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="Produkcija\Repository\ProdukcijaDelitve")
 * @Max\I18n(label="Delitev produkcije",plural="Delitev produkcij")
 * @Max\Id(prefix="0017")
 */
class ProdukcijaDelitev
        extends \Max\Entity\Base
{
    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $id;

    /**
     * @ORM\Column(type="decimal", nullable=true)
     */
    private $odstotekFinanciranja;

    /**
     * @ORM\Column(nullable=true)
     */
    private $vrstaKoproducenta;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Alternacija", mappedBy="koprodukcija")
     */
    private $alternacije;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Uprizoritev", inversedBy="koprodukcija")
     * @ORM\JoinColumn(name="uprizoritev_id", referencedColumnName="id", nullable=false)
     */
    private $uprizoritev;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\ProdukcijskaHisa", inversedBy="koprodukcije")
     * @ORM\JoinColumn(name="koproducent_id", referencedColumnName="id", nullable=false)
     */
    private $koproducent;
}