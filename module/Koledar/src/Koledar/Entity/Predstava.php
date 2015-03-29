<?php
namespace Koledar\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class Predstava         extends \Max\Entity\Base
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @ORM\OneToOne(targetEntity="Koledar\Entity\Dogodek", mappedBy="predstava")
     */
    private $dogodek;
    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Uprizoritev", inversedBy="predstave")
     * @ORM\JoinColumn(name="uprizoritev_id", referencedColumnName="id")
     */
    private $uprizoritev;

    /**
     * @ORM\ManyToOne(targetEntity="Koledar\Entity\Gostovanje", inversedBy="predstave")
     * @ORM\JoinColumn(name="gostovanje_id", referencedColumnName="id")
     */
    private $gostovanje;

    /**
     * @ORM\ManyToOne(targetEntity="Koledar\Entity\Gostujoca", inversedBy="predstave")
     * @ORM\JoinColumn(name="gostujoc_id", referencedColumnName="id")
     */
    private $gostujoca;
}