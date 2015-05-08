<?php

/**
 * Licenca GPLv3 or later
 */

namespace App\Repository;

use Doctrine\Common\Collections\Criteria;
use DoctrineModule\Paginator\Adapter\Selectable;
use Max\Repository\AbstractMaxRepository;

/**
 * Description of PostniNaslovi
 *
 * @author rado
 */
class Telefonske
        extends AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "stevilka" => ["alias" => "stevilka"]
        ]
    ];

    public function getPaginator(array $options, $name = "default")
    {
        switch ($name) {
          default:
                $this->expect(!(empty($options['popa']) && empty($options['oseba'])), "Oseba ali Partner ali država sta obvezna", 770011);
                $crit = new Criteria();
                $e    = $crit->expr();

                if (!empty($options['popa'])) {
                    $popa = $this->getEntityManager()->find('App\Entity\Popa', $options['popa']);
                    $exp  = $e->eq('popa', $popa);
                } else {
                    $oseba = $this->getEntityManager()->find('App\Entity\Oseba', $options['oseba']);

                    $exp = $e->eq('oseba', $oseba);
                }
                $crit->andWhere($exp);
                return new Selectable($this, $crit);
        }
    }

}
