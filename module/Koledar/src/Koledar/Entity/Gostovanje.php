<?php
namespace Koledar\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class Gostovanje 
        extends \Max\Entity\Base

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
    private $vrsta;

    /**
     * @ORM\OneToOne(targetEntity="Koledar\Entity\Dogodek", mappedBy="gostovanje")
     */
    private $dogodek;
    /**
     * @ORM\OneToMany(targetEntity="Koledar\Entity\Predstava", mappedBy="gostovanje")
     */
    private $predstave;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Drzava")
     * @ORM\JoinColumn(name="drzava_id", referencedColumnName="id", nullable=false)
     */
    private $drzava;
}