<?php
namespace Produkcija\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class StrosekUprizoritve
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
    private $naziv;

    /**
     * @ORM\Column(type="decimal", nullable=true)
     */
    private $vrednostDo;

    /**
     * @ORM\Column(type="decimal", nullable=true)
     */
    private $vrednostNa;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $opis;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $sort;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Uprizoritev", inversedBy="stroski")
     * @ORM\JoinColumn(name="uprizoritev_id", referencedColumnName="id")
     */
    private $uprizoritev;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Popa", inversedBy="strosekUprizoritve")
     * @ORM\JoinColumn(name="popa_id", referencedColumnName="id")
     */
    private $popa;
}