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
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
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
     * 
     */
    private $sodelovanje;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\KoprodukcijaDelitev", mappedBy="uprizoritev")
     */
    private $koprodukcija;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Vloga", mappedBy="uprizoritev")
     */
    private $vloge;

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
     * @ORM\ManyToMany(targetEntity="Produkcija\Entity\Rekvizit", mappedBy="uprizoritev")
     */
    private $rekvizit;
}