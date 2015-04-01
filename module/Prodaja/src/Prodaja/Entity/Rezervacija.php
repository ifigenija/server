<?php
namespace Prodaja\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class Rezervacija
{
    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $id;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\RazpisanSedez", mappedBy="rezervacija")
     */
    private $razpisaniSedezi;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\ProdajaPredstave", inversedBy="rezervacija")
     * @ORM\JoinColumn(name="prodaja_predstave_id", referencedColumnName="id")
     */
    private $prodajaPredstave;
}