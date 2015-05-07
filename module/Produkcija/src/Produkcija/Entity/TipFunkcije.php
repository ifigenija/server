<?php
namespace Produkcija\Entity;
use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="Produkcija\Repository\Funkcije")
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
     */
    private $id;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $ime;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $opis;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $dovoliPrekrivanje;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $maxPrekrivanj;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $nastopajoc;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Funkcija", mappedBy="tipVloge", fetch="EXTRA_LAZY")
     */
    private $vloge;
}