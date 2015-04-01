<?php
namespace Koledar\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class Gostujoca         extends \Max\Entity\Base

{
    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $id;

    /**
     * @ORM\OneToMany(targetEntity="Koledar\Entity\Predstava", mappedBy="gostujoca")
     */
    private $predstave;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Uprizoritev", inversedBy="gostujoc")
     * @ORM\JoinColumn(name="uprizoritev_id", referencedColumnName="id")
     */
    private $uprizoritev;
}