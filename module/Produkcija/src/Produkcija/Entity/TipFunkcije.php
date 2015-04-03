<?php
namespace Produkcija\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class TipFunkcije
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
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Funkcija", mappedBy="tipVloge", fetch="EXTRA_LAZY")
     */
    private $vloge;
}